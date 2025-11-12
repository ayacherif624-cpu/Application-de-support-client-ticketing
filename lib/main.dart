 // main.dart

import 'package:flutter/material.dart';
import 'package:application_de_support_client_ticketing/screens/login_screen.dart'; 
import 'package:application_de_support_client_ticketing/styles/style.dart'; 

void main() {
  runApp(const TicketApp());
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
      title: 'TicketPro', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor, 
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: primaryColor, 
          background: darkColor,
        ),
        scaffoldBackgroundColor: darkColor,
        useMaterial3: true,
      ),
      home: const LoginScreen(), 
    );
  }
}