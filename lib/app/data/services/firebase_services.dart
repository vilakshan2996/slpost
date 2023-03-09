import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/parcel.dart';

// class FirebaseServices {
  
//   static Future<void> getRate() async {
//     QuerySnapshot query = await FirebaseFirestore.instance
//         .collection('rates')
//         .where('countries', arrayContains: 'Maldives')
//         .get();
//     DocumentReference ref = query.docs[0].reference;
//     String path = ref.path;
//     DocumentSnapshot doc =
//         await FirebaseFirestore.instance.collection('rates').doc("A").get();
//     print(doc.data());
//     if (doc.exists) {
//       ParcelRates.parcelRate = ParcelRates.fromFirestore(doc);
      
//     } else {
//       print('No such document!');
//     }
//   }


//   static Future<void> updateCollection()async{
//     await FirebaseFirestore.instance
//           .collection("rates")
//           .get()
//           .then((QuerySnapshot snapShot) async {
//         snapShot.docs.forEach((element) async {
//           await FirebaseFirestore.instance
//               .collection("rates")
//               .doc(element.id)
//               .set(element.data()as Map<String, dynamic>);
//         });
//       });
//   }

//   static Future<void> updateDocument()async{
// // get the data from 'name@xxx.com'
//  FirebaseFirestore.instance.collection("rates").doc("A").get().then( (doc) {
//     if (doc.exists) {
//         var data = doc.data();
//         // saves the data to 'name'
//        FirebaseFirestore.instance.collection("rates").doc("A").collection("airmail").doc("A").set(data!).then({
//             // deletes the old document
//             FirebaseFirestore.instance.collection("rates").doc("A").delete()
//         } as FutureOr Function(void value));
//     }
// });
//   }
// }
