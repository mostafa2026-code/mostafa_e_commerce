class Product {
  final String name;
  final int price;
  final List<String>? contents;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    this.contents,
    required this.imageUrl,
  });
}




List<Product> products = [
  Product(
    name: "Quinoa Fruit Salad",
    price: 2000,
    contents: [
      "Red Quinoa",
      "Lime",
      "Honey",
      "Blueberries",
      "Strawberries",
      "Mango",
      "Fresh Mint"
    ],
    imageUrl: "assets/images/breakfast-quinoa-and-red-fruit-salad.png", 
  ),
  Product(
    name: "Honey Lime Combo",
    price: 2000,
    contents: ["Unknown contents"],
    imageUrl: "assets/images/Honey-Lime-Peach-Fruit-Salad.png",
  ),
  Product(
    name: "Berry Mango Combo",
    price: 8000,
    contents: ["Unknown contents"],
    imageUrl: "assets/images/Glowing-Berry-Fruit-Salad.png",
  ),
  Product(
    name: "Tropical Fruit Salad",
    price: 20000,
    
    imageUrl: "assets/images/Best-Ever-Tropical-Fruit-Salad.png",
  ),
  Product(
    name: "Melfon Fruit Salad",
    price: 20000,
    
    imageUrl: "assets/images/Best-Ever-Tropical-Fruit-Salad.png",
  ),
];