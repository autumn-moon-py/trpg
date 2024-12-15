import 'package:trpg_tool/core/models/skill.dart';

mixin ControlSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.control;

  void init() {
    Skill driveCar = Skill()
      ..name = "汽车驾驶"
      ..base = 20;
    Skill ride = Skill()
      ..name = "骑术"
      ..base = 5;
    Skill vehicle = Skill()
      ..name = "驾驶"
      ..haveSub = true
      ..base = 1;
    Skill heavyMachinery = Skill()
      ..name = "操作重型机械"
      ..base = 1;
    final tempList = [driveCar, ride, vehicle, heavyMachinery];
    for (var element in tempList) {
      element.type = type;
    }
    allSkills.addAll(tempList);
  }
}
