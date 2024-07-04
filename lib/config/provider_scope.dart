import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/alert/presentation/providers/alert_provider.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AlertProvider>(create: (_) => AlertProvider()),
      ],
      child: child,);
  }
}
