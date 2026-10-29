# Smith & Saga: Forge Reforged

A Valheim mod: upgrade tiers unlocked, gear rebalanced, smoother crafting and handling, friendlier skills. **Currently in beta.**

## Install (Windows, one line)
Close r2modman and Valheim, open PowerShell, then paste this line:

```powershell
& ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
```

The installer does the following:
1. Installs r2modman if it is not installed. It uses the official release from [ebkr/r2modmanPlus](https://github.com/ebkr/r2modmanPlus).
2. Picks your r2modman Valheim profile. If there is more than one, it asks which one.
3. Installs BepInExPack_Valheim from Thunderstore, if the profile does not have it.
4. Installs the latest Smith & Saga release and adds it to r2modman's mod list.

After that, open r2modman, choose Valheim and the profile, then click **Start modded**.

To uninstall:
```powershell
& ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1'))) -Uninstall
```

The mod is also on Thunderstore as `Smith_and_Saga`, so you can install it from r2modman directly.

---

## インストール（Windows・1 行）
r2modman と Valheim を閉じてから PowerShell を開き、次の 1 行を貼り付けて実行します。

```powershell
& ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
```

インストーラーは次の順に処理します。
1. r2modman が入っていなければ、公式リリースから入れます。
2. Valheim のプロファイルを選びます。プロファイルが複数あるときは、どれに入れるか聞きます。
3. プロファイルに BepInExPack_Valheim がなければ入れます。
4. Smith & Saga の最新版を入れて、r2modman の MOD 一覧に登録します。

終わったら r2modman で Valheim とプロファイルを選び、「Start modded」で起動してください。

アンインストールするときは、上の 1 行の末尾に ` -Uninstall` を付けて実行します。

MOD の内容は [リリースの README](README_MOD.md) を見てください。
