import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:find_hadits/DetailKitabPage.dart';
import 'dart:convert';

class ListKitabPage extends StatefulWidget { // State Maintenance Widget
  ListKitabPageState createState() => ListKitabPageState();
}

class ListKitabPageState extends State<ListKitabPage> {
 
  List kitabs = [];
  List original = [];
  TextEditingController txtQuery = new TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/kitab.json');
    var json = jsonDecode(jsonStr);
    kitabs = json;
    original = json;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      kitabs = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    kitabs.forEach((p) {
      var name = p["kitab_indonesia"].toString().toLowerCase();
      if (name.contains(query)) {
        result.add(p);
      }
    });

    kitabs = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Platform Specific Widget
      appBar: AppBar(  // Platform Specific Widget
        title: Text("Find Hadits"), // Basic Widget
      ),
      body: Column( // Layout Widget
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container( // Layout Widget
              margin: EdgeInsets.all(10),
              child: Column( // Layout Widget
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( "List kitab search", style: TextStyle(fontWeight: FontWeight.bold)), // Basic Widget
                  SizedBox(height: 10),
                  TextFormField(
                    controller: txtQuery,
                    onChanged: search,
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton( // Platform Specific Widget
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            txtQuery.text = '';
                            search(txtQuery.text);
                          },
                        ),
                    ),
                  ),
                ],
              ),
            ),
            _listView(kitabs)
          ]),
    );
  }
}

Widget _listView(kitabs) {
  return Expanded(
    child: ListView.builder(
        itemCount: kitabs.length,
        itemBuilder: (context, index) {
          var kitab = kitabs[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(kitab['id_kitab']),
            ),
            onTap: (){ //   Gesture Tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailKitabPage(
                    id: kitab['id_kitab'],
                    title: kitab['kitab_indonesia'],
                    descId: kitab['desc_id'],
                    descAr: kitab['desc_ar'],
                  ),
                ),
              );
            },
            title: Text(kitab['kitab_arab']),
            subtitle: Text(kitab['kitab_indonesia']),
          );
        }),
  );
}