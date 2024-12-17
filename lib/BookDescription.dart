import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/Notification.dart';
import 'package:bookie_v2/models/Users_Books_model.dart';
import 'package:bookie_v2/services/cloud_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookie_v2/models/cart_model.dart';
import 'package:bookie_v2/cart_provider.dart';
import 'package:bookie_v2/cart_screen.dart';
import 'package:bookie_v2/services/db_helper.dart';
import 'package:provider/provider.dart';


class Bookdescription extends StatefulWidget {
   String bookId;
   Bookdescription ({Key? key, required this.bookId}): super(key: key);
   @override
   State<Bookdescription> createState() => _State();
}
class _State extends State<Bookdescription> {
  Future<Map<String, dynamic>> fetchBookDetails() async {
    // Query Firestore to find the book with the matching bookId field
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Books')
        .where('bookId', isEqualTo: widget.bookId)
        .limit(1) // Limit to 1 document for efficiency
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data();
    } else {
      throw Exception('Book not found');
    }
  }

  CollectionReference _getBooksCollection() {
    return FirebaseFirestore.instance.collection('Books');
  }

  DBHelper? dbHelper = DBHelper();

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => CartScreen()));
            },
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
      body: FutureBuilder(
        future: fetchBookDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found.'));
          }
          final book = snapshot.data!;


           return Padding(
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
                          child: Image.asset(book['imagePath'], height: 180,)
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                           Text( book['Book Name'],
                            style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,),

                          ),
                          Text(
                            book['Author Name'],
                            style: TextStyle(fontSize: 18, color: Colors
                                .deepPurple),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                                  (index) =>
                              const Icon(
                                  Icons.star, color: Colors.amber, size: 25),
                            )
                              ..add(const Text(
                                  "  4.3", style: TextStyle(fontSize: 14))),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.deepPurple,
                              ),
                              SizedBox(width: 6),
                              Text("Like", style: TextStyle(fontSize: 18)),
                              SizedBox(width: 16),
                              Icon(
                                Icons.share,
                                color: Colors.deepPurple,
                              ),
                              SizedBox(width: 6),
                              Text("Share", style: TextStyle(fontSize: 18)),

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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                          height: 200,
                          child: Text(
                              book["Book Description"]))),
                  const SizedBox(height: 24),
                  // Recommended Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _getBooksCollection()
                      .where(FieldPath.documentId, isNotEqualTo: widget.bookId)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No books found.'));
                        }

                        final books = snapshot.data!.docs;

                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: books.length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 14),
                          itemBuilder: (context, index) {
                            final book = books[index];
                            final title = book['Book Name'] ?? 'No Title';
                            final price = book['Book Price'] ?? '0';

                            return Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.book, size: 50,
                                        color: Colors.white),
                                    SizedBox(height: 8),
                                    Text(
                                      title,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "\$${price.toString()}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                                Text("Price", style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold),),
                                Text(
                                  "\$13.99",
                                  style: TextStyle(fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
          );
        }),
    );
  }
}


