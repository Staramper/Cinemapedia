import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {

  static const name = 'not-found-screen';

  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not found'),
      ),
      body: const Center(
        child: Text('Tenemos errores con esta pelicula'),
      ),
    );
  }
}