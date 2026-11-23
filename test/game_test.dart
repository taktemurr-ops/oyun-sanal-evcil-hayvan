import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sanal_evcil_hayvan/oyun_sanal_evcil_hayvan.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sanalEvcilHayvanConfig.title.length, 33);
    expect(sanalEvcilHayvanConfig.tagline.length, 33);
    for (final s in sanalEvcilHayvanConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sanalEvcilHayvanConfig.gameId, sanalEvcilHayvanId);
    expect(sanalEvcilHayvanRules.gameId, sanalEvcilHayvanId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sanalEvcilHayvanRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sanalEvcilHayvanId, optionalMechanics: sanalEvcilHayvanRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sanalEvcilHayvanRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
