class Cart {

   late final int? id;
   final String? bookId;
   final String? bookName;
   final int? initialPrice;
   final int? bookPrice;
   final int? quantity;
   final String? unitTag;
   final String? image;

   Cart({
   required this.id ,
   required this.bookId,
   required this.bookName,
   required this.initialPrice,
   required this.bookPrice,
   required this.quantity,
   required this.unitTag,
   required this.image
   });

   Cart.fromMap(Map<dynamic , dynamic> res)
   : id = res['id'],
   bookId = res["bookId"],
   bookName = res["bookName"],
   initialPrice = res["initialPrice"],
   bookPrice = res["bookPrice"],
   quantity = res["quantity"],
   unitTag = res["unitTag"],
   image = res["image"];

   Map<String, Object?> toMap(){
   return {
   'id' : id ,
   'bookId' : bookId,
   'bookName' :bookName,
   'initialPrice' : initialPrice,
   'bookPrice' : bookPrice,
  'quantity' : quantity,
   'image' : image,};
   }
}