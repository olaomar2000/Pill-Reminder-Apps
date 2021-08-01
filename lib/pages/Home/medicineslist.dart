import 'package:flutter/cupertino.dart';
import 'package:project2_gsg/pages/Home/medicineCard.dart';
//done
class MedicinesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MedicineCard(),
      itemCount: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}