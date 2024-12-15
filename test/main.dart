import 'package:trpg_tool/common/global.dart';
import 'package:trpg_tool/tools/base_attributes.dart';

Future<void> main() async {
  Global.test = true;
  await Global.init();
  readExcel();
}

void readExcel() async {
  final attributesMap = BaseAttributes().rollAttributes();
  for (var c in Global.careerList) {
    c.formulaPoint(attributesMap);
  }
}
