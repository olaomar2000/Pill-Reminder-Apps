import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project2_gsg/models/pill.dart';
//done
class MedicineCard extends StatelessWidget {

  final Pill medicine;
  final Function setData;

  MedicineCard(this.medicine,this.setData);

  @override
  Widget build(BuildContext context) {
    final bool isEnd = DateTime.now().millisecondsSinceEpoch > medicine.time;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0.0,
          margin: EdgeInsets.symmetric(vertical:5.0),
          color: Colors.white,
          child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical:15.0,horizontal: 15.0),
              title:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    medicine.name,
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),

                  ),
                  Icon(Icons.more_vert,color: Colors.grey,)
                ],
              ),
              subtitle: Padding(
                padding:  EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    ElevatedButton(onPressed:(){},
                        child: Text('After Breckfast',style: TextStyle(color: Color(0xff7379CD)),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffBDC4F8)),
                      ),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed:(){}, child: Text('After Diner',style: TextStyle(color: Color(
                        0xffda8297)),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFCCED8)),
                      ),
                    ),
                  ],
                ),
              ),
              leading: Container(
                width: 60.0,
                height: 60.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                      medicine.image),
                ),
              )),
        ),
      ),
    );
  }
}
