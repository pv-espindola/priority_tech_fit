import 'package:flutter/material.dart';

import 'alert_priority.dart';

class AlertModel {
  final Color backgroundColor;
  final String text;
  final IconData leading;
  final AlertPriority priority;

  const AlertModel({
    required this.backgroundColor,
    required this.text,
    required this.leading,
    required this.priority,
  });

  factory AlertModel._warning() => const AlertModel(
        backgroundColor: Colors.amber,
        leading: Icons.warning,
        priority: AlertPriority.warning,
        text: 'Atenção! Você foi avisado.',
      );

  factory AlertModel._info() => const AlertModel(
        backgroundColor: Colors.green,
        leading: Icons.info,
        priority: AlertPriority.info,
        text: 'Este é um aplicativo escrito em Flutter.',
      );

  factory AlertModel._error() => const AlertModel(
        backgroundColor: Colors.red,
        leading: Icons.error,
        priority: AlertPriority.error,
        text: 'Oops, ocorreu um erro. Pedimos desculpas.',
      );

  factory AlertModel.build({required AlertPriority priority}) {
    return switch (priority) {
      AlertPriority.error => AlertModel._error(),
      AlertPriority.warning => AlertModel._warning(),
      AlertPriority.info => AlertModel._info()
    };
  }
}
