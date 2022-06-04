// Bagian Import
import 'package:find_hadits/ListKitabPage.dart';
import 'package:flutter/material.dart';
//

// Bagian Main
void main() {
  runApp(const AppWidget());
}
//

// Bagian Widget
class AppWidget extends StatelessWidget { // State Maintenance Widget
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListKitabPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//