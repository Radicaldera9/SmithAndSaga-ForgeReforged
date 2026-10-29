# Smith & Saga: Forge Reforged - one-line installer for r2modman (Valheim)
#
#   & ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
#
# 1. Installs r2modman if it is missing (official release from github.com/ebkr/r2modmanPlus)
# 2. Uses (or creates) an r2modman Valheim profile
# 3. Installs BepInExPack_Valheim from Thunderstore if the profile does not have it
# 4. Installs the latest Smith & Saga release from this repository and registers it in r2modman's mod list
#
# Options:  -ProfileName <name>   install into this r2modman profile (default: ask / "Default")
#           -Uninstall            remove Smith & Saga from the profile
param(
    [string]$ProfileName = '',
    [switch]$Uninstall
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$Repo        = 'Radicaldera9/SmithAndSaga-ForgeReforged'
$ModFullName = 'Radicaldera-Smith_and_Saga'
$ModFolder   = 'Radicaldera-Smith_and_Saga'
$BepFullName = 'denikson-BepInExPack_Valheim'
$OldMods     = @('Caldera-MoreUpgrades', 'Caldera-EquipmentEditor', 'Caldera-ExtraRecipes', 'Caldera-FixedKnockbackBlock',
                 'Caldera-SmithAndSaga_Dev', 'Caldera-Smith_and_Saga', 'renair-MoreUpgrades')
$Utf8NoBom   = New-Object System.Text.UTF8Encoding $false
$Headers     = @{ 'User-Agent' = 'SmithAndSaga-Installer' }

function Say([string]$msg, [string]$color = 'Gray') { Write-Host $msg -ForegroundColor $color }
function Fail([string]$msg) { Say ''; Say ('エラー: ' + $msg) 'Red'; throw $msg }

function New-TempDir {
    $d = Join-Path ([IO.Path]::GetTempPath()) ('sns_' + [Guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $d | Out-Null
    return $d
}

function Get-File([string]$url, [string]$path) {
    Invoke-WebRequest -Uri $url -OutFile $path -Headers $Headers -UseBasicParsing
}

# ---------------- r2modman ----------------
function Find-R2modman {
    $cands = @(
        (Join-Path $env:LOCALAPPDATA 'Programs\r2modman\r2modman.exe'),
        (Join-Path $env:ProgramFiles 'r2modman\r2modman.exe')
    )
    foreach ($c in $cands) { if ($c -and (Test-Path $c)) { return $c } }
    return $null
}

function Install-R2modman {
    Say 'r2modman が見つからないため、公式リリースからインストールします...' 'Yellow'
    $rel = Invoke-RestMethod -Uri 'https://api.github.com/repos/ebkr/r2modmanPlus/releases/latest' -Headers $Headers
    $asset = $rel.assets | Where-Object { $_.name -like 'r2modman-Setup-*.exe' } | Select-Object -First 1
    if (-not $asset) { Fail 'r2modman のインストーラーが見つかりませんでした。https://github.com/ebkr/r2modmanPlus/releases から手動で入れてください。' }
    $tmp = New-TempDir
    $exe = Join-Path $tmp $asset.name
    Say ('  ダウンロード: ' + $asset.name)
    Get-File $asset.browser_download_url $exe
    Say '  インストール中...'
    Start-Process -FilePath $exe -ArgumentList '/S' -Wait
    Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
    $found = Find-R2modman
    if (-not $found) { Fail 'r2modman のインストールを確認できませんでした。' }
    Say ('  r2modman をインストールしました: ' + $found) 'Green'
    return $found
}

# ---------------- mods.yml ----------------
function Read-ModsYml([string]$file) {
    # returns a list of entry blocks (each starts with "- manifestVersion:")
    $blocks = New-Object System.Collections.Generic.List[string]
    if (-not (Test-Path $file)) { return ,$blocks }
    $text = [IO.File]::ReadAllText($file)
    if ($text.Trim().Length -eq 0 -or $text.Trim() -eq '[]') { return ,$blocks }
    $cur = $null
    foreach ($line in ($text -split "`r?`n")) {
        if ($line -like '- *') {
            if ($cur -ne $null) { $blocks.Add($cur.TrimEnd()) }
            $cur = $line
        } elseif ($cur -ne $null) {
            $cur += "`n" + $line
        }
    }
    if ($cur -ne $null) { $blocks.Add($cur.TrimEnd()) }
    return ,$blocks
}

function Get-BlockName([string]$block) {
    foreach ($l in ($block -split "`n")) { if ($l -match '^\s{2}name:\s*(.+)$') { return $Matches[1].Trim().Trim("'") } }
    if ($block -match '^-\s+name:\s*(.+)$') { return $Matches[1].Trim() }
    return ''
}

function Get-BlockEnabled([string]$block) {
    return ($block -match '(?m)^\s{2}enabled:\s*true\s*$')
}

function Write-ModsYml([string]$file, $blocks) {
    if ($blocks.Count -eq 0) { [IO.File]::WriteAllText($file, "[]`n", $Utf8NoBom); return }
    [IO.File]::WriteAllText($file, (($blocks -join "`n") + "`n"), $Utf8NoBom)
}

function New-ModBlock($m, [bool]$online) {
    $v = $m.version_number.Split('.')
    $deps = ''
    if ($m.dependencies -and $m.dependencies.Count -gt 0) {
        $deps = "`n" + (($m.dependencies | ForEach-Object { '    - ' + $_ }) -join "`n")
    } else { $deps = ' []' }
    $desc = ($m.description -replace "'", "''")
    $site = ($m.website_url -replace "'", "''")
    $now = [long]([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())
    return @"
- manifestVersion: 1
  name: $($m.full_name)
  authorName: $($m.author)
  websiteUrl: '$site'
  displayName: '$($m.display -replace "'", "''")'
  description: '$desc'
  gameVersion: '0'
  networkMode: both
  packageType: other
  installMode: managed
  installedAtTime: $now
  loaders: []
  dependencies:$deps
  incompatibilities: []
  optionalDependencies: []
  versionNumber:
    major: $($v[0])
    minor: $($v[1])
    patch: $($v[2])
  enabled: true
  onlineSource: $($online.ToString().ToLower())
  trustedPackage: false
"@
}

function Set-ModEntry([string]$file, [string]$fullName, [string]$block) {
    $blocks = Read-ModsYml $file
    $keep = New-Object System.Collections.Generic.List[string]
    foreach ($b in $blocks) { if ((Get-BlockName $b) -ne $fullName) { $keep.Add($b) } }
    if ($block) { $keep.Add($block.Replace("`r`n", "`n").TrimEnd()) }
    Write-ModsYml $file $keep
}

# ---------------- packages ----------------
function Install-BepInEx([string]$profileDir, [string]$ymlFile) {
    Say 'BepInExPack_Valheim をインストールします (Thunderstore)...' 'Yellow'
    $pkg = Invoke-RestMethod -Uri 'https://thunderstore.io/api/experimental/package/denikson/BepInExPack_Valheim/' -Headers $Headers
    $latest = $pkg.latest
    $tmp = New-TempDir
    $zip = Join-Path $tmp 'bep.zip'
    Get-File $latest.download_url $zip
    Expand-Archive -Path $zip -DestinationPath (Join-Path $tmp 'x') -Force
    $inner = Join-Path $tmp 'x\BepInExPack_Valheim'
    if (-not (Test-Path $inner)) { Fail 'BepInExPack の中身が想定と違います。r2modman から BepInExPack_Valheim を入れてから再実行してください。' }
    Copy-Item -Path (Join-Path $inner '*') -Destination $profileDir -Recurse -Force
    $m = [pscustomobject]@{ full_name = $BepFullName; author = 'denikson'; name = 'BepInExPack_Valheim'; display = 'BepInExPack_Valheim'
        website_url = 'https://thunderstore.io/c/valheim/p/denikson/BepInExPack_Valheim/'; version_number = $latest.version_number
        description = $latest.description; dependencies = @() }
    Set-ModEntry $ymlFile $BepFullName (New-ModBlock $m $true)
    Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
    Say ('  BepInExPack_Valheim ' + $latest.version_number + ' を入れました') 'Green'
}

function Install-SmithAndSaga([string]$profileDir, [string]$ymlFile) {
    Say 'Smith & Saga の最新リリースを取得しています...' 'Yellow'
    $rels = Invoke-RestMethod -Uri ('https://api.github.com/repos/' + $Repo + '/releases') -Headers $Headers
    $rel = $rels | Where-Object { -not $_.draft } | Select-Object -First 1
    if (-not $rel) { Fail 'リリースが見つかりませんでした。' }
    $asset = $rel.assets | Where-Object { $_.name -like '*.zip' } | Select-Object -First 1
    if (-not $asset) { Fail 'リリースに zip がありません。' }
    $tmp = New-TempDir
    $zip = Join-Path $tmp $asset.name
    Say ('  ダウンロード: ' + $asset.name + '  (' + $rel.tag_name + ')')
    Get-File $asset.browser_download_url $zip
    $x = Join-Path $tmp 'x'
    Expand-Archive -Path $zip -DestinationPath $x -Force
    $man = Get-Content (Join-Path $x 'manifest.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $dll = Get-ChildItem -Path $x -Recurse -Filter 'SmithAndSaga.dll' | Select-Object -First 1
    if (-not $dll) { Fail 'zip に SmithAndSaga.dll がありません。' }

    $dest = Join-Path $profileDir ('BepInEx\plugins\' + $ModFolder)
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    Copy-Item $dll.FullName $dest
    foreach ($f in @('manifest.json', 'README.md', 'CHANGELOG.md', 'icon.png')) {
        $p = Join-Path $x $f
        if (Test-Path $p) { Copy-Item $p $dest }
    }
    $m = [pscustomobject]@{ full_name = $ModFullName; author = 'Radicaldera'; name = $man.name; display = 'Smith & Saga: Forge Reforged'; website_url = $man.website_url
        version_number = $man.version_number; description = $man.description; dependencies = $man.dependencies }
    Set-ModEntry $ymlFile $ModFullName (New-ModBlock $m $false)
    Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
    Say ('  Smith & Saga ' + $man.version_number + ' を入れました') 'Green'
}

# ---------------- main ----------------
Say ''
Say '=== Smith & Saga: Forge Reforged インストーラー ===' 'Cyan'
Say ''

if (Get-Process -Name 'r2modman' -ErrorAction SilentlyContinue) {
    Fail 'r2modman が起動中です。r2modman を終了してから、もう一度実行してください。'
}
if (Get-Process -Name 'valheim' -ErrorAction SilentlyContinue) {
    Fail 'Valheim が起動中です。ゲームを終了してから、もう一度実行してください。'
}

$r2 = Find-R2modman
if (-not $r2 -and -not $Uninstall) { $r2 = Install-R2modman }

$profilesRoot = Join-Path $env:APPDATA 'r2modmanPlus-local\Valheim\profiles'
if (-not (Test-Path $profilesRoot)) { New-Item -ItemType Directory -Path $profilesRoot -Force | Out-Null }
$profiles = @(Get-ChildItem -Path $profilesRoot -Directory | Select-Object -ExpandProperty Name)

if (-not $ProfileName) {
    if ($profiles.Count -eq 0) { $ProfileName = 'Default' }
    elseif ($profiles.Count -eq 1) { $ProfileName = $profiles[0] }
    else {
        Say 'インストール先のプロファイルを選んでください:'
        for ($i = 0; $i -lt $profiles.Count; $i++) { Say ('  [' + ($i + 1) + '] ' + $profiles[$i]) }
        $ans = Read-Host '番号'
        $n = 0
        if (-not [int]::TryParse($ans, [ref]$n) -or $n -lt 1 -or $n -gt $profiles.Count) { Fail '番号が正しくありません。' }
        $ProfileName = $profiles[$n - 1]
    }
}
$profileDir = Join-Path $profilesRoot $ProfileName
New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
$yml = Join-Path $profileDir 'mods.yml'
Say ('プロファイル: ' + $ProfileName)

if ($Uninstall) {
    $dest = Join-Path $profileDir ('BepInEx\plugins\' + $ModFolder)
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Set-ModEntry $yml $ModFullName $null
    Say 'Smith & Saga をアンインストールしました。設定やセーブデータには手を付けていません。' 'Green'
    return
}

if (-not (Test-Path (Join-Path $profileDir 'BepInEx\core\BepInEx.dll'))) { Install-BepInEx $profileDir $yml }
Install-SmithAndSaga $profileDir $yml

# warn about mods that conflict (Smith & Saga does not load while they are active)
$active = @()
foreach ($b in (Read-ModsYml $yml)) {
    $n = Get-BlockName $b
    if ($OldMods -contains $n -and (Get-BlockEnabled $b)) { $active += $n }
}
if ($active.Count -gt 0) {
    Say ''
    Say ('注意: 次の MOD が有効になっています。Smith & Saga と同じ機能を含むため、r2modman で無効にしてください: ' + ($active -join ', ')) 'Yellow'
}

Say ''
Say ('完了しました。r2modman で Valheim → プロファイル「' + $ProfileName + '」を選び、「Start modded」で起動してください。') 'Green'
if ($r2) {
    $open = Read-Host 'r2modman を今すぐ開きますか? (Y/n)'
    if ($open -eq '' -or $open -match '^[yY]') { Start-Process $r2 }
}
