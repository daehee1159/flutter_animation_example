import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/provider_animation_widget.dart';
import '../widgets/stateful_animation_widget.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProviderAnimationWidget(),
            Text('Provider Example'),
            SizedBox(height: 20),
            StatefulAnimationWidget(),
            Text('StatefulWidget Example'),
          ],
        ),
      ),
    );
  }
}
