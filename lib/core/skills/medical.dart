import 'package:trpg_tool/core/models/skill.dart';

mixin MedicalSkills {
  List<Skill> allSkills = [];

  SkillType type = SkillType.medical;

  void init() {
    Skill firstAid = Skill()
      ..name = "急救"
      ..base = 30;
    Skill medicine = Skill()
      ..name = "医学"
      ..base = 1;
    Skill mentalAnalysis = Skill()
      ..name = "精神分析"
      ..base = 1;
    final tempList = [firstAid, medicine, mentalAnalysis];
    for (var element in tempList) {
      element.type = type;
    }
    allSkills.addAll(tempList);
  }
}
