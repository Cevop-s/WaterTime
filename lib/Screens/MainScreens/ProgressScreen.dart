import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    DatePickerController _controller = DatePickerController();

    DateTime _selectedValue = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Text(
          'Home Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Color(0xFF0B6E95), //#0B6E95
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
