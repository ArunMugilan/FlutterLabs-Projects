// import 'package:flutter/foundation.dart';

// class GroceryItem {
//    GroceryItem({
//     required this.id,
//     required this.name,
//     required this.quantity,
//     required this.category,
//   });

//   final String id, name;
//   Category category;
//   final int quantity;
// }
import 'package:shopping_list/models/category.dart';

class GroceryItem {
  const GroceryItem ({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,    
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;  
}