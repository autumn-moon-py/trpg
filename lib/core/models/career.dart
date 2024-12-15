import 'package:trpg_tool/common/config.dart';
import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/core/models/skill.dart';
import 'package:trpg_tool/tools/tools.dart';

class Career {
  // 出处
  final String source;
  // 职业名称
  final String name;
  // 职业信用范围
  final String creditRange;
  late (int, int) creditRangeInt;
  // 职业点数计算
  final String pointFormula;
  List pointFormulaList = [];
  int point = 0;

  // 职业技能列表
  final List<String> skillsStrList;
  final List<Skill> proSkillsList = [];

  Career({
    required this.source,
    required this.name,
    required this.creditRange,
    required this.pointFormula,
    required this.skillsStrList,
  }) {
    _formatCreditRange();
    _formatPointFormula();
    // _formatSkiills();
  }

  void _formatCreditRange() {
    final List<String> list = creditRange.split("-");
    final int min = int.tryParse(list[0]) ?? 0;
    final int max = int.tryParse(list[1]) ?? 0;
    creditRangeInt = (min, max);
  }

  void _formatPointFormula() {
    String formula = pointFormula;
    Map<String, String> invertedMap = APPConfig.attributesChineseMap.invert();
    final RegExp pattern = RegExp(r'([^\u00D7]+)\u00D7(\d+)');
    final matches = pattern.allMatches(formula);
    List result = [];
    for (var match in matches) {
      String attributes = match.group(1)!;
      int multiplier = int.parse(match.group(2)!);
      if (attributes.contains('或')) {
        List<String> parts = attributes.split('或');
        for (var i = 0; i < parts.length; i++) {
          parts[i] = parts[i].replaceFirst("＋", "");
          parts[i] = invertedMap[parts[i]]!;
        }
        result.add([...parts, multiplier]);
      } else {
        attributes = attributes.replaceFirst("＋", "");
        attributes = invertedMap[attributes]!;
        result.add([attributes, multiplier]);
      }
    }
    pointFormulaList = result;
  }

  final existenceKey = '生存';
  final existenceList = [];
  final drivingKey = '驾驶';
  final drivingList = [];
  final languageKey = '外语';
  final languageList = [];
  final orKey = '或';
  final orList = [];

  // ignore: unused_element
  void _formatSkiills() {
    final tempSkills = List<String>.from(skillsStrList);
    for (var s in tempSkills) {
      _speciltyFormat(s);
      _skillFormat(s);
      _socialFormat(s);
      _scienceFormat(s);
    }
  }

  final specialtyKey = '特长';
  final specialtyList = [];
  void _speciltyFormat(String s) {
    final base = Skill()..isSpecialty = true;
    if (s.contains(specialtyKey)) {
      if (s.contains("一")) {
        specialtyList.add(base);
      }
      if (s.contains("二")) {
        specialtyList.add(base);
        specialtyList.add(base);
      }
      specialtyList.add(s);
      skillsStrList.remove(s);
    }
  }

  final skillKey = '技艺';
  final skillList = [];
  void _skillFormat(String s) {
    final base = Skill()
      ..name = skillKey
      ..isPro = true
      ..haveSub = true;
    if (s.contains(skillKey)) {
      String temp = s.replaceBrackets().replaceAll(skillKey, "");
      if (temp.contains("任意") || temp.contains("任一")) {
        skillList.add(base);
      } else if (temp.contains(orKey)) {
        final tempList = temp.split(orKey);
        skillList.add(base..subName = tempList[0]);
        skillList.add(base..subName = tempList[1]);
      } else if (temp.contains("任二")) {
        skillList.add(base);
        skillList.add(base);
      } else {
        skillList.add(base..subName = temp);
      }
      skillList.add(s);
      skillsStrList.remove(s);
    }
  }

  final socialKey = '社交';
  final socialList = [];
  void _socialFormat(String s) {
    final base = Skill()
      ..isPro = true
      ..type = SkillType.social;
    if (s.contains(socialKey)) {
      if (s.contains("一")) {
        socialList.add(base);
      } else {
        socialList.add(base);
        socialList.add(base);
      }
      socialList.add(s);
      skillsStrList.remove(s);
    }
  }

  final scienceKey = '科学';
  final scienceList = [];
  void _scienceFormat(String s) {
    final base = Skill()
      ..name = scienceKey
      ..isPro = true
      ..haveSub = true;
    if (s.contains(scienceKey)) {
      String temp = s.replaceBrackets().replaceAll(scienceKey, "");
      if (temp.contains(orKey)) {
        return;
      }
      if (temp.contains("，")) {
        final tempList = temp.split("，");
        scienceList.add(base..subName = tempList[0]);
        scienceList.add(base..subName = tempList[1]);
      } else if (temp.contains("任一")) {
        scienceList.add(base);
      } else if (temp.contains("三项")) {
        scienceList.add(base);
        scienceList.add(base);
        scienceList.add(base);
      } else {
        scienceList.add(base..subName = temp);
      }
      scienceList.add(s);
      skillsStrList.remove(s);
    }
  }

  final combatKey = '格斗';
  final combatList = [];
  final shootingKey = '射击';
  final shootingList = [];
  void combatFormat(String s) {
    final base = Skill()
      ..isPro = true
      ..haveSub = true
      ..name = combatKey;
    if (s.contains(combatKey)) {
      if (s.contains(orKey)) {
        return;
      }
      String temp = s.replaceBrackets().replaceAll(combatKey, "");
      if (temp == combatKey) {
        combatList.add(base);
      }
    }
  }

  void formulaPoint(Map<String, int> attributesMap) {
    for (List subList in pointFormulaList) {
      if (subList.length == 2) {
        String key = subList[0];
        int multiple = subList[1];
        int temp = attributesMap[key] ?? 0;
        temp *= multiple;
        point += temp;
      } else if (subList.length == 3) {
        String key1 = subList[0];
        String key2 = subList[1];
        int multiple = subList[2];
        int temp1 = attributesMap[key1] ?? 0;
        int temp2 = attributesMap[key2] ?? 0;
        int temp = temp1 > temp2 ? temp1 : temp2;
        temp *= multiple;
        point += temp;
      } else if (subList.length == 4) {
        String key1 = subList[0];
        String key2 = subList[1];
        String key3 = subList[2];
        int multiple = subList[3];
        int temp1 = attributesMap[key1] ?? 0;
        int temp2 = attributesMap[key2] ?? 0;
        int temp3 = attributesMap[key3] ?? 0;
        int temp = temp1 > temp2 ? temp1 : temp2;
        temp = temp3 > temp ? temp3 : temp;
        temp *= multiple;
        point += temp;
      }
    }
    Global.log.d("$name: $point");
  }

  static List<Career> fromList(List<List> rawData) {
    return rawData.map((List row) {
      return Career(
          source: row[0],
          name: row[1],
          creditRange: row[2],
          pointFormula: row[3],
          skillsStrList: row[4].split('，'));
    }).toList();
  }
}
