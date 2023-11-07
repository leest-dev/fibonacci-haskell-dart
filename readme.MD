
Call Haskell from Dart

1. $ brew install ghc // (version 9.6.2)
2. $ ghc --make -dynamic -shared -fPIC -flink-rts Fibonacci.hs -o libfibonacci.so
3. $ dart fibonacci.dart   
