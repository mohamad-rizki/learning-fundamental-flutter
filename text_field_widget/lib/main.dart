import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller =
      TextEditingController(text: "help@gmail.com");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Field Widget"),
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: controller,
                obscureText: false,
                maxLength: 25,
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue[50],
                    filled: true,
                    icon: Icon(Icons.email),
                    prefixIcon: Icon(Icons.person),
                    prefixText: "Email: ",
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "Your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Text(controller.text),
            ],
          ),
        ),
      ),
    );
  }
}
