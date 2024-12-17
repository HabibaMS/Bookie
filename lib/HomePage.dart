import 'package:bookie_v2/BookDescription.dart';
import 'package:bookie_v2/Notification.dart';
import 'package:bookie_v2/services/db_helper.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:bookie_v2/models/cart_model.dart';
import 'package:bookie_v2/cart_provider.dart';
import 'package:bookie_v2/cart_screen.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  final List<Map<String, dynamic>> books = [
    {
      "id": "1",
      "image": "assets/BASS.jpg",
      "name": "Beneath A Starlit Sky",
      "price": "\$21.99",
      "isFavorite": false,
    },
    {
      "id": "2",
      "image": "assets/EOE.jpg",
      "name": "Echoes of Eternity",
      "price": "\$10.99",
      "isFavorite": false,
    },
    {
      "id": "3",
      "image": "assets/FOL.jpg",
      "name": "Fragments of Life",
      "price": "\$15.99",
      "isFavorite": false,
    },
    {
      "id": "4",
      "image": "assets/TLS.jpg",
      "name": "The Lost Story",
      "price": "\$18.99",
      "isFavorite": false,
    },
    {
      "id": "5",
      "image": "assets/TSC.jpg",
      "name": "The Silent Compass",
      "price": "\$28.99",
      "isFavorite": false,
    },
    {
      "id": "6",
      "image": "assets/TOD.jpg",
      "name": "Threads of Destiny",
      "price": "\$17.99",
      "isFavorite": false,
    },
    {
      "id": "7",
      "image": "assets/TTOM.jpg",
      "name": "Tides of Memory",
      "price": "\$13.99",
      "isFavorite": false,
    },
    {
      "id": "8",
      "image": "assets/WITM.jpg",
      "name": "Whispers in the Mist",
      "price": "\$15.99",
      "isFavorite": false,
    },
  ];
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredBooks = [];
  Map<String, dynamic>? _selectedBook;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterBooks);
  }

  void _filterBooks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBooks = widget.books
          .where((book) => book["name"].toLowerCase().contains(query))
          .toList();
    });
  }
  List<Map<String, dynamic>> get favoriteBooks =>
      widget.books.where((book) => book["isFavorite"]).toList();

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookie',
          style: TextStyle(
            fontSize: 35,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: badges.Badge(
                showBadge: true,
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value , child){
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                  },
                ),
                badgeAnimation: badges.BadgeAnimation.fade(
                  animationDuration: Duration(milliseconds: 300)
                ),
                child: Icon(Icons.shopping_bag_outlined, color: Colors.purple,),
              ),
            ),
          ),
          IconButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => NotificationPage()));},
            icon: Icon(
              Icons.notification_add,
              color: Colors.purple,
              size: 30,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_selectedBook == null) ...[
            Text(
              'Choose your',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'best design book',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                suffixIcon: Icon(
                  Icons.filter_list,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_searchController.text.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildMenuItem("Popular", 0),
                  SizedBox(width: 25),
                  _buildMenuItem("Top Books", 1),
                  SizedBox(width: 25),
                  _buildMenuItem("Favourites", 2),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: _searchController.text.isNotEmpty
                    ? ListView.builder(
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                    final book = _filteredBooks[index];
                    return ListTile(
                    title: Text(book["name"]),
                    onTap: () {
                    setState(() {
                    _selectedBook = book;
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                     });
                  },
                );
              },
             )
                  : ListView.builder(
                itemCount: _selectedIndex == 2
                 ? favoriteBooks.length
                 : widget.books.length,
                itemBuilder: (context, index) {
                final book = _selectedIndex == 2
                 ? favoriteBooks[index]
                 : widget.books[index];
                return _buildBookTile(book);
                  },
                ),

              ),
            ] else ...[
              Padding(
               padding: const EdgeInsets.all(5),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               InkWell(
                 child: Container(
                 padding: const EdgeInsets.all(10), // Add padding inside the container for content spacing
                 decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple, // Border color
                    width: 2, // Border width (increase it for a thicker border)
                  ),
                  borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
                               ),
                               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      _selectedBook!["image"],
                      width: 230,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      _selectedBook!["name"],
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      _selectedBook!["price"],
                      style: TextStyle(color: Colors.purple, fontSize: 22),
                    ),
                    SizedBox(height: 20),
                  ],
                               ),
                             ),
               ),
            SizedBox(height: 30), // Space between the border and button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedBook = null; // Reset the selection to show the book list again
                });
              },
              child: Text(
                'Back to Book List',
                style: TextStyle(fontSize: 20, color: Colors.purple),
              ),
            ),
          ],
        ),
      )

      ],
      ],
    ),
    ),

    );
  }

  Widget _buildBookTile(Map<String, dynamic> book) {
     return ListTile(
            leading: Image.asset(
              book["image"],
              width: 100,
              height: 200,
              fit: BoxFit.cover,
            ),
            title: Text(book["name"], style: TextStyle(fontSize: 16)),
            subtitle: Text(
                book["price"], style: TextStyle(color: Colors.purple)),
            trailing: IconButton(
              icon: Icon(
                book["isFavorite"] ? Icons.favorite : Icons.favorite_border,
                color: book["isFavorite"] ? Colors.red : Colors.purple,
              ),
              onPressed: () {
                setState(() {
                  book["isFavorite"] = !book["isFavorite"];
                });
              },
            ),
            onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookdescription(bookId: book["id"]))), // Pass the book data
         );
        }



  Widget _buildMenuItem(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight:
          _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          color: _selectedIndex == index ? Colors.purple : Colors.black,
        ),
      ),
    );
  }
}
