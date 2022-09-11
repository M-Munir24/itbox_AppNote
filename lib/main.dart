import 'package:flutter/material.dart';
import 'package:notes/provider/notes.dart';
import 'package:notes/screens/add_or_detail_note_screen.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Notes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: HomeScreen(),
        routes: {
          AddOrDetailScreen.routeName: (ctx) => AddOrDetailScreen(),
        },
      ),
    );
  }
}
