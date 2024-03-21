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

//NOTE -   factory BankDataClass.fromJson(Map<String, dynamic> json) {:
//Hier wird eine Factory-Methode fromJson definiert, die verwendet wird,
/// The comment `//um eine Weather-Instanz aus JSON-Daten zu erstellen.` is describing the purpose of
/// the factory method `fromJson` in the `BankDataClass`. It explains that the factory method is used to
/// create a `BankDataClass` instance from JSON data. This means that the factory method takes JSON data
/// as input and constructs a new `BankDataClass` object based on that data.
//um eine BankDataClass-Instanz aus JSON-Daten zu erstellen.
//Eine Factory-Methode ist eine Methode, die ein Objekt erstellt und zurückgibt.

  factory BankDataClass.fromJson(Map<String, dynamic> jsonMap) {
        print(jsonMap);

    return BankDataClass(
      
      // temperature: json['temp'],: 
      //Hier wird der Wert des Map-Schlüssels 'temp' aus dem übergebenen JSON-Objekt (json) 
      //genommen und in eine Gleitkommazahl umgewandelt. 
      //Dieser Wert wird dann der temperature Instanzvariable zugewiesen.
      bankName: jsonMap['bank_name'],
      ibanNr: jsonMap['iban'],
      countryCode: jsonMap['country'],
    );
  }

}
