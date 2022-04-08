class Product {
  final String name;
  final double price;
  final String imageUrl;

  const Product(
      {required this.name, required this.price, required this.imageUrl});

  static const List<Product> products = [
    Product(
        name: 'Apple',
        price: 3.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/03/27/18/54/food-1283621_960_720.jpg'),
    Product(
        name: 'Orange',
        price: 4.99,
        imageUrl:
            'https://i.pinimg.com/originals/05/79/5a/05795a16b647118ffb6629390e995adb.jpg'),
    Product(
        name: 'Grapes',
        price: 6.79,
        imageUrl:
            'https://tiimg.tistatic.com/fp/1/005/366/fresh-common-black-graps-108-w300.jpg')
  ];
}
