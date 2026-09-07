import 'package:flutter/material.dart';
import 'register_page.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RegisterPage());
  }
}
