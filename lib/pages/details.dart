
import 'package:flutter/material.dart';

class details extends StatefulWidget{
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Padding(
           padding: EdgeInsets.all(15.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 height: 300,
                 width: double.infinity,
                 child:Image.asset(
                     "assets/images/welcome_image.png") ,
               ),
               SizedBox(height: 25),
               Text('Paracetamel XL2',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30),),
               SizedBox(height: 25),
               Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,laboris nisi ut aliquip ex ea commodo consequat.',
                 style: TextStyle(fontWeight:FontWeight.normal,fontSize: 18,color: Colors.grey),),
               SizedBox(height: 25),
               Row(
                 children: [
                   ElevatedButton(onPressed:(){},
                     child: Text('After Breckfast',style: TextStyle(color: Color(0xff7379CD)),),
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Color(0xffBDC4F8)),
                     ),
                   ),
                   SizedBox(width: 30,),
                   ElevatedButton(onPressed:(){}, child: Text('After Diner',style: TextStyle(color: Color(
                       0xffda8297)),),
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFCCED8)),
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 40),

             ],
           ),
         ),
      ),
    );
  }
}