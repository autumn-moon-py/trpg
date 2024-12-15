import 'dart:math';

import 'package:trpg_tool/common/global.dart';

/// 传入投掷表达式
/// 例如:3d6x5
int baseRollDice(String diceExpression, {bool output = false}) {
  diceExpression = diceExpression.toLowerCase();
  if (output) Global.log.d(diceExpression);

  final regex = RegExp(r'(\d+)d(\d+)([+x*\-]\d+)?');
  Iterable<RegExpMatch> matches = regex.allMatches(diceExpression);
  final rng = Random();

  int result = 0;

  for (var match in matches) {
    // 掷骰子的次数
    int rolls = int.parse(match.group(1)!);
    // 骰子的面数
    int dice = int.parse(match.group(2)!);
    // 可选的运算符和数值
    String? operation = match.group(3);

    // 执行骰子投掷
    int subtotal = 0;
    for (int i = 0; i < rolls; i++) {
      final temp = rng.nextInt(dice) + 1;
      if (output) Global.log.d("投掷第${i + 1}次,面数:$dice,结果:$temp");
      subtotal += temp;
    }
    if (output) Global.log.d("骰子结果:$subtotal");

    // 根据有无运算符进行计算
    if (operation != null) {
      int operationValue = int.parse(operation.substring(1));
      switch (operation[0]) {
        case '+':
          subtotal += operationValue;
          break;
        case '-':
          subtotal -= operationValue;
          break;
        case 'x':
          subtotal *= operationValue;
          break;
        case '*':
          subtotal *= operationValue;
          break;
      }
    }

    result += subtotal;
  }

  if (output) Global.log.d("最终结果:$result");
  return result;
}

int baseRollDice1(
  String diceExpression, {
  bool output = false,
}) {
  diceExpression = diceExpression.toLowerCase().replaceAll(' ', '');
  if (output) Global.log.d(diceExpression);

  // 改进的正则表达式，以支持多个运算符和数字
  final regex = RegExp(r'(\d+)d(\d+)(([+\-*x]\d+)*)');
  Iterable<RegExpMatch> matches = regex.allMatches(diceExpression);
  final rng = Random();

  int result = 0;
  for (var match in matches) {
    int rolls = int.parse(match.group(1)!);
    int dice = int.parse(match.group(2)!);
    String operations = match.group(3) ?? '';

    // 执行骰子投掷
    int subtotal = 0;
    for (int i = 0; i < rolls; i++) {
      final roll = rng.nextInt(dice) + 1;
      if (output) if (output) Global.log.d("投掷第${i + 1}次,面数:$dice,结果:$roll");
      subtotal += roll;
    }
    if (output) Global.log.d("骰子结果:$subtotal");

    // 处理所有后续运算
    if (operations.isNotEmpty) {
      RegExp opRegex = RegExp(r'([+\-*x])(\d+)');
      for (var opMatch in opRegex.allMatches(operations)) {
        String op = opMatch.group(1)!;
        int value = int.parse(opMatch.group(2)!);
        switch (op) {
          case '+':
            subtotal += value;
            break;
          case '-':
            subtotal -= value;
            break;
          case 'x':
          case '*':
            subtotal *= value;
            break;
        }
      }
    }

    result += subtotal;
  }

  if (output) Global.log.d("最终结果:$result");
  return result;
}

// 计算半值和五分之一值
(int, int) getHalfAndFifth(int value) {
  final half = (value / 2).floor();
  final fifth = (value / 5).floor();
  return (half, fifth);
}

extension MapInverter<K, V> on Map<K, V> {
  Map<V, K> invert() {
    Map<V, K> invertedMap = {};
    for (K key in keys) {
      V? value = this[key];
      if (value != null) {
        invertedMap[value] = key;
      }
    }
    return invertedMap;
  }
}

extension StringExtension on String {
  String replaceBrackets() {
    return replaceAll('（', '')
        .replaceAll('）', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll("[", "")
        .replaceAll("]", "");
  }
}
