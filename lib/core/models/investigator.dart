import 'dart:math';

import 'package:username/username.dart';

import 'skill.dart';

enum Gender { none, male, female, other }

class Investigator {
  // 姓名
  String name = '';
  // 玩家
  String player = '';
  // 时代
  String era = "";
  List<String> eras = ["现代", "1920年代"];
  // 职业
  String occupation = '';
  // 年龄
  int age = 0;
  // 性别
  String gender = "";
  // 住地
  String home = '';
  // 家乡
  String hometown = '';
  // 母语
  Language language = Language.chinese;

  String randomName() {
    String name = "";
    bool? isMale;
    if (gender.isNotEmpty) {
      if (gender == '男') {
        isMale = true;
      } else {
        isMale = false;
      }
    }
    if (language == Language.chinese) {
      name = Username.cn(isMale: isMale).fullname;
    } else if (language == Language.english) {
      name = Username.en(isMale: isMale).fullname;
    } else if (language == Language.japanese) {
      name = Username.ja(isMale: isMale).fullname;
    }

    return name;
  }

  String randomGender() {
    final genderList = ['男', '女'];
    if (gender.isNotEmpty && gender == genderList[0]) {
      gender = genderList[1];
    } else {
      gender = genderList[0];
    }
    if (gender.isNotEmpty) return gender;
    final rdg = Random().nextInt(2);
    gender = genderList[rdg];
    return gender;
  }
}
