// lib/screens/transfers_screen.dart
import 'package:flutter/material.dart';
import 'package:lencois_hub/transf_data.dart';
import 'package:lencois_hub/utils/translations.dart';
import '../widgets/transfer_card.dart';

class TransfersScreen extends StatelessWidget {
  const TransfersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          Translator.t('transfer_title'),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: listaTransfer.length,
        itemBuilder: (context, index) {
          return TransferCard(data: listaTransfer[index]);
        },
      ),
    );
  }
}