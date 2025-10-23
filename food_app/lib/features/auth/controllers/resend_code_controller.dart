import 'dart:async';

import 'package:flutter/material.dart';

class ResendCodeController extends ChangeNotifier {
  bool _isResendEnabled = false;
  int _secondsRemaining = 30;
  Timer? _timer;

  bool get isResendEnabled => _isResendEnabled;
  int get secondsRemaining => _secondsRemaining;

  ResendCodeController() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isResendEnabled && _secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        _isResendEnabled = true;
        notifyListeners();
        timer.cancel();
      }
    });
  }

  void restartTimer() {
    _secondsRemaining = 30;
    _isResendEnabled = false;
    notifyListeners();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}