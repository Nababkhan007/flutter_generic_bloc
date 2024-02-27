import 'package:flutter/material.dart';
import 'package:flutter_generic_bloc/view/author_view.dart';

void main() => runApp(const GenericBloc());

class GenericBloc extends StatelessWidget {
  const GenericBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AuthorView(),
    );
  }
}
