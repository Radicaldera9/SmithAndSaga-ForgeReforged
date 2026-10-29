# Smith & Saga: Forge Reforged (beta)

Upgrade tiers unlocked, gear rebalanced, smoother crafting and handling, and friendlier skills — in one mod.

> **Beta.** The in-game texts added by this mod (skills screen, crafting sort button, the Warrior buff) are in Japanese for now.

## Features

### Forge — upgrades
- Upgradeable items go up to **+100**.
- Upgrades never need a crafting station above **level 1**.
- Upgrade materials stay at **vanilla amounts**.
- The "obtained with cheats" mark is removed, and strong upgraded items are no longer flagged as cheated.

### Gear rebalance
- About 160 weapons, armors, shields, arrows and capes have tuned stats, to close the gaps between gear of the same tier.
- Attack animation speed is tuned per weapon type. One- and two-handed swords, axes and clubs are tuned separately. The speed bonus grows with the weapon skill and reaches its full value at skill 60. Below that it scales from the vanilla speed.
- Attack motion values (damage, knockback and stagger multipliers) are tuned per weapon type.

### New secondary attacks
| Weapon | Secondary attack | Damage |
|---|---|---|
| Pickaxes | Atgeir sweep | Blunt only, no mining |
| Sledges | Battleaxe secondary, with battleaxe effects and sounds | Blunt only |
| Bows | Kick, with bare-hand kick effects and sounds; no arrows needed | Pierce only |

### Warrior set bonus
- Wear the helmet, chest and legs of the same series to get the **Warrior** buff.
- The buff gives slight (25%) resistance to blunt and slash, and +20 Blocking skill.
- Series: Bronze, Iron, Padded, Silver (Drake helmet + Wolf armor), Carapace, Flametal.

### Crafting
- Wooden weapons (axe, sword, knife, battleaxe, atgeir, mace, sledge, spear, two-handed sword) can be crafted and upgraded.
- The Abyssal Harpoon and the Antler Pickaxe can be upgraded.
- The Midsummer crown and the pointy hat (Halloween) can be crafted all year and upgraded.
- The crafting list has a sort button at the top: default, by name, or by category. Craftable items always come first. In category order, lower station levels come first.

### Skills
- Skill XP **+30%**.
- **No skill loss** on death.
- **XP respec** in the Skills screen. Lowering a skill by one level banks its XP. Spend banked XP to raise another skill.

## Install
- **r2modman / Thunderstore Mod Manager:** install `Smith_and_Saga`. BepInExPack_Valheim is installed as a dependency.
- **One-line installer (Windows PowerShell)** — installs r2modman if needed, BepInExPack and this mod into an r2modman profile:
  ```powershell
  & ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
  ```

## Compatibility
- This mod does not load while **MoreUpgrades** (renair) or the author's older separate mods (MoreUpgrades port, EquipmentEditor, ExtraRecipes, FixedKnockbackBlock) are active. It already contains their features.
- Other mods that change the same item stats, recipes or upgrade levels may conflict.
- **Multiplayer:** the values are applied on each player's game, so all players should use the same version.

## Credits
- **renair** — original creator of [MoreUpgrades](https://www.nexusmods.com/valheim/mods/1740). The upgrade features of this mod (upgrade levels, station level, cheated-flag removal) are a modified and updated version of MoreUpgrades, released under its permissions: modification and upload are allowed with credit to the original creator.
- The item stat and animation speed features were inspired by aedenthorn's CustomWeaponStats, CustomArmorStats and AnimationSpeed.

---

# Smith & Saga: Forge Reforged（ベータ版）

強化段階の解放、装備バランスの見直し、製作と操作の快適化、スキルまわりの改善をひとつにまとめた MOD です。

## 主な内容
- **強化**
  - 強化上限は +100 です。
  - 強化に必要な作業台・鍛冶場のレベルは 1 です。
  - 強化素材の数はバニラのままです。
  - 「チートで出現」の表示を消します。
- **装備の調整**
  - 約 160 種の装備の性能を調整しています。
  - 攻撃モーションの速度を武器種ごとに調整しています。剣・斧・棍棒は片手と両手で別々です。速度はスキルに応じて上がり、スキル 60 で最大になります。
  - モーション値（ダメージ・ノックバック・よろめきの倍率）を調整しています。
- **副次攻撃**
  - つるはし：アトゲイルの薙ぎ払い。打撃ダメージのみで、採掘はできません。
  - 大ハンマー：バトルアックスの副次攻撃。打撃ダメージのみです。
  - 弓：キック。刺突ダメージのみで、矢は不要です。
- **戦士のセット効果**
  - 青銅・鉄・詰め物・銀（ドレイクの兜＋狼の防具）・甲皮・炎金の兜・胸・脚を同じシリーズでそろえると発動します。
  - 打撃・斬撃にやや耐性（25%）がつき、ブロックスキルが +20 されます。
- **製作**
  - 木の武器シリーズを作成・強化できます。
  - 奈落の銛と枝角のつるはしを強化できます。
  - 夏至祭の冠ととんがり帽子（ハロウィン）を、通年で作成・強化できます。
  - 製作リストに並び替えボタンがあります（標準 / 名前順 / カテゴリ順）。
- **スキル**
  - 経験値が +30% になります。
  - 死亡してもスキルが下がりません。
  - スキル画面で、経験値単位の振り直しができます。

## インストール
PowerShell で次の 1 行を実行します。必要に応じて、r2modman、BepInExPack、この MOD の順に入れます。
```powershell
& ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Radicaldera9/SmithAndSaga-ForgeReforged/main/install.ps1')))
```
- **注意**：MoreUpgrades（renair）や、作者の旧 MOD（MoreUpgrades 移植版、EquipmentEditor、ExtraRecipes、FixedKnockbackBlock）が有効な間は、この MOD は読み込まれません。
- **マルチプレイ**：全員が同じバージョンを入れてください。

## クレジット
- **renair**：[MoreUpgrades](https://www.nexusmods.com/valheim/mods/1740) のオリジナル作成者です。この MOD の強化機能（強化段階・施設レベル・チート表記の除去）は、MoreUpgrades を最新版向けに改変したものです。元 MOD の許可（作成者を明記すれば改変・アップロード可）に基づいて公開しています。
- アイテム性能とモーション速度の機能は、aedenthorn さんの CustomWeaponStats / CustomArmorStats / AnimationSpeed を参考にしました。
