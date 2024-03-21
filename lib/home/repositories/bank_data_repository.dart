// ignore_for_file: avoid_print

/* -------------------------------------------------------------------------- */
/*               //SECTION - für die API-Kommunikation via getWeather()       */
/*                           mit JSON, HTTP-Package                           */
/* -------------------------------------------------------------------------- */

import 'package:bank_name_sucker_app/home/models/bank_data_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* - Mein Api-Key @ Api Ninjas com wgvhYbrYetmOl6EoCPSdfsGid0zbxlmLjHJJh7Fr - */

/* -------------------------------------------------------------------------- */
/*                                  Test-IBANs                                */
/* -------------------- Finnland - FI01 1234 5600 0007 85 ------------------- */
/* ------------- Frankreich1 - FR04 2004 1010 0505 0001 3M02 606 ------------ */
/* ----------------- Georgien - GE09 NB00 0000 0101 9049 17 ----------------- */
/* ---------------- Polen  PL07 1140 2004 0000 3002 0135 5387 --------------- */
/* -- https://www.bcf.ch/sites/default/files/documents/paragraphs/overview/ -- */
/* -- fkb-internationalen-zahlungsverkehr.pdf ------------------------------- */
/* -------------------------------------------------------------------------- */

class BankDataRepository {
  static const _apiKey = 'wgvhYbrYetmOl6EoCPSdfsGid0zbxlmLjHJJh7Fr';
  Future<BankDataClass?> getBankData(String bankData) async {

    /* -------------------------------------------------------------------------- */
    /*                  Eigentlich wollte ich einbauen, dass man                  */
    /* ---------- ENTWEDER eine IBAN oder einen Banknamen eingeben kann --------- */
    /* ------------- und das Textfield prüft, ob IBAN oder Bankname ------------- */
    /* ------------- und bestimmt dann die entsprechende request URL ------------ */
    /* ----- Ich bin davon ausgegangen, dass ich die API auch nach Banknamen ---- */
    /* --------------- durchsuchen kann. Geht aber offenbar nicht. -------------- */
    /* -------------------------------------------------------------------------- */
    // 
    String url = 'https://api.api-ninjas.com/v1/iban?iban=$bankData';
    try {
      final response =
          await http.get(Uri.parse(url), headers: {'X-Api-Key': _apiKey});
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return BankDataClass.fromJson(jsonData);
      } else {
        // Bank nicht gefunden, dann return NULL
        //TODO - PSEUDO-Code für Print
        // wenn an 3. Stelle der Texteingabe eine Ziffer steht,
        // ist es eine IBAN, sonst ein Bankname
        print('Bank nicht gefunden: $bankData - ${response.body}');
        return null;
      }
    } catch (e) {
      // Fehler beim Laden der Bankdaten, dann return NULL
      print('Fehler beim Laden der Bankdaten: $e');
      return null;
    }
  }
}