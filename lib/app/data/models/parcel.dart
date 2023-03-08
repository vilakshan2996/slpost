import 'package:cloud_firestore/cloud_firestore.dart';


//Class which containes list of countries of that group and each type of psots available , for example differenct packets available 
//for air mail
class ParcelRates {

  static late ParcelRates parcelRates;
  List<String> countries;
  ParcelType letter;

  ParcelRates({required this.countries, required this.letter});

  factory ParcelRates.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return ParcelRates(
      countries: List<String>.from(data['countries']),
      letter: ParcelType.fromFirestore(data['Letter']),
    );
  }
}


//Class for each type of parcels like Letter, UPacket
class ParcelType {
  int maxWeight;
  WeightRate rate;

  ParcelType({required this.maxWeight, required this.rate});

  factory ParcelType.fromFirestore(Map<String, dynamic> data) {
    var rateJson = data['rate'] as Map<String, dynamic>;
    return ParcelType(
      maxWeight: data['maxWeight'] as int,
      rate: WeightRate.fromFirestore(rateJson)
    );
  }
}

//Class for rate of Fixed and Variable type of each package
class WeightRate{
  Map<int,int> fixedWeightRate;
  Map<int,int> variableWeightRate;

  WeightRate({required this.fixedWeightRate,required this.variableWeightRate});

   factory WeightRate.fromFirestore(Map<String, dynamic> data){
    String key1 = (data["fixed"] as Map<String,dynamic>).keys.first;  //fixed is 20g
    String key2 = (data["variable"] as Map<String,dynamic>).keys.first;   //variable is 10g
    return WeightRate(
      fixedWeightRate:{int.parse(key1):data["fixed"][key1]},
      variableWeightRate: {int.parse(key2):data["variable"][key2]},
    );
   }

}