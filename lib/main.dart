import 'package:flutter/material.dart';
import 'package:flutter_animation_example/provider/animation_provider.dart';
import 'package:flutter_animation_example/provider/ticker_provider_impl.dart';
import 'package:flutter_animation_example/screens/animation_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AnimationProvider(
        TickerProviderImpl(),
      ),
      child: const MaterialApp(
        home: AnimationScreen(),
      ),
    ),
  );
}
