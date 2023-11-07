import 'dart:ffi' as ffi;

typedef FibCType = ffi.Int32 Function(ffi.Int32);
typedef FibDartType = int Function(int);

typedef HsInitCType = ffi.Void Function(ffi.Pointer<ffi.Int32>);
typedef HsInitDartType = void Function(ffi.Pointer<ffi.Int32>);

typedef HsExitCType = ffi.Void Function();
typedef HsExitDartType = void Function();

final ffi.DynamicLibrary fibonacciLib =
    ffi.DynamicLibrary.open('./libfibonacci.so');

final FibDartType fibonacci = fibonacciLib
    .lookup<ffi.NativeFunction<FibCType>>('fibonacci_hs')
    .asFunction();

final HsInitDartType hsInit = fibonacciLib
    .lookup<ffi.NativeFunction<HsInitCType>>('hs_init')
    .asFunction();

final HsExitDartType hsExit = fibonacciLib
    .lookup<ffi.NativeFunction<HsExitCType>>('hs_exit')
    .asFunction();

void main() {
  final n = 10; // Change n to the desired Fibonacci number.
  hsInit(ffi.nullptr);
  final result = fibonacci(n);
  hsExit();
  print("Fibonacci($n) = $result");
}
