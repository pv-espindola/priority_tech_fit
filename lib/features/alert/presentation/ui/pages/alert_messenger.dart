import 'package:flutter/material.dart';
import 'package:priority/config/alert_scope.dart';
import 'package:priority/features/alert/presentation/ui/widgets/alert_button.dart';
import 'package:priority/features/alert/presentation/ui/widgets/hide_alert_button.dart';

import '../../../data/alert_model.dart';
import '../../../data/alert_priority.dart';

class AlertMessenger extends StatefulWidget {
  const AlertMessenger({super.key});

  @override
  State<AlertMessenger> createState() => _AlertMessengerState();
}

class _AlertMessengerState extends State<AlertMessenger> {
  @override
  Widget build(BuildContext context) {
    // AlertProvider alertProvider = context.read<AlertProvider>();
    // print(alertProvider.state.status);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Alerts'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  AlertScope.of(context).homeText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: AlertPriority.values.map((e) {
                        AlertModel alert = AlertModel.build(priority: e);
                        return AlertButton(
                          alert: alert,
                        );
                      }).toList(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      child: HideAlertButton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
