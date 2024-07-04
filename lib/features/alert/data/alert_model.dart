import 'package:flutter/material.dart';

import 'alert_priority.dart';

class AlertModel {
  final Color backgroundColor;
  final Widget child;
  final Widget leading;
  final AlertPriority priority;

  const AlertModel({
    required this.backgroundColor,
    required this.child,
    required this.leading,
    required this.priority,
  });

  factory AlertModel._warning() => const AlertModel(
        backgroundColor: Colors.amber,
        leading: Icon(Icons.warning),
        priority: AlertPriority.warning,
        child: Text('Atenção! Você foi avisado.'),
      );

  factory AlertModel._info() => const AlertModel(
        backgroundColor: Colors.green,
        leading: Icon(Icons.info),
        priority: AlertPriority.info,
        child: Text('Este é um aplicativo escrito em Flutter.'),
      );

  factory AlertModel._error() => const AlertModel(
        backgroundColor: Colors.red,
        leading: Icon(Icons.error),
        priority: AlertPriority.error,
        child: Text('Oops, ocorreu um erro. Pedimos desculpas.'),
      );

  factory AlertModel.build({required AlertPriority priority}) {
    return switch (priority) {
      AlertPriority.error => AlertModel._error(),
      AlertPriority.warning => AlertModel._warning(),
      AlertPriority.info => AlertModel._info()
    };
  }
}
