# Smith & Saga: Forge Reforged (beta)

Upgrade tiers unlocked, gear rebalanced, smoother crafting and handling, set bonuses and friendlier skills — in one mod.

> **Testing stage.** This is the author's first mod, and the author is still partway through the Deep North. Balance, especially for late-game gear, may change, and bugs are possible. Please back up your world and characters before trying it. Feedback is very welcome.

The mod's own controls use symbols and icons, so they work in any language.

## Features

### Forge — upgrades
- The upgrade limit is raised to **+100**. No idols are needed.
- Gear that normally cannot be upgraded can be upgraded.
- Upgrades work at a **level 1** workbench or forge.
- **Cheat-flag removal (optional, off by default):** a checkbox in the bottom-right corner of the Achievements screen removes the "obtained with cheats" mark and the cheat check. Turn it off if it conflicts with another cheat-flag mod.

![Upgrading past the vanilla limit](https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/images/upgrade.jpg)

*Antler Pickaxe going to quality 5 with a level 1 station. The sort icons sit at the top of the list.*

### Gear rebalance
- About 160 pieces of gear have tuned stats.
- Attack animation speed is tuned. The speed rises with your skill level and reaches its maximum at skill 60.
- Motion values (damage, knockback and stagger multipliers) are tuned.

### New secondary attacks
| Weapon | Secondary attack | Damage |
|---|---|---|
| Pickaxes | Atgeir sweep. Cannot mine. | Uses the blunt damage |
| Sledges | The same secondary attack as the battleaxe | Uses the blunt damage |
| Bows | Kick. No arrows needed. | Uses the pierce damage |

![Pickaxe sweep, sledge swing and bow kick](https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/images/secondary.jpg)

*Left to right: pickaxe sweep, sledge swing, bow kick.*

### Set bonuses
**New armor sets**

- **Warrior**
  - Armor: Bronze, Iron, Padded, Silver (Drake helmet + Wolf armor), Carapace, Flametal — helmet, chest and legs, series may be mixed
  - Effect: blunt / slash damage taken -12.5%, knockback taken -50%, Blocking +20
- **Nimble**
  - Armor: Leather, Troll, Root, Fenris, Lox, Ask — helmet, chest and legs, series may be mixed
  - Effect: Run +10, Dodge +10
- **Homesteader**
  - Armor: Hildir's hats and clothes that already lower base-item stamina — any hat + any garment
  - Effect: base-item stamina use (hammer, hoe, cultivator...) -50%

**Series sets** (helmet, chest and legs of one series)

- **Guardian's Lore** (Bronze)
  - Blocking +20
- **Miner** (Iron)
  - Wetproof, Pickaxes +30
- **White Wolf** (Silver)
  - Frost resistance (very resistant, 75%)
- **Bulwark** (Padded)
  - Blunt resistance (slightly resistant, 25%)
- **Hardshell** (Carapace)
  - Pierce resistance (slightly resistant, 25%)
- **Flameforged** (Flametal)
  - Slash resistance (slightly resistant, 25%)

### Crafting
- The wooden weapon series can be crafted and upgraded.
- The Midsummer crown and the pointy hat (Halloween) can be crafted and upgraded all year round.
- Sort icon buttons are added at the top of the crafting list: list lines = default, A/Z with an arrow = by name, gear icons = by category.

### Skills
- Skill XP gain **+30%**.
- Skills do **not drop** when you die.
- Every skill in the Skills screen gets [-] and [+] buttons. The XP freed by lowering a skill one level with [-] is stored as `exp:` in the top-right corner, and [+] spends it on another skill.

![Skills screen with - and + buttons](https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/images/skills.png)

## Install
- **r2modman / Thunderstore Mod Manager:** install `Smith_and_Saga`. BepInExPack_Valheim is installed as a dependency.
- **One-line installer (Windows PowerShell)** — installs r2modman if needed, BepInExPack and this mod into an r2modman profile:
  ```powershell
  & ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
  ```

## Compatibility
- This mod does not load while **MoreUpgrades** (renair) or the author's older separate mods (MoreUpgrades port, EquipmentEditor, ExtraRecipes, FixedKnockbackBlock) are active. It already contains their features.
- Other mods that change the same item stats, recipes, upgrade levels or armor set bonuses may conflict.
- **Cheat-flag mods** (OdinLookedAway, CheatCleanup, NoCheatText ...): if they conflict, turn this mod's cheat-flag checkbox off (off by default).
- **Multiplayer:** the values are applied on each player's game, so all players should use the same version.

