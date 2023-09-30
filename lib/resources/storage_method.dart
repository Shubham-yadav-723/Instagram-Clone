import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{
  final FirebaseStorage _storage= FirebaseStorage.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;

  //adding image tp storage

  Future<String> uploadImageToStorage(String childName, Uint8List file,bool isPost)async{
    Reference ref= _storage.ref().child(childName).child(_auth.currentUser!.uid);

    //upload
    UploadTask uploadTask=ref.putData(file);

    TaskSnapshot snap=   await uploadTask;
    String downloadurl =await snap.ref.getDownloadURL(); 
    return downloadurl;

  }
}