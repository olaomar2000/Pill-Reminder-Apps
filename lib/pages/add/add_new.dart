import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project2_gsg/database/repository.dart';
import 'package:project2_gsg/models/m_type.dart';
import 'package:project2_gsg/models/pill.dart';
import 'package:project2_gsg/pages/Home/home.dart';
import 'package:project2_gsg/pages/add/typecard.dart';
import 'package:project2_gsg/platform_flat_button.dart';
import 'package:project2_gsg/snack_bar.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class add_new extends StatefulWidget {
  @override
  State<add_new> createState() => _add_newState();
}

class _add_newState extends State<add_new> {


  final _scaffoldKey = GlobalKey<ScaffoldState>();


  //list of medicines forms objects
  final List<MedicineType> medicineTypes = [
    MedicineType("Syrup", Image.asset("assets/images/syrup.png"), true),
    MedicineType(
        "Pill", Image.asset("assets/images/pills.png"), false),
    MedicineType(
        "Capsule", Image.asset("assets/images/capsule.png"), false),
    MedicineType(
        "Cream", Image.asset("assets/images/cream.png"), false),
    MedicineType(
        "Drops", Image.asset("assets/images/drops.png"), false),
    MedicineType(
        "Syringe", Image.asset("assets/images/syringe.png"), false),
  ];

  //-------------Pill object------------------
  int howManyWeeks = 1;
  String selectWeight;
  DateTime setDate = DateTime.now();
  final TextEditingController nameController = TextEditingController();

  final Repository _repository = Repository();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: _scaffoldKey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset('assets/images/welcome_image.png'),
                ),
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicine Name',
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                    ),
                    SizedBox(height: 10),
                    Text('Type',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      height: 100,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ...medicineTypes.map(
                                  (type) => MedicineTypeCard(type, medicineTypeClick))
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Time & Shedule',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        PlatformFlatButton(
                          handler: () => openDatePicker(),
                          buttonChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                DateFormat("dd.MM").format(setDate),
                                style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.event,
                                size: 30,
                                color:  Color(0xff8C87E6),
                              )
                            ],
                          ),
                          color: Color(0xffda8297),
                        ),
                      ],
                    ),



                    SizedBox(height: 30),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child:FlatButton(
                        color:Color(0xffda8297),
                        child: Text('Done',style: TextStyle(fontSize: 24),),
                        onPressed: ()async => savePill() ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),

                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }




  //-------------------------SHOW DATE PICKER AND CHANGE CURRENT CHOOSE DATE-------------------------------
  Future<void> openDatePicker() async {
    await showDatePicker(
        context: context,
        initialDate: setDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 100000)))
        .then((value) {
      DateTime newDate = DateTime(
          value != null ? value.year : setDate.year,
          value != null ? value.month : setDate.month,
          value != null ? value.day : setDate.day,
          setDate.hour,
          setDate.minute);
      setState(() => setDate = newDate);
      print(setDate.day);
      print(setDate.month);
      print(setDate.year);
    });
  }

  //=======================================================================================================

  //--------------------------------------SAVE PILL IN DATABASE---------------------------------------
  Future savePill() async {
    //check if medicine time is lower than actual time
    if (setDate.millisecondsSinceEpoch <=
        DateTime.now().millisecondsSinceEpoch) {

         print( "Check your medicine time and date");
    } else {
      //create pill object
      Pill pill = Pill(

          medicineForm: medicineTypes[medicineTypes.indexWhere((element) => element.isChoose == true)].name,
          name: nameController.text,
          time: setDate.millisecondsSinceEpoch,
          type: selectWeight,
         );

      //---------------------| Save as many medicines as many user checks |----------------------
      for (int i = 0; i < howManyWeeks; i++) {
        dynamic result =
        await _repository.insertData("Pills", pill.pillToMap());
        if (result == null) {
          print("Something went wrong");
          return;
        } else {

          tz.initializeTimeZones();
          tz.setLocalLocation(tz.getLocation('Europe/Warsaw'));
          setDate = setDate.add(Duration(milliseconds: 604800000));
          pill.time = setDate.millisecondsSinceEpoch;

        }
      }
      Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => home_page()),
      );

    }
  }

  void medicineTypeClick(MedicineType medicine) {
    setState(() {
      medicineTypes.forEach((medicineType) => medicineType.isChoose = false);
      medicineTypes[medicineTypes.indexOf(medicine)].isChoose = true;
    });
  }

  //=====================================================================================================

  //get time difference
  int get time =>
      setDate.millisecondsSinceEpoch -
          tz.TZDateTime.now(tz.local).millisecondsSinceEpoch;















}

