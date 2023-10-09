import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/model/post.dart';
import 'package:insta_clone/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  //to uplaod post
  Future<String> uploadPost(String description,Uint8List file,String uid,String username,String profImage)async{
    String res="Some Error Occured";
    try{
      String photoUrl=await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId=const Uuid().v1();
      Post post=Post(datePublished: 
      DateTime.now(), 
      uid: uid, 
      postUrl: photoUrl, 
      username: username,
       description: description, 
       postId: postId, 
       profImage: profImage, 
       likes: []);
       _firestore.collection('posts').doc(postId).set(post.toJson());
       res='success';
    }catch(err){
      res=err.toString();
    }
    return res;
  }

  Future<void> likePost(String postId,String uid, List likes)async{
    try{
      if(likes.contains(uid)){
       await _firestore.collection('posts').doc(postId).update({
          'likes':FieldValue.arrayRemove([uid]),
        });
      }else{
         await _firestore.collection('posts').doc(postId).update({
          'likes':FieldValue.arrayUnion([uid]),
        });
      }
      
    }
    catch(e){
      print(e.toString(),);
    }
  }
}