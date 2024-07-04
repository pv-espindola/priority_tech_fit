import 'package:flutter/material.dart';
import 'package:priority/config/alert_scope.dart';

class HideAlertButton extends StatelessWidget {
  const HideAlertButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: ()=> AlertScope.of(context).hideAlert(),
      child: const Text('Hide alert'),
    );
  }
}
