import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

typedef SimpleFunction = Int16 Function();
typedef SimpleFunctionDart = int Function();

typedef DartStrLenFunction = int Function(Pointer<Utf8> s);
typedef CStrLenFunction = Int16 Function(Pointer<Utf8> s);

class FFIBridge {
  late SimpleFunctionDart _getCValue;

  late DartStrLenFunction _getStrLen;

  FFIBridge() {
    final dl = Platform.isAndroid
        ? DynamicLibrary.open('libsimple.so')
        : DynamicLibrary.process();

    _getCValue =
        dl.lookupFunction<SimpleFunction, SimpleFunctionDart>('get_value');

    // Get function from C
    _getStrLen = dl
        .lookupFunction<CStrLenFunction, DartStrLenFunction>('get_str_length');
  }

  int getCValue() => _getCValue();

  /// Connect String to char* from C and call C function
  int getStrLen(String s) {
    var sPointer = s.toNativeUtf8();
    return _getStrLen(sPointer);
  }
}
