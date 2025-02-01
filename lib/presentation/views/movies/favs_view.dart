import 'package:flutter/material.dart';

class FavsView extends StatelessWidget {
  const FavsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favs View'),
      ),
      body: const Center(child: Text('Favoritos'),),
    );
  }
}