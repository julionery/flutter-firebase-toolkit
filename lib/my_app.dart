
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:toolkit_app/pages/home_page.dart';

import 'models/cart_model.dart';
import 'models/user_model.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return ScopedModel<CartModel>(
              model: CartModel(model),
              child: MaterialApp(
                  title: 'ToolKit',
                  theme: ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.blue,
                  ),
                  debugShowCheckedModeBanner: false,
                  home: HomePage()
              ),
            );
          }
      )
    );
  }
}
