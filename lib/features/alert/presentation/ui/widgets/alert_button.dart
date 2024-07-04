import 'package:flutter/material.dart';
import 'package:priority/features/alert/data/alert_model.dart';
import 'package:priority/features/alert/data/alert_priority.dart';

class AlertButton extends StatelessWidget {
  final Function() onPressed;
  final AlertModel alert;
  late final ButtonComposition composition;

  AlertButton({required this.alert, required this.onPressed, super.key}) {
    compose();
  }

  void compose() {
    switch (alert.priority) {
      case AlertPriority.error:
        composition = ButtonComposition(icon: Icons.error, text: 'Error');
      case AlertPriority.warning:
        composition = ButtonComposition(icon: Icons.warning, text: 'Warning');
      case AlertPriority.info:
        composition = ButtonComposition(icon: Icons.info, text: 'Info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(alert.backgroundColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(composition.icon),
          const SizedBox(width: 4.0),
          Text(composition.text),
        ],
      ),
    );
  }
}

class ButtonComposition {
  IconData icon;
  String text;

  ButtonComposition({
    required this.icon,
    required this.text,
  });
}
