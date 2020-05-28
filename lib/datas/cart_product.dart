import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toolkit_app/datas/product_data.dart';

class CartProduct{

  String cid;

  String category;
  String productId;

  int quantity;
  String size;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    productId = document.data["productId"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category": category,
      "productId": productId,
      "quantity": quantity,
      "size": size,
      "product": productData.toResumedMap()
    };
  }

}