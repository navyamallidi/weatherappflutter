import 'package:flutter/material.dart';
import 'package:weatherapp/Worker/worker.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    startApp();
  }

  void startApp() async {
    Worker instance = Worker(location: "Bhopal");
    await instance.getData();
    print(instance.air_speed);
    print(instance.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to full width
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0), // Add padding around the button
              alignment: Alignment.centerLeft, // Align text to the left within the container
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                icon: Icon(Icons.add_to_home_screen, color: Colors.blueAccent),
                label: Text("GO TO HOME", style: TextStyle(color: Colors.blueAccent)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
