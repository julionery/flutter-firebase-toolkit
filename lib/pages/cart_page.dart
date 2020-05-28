import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:toolkit_app/models/cart_model.dart';
import 'package:toolkit_app/models/user_model.dart';
import 'package:toolkit_app/pages/login_page.dart';
import 'package:toolkit_app/pages/order_page.dart';
import 'package:toolkit_app/tiles/cart_tile.dart';
import 'package:toolkit_app/widgets/cart_price.dart';
import 'package:toolkit_app/widgets/discount_card.dart';
import 'package:toolkit_app/widgets/ship_card.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Carrinho"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model){
                int p = model.products.length;
                return Text(
                  "${p ?? 0} ${p == 1 ? "ITEM" : "ITENS"}",
                  style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model){
          if(model.isLoading && UserModel.of(context).isLoggedIn()){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(!UserModel.of(context).isLoggedIn()){
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.remove_shopping_cart,
                    size: 80.0, color: Theme.of(context).primaryColor,),
                  SizedBox(height: 16.0,),
                  Text("Faça o login para adicionar produtos!",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0,),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text("Entrar", style: TextStyle(fontSize: 18.0),),
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>LoginPage()),
                      );
                    },
                  )
                ],
              ),
            );
          } else if ( model.products == null || model.products.length == 0){
            return Center(
              child: Text("Nenhum produto no carrinho!",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView(
              children: <Widget>[
                Column(
                  children: model.products.map(
                    (product){
                      return CartTile(product);
                    }
                  ).toList(),
                ),
                DiscountCard(),
                ShipCard(),
                CartPrice(() async {
                  String orderId = await model.finishOrder();
                  if(orderId != null)
                    {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>OrderPage(orderId))
                      );
                    }
                }),
              ],
            );
          }
        }
      ),
    );
  }
}
