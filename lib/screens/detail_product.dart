import 'package:flutter/material.dart';
import 'package:supermarket_place/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product; 

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${product.fields.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 10),
            Text("Price: ${product.fields.price}"),
            const SizedBox(height: 10),
            Text("Stock: ${product.fields.stock}"),
            const SizedBox(height: 10),
            Text("Category: ${product.fields.category}"),
            const SizedBox(height: 10),
            Text("Date Added: ${product.fields.dateAdded}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('Back to Product List'),
            ),
          ],
        ),
      ),
    );
  }
}
