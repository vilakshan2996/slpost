import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/parcel.dart';

class FirebaseServices {
  static Future<void> getRate() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('rates')
        .where('countries', arrayContains: 'Maldives')
        .get();
    DocumentReference ref = query.docs[0].reference;
    String path = ref.path;
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('rates').doc("A").get();
    print(doc.data());
    if (doc.exists) {
      ParcelRates.parcelRates = ParcelRates.fromFirestore(doc);
      
    } else {
      print('No such document!');
    }
  }
}
