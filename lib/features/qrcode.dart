import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:qr_flutter/qr_flutter.dart'; // For generating the visual QR
import 'dart:convert'; // For jsonEncode

class InstapayLearningPage extends StatefulWidget {
  const InstapayLearningPage({super.key});

  @override
  State<InstapayLearningPage> createState() => _InstapayLearningPageState();
}

class _InstapayLearningPageState extends State<InstapayLearningPage> {
  // Controllers to capture user input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  // Default value is 'P2P'
  String _selectedTransactionType = 'P2P';
  // The list of options to show in the menu
  final List<String> _typeOptions = ['P2P', 'P2B', 'P2M'];

  // Variable to store the generated QR string
  String? _qrDataString;

  // --- THIS IS THE CORE LOGIC ---
  // This function mimics your 'InstapayService.generateInstapayQR'
  void _generateQR() {
    // 1. Prepare the Data
    // COMPARED TO YOUR CODE: This is like the 'insTa' or 'Kplus' variables.
    // We are creating a Map<String, dynamic> to hold our data.
    Map<String, dynamic> payload = {
      "typeOfTrans": _selectedTransactionType,
      "merchName": _nameController.text, // User input
      "amount": _amountController.text,  // User input
      "currCode": "608", // PHP Currency Code
      "countryCode": "PH",
      "timestamp": DateTime.now().toString(),
    };

    // 2. Encode to JSON
    // COMPARED TO YOUR CODE: This is the 'jsonEncode(...)' part.
    // It turns the Dart Map into a String that computers can read.
    String jsonString = jsonEncode(payload);

    // 3. Update State
    // COMPARED TO YOUR CODE: Your code sends this to a server.
    // Here, we just save it to a variable so the UI can draw it immediately.
    setState(() {
      _qrDataString = jsonString;
    });

    print("Generated Payload: $_qrDataString");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple QR Generator")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- INPUT SECTION ---
            const Text("Enter Transaction Details:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Account Name (merchName)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            //type of transaction
            const Text("Transaction Type:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedTransactionType, //1. Current value
              decoration: const InputDecoration(
                labelText: "Transaction Type",
                border: OutlineInputBorder(),
              ),
              // 2. Map the list of strings to DropdownMenuItem widgets
              items: _typeOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              //3. what to do when user selects a new item
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTransactionType = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),


            // --- BUTTON SECTION ---
            ElevatedButton(
              onPressed: _generateQR,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15)),
              child: const Text("Generate Instapay QR"),
            ),

            const SizedBox(height: 40),

            // --- RESULT SECTION ---
            // COMPARED TO YOUR CODE: This visualizes the result.
            // In your app, the server sends back the QR data, and you display it.
            if (_qrDataString != null) ...[
              const Center(
                  child: Text("Scan this to pay:",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(height: 10),
              Center(
                child: QrImageView(
                  data: _qrDataString!, // Pass the JSON string here
                  version: QrVersions.auto,
                  size: 280.0,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Raw Data (What the scanner sees):",
                  style: TextStyle(color: Colors.grey)),
              Text(_qrDataString!, style: const TextStyle(fontSize: 12)),
            ] else
              const Center(
                child: Text(
                  "Enter details above to generate a QR",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}