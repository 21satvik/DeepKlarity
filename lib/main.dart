import 'package:deepklarity/models/product.dart';
import 'package:deepklarity/screens/data_screen.dart';
import 'package:deepklarity/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<Product> box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  box = await Hive.openBox<Product>('products');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(191, 91, 233, 1),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        DataScreen.routeName: (context) => const DataScreen(),
      },
    );
  }
}
