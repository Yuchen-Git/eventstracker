import 'package:flutter/material.dart';
import 'calender_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> eventList = []; // list to store event names

  void _showAddEventDialog() {
    TextEditingController _controller = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add new event'),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: "Enter event name"),
            ),
            actions: [
              TextButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    eventList.add(_controller.text);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(eventList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalendarScreen(eventName: eventList[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 60.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        tooltip: 'Add Event',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
