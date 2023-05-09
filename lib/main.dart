import 'package:flutter/material.dart';
import 'package:flutter_application_task1/view/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


void main() {
  runApp( const ProviderScope(child: Myapp()));
}

class Myapp extends ConsumerWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  const MaterialApp(
      home: splashscreen(),
    );
  }
}
