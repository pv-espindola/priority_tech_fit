import 'package:flutter/material.dart';
import 'package:priority/features/alert/data/alert_model.dart';
import 'package:priority/features/alert/presentation/ui/widgets/alert_notification_widget.dart';

const kAlertHeight = 80.0;

class AlertScope extends StatefulWidget {
  const AlertScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AlertScope> createState() => AlertScopeState();

  static AlertScopeState of(BuildContext context) {
    try {
      final scope = _AlertMessengerScope.of(context);
      return scope.state;
    } catch (error) {
      throw FlutterError.fromParts(
        [
          ErrorSummary('No AlertMessenger was found in the Element tree'),
          ErrorDescription(
              'AlertMessenger is required in order to show and hide alerts.'),
          ...context.describeMissingAncestor(expectedAncestorType: AlertScope),
        ],
      );
    }
  }
}

class AlertScopeState extends State<AlertScope> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  AlertNotificationWidget? alertWidget;
  String homeText = '';

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final alertHeight = MediaQuery.of(context).padding.top + kAlertHeight;
    animation = Tween<double>(begin: -alertHeight, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void showAlert({required AlertModel alert}) {
    if (alertWidget == null ||
        alertWidget != null &&
            alert.priority.value > alertWidget!.alert.priority.value) {
      AlertNotificationWidget alertNotification =
          AlertNotificationWidget(alert: alert);
      setState(() {
        alertWidget = alertNotification;
        homeText = textAlertScope;
      });
      controller.forward();
    }
  }

  void hideAlert() {
    alertWidget = null;
    homeText = '';
    controller.reverse();
  }

  String get textAlertScope {
    if (alertWidget != null) {
      return '${alertWidget!.alert.text}'
          '\n Prioridade: ${alertWidget!.alert.priority.value}';
    }
    return '';
  }

  

  @override
  Widget build(BuildContext context) {
    final statusbarHeight = MediaQuery.of(context).padding.top;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final position = animation.value + kAlertHeight;
        return Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Positioned.fill(
              top: position <= statusbarHeight ? 0 : position - statusbarHeight,
              child: _AlertMessengerScope(
                state: this,
                message: textAlertScope,
                child: widget.child,
              ),
            ),
            Positioned(
              top: animation.value,
              left: 0,
              right: 0,
              child: alertWidget ?? const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}

class _AlertMessengerScope extends InheritedWidget {
  const _AlertMessengerScope({
    required this.state,
    required this.message,
    required super.child,
  });

  final AlertScopeState state;
  final String message;

  @override
  bool updateShouldNotify(_AlertMessengerScope oldWidget) =>
      state != oldWidget.state || message != oldWidget.message;

  static _AlertMessengerScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AlertMessengerScope>();
  }

  static _AlertMessengerScope of(BuildContext context) {
    final scope = maybeOf(context);
    assert(scope != null, 'No _AlertMessengerScope found in context');
    return scope!;
  }
}
