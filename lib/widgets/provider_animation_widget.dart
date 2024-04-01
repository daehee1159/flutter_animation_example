import 'package:flutter/material.dart';
import 'package:flutter_animation_example/provider/animation_provider.dart';
import 'package:provider/provider.dart';

class ProviderAnimationWidget extends StatelessWidget {
  const ProviderAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationProvider>(
      builder: (context, animationProvider, child) {
        return GestureDetector(
          onTap: () {
            animationProvider.toggleExpanded();
          },
          child: AnimatedBuilder(
            animation: animationProvider.controller,
            builder: (context, child) {
              return Container(
                width: animationProvider.animation.value,
                height: animationProvider.animation.value,
                color: animationProvider.isExpanded ? Colors.red : Colors.green,
                alignment: Alignment.center,
                child: Text(
                  animationProvider.isExpanded ? 'Expanded' : 'Collapsed',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
