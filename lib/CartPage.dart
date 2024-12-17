import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem('Five Feet Apart', 'John Cena', 20.0, 'assets/book1.png'),
    CartItem('Harry Potter', 'J.K. Rowling', 15.0, 'assets/book2.png'),
    CartItem('The Jungle Book', 'Rudyard Kipling', 18.0, 'assets/book3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(cartItems[index].imagePath,
                      width: 50, height: 50),
                  title: Text(cartItems[index].name),
                  subtitle: Text(cartItems[index].author),
                  trailing: Text("\$${cartItems[index].price.toStringAsFixed(2)}"),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: TextStyle(fontSize: 20)),
                    Text("\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text("Check Out"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final String author;
  final double price;
  final String imagePath;

  CartItem(this.name, this.author, this.price, this.imagePath);
}