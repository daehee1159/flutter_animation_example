import 'package:flutter/material.dart';

class StatefulAnimationWidget extends StatefulWidget {
  const StatefulAnimationWidget({super.key});

  @override
  State<StatefulAnimationWidget> createState() => _StatefulAnimationWidgetState();
}

class _StatefulAnimationWidgetState extends State<StatefulAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 100, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: _animation.value,
            height: _animation.value,
            color: _isExpanded ? Colors.red : Colors.green,
            alignment: Alignment.center,
            child: Text(
              _isExpanded ? 'Expanded' : 'Collapsed',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
