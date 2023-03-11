
import 'package:get/get_rx/src/rx_types/rx_types.dart';


abstract class ParcelType {
  Rx<int> fees =0.obs;
  Rx<int> nonRegisteredFees=0.obs;
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
  void findFees(int weight) {
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
  void findFees(int weight) {
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


class Countr{
  String name;
  String code;
  
  Countr({required this.name,required this.code});
}

class Groups{
 static List<Countr> A = [   Countr(name: "American Samoa", code: "AS"), Countr(name: "Andorra", code: "AD"), Countr(name: "Angola", code: "AO"), Countr(name: "Anguilla", code: "AI"), Countr(name: "Antigua and Barbuda", code: "AG"), Countr(name: "Argentina", code: "AR"), Countr(name: "Armenia", code: "AM"), Countr(name: "Aruba", code: "AW"), Countr(name: "Ascension Island", code: "AC"), Countr(name: "Australia", code: "AU"), Countr(name: "Austria", code: "AT"), Countr(name: "Azerbaijan", code: "AZ"), Countr(name: "Bahamas", code: "BS"), Countr(name: "Bahrain", code: "BH"), Countr(name: "Bangladesh", code: "BD"), Countr(name: "Barbados", code: "BB"), Countr(name: "Belarus", code: "BY"), Countr(name: "Belgium", code: "BE"), Countr(name: "Belize", code: "BZ"), Countr(name: "Benin", code: "BJ"), Countr(name: "Bermuda", code: "BM"), Countr(name: "Bhutan", code: "BT"), Countr(name: "Bolivia", code: "BO"), Countr(name: "Bosnia and Herzegovina", code: "BA"), Countr(name: "Botswana", code: "BW"), Countr(name: "Brazil", code: "BR"), Countr(name: "British Indian Ocean Territory", code: "IO"), Countr(name: "British Virgin Islands", code: "VG"), Countr(name: "Brunei", code: "BN"), Countr(name: "Bulgaria", code: "BG"), Countr(name: "Burkina Faso", code: "BF"), Countr(name: "Burundi", code: "BI"), Countr(name: "Cambodia", code: "KH"), Countr(name: "Cameroon", code: "CM"), Countr(name: "Canada", code: "CA"), Countr(name: "Cape Verde", code: "CV"), Countr(name: "Caribbean Netherlands", code: "BQ"), Countr(name: "Cayman Islands", code: "KY"), Countr(name: "Central African Republic", code: "CF"), Countr(name: "Chad", code: "TD"), Countr(name: "Chile", code: "CL"), Countr(name: "China", code: "CN"), Countr(name: "Christmas Island", code: "CX"), Countr(name: "Cocos [Keeling] Islands", code: "CC"), Countr(name: "Colombia", code: "CO"), Countr(name: "Comoros", code: "KM"), Countr(name: "Democratic Republic Congo", code: "CD"), Countr(name: "Republic of Congo", code: "CG"), Countr(name: "Cook Islands", code: "CK"), Countr(name: "Costa Rica", code: "CR"), Countr(name: "Côte d\'Ivoire", code: "CI"), Countr(name: "Croatia", code: "HR"), Countr(name: "Cuba", code: "CU"), Countr(name: "Curaçao", code: "CW"), Countr(name: "Cyprus", code: "CY"), Countr(name: "Czech Republic", code: "CZ"), Countr(name: "Denmark", code: "DK"), Countr(name: "Djibouti", code: "DJ"), Countr(name: "Dominica", code: "DM"), Countr(name: "Dominican Republic", code: "DO"), Countr(name: "East Timor", code: "TL"), Countr(name: "Ecuador", code: "EC"), Countr(name: "Egypt", code: "EG"), Countr(name: "El Salvador", code: "SV"), Countr(name: "Equatorial Guinea", code: "GQ"), Countr(name: "Eritrea", code: "ER"), Countr(name: "Estonia", code: "EE"), Countr(name: "Eswatini", code: "SZ"), Countr(name: "Ethiopia", code: "ET"), Countr(name: "Falkland Islands [Islas Malvinas]", code: "FK"), Countr(name: "Faroe Islands", code: "FO"), Countr(name: "Fiji", code: "FJ"), Countr(name: "Finland", code: "FI"), Countr(name: "France", code: "FR"), Countr(name: "French Guiana", code: "GF"), Countr(name: "French Polynesia", code: "PF"), Countr(name: "Gabon", code: "GA"), Countr(name: "Gambia", code: "GM"), Countr(name: "Georgia", code: "GE"), Countr(name: "Germany", code: "DE"), Countr(name: "Ghana", code: "GH"), Countr(name: "Gibraltar", code: "GI"), Countr(name: "Greece", code: "GR"), Countr(name: "Greenland", code: "GL"), Countr(name: "Grenada", code: "GD"), Countr(name: "Guadeloupe", code: "GP"), Countr(name: "Guam", code: "GU"), Countr(name: "Guatemala", code: "GT"), Countr(name: "Guernsey", code: "GG"), Countr(name: "Guinea Conakry", code: "GN"), Countr(name: "Guinea-Bissau", code: "GW"), Countr(name: "Guyana", code: "GY"), Countr(name: "Haiti", code: "HT"), Countr(name: "Heard Island and McDonald Islands", code: "HM"), Countr(name: "Honduras", code: "HN"), Countr(name: "Hong Kong", code: "HK"), Countr(name: "Hungary", code: "HU"), Countr(name: "Iceland", code: "IS"), Countr(name: "India", code: "IN"), Countr(name: "Indonesia", code: "ID"), Countr(name: "Iran", code: "IR"), Countr(name: "Iraq", code: "IQ"), Countr(name: "Ireland", code: "IE"), Countr(name: "Isle of Man", code: "IM"), Countr(name: "Israel", code: "IL"), Countr(name: "Italy", code: "IT"), Countr(name: "Jamaica", code: "JM"), Countr(name: "Japan", code: "JP"), Countr(name: "Jersey", code: "JE"), Countr(name: "Jordan", code: "JO"), Countr(name: "Kazakhstan", code: "KZ"), Countr(name: "Kenya", code: "KE"), Countr(name: "Kiribati", code: "KI"), Countr(name: "Kosovo", code: "XK"), Countr(name: "Kuwait", code: "KW"), Countr(name: "Kyrgyzstan", code: "KG"), Countr(name: "Laos", code: "LA"), Countr(name: "Latvia", code: "LV"), Countr(name: "Lebanon", code: "LB"), Countr(name: "Lesotho", code: "LS"), Countr(name: "Liberia", code: "LR"), Countr(name: "Libya", code: "LY"), Countr(name: "Liechtenstein", code: "LI"), Countr(name: "Lithuania", code: "LT"), Countr(name: "Luxembourg", code: "LU"), Countr(name: "Macau", code: "MO"), Countr(name: "Macedonia", code: "MK"), Countr(name: "Madagascar", code: "MG"), Countr(name: "Malawi", code: "MW"), Countr(name: "Malaysia", code: "MY"), Countr(name: "Maldives", code: "MV"), Countr(name: "Mali", code: "ML"), Countr(name: "Malta", code: "MT"), Countr(name: "Marshall Islands", code: "MH"), Countr(name: "Martinique", code: "MQ"), Countr(name: "Mauritania", code: "MR"), Countr(name: "Mauritius", code: "MU"), Countr(name: "Mayotte", code: "YT"), Countr(name: "Mexico", code: "MX"), Countr(name: "Micronesia", code: "FM"), Countr(name: "Moldova", code: "MD"), Countr(name: "Monaco", code: "MC"), Countr(name: "Mongolia", code: "MN"), Countr(name: "Montenegro", code: "ME"), Countr(name: "Montserrat", code: "MS"), Countr(name: "Morocco", code: "MA"), Countr(name: "Mozambique", code: "MZ"), Countr(name: "Myanmar [Burma]", code: "MM"), Countr(name: "Namibia", code: "NA"), Countr(name: "Nauru", code: "NR"), Countr(name: "Nepal", code: "NP"), Countr(name: "Netherlands", code: "NL"), Countr(name: "New Caledonia", code: "NC"), Countr(name: "New Zealand", code: "NZ"), Countr(name: "Nicaragua", code: "NI"), Countr(name: "Niger", code: "NE"), Countr(name: "Nigeria", code: "NG"), Countr(name: "Niue", code: "NU"), Countr(name: "Norfolk Island", code: "NF"), Countr(name: "North Korea", code: "KP"), Countr(name: "Northern Mariana Islands", code: "MP"), Countr(name: "Norway", code: "NO"), Countr(name: "Oman", code: "OM"), Countr(name: "Pakistan", code: "PK"), Countr(name: "Palau", code: "PW"), Countr(name: "Palestinian Territories", code: "PS"), Countr(name: "Panama", code: "PA"), Countr(name: "Papua New Guinea", code: "PG"), Countr(name: "Paraguay", code: "PY"), Countr(name: "Peru", code: "PE"), Countr(name: "Philippines", code: "PH"), Countr(name: "Poland", code: "PL"), Countr(name: "Portugal", code: "PT"), Countr(name: "Puerto Rico", code: "PR"), Countr(name: "Qatar", code: "QA"), Countr(name: "Réunion", code: "RE"), Countr(name: "Romania", code: "RO"), Countr(name: "Russia", code: "RU"), Countr(name: "Rwanda", code: "RW"), Countr(name: "Saint Barthélemy", code: "BL"), Countr(name: "Saint Helena", code: "SH"), Countr(name: "St. Kitts", code: "KN"), Countr(name: "St. Lucia", code: "LC"), Countr(name: "Saint Martin", code: "MF"), Countr(name: "Saint Pierre and Miquelon", code: "PM"), Countr(name: "St. Vincent", code: "VC"), Countr(name: "Samoa", code: "WS"), Countr(name: "San Marino", code: "SM"), Countr(name: "São Tomé and Príncipe", code: "ST"), Countr(name: "Saudi Arabia", code: "SA"), Countr(name: "Senegal", code: "SN"), Countr(name: "Serbia", code: "RS"), Countr(name: "Seychelles", code: "SC"), Countr(name: "Sierra Leone", code: "SL"), Countr(name: "Singapore", code: "SG"), Countr(name: "Sint Maarten", code: "SX"), Countr(name: "Slovakia", code: "SK"), Countr(name: "Slovenia", code: "SI"), Countr(name: "Solomon Islands", code: "SB"), Countr(name: "Somalia", code: "SO"), Countr(name: "South Africa", code: "ZA"), Countr(name: "South Georgia and the South Sandwich Islands", code: "GS"), Countr(name: "South Korea", code: "KR"), Countr(name: "South Sudan", code: "SS"), Countr(name: "Spain", code: "ES"), Countr(name: "Sri Lanka", code: "LK"), Countr(name: "Sudan", code: "SD"), Countr(name: "Suriname", code: "SR"), Countr(name: "Svalbard and Jan Mayen", code: "SJ"), Countr(name: "Sweden", code: "SE"), Countr(name: "Switzerland", code: "CH"), Countr(name: "Syria", code: "SY"), Countr(name: "Taiwan", code: "TW"), Countr(name: "Tajikistan", code: "TJ"), Countr(name: "Tanzania", code: "TZ"), Countr(name: "Thailand", code: "TH"), Countr(name: "Togo", code: "TG"), Countr(name: "Tokelau", code: "TK"), Countr(name: "Tonga", code: "TO"), Countr(name: "Trinidad/Tobago", code: "TT"), Countr(name: "Tunisia", code: "TN"), Countr(name: "Turkey", code: "TR"), Countr(name: "Turkmenistan", code: "TM"), Countr(name: "Turks and Caicos Islands", code: "TC"), Countr(name: "Tuvalu", code: "TV"), Countr(name: "U.S. Virgin Islands", code: "VI"), Countr(name: "Uganda", code: "UG"), Countr(name: "Ukraine", code: "UA"), Countr(name: "United Arab Emirates", code: "AE"), Countr(name: "United Kingdom", code: "GB"), Countr(name: "United States", code: "US"), Countr(name: "Uruguay", code: "UY"), Countr(name: "Uzbekistan", code: "UZ"), Countr(name: "Vanuatu", code: "VU"), Countr(name: "Vatican City", code: "VA"), Countr(name: "Venezuela", code: "VE"), Countr(name: "Vietnam", code: "VN"), Countr(name: "Wallis and Futuna", code: "WF"), Countr(name: "Western Sahara", code: "EH"), Countr(name: "Yemen", code: "YE"), Countr(name: "Zambia", code: "ZM"), Countr(name: "Zimbabwe", code: "ZW")];
 static List<Countr> B = [];
 static List<Countr> C = [Countr(name: "Afghanistan", code: "AF"),];
 static List<Countr> D = [];
 static List<Countr> E = [Countr(name: "Albania", code: "AL"), Countr(name: "Algeria", code: "DZ"),];
 static List<Countr> F = [];
 static List<Countr> G = [];
 static List<Countr> H = [];



  
}