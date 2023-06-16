import 'package:flutter/services.dart';

import 'ffi_bridge.dart';

class PlatformService {
  static const method = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  final _bridge = FFIBridge();

  // Future<int> callMethodChannel() async {
  //   try {
  //     return await method.invokeMethod('CALL');
  //   } on PlatformException catch (e) {
  //     print("Failed to get value: '${e.message}'");
  //     return 0;
  //   }
  // }
  int getValue() {
    try {
      return _bridge.getCValue();
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'");
      return 0;
    }
  }

  int getStrLen(String str) {
    try {
      return _bridge.getStrLen(str);
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'");
      return 0;
    }
  }

  Stream<int> getStream() =>
      stream.receiveBroadcastStream().map((event) => event as int);
}
