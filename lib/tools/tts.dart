// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:get/get.dart';
// import 'package:trpg_tool/common/global.dart';

// class TTS {
//   FlutterTts flutterTts = FlutterTts();
//   bool isPlay = false;
//   void Function()? completionCallback;

//   Future<void> init(void Function() callback) async {
//     completionCallback = callback;
//     await flutterTts.setLanguage("zh-CN");
//     await flutterTts.setSpeechRate(0.5);
//     // await flutterTts.setVolume(1.0);
//     // await flutterTts.setPitch(1.0);
//   }

//   Future<void> speak(String text) async {
//     flutterTts.setCompletionHandler(() {
//       completionCallback?.call();
//       Global.log.d("播报完成");
//     });
//     await flutterTts.speak("${GetPlatform.isWindows ? "开始播报" : ""}$text");
//   }
// }
