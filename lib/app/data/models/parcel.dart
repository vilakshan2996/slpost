
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


 class ParcelType {
  Rx<int> fees =0.obs;
  Rxn<int> nonRegisteredFees=Rxn<int>();
  int startColor,endColor;
  String title;
  String imagePath;
  int ?MaximumWeight;
  Rx<bool>isWeightExceeded = Rx<bool>(false);

  ParcelType({required this.title,required this.startColor,required this.endColor,required this.imagePath,this.MaximumWeight});
  void findFees(int w,Country c){
          if(w>MaximumWeight!*1000){
      isWeightExceeded.value = true;
      fees.value = 0;
      nonRegisteredFees.value = 0;
      return;
    }else{
      isWeightExceeded.value = false;
    }

  }

  
   


 }


class SeaMailLetter extends ParcelType{
  SeaMailLetter({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  

  
  @override
  void findFees(int weight,Country country) {
    super.findFees(weight, country); 
   
      if(weight<20){
      fees.value = 130;
    }else if(weight<50){
      fees.value = 240;
    }else if(weight<100){
      fees.value = 440;
    }else if(weight<250){
      fees.value = 1020;
    }else if(weight<500){
      fees.value = 1980;
    }else if(weight<1000){
      fees.value=3920;
    }else {
      fees.value = 7780;
    }
    nonRegisteredFees.value = fees.value;
    fees.value = fees.value + 870;


    }
    

    
    }

    

 




class SeaMailPM extends ParcelType{
  SeaMailPM({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight,Country country) {

    super.findFees(weight, country); 
    if(weight<20){
      fees.value = 120;
    }else if(weight<50){
      fees.value = 230;
    }else if(weight<100){
      fees.value = 410;
    }else if(weight<250){
      fees.value = 970;
    }else if(weight<500){
      fees.value = 1900;
    }else if(weight<1000){
      fees.value=3760;
    }else {
      fees.value = 7480;
    }
    nonRegisteredFees.value = fees.value;
    fees.value = fees.value + 870;
    }

    
  }
  

  class SeaMailSP extends ParcelType {
  SeaMailSP({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight,Country country) {
    super.findFees(weight, country); 
    if(weight<100){
      fees.value = 440;
    }else if(weight<250){
      fees.value = 1000;
    }else if(weight<500){
      fees.value = 1930;
    }else {
      fees.value = 3790;
    }
    nonRegisteredFees.value = fees.value;
    fees.value = fees.value + 870;

    

    
    }
 
  }


    
  class AirMailLetter extends ParcelType{
  AirMailLetter({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight,Country country) {
    super.findFees(weight, country); 

    int times;
    if(weight<=20){
      times=0;
    }else{
      times = ((weight-20)/10).ceil();
    }
    if(country.groupName =="A"){
      fees.value = 110 + times*35;

    }else if(country.groupName =="B"){
      fees.value = 120 + times*40;

    }else if(country.groupName =="C"){
      fees.value = 130 + times*40;

    }else if(country.groupName =="D"){
      fees.value = 140 + times*45;

    }else if(country.groupName =="E"){
      fees.value = 150 + times*50;

    }else if(country.groupName =="F"){
      fees.value = 160 + times*55;

    }else if(country.groupName =="G"){
      fees.value = 170 + times*60;

    }else{
      fees.value = 210 + times*85;

    }

    nonRegisteredFees.value = fees.value;
    fees.value = fees.value + 870;
  }
    
  }

  

  class AirUpacket extends ParcelType{
  AirUpacket({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight,Country country) {
    super.findFees(weight, country); 

    int times;
    if(weight<=50){
      times=0;
    }else{
      times = ((weight-50)/50).ceil();
    }
    if(country.groupName =="A"){
      fees.value = 240 + times*170;

    }else if(country.groupName =="B"){
      fees.value = 260 + times*195;

    }else if(country.groupName =="C"){
      fees.value = 280 + times*215;

    }else if(country.groupName =="D"){
      fees.value = 300 + times*240;

    }else if(country.groupName =="E"){
      fees.value = 330 + times*260;

    }else if(country.groupName =="F"){
      fees.value = 350 + times*285;

    }else if(country.groupName =="G"){
      fees.value = 380 + times*310;

    }else{
      fees.value = 480 + times*420;

    }

    nonRegisteredFees.value = fees.value;
    fees.value = fees.value + 870;
  }
    
  }

  class AirPrintedMatter extends ParcelType{
  AirPrintedMatter({required super.title, required super.startColor, required super.endColor, required super.imagePath,required super.MaximumWeight});

  @override
  void findFees(int weight,Country country) {

   super.findFees(weight, country); 

   int times;
    if(weight<=20){
      times=0;
    }else{
      times = ((weight-20)/10).ceil();
    }
    if(country.groupName =="A"){
      fees.value = 105 + times*35;

    }else if(country.groupName =="B"){
      fees.value = 115 + times*40;

    }else if(country.groupName =="C"){
      fees.value = 120 + times*40;

    }else if(country.groupName =="D"){
      fees.value = 130 + times*45;

    }else if(country.groupName =="E"){
      fees.value = 140 + times*50;

    }else if(country.groupName =="F"){
      fees.value = 150 + times*55;

    }else if(country.groupName =="G"){
      fees.value = 160 + times*60;

    }else{
      fees.value = 205 + times*85;

    }

    nonRegisteredFees.value = fees.value;
    fees.value = fees.value + 870;
  }
    
  

    
  }



  class PostCard extends ParcelType {
  PostCard({required super.title, required super.startColor, required super.endColor, required super.imagePath});

  @override
  void findFees(int weight, Country c) {
    print(".............findFees() PostCard Method called.............");
    fees.value = 70;
  }
    
  }



class Mails{
  static List<ParcelType> seamails = [
    SeaMailLetter(title: "Letter", startColor: 0xff6F72CA, endColor: 0xff1E1466, imagePath:"assets/images/letter.png", MaximumWeight: 2),
     SeaMailSP(title: "Small Packets", startColor: 0xffFA7D82, endColor: 0xffFFB295, imagePath:"assets/images/upacket.png", MaximumWeight: 2),
    SeaMailPM(title: "Printed Matter, Books", startColor: 0xff738AE6, endColor: 0xff5C5EDD, imagePath:"assets/images/books.png", MaximumWeight: 2),

  ];

  static List<ParcelType> airmails = [
    AirMailLetter(title: "Letter", startColor:0xff6F72CA, endColor: 0xff1E1466, imagePath:"assets/images/letter.png",MaximumWeight:2),
    AirUpacket(title: "U Packet", startColor: 0xffFA7D82, endColor: 0xffFFB295, imagePath: "assets/images/upacket.png", MaximumWeight: 2),
    AirPrintedMatter(title: "Printed Matters", startColor: 0xff738AE6, endColor:  0xff5C5EDD, imagePath: "assets/images/books.png", MaximumWeight: 2),
    PostCard(title: "Post Card", startColor: 0xffA6E3E9, endColor: 0xff0E6BA8, imagePath: "assets/images/postcard.png")

  ];


  
}


