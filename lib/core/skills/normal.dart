import 'package:trpg_tool/core/models/skill.dart';

import 'combat.dart';
import 'control.dart';
import 'explore.dart';
import 'knowledge.dart';
import 'medical.dart';
import 'social.dart';
import 'sport.dart';
import 'technology.dart';

class Skills
    with
        ExploreSkills,
        CombatSkills,
        KnowledgeSkills,
        ControlSkills,
        MedicalSkills,
        SportSkills,
        SocialSkills,
        TechnologySkills {
  @override
  void init() {
    super.init();
    Skill creditRating = Skill()..name = "信用评级";
    Skill kh = Skill()
      ..name = "克苏鲁神话"
      ..canHobby = false
      ..canPro = false;
    allSkills.addAll([creditRating, kh]);
  }
}
