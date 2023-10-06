import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../provider/user_provider.dart';



class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
Uint8List? _file;
final TextEditingController _descriptionController=TextEditingController();


  _selectImage(BuildContext context)async{
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: const Text("Create a Post"),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a Photo'),
            onPressed: ()async{
              Navigator.of(context).pop();
              Uint8List file=await pickImage(ImageSource.camera); 
              setState(() {
                _file=file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from gallary'),
            onPressed: ()async{
              Navigator.of(context).pop();
              Uint8List file=await pickImage(ImageSource.gallery); 
              setState(() {
                _file=file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Cancel'),
            onPressed: ()async{
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }


  @override
  Widget build(BuildContext context) {

  final User user=Provider.of<UserProvider>(context).getUser;
    return _file==null
    ? Center(
      child: IconButton(icon: const Icon(Icons.upload,size: 40,),
      onPressed: () {
        _selectImage(context);

      },),
    )

     :Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          
          onPressed: (){
            
          },
        ),
        title: const Text("Post to"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Post",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    user.photoUrl),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'write caption for the post.',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }
}
