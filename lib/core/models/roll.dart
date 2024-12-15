// 成功等级反向映射
const Map<String, SuccessLevel> successLevelReverseMap = {
  "常规": SuccessLevel.normal,
  "困难": SuccessLevel.hard,
  "极难": SuccessLevel.extreme
};

// 失败,常规成功,困难成功,极难成功
enum SuccessLevel { fail, normal, hard, extreme }

bool checkRollSuccess(
    int beCheckValue, int checkValue, int half, int fifth, SuccessLevel level) {
  bool success = false;
  if (checkValue >= 96) {
    if (checkValue == 100 && beCheckValue >= 50) {
      return false;
    }
    if (checkValue < 50) {
      return false;
    }
  }
  if (checkValue == 1) {
    return true;
  }
  if (level == SuccessLevel.normal) {
    success = checkValue <= beCheckValue;
  } else if (level == SuccessLevel.hard) {
    success = checkValue <= half;
  } else if (level == SuccessLevel.extreme) {
    success = checkValue <= fifth;
  }
  return success;
}
