import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:toolkit_app/configs/strings_value.dart';
import 'package:toolkit_app/models/user_model.dart';
import 'package:toolkit_app/pages/login_page.dart';
import 'package:toolkit_app/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(32.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        StringValues.drawerAppName,
                        style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  StringValues.drawerHello +
                                      (!model.isLoggedIn()
                                          ? ""
                                          : model.userData["name"]),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn()
                                        ? StringValues.drawerLoginOrRegister
                                        : StringValues.drawerLogout,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    if (!model.isLoggedIn()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    } else {
                                      model.signOut();
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        ))
                  ],
                ),
              ),
              Divider(),
              DrawerTile(
                  Icons.home, StringValues.drawerNews, pageController, 0),
              DrawerTile(
                  Icons.list, StringValues.drawerProducts, pageController, 1),
              DrawerTile(Icons.location_on, StringValues.drawerStores,
                  pageController, 2),
              DrawerTile(Icons.playlist_add_check,
                  StringValues.drawerMyRequests, pageController, 3),
              DrawerTile(Icons.directions_car, StringValues.drawerListVehicles,
                  pageController, 4),
              DrawerTile(Icons.public, StringValues.drawerPlanetary,
                  pageController, 5),
              DrawerTile(Icons.settings, StringValues.drawerSettings,
                  pageController, 6),
              DrawerTile(Icons.poll, StringValues.drawerIMC, pageController, 7),
              DrawerTile(Icons.monetization_on,
                  StringValues.drawerCurrencyConverter, pageController, 8),
              DrawerTile(
                  Icons.image, StringValues.drawerGifs, pageController, 9),
              DrawerTile(Icons.people, StringValues.drawerContacts,
                  pageController, 10),
              DrawerTile(
                  Icons.list, StringValues.drawerToDoList, pageController, 11),
              DrawerTile(
                  Icons.chat, StringValues.drawerChat, pageController, 12),
            ],
          )
        ],
      ),
    );
  }
}
