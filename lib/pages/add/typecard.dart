import 'package:flutter/material.dart';



class MedicineTypeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xff7379CD),
            ),
            height: 70,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.0,),
                Container(child: Icon(Icons.local_drink,color: Colors.white,),),
                SizedBox(height: 7.0,),
              ],
            ),


          ),
        );

  }
}
