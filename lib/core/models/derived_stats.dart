class DerivedStats {
  // san 当前理智,起始理智,最大理智
  final sanStrList = ["当前理智", "起始理智", "最大理智"];
  int san = 0;
  int sanStart = 0;
  int sanMax = 0;

  // hp,当前生命,最大生命
  final hpStrList = ["当前生命", "最大生命"];
  int hp = 0;
  int hpMax = 0;

  // mp,当前魔法,最大魔法
  final mpStrList = ["当前魔法", "最大魔法"];
  int mp = 0;
  int mpMax = 0;

  // 身体状态
  BodyState bodyState = BodyState.normal;

  // 精神状态
  MindState mindState = MindState.normal;
}

// BodyState中文映射
Map<BodyState, String> bodyStateChineseMap = {
  BodyState.normal: "",
  BodyState.injured: "受伤",
  BodyState.unconscious: "昏迷",
  BodyState.dying: "濒死",
  BodyState.dead: "死亡"
};

// 身体状态的枚举,重伤,昏迷,濒死,死亡
enum BodyState { normal, injured, unconscious, dying, dead }

// MindState中文映射
Map<MindState, String> mindStateChineseMap = {
  MindState.normal: "",
  MindState.temporary: "临时疯狂",
  MindState.permanent: "永久疯狂",
  MindState.irregular: "不定期疯狂"
};

// 精神状态的枚举,临时疯狂,永久疯狂,不定期疯狂
enum MindState { normal, temporary, permanent, irregular }
