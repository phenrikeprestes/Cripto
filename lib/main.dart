import 'package:flutter/material.dart';
import 'package:cripto/pages/moedas_pages.dart';

void main() {
  runApp(MaterialApp(
    title: 'Moedasbase',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.indigo),
    home: MoedasPage(),
  ));
}
