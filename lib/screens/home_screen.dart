import 'dart:convert';

import 'package:deepklarity/models/product.dart';
import 'package:deepklarity/screens/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  Future<List<Product>> storeData() async {
    List data = json.decode(await rootBundle.loadString('assets/product.json'));
    List<Product> products =
        data.map((data) => Product.fromJson(data)).toList();
    await box.clear();
    await box.addAll(products);
    setState(() {
      _isLoading = false;
      Navigator.of(context)
          .pushNamed(DataScreen.routeName, arguments: products.length);
    });
    return products;
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                child: const Text('store data'),
                onPressed: () {
                  storeData();
                  setState(() {
                    _isLoading = true;
                  });
                },
              ),
      ),
    );
  }
}
