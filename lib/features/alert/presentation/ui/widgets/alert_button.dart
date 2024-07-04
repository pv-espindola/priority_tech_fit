import 'package:flutter/material.dart';
import 'package:priority/config/alert_scope.dart';
import 'package:priority/features/alert/data/alert_model.dart';
import 'package:priority/features/alert/data/alert_priority.dart';

class AlertButton extends StatefulWidget {
  final AlertModel alert;

  AlertButton({required this.alert, super.key}) {
  }

  @override
  State<AlertButton> createState() => _AlertButtonState();
}

class _AlertButtonState extends State<AlertButton> {
  late final ButtonComposition composition;
  void compose() {
    switch (widget.alert.priority) {
      case AlertPriority.error:
        composition = ButtonComposition(icon: Icons.error, text: 'Error');
      case AlertPriority.warning:
        composition = ButtonComposition(icon: Icons.warning, text: 'Warning');
      case AlertPriority.info:
        composition = ButtonComposition(icon: Icons.info, text: 'Info');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    compose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=> AlertScope.of(context).showAlert(alert: widget.alert),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(widget.alert.backgroundColor),
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
