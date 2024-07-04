import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:priority/features/alert/data/alert_model.dart';

import '../../../../../config/alert_scope.dart';
import '../pages/alert_messenger.dart';

class AlertNotificationWidget extends StatelessWidget {
  final AlertModel alert;
  const AlertNotificationWidget({
    required this.alert,
    super.key});


  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Material(
      child: Ink(
        color: alert.backgroundColor,
        height: kAlertHeight + statusBarHeight,
        child: Column(
          children: [
            SizedBox(height: statusBarHeight),
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 28.0),
                  IconTheme(
                    data: const IconThemeData(
                      color: Colors.white,
                      size: 36,
                    ),
                    child: alert.leading,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.white),
                      child: alert.child,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 28.0),
          ],
        ),
      ),
    );
  }
}