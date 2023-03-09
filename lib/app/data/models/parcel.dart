import 'package:cloud_firestore/cloud_firestore.dart';


//Class which containes list of countries of that group and each type of psots available , for example differenct packets available 
//for air mail
// class ParcelRates {

//   static late ParcelRates parcelRate;
//   List<String> countries;
//   ParcelType letter;
//   int registrationFees ;

//   ParcelRates({required this.countries, required this.letter,required this.registrationFees});

//   factory ParcelRates.fromFirestore(DocumentSnapshot doc) {
//     var data = doc.data() as Map<String, dynamic>;
//     return ParcelRates(
//       countries: List<String>.from(data['countries']),
//       letter: ParcelType.fromFirestore(data['Letter']),
//       registrationFees: data["registrationFees"],

//     );
//   }
// }


// //Class for each type of parcels like Letter, UPacket
// class ParcelType {
//   int maxWeight;
//   WeightRate rate;
//   int feesWithoutRegistration = 0;
//   int fees = 0;

//   ParcelType({required this.maxWeight, required this.rate});

//   factory ParcelType.fromFirestore(Map<String, dynamic> data) {
//     var rateJson = data['rate'] as Map<String, dynamic>;
//     return ParcelType(
//       maxWeight: data['maxWeight'] as int,
//       rate: WeightRate.fromFirestore(rateJson)
//     );
//   }


//   void calculateTotalCharges(int inputWeight, int registrationFees){
//     if(inputWeight<rate.fixedWeight){
//       fees = rate.fixedWeightRate;
//     }else{
//       int times = ((inputWeight - rate.fixedWeight)/rate.variableWeight).ceil();
//       feesWithoutRegistration = times*rate.variableWeightRate + rate.fixedWeightRate;
//       fees = feesWithoutRegistration + registrationFees;
//       print(fees);
      
//     }
//   }
// }

// //Class for rate of Fixed and Variable type of each package
// class WeightRate{
//   int fixedWeight;
//   int fixedWeightRate;
//   int variableWeight;
//   int variableWeightRate;

//   WeightRate({required this.fixedWeightRate,required this.variableWeightRate,required this.fixedWeight,required this.variableWeight});

//    factory WeightRate.fromFirestore(Map<String, dynamic> data){
//     String fixed = (data["fixed"] as Map<String,dynamic>).keys.first;
//     String variable = (data["variable"] as Map<String,dynamic>).keys.first;   //variable is 10g
//     return WeightRate(
//       fixedWeight: int.parse(fixed),
//       fixedWeightRate:data["fixed"][fixed],
//       variableWeight: int.parse(variable) ,
//       variableWeightRate: data["variable"][variable],
//     );
//    }

// }



abstract class ParcelType {
  double fees =0;
  double nonRegisteredFees = 0;
  int startColor,endColor;
  String title;
  String imagePath;
  int ?MaximumWeight;

  ParcelType({required this.title,required this.startColor,required this.endColor,required this.imagePath,this.MaximumWeight});


  void findFees(int w);
}


class SeaMailLetter extends ParcelType{
  SeaMailLetter({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});


  
  @override
  void findFees(int weight) {
    // TODO: implement findFees
    if(weight<20){
      fees = 130;
    }else if(weight<50){
      fees = 240;
    }else if(weight<100){
      fees = 440;
    }else if(weight<250){
      fees = 1020;
    }else if(weight<500){
      fees = 1980;
    }else if(weight<1000){
      fees=3920;
    }else {
      fees = 7780;
    }
    nonRegisteredFees = fees;
    fees = fees + 870;
    }

 

}


class SeaMailPM extends ParcelType{
  SeaMailPM({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight) {
    if(weight<20){
      fees = 120;
    }else if(weight<50){
      fees = 230;
    }else if(weight<100){
      fees = 410;
    }else if(weight<250){
      fees = 970;
    }else if(weight<500){
      fees = 1900;
    }else if(weight<1000){
      fees=3760;
    }else {
      fees = 7480;
    }
    nonRegisteredFees = fees;
    fees = fees + 870;
    }

    
  }
  

  class SeaMailSP extends ParcelType {
  SeaMailSP({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight) {
    if(weight<100){
      fees = 440;
    }else if(weight<250){
      fees = 1000;
    }else if(weight<500){
      fees = 1930;
    }else {
      fees = 3790;
    }
    nonRegisteredFees = fees;
    fees = fees + 870;
    }

  }


    


  




class Mails{
  static List<ParcelType> seamails = [
    SeaMailLetter(title: "Letter", startColor: 0xff6F72CA, endColor: 0xff1E1466, imagePath:"assets/fitness_app/letter.png", MaximumWeight: 2),
     SeaMailSP(title: "Small Packets", startColor: 0xffFA7D82, endColor: 0xffFFB295, imagePath:"assets/fitness_app/letter.png", MaximumWeight: 2),
    SeaMailPM(title: "Printed Matter, Books", startColor: 0xff738AE6, endColor: 0xff5C5EDD, imagePath:"assets/fitness_app/letter.png", MaximumWeight: 2),

  ];

  static List<ParcelType> airmails = [
    SeaMailLetter(title: "Letter", startColor: 0xffFE95B6, endColor: 0xffFF5287, imagePath:"assets/fitness_app/letter.png", MaximumWeight: 2),
    SeaMailLetter(title: "Letter", startColor: 0xff6F72CA, endColor: 0xff1E1466, imagePath:"assets/fitness_app/letter.png", MaximumWeight: 2),
   
  ];
}