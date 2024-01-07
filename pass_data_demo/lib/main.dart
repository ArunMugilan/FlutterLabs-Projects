import 'product.dart';
import 'prod_detail_screen.dart';
import 'package:flutter/material.dart';

List<Product> productList = [
  Product("A1001", "Panasonic Aircond HP 1.5"),
  Product("A2023", "Daikin Aircond HP 1.5"),
  Product("A1058", "Panasonic Vacuum Cleaner"),
];

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inventory App",
      home: ProductScreen(products: productList),
  ));
}

class ProductScreen extends StatelessWidget {
  final List<Product> products;

  const ProductScreen({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Products"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].code),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              =>
                  ProductDetailScreen(products: products[index])
              ));
            },
          );
        },
      ),
    );
  }
}