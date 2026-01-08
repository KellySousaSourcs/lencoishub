import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  final String title;

  const CategoryListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Tela de listagem (em construção)'),
      ),
    );
  }
}
