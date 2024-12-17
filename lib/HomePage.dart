import 'package:bookie_v2/BookDescription.dart';
import 'package:bookie_v2/Notification.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  final List<Map<String, dynamic>> books = [
    {
      "image": "assets/EOE.jpg",
      "name": "Echoes of Eternity",
      "price": "\$10.99",
      "isFavorite": false,
    },
    {
      "image": "assets/WITM.jpg",
      "name": "Whispers in the Mist",
      "price": "\$15.99",
      "isFavorite": false,
    },
    {
      "image": "assets/TOD.jpg",
      "name": "Threads of Destiny",
      "price": "\$17.99",
      "isFavorite": false,
    },
    {
      "image": "assets/TSC.jpg",
      "name": "The Silent Compass",
      "price": "\$28.99",
      "isFavorite": false,
    },
    {
      "image": "assets/TLS.jpg",
      "name": "The Lost Story",
      "price": "\$18.99",
      "isFavorite": false,
    },
    {
      "image": "assets/BASS.jpg",
      "name": "Beneath A Starlit Sky",
      "price": "\$21.99",
      "isFavorite": false,
    },
    {
      "image": "assets/TTOM.jpg",
      "name": "Tides of Memory",
      "price": "\$13.99",
      "isFavorite": false,
    },
    {
      "image": "assets/FOL.jpg",
      "name": "Fragments of Life",
      "price": "\$15.99",
      "isFavorite": false,
    },
  ];
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> get favoriteBooks =>
      widget.books.where((book) => book["isFavorite"]).toList();

  void ListInteraction (){

    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookdescription()));
  }

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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.purple,
              size: 30,
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
            Padding(
              padding: const EdgeInsets.all(15),
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
            SizedBox(height: 20),
            Expanded(
              child: _selectedIndex == 2
                  ? ListView.builder(
                itemCount: favoriteBooks.length,
                itemBuilder: (context, index) {
                  final book = favoriteBooks[index];
                  return _buildBookTile(book);
                },
              )
                  : ListView.builder(
                itemCount: widget.books.length,
                itemBuilder: (context, index) {
                  final book = widget.books[index];
                  return _buildBookTile(book);
                },
              ),
            ),
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
      title: Text(
        book["name"],
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        book["price"],
        style: TextStyle(color: Colors.purple),
      ),
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
      onTap: ListInteraction,
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
