// ignore_for_file: avoid_print

/* -------------------------------------------------------------------------- */
/*                //SECTION - Bankdaten-Klasse                             */
/* ------------------------------------------------------------------------ */


/* Datensatz aus IBAN-API
{
  "iban": "DE16200700000532013000",
  "bank_name": "Deutsche Bank",
  "account_number": "0532013000",
  "bank_code": "20070000",
  "country": "DE",
  "checksum": "16",
  "valid": true,
  "bban": "200700000532013000"
}*/

//NOTE - class BankDataClass {: 
// Hier wird eine neue Klasse mit dem Namen "BankDataClass" definiert.
//Diese Klasse wird verwendet, um Bankdaten einer API bereitzustellen.
class BankDataClass {
  final String bankName;
  final String ibanNr;
  final String countryCode;

  BankDataClass({
    required this.bankName,
    required this.ibanNr,
    required this.countryCode,
  });

//HINWEIS – Factory BankDataClass.fromJson(Map<String, Dynamic> json) {:
/// Die Funktion ist ein Factory-Konstruktor in Dart, der eine JSON-Map in eine Instanz von a konvertiert
/// BankDataClass.
/// Argumente:
///   jsonMap (Map<String, dynamisch>): Der „jsonMap“-Parameter in der „BankDataClass.fromJson“-Factory
/// Die Methode ist eine Map, die Schlüssel-Wert-Paare enthält, 
/// wobei die Schlüssel Zeichenfolgen und die Werte vom Typ sind„dynamisch“. 
/// Diese Karte wird normalerweise verwendet, um die JSON-Daten darzustellen, 
/// die in eine konvertiert werden müssen Instanz der `Bank
  factory BankDataClass.fromJson(Map<String, dynamic> jsonMap) {
        print(jsonMap);

    return BankDataClass(
      
      bankName: jsonMap['bank_name'],
      ibanNr: jsonMap['iban'],
      countryCode: jsonMap['country'],
    );
  }

}
