import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../day.dart';

class CalendarDay extends StatefulWidget {
  final Day day;
  final Function onDayClick;

  CalendarDay(this.day, this.onDayClick);

  @override
  _CalendarDayState createState() => _CalendarDayState();
}
//Done
class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.day.dayLetter,
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 17.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () => widget.onDayClick(widget.day),
            child: CircleAvatar(
              radius: constrains.maxHeight * 0.20,
              backgroundColor: widget.day.isChecked
                  ? Color(0xffFA8CA5)
                  : Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  widget.day.dayNumber,
                  style: TextStyle(
                      color: widget.day.isChecked ? Colors.white : Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
