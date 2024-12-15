class Skill {
  // 技能名
  String name = "";
  bool haveSub = false;
  String subName = "";

  // 基础
  int base = 0;

  // 职业
  int pro = 0;

  // 特长
  bool isSpecialty = false;

  // 兴趣
  bool canHobby = true;
  int hobby = 0;

  // 成长
  bool growth = false;
  int growthInt = 0;

  // 总值
  int total = 0;

  // 本职技能
  bool isPro = false;
  bool canPro = true;

  // 类型
  SkillType type = SkillType.none;
}

// 技能类型中文映射
Map<SkillType, String> skillTypeChineseMap = {
  SkillType.explore: "探索",
  SkillType.social: "社交",
  SkillType.combat: "战斗",
  SkillType.medical: "医疗",
  SkillType.sport: "运动",
  SkillType.knowledge: "知识",
  SkillType.technology: "技术",
  SkillType.control: "操纵",
  SkillType.other: "其他",
  SkillType.none: "",
};

// 技能类型,探索,社交,战斗,医疗,运动,知识,技术,操纵,其他
enum SkillType {
  explore,
  social,
  combat,
  medical,
  sport,
  knowledge,
  technology,
  control,
  other,
  none
}

// 语言中文映射
Map<Language, String> languageChineseMap = {
  Language.chinese: "汉语",
  Language.english: "英语",
  Language.japanese: "日语",
  Language.french: "法语",
  Language.russian: "俄语",
  Language.spanish: "西班牙",
  Language.german: "德语",
  Language.italian: "意大利语",
  Language.portuguese: "葡萄牙语",
  Language.arabic: "阿拉伯语",
  Language.latin: "拉丁语",
};

// 语言反向映射
Map<String, Language> languageReverseMap = {
  "汉语": Language.chinese,
  "英语": Language.english,
  "日语": Language.japanese,
  "法语": Language.french,
  "俄语": Language.russian,
  "韩语": Language.spanish,
  "德语": Language.german,
  "意大利语": Language.italian,
  "葡萄牙语": Language.portuguese,
};

// 语言枚举,汉语,英语,日语,法语,俄语,韩语,西班牙,德语,意大利语,葡萄牙语,阿拉伯语,拉丁语
enum Language {
  chinese,
  english,
  japanese,
  french,
  russian,
  spanish,
  german,
  italian,
  portuguese,
  arabic,
  latin,
  none,
}

// 生存中文映射
Map<Survival, String> survivalChineseMap = {
  Survival.desert: "沙漠",
  Survival.forest: "森林",
  Survival.island: "荒岛",
  Survival.mountain: "高山",
  Survival.sea: "海上",
  Survival.none: "",
};

// 生存枚举,沙漠,森林,荒岛,高山,海上
enum Survival { desert, forest, island, mountain, sea, none }

// 驾驶中文映射
Map<Vehicle, String> vehicleChineseMap = {
  Vehicle.ship: "船",
  Vehicle.car: "马车",
  Vehicle.airplane: "飞行器",
  Vehicle.none: "",
};

// 驾驶,船,马车,飞行器
enum Vehicle { ship, car, airplane, none }

// 射击中文映射
Map<Shoot, String> shootChineseMap = {
  Shoot.handgun: "手枪",
  Shoot.pistol: "步枪/霰弹枪",
  Shoot.smg: "冲锋枪",
  Shoot.bow: "弓弩",
  Shoot.machinegun: "机枪",
  Shoot.heavy: "重武器",
  Shoot.none: "",
};

// 射击,手枪,步枪/霰弹枪,冲锋枪,弓弩,机枪,重武器
enum Shoot { handgun, pistol, shotgun, smg, bow, machinegun, heavy, none }

// 格斗中文映射
Map<Combat, String> combatChineseMap = {
  Combat.boxing: "拳击",
  Combat.brawl: "斗殴",
  Combat.knife: "刀剑",
  Combat.spear: "矛",
  Combat.axe: "斧",
  Combat.rope: "绞索",
  Combat.chainsaw: "链锯",
  Combat.chain: "链枷",
  Combat.whip: "鞭",
  Combat.none: "",
};

// 格斗,斗殴,刀剑,矛,斧,绞索,链锯,链枷,鞭
enum Combat {
  boxing,
  brawl,
  knife,
  spear,
  axe,
  rope,
  chainsaw,
  chain,
  whip,
  none
}

// 科学中文映射
Map<Science, String> scienceChineseMap = {
  Science.astronomy: "天文学",
  Science.biology: "生物学",
  Science.chemistry: "化学",
  Science.geology: "地质学",
  Science.medicine: "医学",
  Science.physics: "物理",
  Science.psychology: "心理学",
  Science.science: "科学",
  Science.cryptography: "密码学",
  Science.engineering: "工程学",
  Science.mathematics: "数学",
  Science.pharmacy: "药学",
  Science.none: ""
};

// 科学,数学,药学,动物学,密码学,鉴证,物理,地质学,植物学,气象学,制药,化学,生物学,天文学,工程学
enum Science {
  astronomy,
  biology,
  chemistry,
  geology,
  medicine,
  physics,
  psychology,
  science,
  cryptography,
  engineering,
  mathematics,
  pharmacy,
  statistics,
  none
}

// 技艺中文映射
Map<Craft, String> craftChineseMap = {
  Craft.performance: "表演",
  Craft.art: "艺术",
  Craft.calligraphy: "书法",
  Craft.forgery: "伪造",
  Craft.hairdressing: "理发",
  Craft.woodworking: "木工",
  Craft.pipeWork: "管道工",
  Craft.music: "音乐",
  Craft.photography: "摄影",
  Craft.typing: "打字",
  Craft.cooking: "烹饪",
  Craft.technicalDrawing: "技术制图",
  Craft.blacksmith: "铁匠",
  Craft.painting: "绘画",
  Craft.writing: "写作",
  Craft.quickDrawing: "速记",
  Craft.tailoring: "裁缝",
  Craft.farming: "耕作",
  Craft.welding: "焊接",
  Craft.none: ""
};

// 技艺,表演,艺术,书法,伪造,理发,木工,管道工,音乐,摄影,打字,烹饪,技术制图,铁匠,绘画,写作,速记,裁缝,耕作,焊接
enum Craft {
  performance,
  art,
  calligraphy,
  forgery,
  hairdressing,
  woodworking,
  pipeWork,
  music,
  photography,
  typing,
  cooking,
  technicalDrawing,
  blacksmith,
  painting,
  writing,
  quickDrawing,
  tailoring,
  farming,
  welding,
  none
}
