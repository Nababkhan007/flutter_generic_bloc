import 'package:flutter/material.dart';

void main() => runApp(const GenericBloc());

class GenericBloc extends StatelessWidget {
  const GenericBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Generic Bloc"),
        ),
        body: const Center(
          child: Text("Home page"),
        ),
      ),
    );
  }
}
