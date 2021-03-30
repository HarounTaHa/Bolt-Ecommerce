class Product {
  String imageUrl;
  String name;
  String price;
  String description;
  int id;

  Product(this.id, this.imageUrl, this.name, this.price, this.description);
}

List productFeatured = [
  Product(1, 'assets/woman_1.png', 'Woman T-Shirt', '55.00',
      'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.'),
  Product(2, 'assets/man_1.png', 'Man T-Shirt', '34.00',
      'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.'),
  Product(3, 'assets/woman_2.png', 'Woman T-Shirt', '34.00',
      'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.'),
  Product(4, 'assets/woman_4.png', 'Blezer', '34.00',
      'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.'),
  Product(5, 'assets/man_3.png', 'Shirt', '34.00',
      'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.'),
  Product(6, 'assets/woman_5.png', 'T-Shirt', '34.00',
      'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.'),
];
List productBestSell = [
  Product(7, 'assets/woman_3.png', 'Woman T-Shirt', '24.00',
      'A wonderful serenity has taken possession of my entire soul.'),
  Product(8, 'assets/man_2.png', 'Man T-Shirt', '44.00',
      'A wonderful serenity has taken possession of my entire soul.'),
  Product(9, 'assets/woman_2.png', 'Woman T-Shirt', '34.00',
      'A wonderful serenity has taken possession of my entire soul.'),
];
List cartProduct = [
  Product(3, 'assets/woman_2.png', 'Woman T-Shirt', '34.00',
      'A wonderful serenity has taken possession of my entire soul.')
];
