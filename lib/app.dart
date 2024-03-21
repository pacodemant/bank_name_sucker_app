/* -------------------------------------------------------------------------- */
/*                     //SECTION - Einstellungen, grundlegend f.d. App       */
/* ------------------------------------------------------------------------ */

import 'package:bank_name_sucker_app/home/search_page.dart';
import 'package:flutter/material.dart';

class BankNameSuckerApp extends StatelessWidget {
  const BankNameSuckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Name Sucker App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Farbpalette für die App
        scaffoldBackgroundColor:
            Colors.blueGrey[200], // Hintergrundfarbe der App
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[400],
            title: const Text('Bank Name Sucker App'),
          ),
          body: const HomePage()),
    );
  }
}
