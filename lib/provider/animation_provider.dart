import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

  AnimationController get controller => _controller;
  Animation<double> get animation => _animation;
  bool get isExpanded => _isExpanded;

  AnimationProvider(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: vsync,
    );
    _animation = Tween<double>(begin: 100, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    notifyListeners();
  }

  void toggleExpanded() {
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
