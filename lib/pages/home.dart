import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void  getData() async
  {
    http.Response response = await http.get(Uri.parse(""));
    Map data = jsonDecode(response.body);
    Map temp_main = data['main'];
    String temp = temp_main['temp'];
    print(temp);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
      ),
    );
  }
}
