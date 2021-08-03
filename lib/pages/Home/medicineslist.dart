import 'package:flutter/cupertino.dart';
import 'package:project2_gsg/models/pill.dart';
import 'package:project2_gsg/pages/Home/medicinecard.dart';




class MedicinesList extends StatelessWidget {
  final List<Pill> listOfMedicines;
  final Function setData;

  MedicinesList(this.listOfMedicines,this.setData);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MedicineCard(listOfMedicines[index],setData),
      itemCount: listOfMedicines.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}