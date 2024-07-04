import '../../data/alert_model.dart';

enum AlertStatus{available, busy  }

class AlertState{
  final AlertModel alert;
  final AlertStatus status;

  AlertState({
    required this.alert,
    required this.status,
}) ;



}