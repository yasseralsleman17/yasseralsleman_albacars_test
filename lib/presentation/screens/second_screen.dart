import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int selectedTime =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const Text("Select Your Appointment Time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(
              height: 30,
            ),
            _buildDefaultSingleDatePickerWithValue(),

            SizedBox(
              height: 300,
              child: GridView.builder(
                  itemCount: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4 / 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildTimeSlots(index);
                  }),
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ))),
                onPressed: () => { Navigator.of(context).pushNamed('/third')},
                child: const Text("Next",
                    style: TextStyle(fontSize: 17, color: Colors.white))),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   children: [
            //     _buildTimeSlots(), _buildTimeSlots(), _buildTimeSlots(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  Widget _buildDefaultSingleDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      dayBorderRadius: BorderRadius.circular(5),
      selectedDayTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      selectedDayHighlightColor: Colors.red,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      selectableDayPredicate: (day) => !day
          .difference(DateTime.now().subtract(const Duration(days: 1)))
          .isNegative,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
          config: config,
          initialValue: _singleDatePickerValueWithDefaultValue,
          onValueChanged: (values) =>
              setState(() => _singleDatePickerValueWithDefaultValue = values),
        ),
        const SizedBox(height: 10),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     const Text('Selection(s):  '),
        //     const SizedBox(width: 10),
        //     Text(
        //       _getValueText(
        //         config.calendarType,
        //         _singleDatePickerValueWithDefaultValue,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildTimeSlots(int index) {
    return GestureDetector(onTap: (){
      setState(() {
        selectedTime=index;
      });
    },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedTime==index ?Colors.red:Colors.white ,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5)),
        child:   Text(
          "1:00pm - 1:30pm",
          style: TextStyle(
              fontSize: 12, color: selectedTime==index ?Colors.white:  Colors.black87 , fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    return valueText;
  }
}
