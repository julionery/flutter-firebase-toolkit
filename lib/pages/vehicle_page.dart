
import 'package:flutter/material.dart';
import 'package:toolkit_app/models/product_model.dart';
import 'package:toolkit_app/mockups/product_list.dart';

class VehiclePage extends StatelessWidget {
  final String title;
  final List<ProductModel> _productsList = productList;

  VehiclePage({
    Key key, this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _productsList.map((product){
        return Card(
          child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.manufacturer),
              trailing: Text(product.formattedPrice),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(product.imageUrl),
                backgroundColor: Colors.grey,
              )
          ),
        );
      }).toList()
    );
  }
}
