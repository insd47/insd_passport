class CancellationToken {
  bool _isCancellationRequested = false;

  bool get isCancellationRequested => _isCancellationRequested;

  void cancel() => _isCancellationRequested = true;
}

Future<void> asyncFunction(CancellationToken token) async {
  while (true) {
    if (token.isCancellationRequested) {
      break;
    }

    // 작업 수행...
    await Future.delayed(Duration(seconds: 1));
  }
}
