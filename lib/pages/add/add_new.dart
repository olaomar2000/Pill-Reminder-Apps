import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2_gsg/pages/add/typecard.dart';
import 'package:project2_gsg/platform_flat_button.dart';

class add_new extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      keyboardType: TextInputType.number,
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
                    Row(
                      children: [
                         MedicineTypeCard(),
                         MedicineTypeCard(),
                         MedicineTypeCard(),
                         MedicineTypeCard(),

                      ],
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
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'After Breckfast',
                            style: TextStyle(color: Color(0xff7379cd)),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffBDC4F8)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'After Diner',
                            style: TextStyle(color: Color(0xffda8297)),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffFCCED8)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Done',
                          style: TextStyle(color: Color(0xff7379CD)),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xffBDC4F8)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
