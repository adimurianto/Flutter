import 'package:flutter/material.dart';
class DetailKitabPage extends StatelessWidget {
  final String id;
  final String title;
  final String descId;
  final String descAr;
  
  DetailKitabPage({Key? key, required this.id, required this.title, required this.descId, required this.descAr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(descAr, textAlign: TextAlign.end),
            SizedBox(height: 10),
            Text(descId),
          ],
        ),
      ),
    );
  }
}