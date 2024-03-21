import 'package:bank_name_sucker_app/home/models/bank_data_class.dart';
import 'package:bank_name_sucker_app/home/repositories/bank_data_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputBankTextValue = TextEditingController();
  BankDataClass? _bankData;
  bool _isLoading = false;
  bool _bankEntered = false;

  @override
  void initState() {
    super.initState();
    _bankData = null;
  }

  void _fetchBankData(String bankData) {
    setState(
      () {
        _isLoading = true;
      },
    );

    BankDataRepository().getBankData(bankData).then(
      (weather) {
        setState(
          () {
            _bankData = weather;
            _isLoading = false;
            _bankEntered = true;
          },
        );
      },
    ).catchError(
      (error) {
        setState(
          () {
            _isLoading = false;
            _bankEntered = true;
          },
        );
        _showErrorSnackBar(bankData);
      },
    );
  }

  void _showErrorSnackBar(String bankData) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bank nicht gefunden: $bankData'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputBankTextValue,
              decoration: const InputDecoration(
                hintText: 'Enter IBAN or Bank Name',
              ),
              onTap: () {
                _inputBankTextValue.clear();
              },
              onSubmitted: (textfieldValue) {
                _fetchBankData(textfieldValue);
              },
            ),

            /// The `_isLoading` boolean variable is used to track whether the app is currently in
            /// a loading state. When `_isLoading` is set to `true`, it indicates that the app is
            /// fetching data or performing some operation that requires loading time. This
            /// variable is typically used to show a loading indicator (in this case, a
            /// `CircularProgressIndicator`) to provide feedback to the user that some process is
            /// ongoing and to prevent further user interaction until the process is complete.
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_bankData != null)
              Column(
                children: [
                  Text(
                    'input: ${_inputBankTextValue.text}',
                    style: const TextStyle(fontSize: 11),
                  ),
                  Text(
                    _bankData!.bankName,
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  Text(
                    'IBAN ${_bankData!.ibanNr}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Ländercode: ${_bankData!.countryCode}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              )
            else if (_bankEntered) // Nur anzeigen, wenn eine IBAN/Bank eingegeben wurde
              Text(
                'Bank nicht gefunden: ${_inputBankTextValue.text}',
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputBankTextValue.dispose();
    super.dispose();
  }
}
