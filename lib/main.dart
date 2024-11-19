import 'package:flutter/material.dart';
import 'package:flutter_trust/common/movie_provider.dart';
import 'package:flutter_trust/features/tablods.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MaterialApp(
      home: Tablods(),
      title: 'Movie App',
      ),
    );
  }
}

