import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project2_gsg/database/repository.dart';
import 'package:project2_gsg/models/calendar_day_model.dart';
import 'package:project2_gsg/models/pill.dart';
import 'package:project2_gsg/pages/Home/calendar.dart';
import 'package:project2_gsg/pages/Home/medicineslist.dart';
import 'package:project2_gsg/pages/add/add_new.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//Done
class home_page extends StatefulWidget {


  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {


  List<Pill> allListOfPills = List<Pill>();
  final Repository _repository = Repository();
  // ignore: deprecated_member_use
  List<Pill> dailyPills = List<Pill>();

  final CalendarDayModel _days = CalendarDayModel();
  List<CalendarDayModel> _daysList;
  //====================================================

  //handle last choose day index in calendar
  int _lastChooseDay = 0;


  @override
  void initState() {
    super.initState();
    setData();
    _daysList = _days.getCurrentDays();
  }

  Future setData() async {
    allListOfPills.clear();
    (await _repository.getAllData("Pills")).forEach((pillMap) {
      allListOfPills.add(Pill().pillMapToObject(pillMap));
    });
    chooseDay(_daysList[_lastChooseDay]);
  }


  @override
  Widget build(BuildContext context) {
    final Widget addButton = FloatingActionButton(
      elevation: 2.0,
      onPressed: () async {
        await setData();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => add_new()),
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 24.0,
      ),
      backgroundColor: Color(0xffda8297),
    );

    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      floatingActionButton: addButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: deviceHeight * 0.1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text(
                                "Your Medicines\nReminder",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Color(0xff8C87E6),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Calendar(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: deviceHeight * 0.03),
              dailyPills.isEmpty
                  ? SizedBox(
                width: double.infinity,
                height: 100,
                child: Text('Add Pills ')
              )
                  : MedicinesList(dailyPills,setData),

            ],
          ),
        ),
      ),

    );
  }
  void chooseDay(CalendarDayModel clickedDay){
    setState(() {
      _lastChooseDay = _daysList.indexOf(clickedDay);
      _daysList.forEach((day) => day.isChecked = false );
      CalendarDayModel chooseDay = _daysList[_daysList.indexOf(clickedDay)];
      chooseDay.isChecked = true;
      dailyPills.clear();
      allListOfPills.forEach((pill) {
        DateTime pillDate = DateTime.fromMicrosecondsSinceEpoch(pill.time * 1000);
        if(chooseDay.dayNumber == pillDate.day && chooseDay.month == pillDate.month && chooseDay.year == pillDate.year){
          dailyPills.add(pill);
        }
      });
      dailyPills.sort((pill1,pill2) => pill1.time.compareTo(pill2.time));
    });
  }
}









