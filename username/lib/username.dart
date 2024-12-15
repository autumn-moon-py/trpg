import 'dart:math';
import 'package:username/username_ja.dart';

import 'language_code.dart';
import 'username_cn.dart';
import "usernaem_en.dart";

/// username class
abstract class Username {
  /// surname
  final String? surName;

  /// given name
  final String? givenName;

  final bool? isMale;

  /// constructor
  Username({this.surName, this.givenName, this.isMale});

  /// top sur names
  List<String> get topSurNames;

  /// top given names
  List<String> get topGivenNames;

  /// 性别划分
  String getBaseName(String male, String female) {
    String name = "";
    if (isMale == null) name = "$male,$female";
    if (isMale != null) {
      if (isMale!) {
        name = male;
      } else {
        name = female;
      }
    }
    return name;
  }

  /// get random surname.
  /// if specified surname,then surname fixed.
  /// or else use top random surname
  String getSurName() {
    if (surName != null) return surName!;
    final rand = Random();
    final index = rand.nextInt(topSurNames.length);
    return topSurNames[index];
  }

  /// get random given name.
  /// if specified given name,then given name fixed.
  /// or else use top random given name
  String getGivenName() {
    if (givenName != null) return givenName!;
    final rand = Random();
    final index = rand.nextInt(topGivenNames.length);
    return topGivenNames[index];
  }

  /// tool: split string with comma
  List<String> splitCommaString(String input) {
    final list = input.split(',');
    final pure = list.map((name) => name.trim()).toList();
    return pure;
  }

  @override
  String toString() => fullname;

  /// get fullname
  /// (e.g. Chinese fullname is : surname+given name)
  String get fullname;

  List<String> getFullnames({int count = 0}) {
    if (count <= 0) return [fullname];
    final list = List.generate(count, (_) => fullname);
    return list;
  }

  /// factory locale
  factory Username._locale(
      {LanguageCode lang = LanguageCode.cn,
      String? surName,
      String? givenName,
      bool? isMale}) {
    if (lang == LanguageCode.cn) {
      return CNUsername(surName: surName, givenName: givenName, isMale: isMale);
    }

    if (lang == LanguageCode.en) {
      return ENUsername(surName: surName, givenName: givenName, isMale: isMale);
    }

    if (lang == LanguageCode.ja) {
      return JAUsername(surName: surName, givenName: givenName, isMale: isMale);
    }

    throw UnimplementedError();
  }

  factory Username.cn({String? surName, String? givenName, bool? isMale}) =>
      Username._locale(
          lang: LanguageCode.cn,
          surName: surName,
          givenName: givenName,
          isMale: isMale);

  factory Username.en({String? surName, String? givenName, bool? isMale}) =>
      Username._locale(
          lang: LanguageCode.en,
          surName: surName,
          givenName: givenName,
          isMale: isMale);

  factory Username.ja({String? surName, String? givenName, bool? isMale}) =>
      Username._locale(
          lang: LanguageCode.ja,
          surName: surName,
          givenName: givenName,
          isMale: isMale);
}
