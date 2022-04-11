import 'package:flutter/material.dart';
import 'package:pays_online/pages/home_page.dart';
import 'package:pays_online/pages/pago_completo_page.dart';
import 'package:pays_online/pages/tarjeta_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stripe App',
      initialRoute: 'home',
      routes: {
        'home' : ((context) => const HomePage()),
        'pago' : ((context) => const PagoCompletoPage()),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff284879),
        scaffoldBackgroundColor: Color(0xff21232A)
      ),
    );
  }
}