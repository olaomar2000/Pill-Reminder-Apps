import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project2_gsg/pages/Home/calendar.dart';
import 'package:project2_gsg/pages/Home/medicineslist.dart';
import 'package:project2_gsg/pages/add/add_new.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class home_page extends StatefulWidget {


  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    super.initState();
  }
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
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
              MedicinesList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff7379CD),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {

          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Calendar'),
            icon: Icon(Icons.calendar_today_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Add'),
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.perm_identity),
          ),
        ],
      ),
    );
  }
}









