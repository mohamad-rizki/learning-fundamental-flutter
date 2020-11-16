import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "No Name");
  bool isEnable = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("key_name", controller.text);
    pref.setBool("is_enable", isEnable);
  }

  Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("key_name") ?? "No Name";
  }

  Future<bool> getEnable() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("is_enable") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared Preference"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
              ),
              Switch(
                value: isEnable,
                onChanged: (newValue) {
                  setState(() {
                    isEnable = newValue;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  saveData();
                },
                child: Text("Save"),
              ),
              RaisedButton(
                onPressed: () {
                  getName().then((value) {
                    controller.text = value;
                    setState(() {});
                  });
                  getEnable().then((value) {
                    isEnable = value;
                    setState(() {});
                  });
                },
                child: Text("Load"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
