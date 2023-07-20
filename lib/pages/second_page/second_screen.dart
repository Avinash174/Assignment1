import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<String> days = [];
  final int targetDay = DateTime.sunday;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int countSamedaysInRange(DateTime startDate, DateTime endDate) {
    int count = 0;
    DateTime currentDate = startDate;

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      if (currentDate.weekday == targetDay) {
        count++;
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return count;
  }

  void calculateSamedays() {
    setState(() {
      int samedayCount = countSamedaysInRange(startDate, endDate);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sunday Count'),
          content: Text(
              'Number of Sundays between $startDate and $endDate: $samedayCount'),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Object? receivedData = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Same Days Count :'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              ' $receivedData ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please Select date :',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Select'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    setState(() {
                      startDate = selectedDate;
                    });
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select End Date:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Select'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: endDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    setState(() {
                      endDate = selectedDate;
                    });
                  }
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text('Calculate'),
              onPressed: calculateSamedays,
            ),
          ],
        ),
      ),
    );
  }
}
