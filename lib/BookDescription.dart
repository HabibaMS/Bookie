import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/Notification.dart';
import 'package:flutter/material.dart';

class Bookdescription  extends StatefulWidget {
  const Bookdescription ({super.key});

  @override
  State<Bookdescription> createState() => _State();
}

class _State extends State<Bookdescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
        }, icon: Icon(Icons.arrow_back_sharp)),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.shopping_cart,
                color: Colors.deepPurple),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => NotificationPage()));
            },
            icon: Icon(
              Icons.notification_add,
              color: Colors.deepPurple,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        // Product Image and Title
        Row(
        children: [
          Container(
          height: 180,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.purple.shade200,
          ),
          child: const Icon(Icons.book, size: 60, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            const Text(
              "Quichotte",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),

            ),
            const Text(
              "Nicholas Sparks",
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => const Icon(Icons.star, color: Colors.amber, size: 25),
              )..add(const Text("  4.3", style: TextStyle(fontSize: 14))),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 6),
                Text("Like",style: TextStyle(fontSize: 18)),
                SizedBox(width: 16),
                Icon(
                  Icons.share,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 6),
                Text("Share",style: TextStyle(fontSize: 18)),

              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        ],
              ),
        const SizedBox(height: 24),
        // About Section
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Author details',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
        const SizedBox(height: 8),
    const Text(
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    const SizedBox(height: 24),
// Recommended Section
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
        "Recommended",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "See all",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ],
    ),
    const SizedBox(height: 8),
    SizedBox(
    height: 120,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: 3,
    separatorBuilder: (context, index) => const SizedBox(width: 14),
    itemBuilder: (context, index) {
    return Container(
    width: 100,
    decoration: BoxDecoration(
    color: Colors.purple.shade100,
    borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(
    child: Icon(Icons.book, size: 50, color: Colors.white),
    ),
    );

    },
    ),
    ),
    const Spacer(),
    // Price and Buy Button
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Price",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      Text(
      "\$12.89",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      ]),
    ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160,
          height: 60,
          child:
          FilledButton(
            onPressed: () {},
            child:
            Text("Add to cart",),
          ),
        ),
      ),
    ]),
    ]),
    ),
    );
  }
}

