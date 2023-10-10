import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("comments"),
        centerTitle: false,
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dXJsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                ),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'comment as username',
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical:8,horizontal: 8 ),
                  child: const Text("Post",style: TextStyle(
                    color: Colors.blueAccent,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
