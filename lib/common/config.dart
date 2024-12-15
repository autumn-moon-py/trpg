class APPConfig {
  // 骰子音频地址
  static const String diceAudioPath = "sound/dice.mp3";

  // 职业表格
  static const String careerTablePath = "assets/excel/职业.csv";

  /// 基础属性最大值
  static const Map<String, int> attributesMaxMap = {
    'STR': 99,
    'CON': 99,
    'SIZ': 180,
    'DEX': 99,
    'APP': 99,
    'INT': 99,
    'POW': 100,
    'EDU': 99,
    "LUK": 99
  };

  /// 基础属性对应中文
  static const Map<String, String> attributesChineseMap = {
    'STR': '力量',
    'CON': '体质',
    'SIZ': '体型',
    'DEX': '敏捷',
    'APP': '外貌',
    'INT': '智力',
    "POW": "意志",
    'EDU': '教育',
    'LUK': '幸运',
  };

  /// 基础属性生成骰子表达式
  static const Map<String, String> attributesDiceMap = {
    'STR': "3d6x5",
    'CON': "3d6x5",
    'SIZ': "2d6+6x5",
    'DEX': "3d6x5",
    'APP': "3d6x5",
    'INT': "2d6+6x5",
    'POW': "3d6x5",
    'EDU': "2d6+6x5",
    "LUK": "3d6x5"
  };

  /// 其他数值对应中文
  static const Map<String, String> derivedStatsChineseMap = {
    "DB": "附加伤害",
    "Build": "体格",
    "HP": "生命值",
    "MP": "魔法值",
    "SAN": "理智",
    "MOV": "移动力",
  };

  static (String, int) getDBAndBuild(int count) {
    String db = "";
    int build = 0;
    if (count >= 2 && count <= 64) {
      db = "-2";
      build = -2;
    } else if (count >= 65 && count <= 84) {
      db = "-1";
      build = -1;
    } else if (count >= 85 && count <= 124) {
      db = "0";
      build = 0;
    } else if (count >= 125 && count <= 164) {
      db = "1d4";
      build = 1;
    } else if (count >= 165 && count <= 204) {
      db = "1d6";
      build = 2;
    }
    return (db, build);
  }

  /// 其他数值生成骰子表达式
  static Map<String, String Function(Map<String, int>)> derivedStatsDiceMap = {
    "DB": (attributesMap) {
      String db = "";
      int siz = attributesMap['SIZ']!;
      int str = attributesMap['STR']!;
      db = getDBAndBuild(siz + str).$1;
      return db;
    },
    "HP": (attributesMap) {
      int hp = 0;
      int con = attributesMap['CON']!;
      int siz = attributesMap['SIZ']!;
      hp = ((con + siz) / 10).ceil();
      return hp.toString();
    },
    "MP": (attributesMap) {
      int mp = 0;
      int pow = attributesMap['POW']!;
      mp = (pow / 5).ceil();
      return mp.toString();
    },
    "SAN": (attributesMap) {
      int san = 0;
      int pow = attributesMap['POW']!;
      san = pow;
      return san.toString();
    },
    "MOV": (attributesMap) {
      int mov = 8;
      int str = attributesMap['STR']!;
      int dex = attributesMap['DEX']!;
      int siz = attributesMap['SIZ']!;
      if (str > siz && dex > siz) {
        mov += 1;
      }
      if (str <= siz && dex <= siz) {
        mov -= 1;
      }
      return mov.toString();
    },
    // 高体格可以丢起低体格
    "Build": (attributesMap) {
      int build = 0;
      int str = attributesMap['STR']!;
      int siz = attributesMap['SIZ']!;
      final result = getDBAndBuild(str + siz);
      build = result.$2;
      return build.toString();
    }
  };
}
