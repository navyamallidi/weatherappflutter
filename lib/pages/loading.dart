import 'package:flutter/material.dart';
import 'package:weatherapp/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void startapp() async{
    worker instance = worker(location: "Mumbai");
    await instance.getData();
    print(instance.airSpeed);
  }

  @override
  void initState() {
    // TODO: implement initState
    startapp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column( children: <Widget>[
          IconButton(onPressed: () {
            Navigator.pushNamed(context, "/home");
          }, icon: Icon(Icons.chevron_left), color: Colors.blueAccent, ),
        ],
        ),
      ),
    );
  }
}
