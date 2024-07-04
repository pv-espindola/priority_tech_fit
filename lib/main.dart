import 'package:flutter/material.dart';
import 'package:priority/config/provider_scope.dart';
import 'alert_priority_app.dart';

void main() {
  Widget app = const ProviderScope(child: AlertPriorityApp());
  runApp(app);
}

