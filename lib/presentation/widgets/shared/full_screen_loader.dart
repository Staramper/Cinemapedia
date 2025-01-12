import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
   const FullScreenLoader({super.key});

  Stream<String> getLoandingMessages(){

  final messages = <String>[
    'Cargando peliculas',
    'Comprando palomitas de maíz',
    'Cargando populares',
    'Llamando a mi novia',
    'Ya merito...',
    'Esto esta tardando demaciado :(',
  ];

  return Stream.periodic(const Duration(milliseconds: 1200), (step) {
    return messages[step];
  }).take(messages.length);

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoandingMessages(), 
            builder: (context, snapshot) {
              if ( !snapshot.hasData ) return const Text('Cargando');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
} 