class Pill {
  int id;
  String name;

  String type;

  String medicineForm;
  int time;

  Pill({this.id,

    this.time,

    this.medicineForm,
    this.name,
    this.type});

  Map<String, dynamic> pillToMap() {
    Map<String, dynamic> map = Map();
    map['id'] = this.id;
    map['name'] = this.name;

    map['type'] = this.type;

    map['medicineForm'] = this.medicineForm;
    map['time'] = this.time;
    return map;
  }

  //=====================================================

  //---------------------create pill object from map---------------------
  Pill pillMapToObject(Map<String, dynamic> pillMap) {
    return Pill(
        id: pillMap['id'],
        name: pillMap['name'],

        type: pillMap['type'],

        medicineForm: pillMap['medicineForm'],
        time: pillMap['time']);
  }
  String get image{
    switch(this.medicineForm){
      case "Syrup": return "assets/images/syrup.png"; break;
      case "Pill":return "assets/images/pills.png"; break;
      case "Capsule":return "assets/images/capsule.png"; break;
      case "Cream":return "assets/images/cream.png"; break;
      case "Drops":return "assets/images/drops.png"; break;
      case "Syringe":return "assets/images/syringe.png"; break;
      default : return "assets/images/pills.png"; break;
    }
  }
}
