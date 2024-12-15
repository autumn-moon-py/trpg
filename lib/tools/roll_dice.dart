import 'package:trpg_tool/tools/tools.dart';

class RollDice {
  // 百面
  static int rd100() {
    return baseRollDice("1d100");
  }

  // 三个24面之和
  static int r3d24() {
    return baseRollDice("3d24");
  }

  // 三个90面之和
  static int r3d90() {
    return baseRollDice("3d90");
  }
}
