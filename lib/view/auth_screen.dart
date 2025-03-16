import 'package:flutter/material.dart';
import 'package:property_app/widget/property_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PropertyWidget().authPropertHomeWidget(context: context));
  }
}