## Credits
- **renair** — original creator of [MoreUpgrades](https://www.nexusmods.com/valheim/mods/1740). The upgrade features of this mod (upgrade levels, station level, cheated-flag removal) are a modified and updated version of MoreUpgrades, released under its permissions: modification and upload are allowed with credit to the original creator.
- The item stat and animation speed features were inspired by aedenthorn's CustomWeaponStats, CustomArmorStats and AnimationSpeed.

---

# Smith & Saga: Forge Reforged（ベータ版）

強化段階の解放、装備バランスの見直し、製作と操作の快適化、セット効果、スキルまわりの改善をひとつにまとめた MOD です。

> **テスト段階です。** 作者にとって初めての MOD 制作で、作者自身もディープノースを攻略している途中です。終盤の装備を中心にバランスは今後変わる可能性があり、不具合が残っているかもしれません。試す前にワールドとキャラクターのバックアップをおすすめします。感想や不具合の報告を歓迎します。

## 主な内容
- 強化上限を +100 に引き上げ、偶像は不要。
- 通常では強化できない装備を強化可能。
- 作業台・鍛冶場のレベルは 1 で強化可能。
- 「チートで出現」の表示と判定の消去（任意・初期状態はオフ）。実績画面の右下のチェックボックスで切り替え。他のチート判定 MOD と競合する場合はオフにしてください。
- 約 160 種の装備の性能を調整。
- 攻撃モーション速度調整。速度はスキルレベルに応じて上がり、スキル 60 で最大速度。
- モーション値（ダメージ・ノックバック・よろめきの倍率）を調整。
- つるはし：アトゲイルの薙ぎ払い。打撃攻撃力を参照し、採掘は不可。
- 大ハンマー：バトルアックスと同様の副次攻撃。打撃攻撃力を参照。
- 弓：キック。刺突攻撃力を参照し、矢は不要。
- 木の武器シリーズを作成・強化可能。
- 夏至祭の冠ととんがり帽子（ハロウィン）を、通年で作成・強化できます。
- 製作リストの上に並び替えアイコンボタンを追加（横線 = 標準 / A・Z と矢印 = 名前順 / 装備アイコン = カテゴリ順）。
- スキル経験値獲得量が +30% 。
- 死亡してもスキルが低下しない。
- スキル画面の各スキルに［-］［+］ボタンを追加。［-］で1レベル下げた分の経験値は右上の `exp:` に貯まり、［+］で別のスキルに使用可能。

## セット効果
**新しい装備セット**

- **戦士**
  - 対象：青銅・鉄・詰め物・銀（ドレイクの兜＋狼の胸・脚）・甲皮・炎金の兜・胸・脚（シリーズを混ぜても可）
  - 効果：打撃・斬撃のダメージ -12.5%、受けるノックバック -50%、ブロック +20
- **身軽**
  - 対象：革・トロル革・木の根・フェンリル・ロックス・アスクの兜・胸・脚（シリーズを混ぜても可）
  - 効果：走り +10、回避 +10
- **開拓者**
  - 対象：元から基地用スタミナ軽減が付いたヒルディルの帽子と上着（組み合わせ自由）
  - 効果：基地用（ハンマー・鍬・耕運機など）のスタミナ消費 -50%

**シリーズのセット**（同じシリーズの兜・胸・脚）

- **守りの心得**（青銅）
  - ブロック +20
- **坑夫**（鉄）
  - 濡れ耐性、つるはし +30
- **白狼**（銀）
  - 冷気耐性（かなり耐性あり・75%）
- **鉄壁**（詰め物）
  - 打撃耐性（やや耐性あり・25%）
- **堅殻**（甲皮）
  - 刺突耐性（やや耐性あり・25%）
- **炎鍛**（炎金）
  - 斬撃耐性（やや耐性あり・25%）

## インストール
PowerShell で次の 1 行を実行します。必要に応じて、r2modman、BepInExPack、この MOD の順に入れます。
```powershell
& ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
```
- **注意**：MoreUpgrades（renair）や、作者の旧 MOD（MoreUpgrades 移植版、EquipmentEditor、ExtraRecipes、FixedKnockbackBlock）が有効な間は、この MOD は読み込まれません。
- **チート判定 MOD**（OdinLookedAway、CheatCleanup、NoCheatText など）と競合する場合は、この MOD のチェックボックスをオフにしてください（初期状態はオフ）。
- **マルチプレイ**：全員が同じバージョンを入れてください。

## クレジット
- **renair**：[MoreUpgrades](https://www.nexusmods.com/valheim/mods/1740) のオリジナル作成者です。この MOD の強化機能（強化段階・施設レベル・チート表記の除去）は、MoreUpgrades を最新版向けに改変したものです。元 MOD の許可（作成者を明記すれば改変・アップロード可）に基づいて公開しています。
- アイテム性能とモーション速度の機能は、aedenthorn さんの CustomWeaponStats / CustomArmorStats / AnimationSpeed を参考にしました。
