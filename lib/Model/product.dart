class Product {
  String imageUrl;
  String name;
  String price;
  String description;

  Product(this.imageUrl, this.name, this.price, this.description);
}

List productFeatured = [
  Product('assets/woman_1.png', 'Woman T-Shirt', '\$55.00',
      'A wonderful serenity has taken possession of my entire soul.'),
  Product('assets/man_1.png', 'Man T-Shirt', '\$34.00',
      'A wonderful serenity has taken possession of my entire soul.'),
  Product('assets/woman_2.png', 'Woman T-Shirt', '\$34.00',
      'A wonderful serenity has taken possession of my entire soul.'),
];
List productBestSell = [
  Product('assets/woman_3.png', 'Woman T-Shirt', '\$24.00',
      'A wonderful serenity has taken possession of my entire soul.'),
  Product('assets/man_2.png', 'Man T-Shirt', '\$44.00',
      'A wonderful serenity has taken possession of my entire soul.'),
  Product('assets/woman_2.png', 'Woman T-Shirt', '\$34.00',
      'A wonderful serenity has taken possession of my entire soul.'),
];
