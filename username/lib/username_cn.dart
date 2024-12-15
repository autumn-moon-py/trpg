import 'username.dart';

/// Chinese username
class CNUsername extends Username {
  CNUsername({super.surName, super.givenName, super.isMale});

  /// fullname
  @override
  String get fullname => getSurName() + getGivenName();

  /// top surnames
  @override
  List<String> get topSurNames {
    const names =
        '王,李,张,刘,陈,杨,黄,赵,吴,周,徐,孙,马,朱,胡,郭,何,高,林,郑,谢,罗,梁,宋,唐,许,韩,冯,邓,曹,彭,曾,蕭,田,董,袁,潘,于,蒋,蔡,余,杜,叶,程,苏,魏,吕,丁,任,沈,姚,卢,姜,崔,钟,谭,陆,汪,范,金,石,廖,贾,夏,韦,付,方,白,邹,孟,熊,秦,邱,江,尹,薛,闫,段,雷,侯,龙,史,陶,黎,贺,顾,毛,郝,龚,邵,万,钱,严,覃,武,戴,莫,孔,向,汤,诸葛';
    return splitCommaString(names);
  }

  /// top given names
  @override
  List<String> get topGivenNames {
    String names = '';
    String female =
        "秀英,桂英,秀兰,玉兰,桂兰,秀珍,凤英,玉珍,玉英,兰英,英,萍,玉梅,红,丽,敏,艳,芳,静,霞,红梅,燕,娟,娜,丹,玲,婷,婷婷,雪,倩,欣怡,悦,佳怡,颖,雨欣,梓涵,诗涵,梓宣,紫涵,雨涵,一诺,雅琴,诗琪,晓雪,珊珊,琪华,美琳,欣妍,佳梦,欣然,思琪,书芹,芮优,璟雯,婧琪,白洁,妍丽,安娜,丽珠,美莲,雨婷,梦琪,紫萱,雨琪,香茹,语心,彤云,飘雪,晗玥,婷美,瑾萱,佳琪,佳怡,依娜,娅楠,雅静,丽泽,芷若,慧婕,思慧,雅婷,心语,佳文,茹雪,雯华,冰洁,珊珊,欢馨,优璇,雨嘉,嘉玉,梦洁,倩雯,佩玉,佳美,可心,惠茜,慧妍,美华,慧君,雪丽,子璇,婧霖,美琪,凝雪,雁桃,映波,靖荷,书双,美莲,又菡,悦人,婷秀,语柳,芷云,思茵,忆枫,映易,天晴,聪慧,娴优,珺琪,绮琳,怡然";
    String male =
        "建国,建华,国华,和平,明,建平,军,平,志明,徳明,勇,伟,建军,强,斌,刚,涛,波,辉,磊,超,鹏,杰,浩,鑫,帅,俊杰,宇,浩然,浩宇,宇轩,子轩,宇航,皓轩,子豪,浩轩,子涵,彦宏,天翔,子瑜,泽洋,俊驰,明哲,天赋,思远,炜烽,凯瑞,俊马,宏远,哲瀚,宇杰,鼎盛,曜栋,俊楠,宏深,晨涛,泽民,星泽,承恩,子墨,致远,俊彦,智宸,煜城,懿轩,哲圣,博文,振家,乐驹,晓博,文博,文昊,昊然,立诚,立轩,立辉,峻熙,弘文,熠彤,鸿煊,烨霖,哲瀚,鑫鹏,昌淼,翼,远航,俊驰,睿智,浩初,星睿,星睿,嘉懿,煜祺,智渊,飞宇,语堂,聪健,冠宇,晟睿,思淼,晓昕,展鹏,景明,越彬,海荣,天佑,瑾瑜,晋鹏,敬曦,楷瑞,建辉,智伟,理全,苑博,念波,嘉懿,鹏飞,弘博,雨泽,鹏煊,曜栋,世元,子墨,乐正,思远,文曜,梓晨,梓轩,欣鹏,炘宇,泽雨,文昊,一鸣,宸瑜,波鸿,昊焱,烨伟,哲彦";
    names = getBaseName(male, female);
    return splitCommaString(names);
  }
}