import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';



//Parent Class, contains meta information of each packages, and methods
class ParcelType {

  //properties of child class
  int? nonRegisteredFees, maximumWeight;       //No fees as registered, or non registered for PostCard and maximum Weight is not for it
  bool isWeightExceeded = false;              //To Blur the card if the user select more than the maximum allowed weight
  int startColor, endColor, fees = 0;        //color of the container
  String title, imagePath;                       //title of the card

  ParcelType(
      {required this.title,
      required this.startColor,
      required this.endColor,
      required this.imagePath,
      this.maximumWeight});


  //call this method to get the fees by the weight and the Country   
  void findFees(int w, Country c) {   
    if (w > maximumWeight! * 1000) {
      isWeightExceeded = true;          //blur 
    } else {
      isWeightExceeded = false;          //no blur
    }
  }
}



class SeaMailLetter extends ParcelType {
  SeaMailLetter(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath,
      required super.maximumWeight});

  @override
  void findFees(int weight, Country country) {
    super.findFees(weight, country);

    if (weight < 20) {
      fees = 130;
    } else if (weight < 50) {
      fees = 240;
    } else if (weight < 100) {
      fees = 440;
    } else if (weight < 250) {
      fees = 1020;
    } else if (weight < 500) {
      fees = 1980;
    } else if (weight < 1000) {
      fees = 3920;
    } else {
      fees = 7780;
    }
    nonRegisteredFees = fees;
    fees = fees + 870;
  }
}



class SeaMailPM extends ParcelType {
  SeaMailPM(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath,
      required super.maximumWeight});

  @override
  void findFees(int weight, Country country) {
    super.findFees(weight, country);
    if (weight < 20) {
      fees = 120;
    } else if (weight < 50) {
      fees = 230;
    } else if (weight < 100) {
      fees = 410;
    } else if (weight < 250) {
      fees = 970;
    } else if (weight < 500) {
      fees = 1900;
    } else if (weight < 1000) {
      fees = 3760;
    } else {
      fees = 7480;
    }
    nonRegisteredFees = fees;
    fees = fees + 870;
  }
}

class SeaMailSP extends ParcelType {
  SeaMailSP(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath,
      required super.maximumWeight});

  @override
  void findFees(int weight, Country country) {
    super.findFees(weight, country);
    if (weight < 100) {
      fees = 440;
    } else if (weight < 250) {
      fees = 1000;
    } else if (weight < 500) {
      fees = 1930;
    } else {
      fees = 3790;
    }
    nonRegisteredFees = fees;
    fees = fees + 870;
  }
}

class AirMailLetter extends ParcelType {
  AirMailLetter(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath,
      required super.maximumWeight});

  @override
  void findFees(int weight, Country country) {
    super.findFees(weight, country);

    int times;
    if (weight <= 20) {
      times = 0;
    } else {
      times = ((weight - 20) / 10).ceil();
    }
    if (country.groupName == "A") {
      fees = 110 + times * 35;
    } else if (country.groupName == "B") {
      fees = 120 + times * 40;
    } else if (country.groupName == "C") {
      fees = 130 + times * 40;
    } else if (country.groupName == "D") {
      fees = 140 + times * 45;
    } else if (country.groupName == "E") {
      fees = 150 + times * 50;
    } else if (country.groupName == "F") {
      fees = 160 + times * 55;
    } else if (country.groupName == "G") {
      fees = 170 + times * 60;
    } else {
      fees = 210 + times * 85;
    }

    nonRegisteredFees = fees;
    fees = fees + 870;
  }
}

class AirUpacket extends ParcelType {
  AirUpacket(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath,
      required super.maximumWeight});

  @override
  void findFees(int weight, Country country) {
    super.findFees(weight, country);

    int times;
    if (weight <= 50) {
      times = 0;
    } else {
      times = ((weight - 50) / 50).ceil();
    }
    if (country.groupName == "A") {
      fees = 240 + times * 170;
    } else if (country.groupName == "B") {
      fees = 260 + times * 195;
    } else if (country.groupName == "C") {
      fees = 280 + times * 215;
    } else if (country.groupName == "D") {
      fees = 300 + times * 240;
    } else if (country.groupName == "E") {
      fees = 330 + times * 260;
    } else if (country.groupName == "F") {
      fees = 350 + times * 285;
    } else if (country.groupName == "G") {
      fees = 380 + times * 310;
    } else {
      fees = 480 + times * 420;
    }

    nonRegisteredFees = fees;
    fees = fees + 870;
  }
}

class AirPrintedMatter extends ParcelType {
  AirPrintedMatter(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath,
      required super.maximumWeight});

  @override
  void findFees(int weight, Country country) {
    super.findFees(weight, country);

    int times;
    if (weight <= 20) {
      times = 0;
    } else {
      times = ((weight - 20) / 10).ceil();
    }
    if (country.groupName == "A") {
      fees = 105 + times * 35;
    } else if (country.groupName == "B") {
      fees = 115 + times * 40;
    } else if (country.groupName == "C") {
      fees = 120 + times * 40;
    } else if (country.groupName == "D") {
      fees = 130 + times * 45;
    } else if (country.groupName == "E") {
      fees = 140 + times * 50;
    } else if (country.groupName == "F") {
      fees = 150 + times * 55;
    } else if (country.groupName == "G") {
      fees = 160 + times * 60;
    } else {
      fees = 205 + times * 85;
    }

    nonRegisteredFees = fees;
    fees = fees + 870;
  }
}

class PostCard extends ParcelType {
  PostCard(
      {required super.title,
      required super.startColor,
      required super.endColor,
      required super.imagePath});

  @override
  void findFees(int weight, Country c) {
    print(".............findFees() PostCard Method called.............");
    fees = 70;
  }
}





class Mails {
  static List<Rx<ParcelType>> seamails = [
    SeaMailLetter(
        title: "Letter",
        startColor: 0xff6F72CA,
        endColor: 0xff1E1466,
        imagePath: "assets/images/letter.png",
        maximumWeight: 2).obs,
    SeaMailSP(
        title: "Small Packets",
        startColor: 0xffFA7D82,
        endColor: 0xffFFB295,
        imagePath: "assets/images/upacket.png",
        maximumWeight: 2).obs,
    SeaMailPM(
        title: "Printed Matter, Books",
        startColor: 0xff738AE6,
        endColor: 0xff5C5EDD,
        imagePath: "assets/images/books.png",
        maximumWeight: 2).obs,
  ];

  static List<Rx<ParcelType>> airmails = [
    AirMailLetter(
        title: "Letter",
        startColor: 0xff6F72CA,
        endColor: 0xff1E1466,
        imagePath: "assets/images/letter.png",
        maximumWeight: 2).obs,
    AirUpacket(
        title: "U Packet",
        startColor: 0xffFA7D82,
        endColor: 0xffFFB295,
        imagePath: "assets/images/upacket.png",
        maximumWeight: 2).obs,
    AirPrintedMatter(
        title: "Printed Matters",
        startColor: 0xff738AE6,
        endColor: 0xff5C5EDD,
        imagePath: "assets/images/books.png",
        maximumWeight: 2).obs,
    PostCard(
        title: "Post Card",
        startColor: 0xffA6E3E9,
        endColor: 0xff0E6BA8,
        imagePath: "assets/images/postcard.png").obs
  ];
}
