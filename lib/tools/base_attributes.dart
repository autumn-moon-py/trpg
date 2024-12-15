import 'dart:math';

import 'package:trpg_tool/common/global.dart';

import 'tools.dart';
import 'package:trpg_tool/common/config.dart';

class BaseAttributes {
  final random = Random();

  Map<String, String> get attributesChineseMap =>
      APPConfig.attributesChineseMap;
  Map<String, String> get attributesDiceMap => APPConfig.attributesDiceMap;

  bool roll = false;

  int _minAttribute = 40;
  int _maxAttribute = 99;
  int _lowerLimit = 0;
  int _upperLimit = 0;
  int _totalSum = 0;
  bool _noDistributeAllPoints = false;

  Map<String, int> attributesMap = {
    'STR': 0,
    'CON': 0,
    'SIZ': 0,
    'DEX': 0,
    'APP': 0,
    'INT': 0,
    'POW': 0,
    'EDU': 0,
  };
  Map<String, String> derivedStatsMap = {
    "DB": "",
    "Build": "",
    "MOV": "",
    "HP": "",
    "MP": "",
    "SAN": "",
  };

  Map<String, int> rollAttributes(
      {int? totalSum,
      bool includeLuck = false,
      bool noDistributeAllPoints = false,
      int minAttribute = 40,
      int maxAttribute = 99}) {
    _minAttribute = minAttribute;
    _maxAttribute = maxAttribute;
    _noDistributeAllPoints = noDistributeAllPoints;

    if (includeLuck) {
      attributesMap['LUK'] = 0;
    }

    // 调整属性总和到指定范围
    if (totalSum != null) {
      _totalSum = totalSum;
      _lowerLimit = max(480, totalSum);
      _upperLimit = min(600, totalSum);
    } else {
      _lowerLimit = 480;
      _upperLimit = 600;
      _totalSum = random.nextInt(_upperLimit - _lowerLimit) + _lowerLimit;
    }

    // 分配基础属性点
    List<String> keys = attributesMap.keys.toList();
    int totalAttributes = _randomBaseDistribute(keys);

    // 分配剩余点
    if (_noDistributeAllPoints) {
      _randomDistribute(totalAttributes, keys);
    } else {
      _completeDistribute(totalAttributes, keys);
    }

    return attributesMap;
  }

  Map<String, String> getDerivedStats() {
    derivedStatsMap.forEach((key, value) {
      derivedStatsMap[key] =
          APPConfig.derivedStatsDiceMap[key]!(attributesMap).toString();
    });

    return derivedStatsMap;
  }

  // 分配属性点
  int _randomBaseDistribute(List<String> keys) {
    int totalAttributes = 0;
    if (!roll) {
      for (String key in keys) {
        attributesMap[key] =
            _minAttribute + random.nextInt(_maxAttribute - _minAttribute + 1);
        totalAttributes += attributesMap[key]!;
      }
    } else {
      for (String key in keys) {
        String diceExpression = attributesDiceMap[key]!;
        int diceResult = baseRollDice1(diceExpression, output: true);
        Global.log.d("$key:$diceResult");
        attributesMap[key] = diceResult;
        totalAttributes += diceResult;
      }
    }
    Global.log.d(attributesMap.toString());
    return totalAttributes;
  }

  // 随机分配,但最小不低于95%
  void _randomDistribute(int totalAttributes, List<String> keys) {
    int diff = _totalSum - totalAttributes;
    while (diff != 0) {
      for (String key in keys) {
        int temp = attributesMap[key]!;
        if ((diff > 0 && temp < _maxAttribute) ||
            (diff < 0 && temp > _minAttribute)) {
          int adjustment = diff.abs() >
                  (diff > 0 ? _maxAttribute - temp : temp - _minAttribute)
              ? (diff > 0 ? _maxAttribute - temp : temp - _minAttribute)
              : diff.abs();
          temp += diff > 0 ? adjustment : -adjustment;
          diff += diff > 0 ? -adjustment : adjustment;
          if (diff == 0) break;
        }
      }
    }

    final double minTotal = _totalSum * 0.95;
    totalAttributes = attributesMap.values.reduce((sum, e) => sum + e);
    if (totalAttributes < minTotal) {
      int needed = (_totalSum * 0.9).floor() - totalAttributes;
      while (needed > 0) {
        for (String key in keys) {
          if (attributesMap[key]! < _maxAttribute) {
            int increment = min(needed, _maxAttribute - attributesMap[key]!);
            attributesMap[key] = attributesMap[key]! + increment;
            needed -= increment;
            if (needed <= 0) break;
          }
        }
      }
    }
  }

  // 完全分配
  void _completeDistribute(int totalAttributes, List<String> keys) {
    while (totalAttributes < _lowerLimit || totalAttributes > _upperLimit) {
      if (roll) {
        if (totalAttributes < _lowerLimit) {
          // 如果属性总和低于下限，按属性值升序排序，优先增加小属性
          keys.sort((a, b) => attributesMap[a]!.compareTo(attributesMap[b]!));
        } else if (totalAttributes > _upperLimit) {
          // 如果属性总和高于上限，按属性值降序排序，优先减少大属性
          keys.sort((a, b) => attributesMap[b]!.compareTo(attributesMap[a]!));
        }
      }
      for (String key in keys) {
        int temp = attributesMap[key]!;
        if (totalAttributes < _lowerLimit && temp < _maxAttribute) {
          int adjustment = min(_maxAttribute - attributesMap[key]!,
              _lowerLimit - totalAttributes);
          temp += adjustment;
          totalAttributes += adjustment;
        } else if (totalAttributes > _upperLimit && temp > _minAttribute) {
          int adjustment =
              min(temp - _minAttribute, totalAttributes - _upperLimit);
          temp -= adjustment;
          totalAttributes -= adjustment;
        }
        attributesMap[key] = temp;
      }
    }
  }
}
