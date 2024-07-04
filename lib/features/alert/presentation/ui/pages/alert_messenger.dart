import 'package:flutter/material.dart';
import 'package:priority/config/alert_scope.dart';

import '../../../data/alert_model.dart';
import '../../../data/alert_priority.dart';

class AlertMessenger extends StatelessWidget {
  const AlertMessenger({super.key});

  @override
  Widget build(BuildContext context) {
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
                  '<Adicione o texto do alerta de prioridade aqui>',
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
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            AlertScope.of(context).showAlert(
                              alert: const AlertModel(
                                backgroundColor: Colors.red,
                                leading: Icon(Icons.error),
                                priority: AlertPriority.error,
                                child: Text('Oops, ocorreu um erro. Pedimos desculpas.'),
                              ),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.error),
                              SizedBox(width: 4.0),
                              Text('Error'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AlertScope.of(context).showAlert(
                              alert: const AlertModel(
                                backgroundColor: Colors.amber,
                                leading: Icon(Icons.warning),
                                priority: AlertPriority.warning,
                                child: Text('Atenção! Você foi avisado.'),
                              ),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.amber),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.warning_outlined),
                              SizedBox(width: 4.0),
                              Text('Warning'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            AlertScope.of(context).showAlert(
                              alert: const AlertModel(
                                backgroundColor: Colors.green,
                                leading: Icon(Icons.info),
                                priority: AlertPriority.info,
                                child: Text('Este é um aplicativo escrito em Flutter.'),
                              ),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(width: 4.0),
                              Text('Info'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      child: ElevatedButton(
                        onPressed: AlertScope.of(context).hideAlert,
                        child: const Text('Hide alert'),
                      ),
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
