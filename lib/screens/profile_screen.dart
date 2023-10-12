import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("username"),
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1669324357471-e33e71e3f3d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXJsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60",
                      ),
                      radius: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildStatColumn(20, "posts"),
                              buildStatColumn(210, "followers"),
                              buildStatColumn(200, "following"),
                            ],
                          ),
                          Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FollowButton(text: 'Edit Profile',
                        backgroundColor: mobileBackgroundColor,
                        textColor: primaryColor,
                        borderColor: Colors.grey,
                        function: (){},)

                      ],
                    )
                        ],
                      ),
                      
                      
                    ),
                    
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("username",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 1),
                  child: Text("some bio here",),
                )
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
