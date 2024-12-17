import 'package:bookie_v2/HomePage.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'imageUrl': "assets/Icon2.jpg",
      'recommendation': 'You have a new message from John!',
    },
    {
      'imageUrl': "assets/down.jpg",
      'recommendation': 'New update available for your app.',
    },
    {
      'imageUrl': "assets/Icon.jpg",
      'recommendation': 'Reminder: Your appointment is tomorrow.',
    },
    {
      'imageUrl': "assets/Icon2.jpg",
      'recommendation': 'You have a new message from John!',
    },
    {
      'imageUrl': "assets/pexels-3.jpg",
      'recommendation': 'New update available for your app.',
    },
    {
      'imageUrl': "assets/Icon.jpg",
      'recommendation': 'Reminder: Your appointment is tomorrow.',
    },
    {
      'imageUrl': "assets/Icon2.jpg",
      'recommendation': 'You have a new message from John!',
    },
    {
      'imageUrl': 'https://www.example.com/image2.jpg',
      'recommendation': 'New update available for your app.',
    },
    {
      'imageUrl': 'assets/Icon.jpg',
      'recommendation': 'Reminder: Your appointment is tomorrow.',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
        }, icon: Icon(Icons.arrow_back_sharp)),
        title: Text('Notifications',style: TextStyle(color: Colors.purple,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),

      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(notifications[index]['imageUrl']!),
                radius: 30,
              ),
              title: Text(
                'Notification ${index + 1}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  notifications[index]['recommendation']!,
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}