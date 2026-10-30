# Smith & Saga: Forge Reforged (beta)

Upgrade tiers unlocked, gear rebalanced, smoother crafting and handling, and friendlier skills — in one mod.

> **Testing stage.** This is the author's first mod, and the author is still partway through the Deep North. Balance, especially for late-game gear, may change, and bugs are possible. Please back up your world and characters before trying it. Feedback is very welcome.

The mod's own controls use symbols and icons, so they work in any language.

## Features

### Forge — upgrades
- The upgrade limit is raised to **+100**. No idols are needed.
- Upgrades work at a **level 1** workbench or forge.
- The "obtained with cheats" mark and the cheat check are removed.

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

### Warrior set bonus
- Wear a full set of Bronze, Iron, Padded, Silver, Carapace or Flametal armor (helmet, chest and legs of the same series) to activate it.
- You get slight (25%) resistance to blunt and slash, and +20 Blocking skill.

### Crafting
- The wooden weapon series can be crafted and upgraded.
- The Abyssal Harpoon and the Antler Pickaxe can be upgraded.
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
- Other mods that change the same item stats, recipes or upgrade levels may conflict.
- **Multiplayer:** the values are applied on each player's game, so all players should use the same version.

## Credits
- **renair** — original creator of [MoreUpgrades](https://www.nexusmods.com/valheim/mods/1740). The upgrade features of this mod (upgrade levels, station level, cheated-flag removal) are a modified and updated version of MoreUpgrades, released under its permissions: modification and upload are allowed with credit to the original creator.
- The item stat and animation speed features were inspired by aedenthorn's CustomWeaponStats, CustomArmorStats and AnimationSpeed.

---

# Smith & Saga: Forge Reforged（ベータ版）

強化段階の解放、装備バランスの見直し、製作と操作の快適化、スキルまわりの改善をひとつにまとめた MOD です。

> **テスト段階です。** 作者にとって初めての MOD 制作で、作者自身もディープノースを攻略している途中です。終盤の装備を中心にバランスは今後変わる可能性があり、不具合が残っているかもしれません。試す前にワールドとキャラクターのバックアップをおすすめします。感想や不具合の報告を歓迎します。

## 主な内容
- 強化上限を +100 に引き上げ、偶像は不要。
- 作業台・鍛冶場のレベルは 1 で強化可能。
- 「チートで出現」の表示と判定を消去。
- 約 160 種の装備の性能を調整。
- 攻撃モーション速度調整。速度はスキルレベルに応じて上がり、スキル 60 で最大速度。
- モーション値（ダメージ・ノックバック・よろめきの倍率）を調整。
- つるはし：アトゲイルの薙ぎ払い。打撃攻撃力を参照し、採掘は不可。
- 大ハンマー：バトルアックスと同様の副次攻撃。打撃攻撃力を参照。
- 弓：キック。刺突攻撃力を参照し、矢は不要。
- 青銅・鉄・詰め物・銀・甲皮・炎金の鎧一式を兜・胸・脚で同じシリーズにそろえると発動。打撃・斬撃にやや耐性（25%）がつき、ブロックスキルが +20 。
- 木の武器シリーズを作成・強化可能。
- 奈落の銛と枝角のつるはしを強化可能。
- 夏至祭の冠ととんがり帽子（ハロウィン）を、通年で作成・強化できます。
- 製作リストの上に並び替えアイコンボタンを追加（横線 = 標準 / A・Z と矢印 = 名前順 / 装備アイコン = カテゴリ順）。
- スキル経験値獲得量が +30% 。
- 死亡してもスキルが低下しない。
- スキル画面の各スキルに［-］［+］ボタンを追加。［-］で1レベル下げた分の経験値は右上の `exp:` に貯まり、［+］で別のスキルに使用可能。

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
