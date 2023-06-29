import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  final String eventName;

  CalendarScreen({required this.eventName});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Map<DateTime, List> _events = {};
  Set<DateTime> _checkedDays = {}; // Added
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  List _selectedEvents = [];
  TextEditingController _eventController = TextEditingController();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _selectedEvents = _events[_selectedDay] ?? [];

      // Toggle the selected day
      if (_checkedDays.contains(_selectedDay)) {
        _checkedDays.remove(_selectedDay);
      } else {
        _checkedDays.add(_selectedDay);
      }
    });
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
          decoration: InputDecoration(hintText: 'Enter your note'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Save"),
            onPressed: () {
              if (_eventController.text.isEmpty) return;
              if (_events[_selectedDay] != null) {
                _events[_selectedDay]!.add(_eventController.text);
              } else {
                _events[_selectedDay] = [_eventController.text];
              }
              _eventController.clear();
              Navigator.pop(context);
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.eventName} - Checked days: ${_checkedDays.length}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddDialog,
          )
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            eventLoader: (day) => _events[day] ?? [],
            onDaySelected: _onDaySelected,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (_checkedDays.contains(date)) {
                  return Icon(Icons.check_circle, color: Colors.green);
                }
                return null;
              },
            ),
          ),
          ..._selectedEvents.map((event) => ListTile(
            title: Text(event.toString()),
          )).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }
}
