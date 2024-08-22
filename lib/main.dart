import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:timbu_app/bloc/product_bloc.dart';
import 'package:timbu_app/data/providers/product_provider.dart';
import 'package:timbu_app/data/repositories/product_repostory.dart';
import 'package:timbu_app/ui/screens/product_list_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timbu Products App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => ProductRepository(
          productProvider: ProductProvider(),
        ),
        child: BlocProvider(
          create: (context) => ProductBloc(context.read<ProductRepository>()),
          child: const ProductListScreen(),
        ),
      ),
    );
  }
}
