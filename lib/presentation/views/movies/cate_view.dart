import 'package:flutter/material.dart';

class CateView extends StatelessWidget {
  const CateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cate View'),
      ),
      body: const Center(child: Text('Categorias'),),
    );
  }
}