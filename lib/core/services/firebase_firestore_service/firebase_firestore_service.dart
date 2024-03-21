

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirebaseService
{
  

    Future<DocumentSnapshot> 
     getDocument(String idDoc)
      async
    {
      print(idDoc);
      try{
       return  
       FirebaseFirestore.instance.
       collection('user_info').doc(idDoc).
       get();
      } on FirebaseException catch (e) {
        print(e.toString());
        rethrow;
      }
    }
    Future<void> addDocument(Map<String, dynamic> data , String idDoc) async
    {
      try{
        await FirebaseFirestore.instance.collection('user_info').
        doc(idDoc).set(data);
      } on FirebaseException catch (e) {
        print(e.toString());
        rethrow;
      }
    }
    Future<void> updateDocument(Map<String, dynamic> data , String idDoc) async
    {
      try{
        await FirebaseFirestore.instance.collection('user_info').
        doc(idDoc).update(data);
        print("Heello world");
      } on FirebaseException catch (e) {
        print(e.toString());
        rethrow;
      }
    }

}