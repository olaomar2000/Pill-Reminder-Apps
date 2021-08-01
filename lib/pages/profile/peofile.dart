import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2_gsg/pages/Home/medicineslist.dart';

class profile_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 height: 220,
                 width: double.infinity,
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
                 child: Padding(
                   padding:  EdgeInsets.only(top: 20),
                   child: Column(
                     children: [
                     Container(
                     width: 80.0,
                     height: 80.0,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(50.0),
                       child: Image.asset(
                           "assets/images/welcome_image.png"),
                     ),
                   ),
                      SizedBox(height: 10,),
                      Text('Ola Omar',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                       Text('Age -25',style: TextStyle(fontSize: 15)),
                       SizedBox(height: 10,),
                       RaisedButton(
                         onPressed: () {},
                         textColor: Colors.white,
                         color: Colors.transparent,
                         padding: EdgeInsets.all(0),
                         shape: RoundedRectangleBorder(
                           borderRadius: new BorderRadius.circular(18.0),
                         ),

                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Color(0xff8C87E6)
                           ),
                           padding: const EdgeInsets.only(top: 10,bottom: 10,left: 50,right: 50),
                           child: const Text('Swip to edit profile', style: TextStyle(fontSize: 16)),
                         ),
                       ),

                     ],
                   ),
                 ),
               ),
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.only(top: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('   Onging Course',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     SizedBox(height: 5,),
                     MedicinesList(),
                   ],
                 ),
               ),





             ],
           ),
         ),
      ),
    );
  }

}