import 'package:flutter/material.dart';
import 'package:toolkit_app/configs/strings_value.dart';
import 'package:toolkit_app/pages/chat/chat_page.dart';
import 'package:toolkit_app/pages/features/calculate_imc_page.dart';
import 'package:toolkit_app/pages/features/currency_converter_page.dart';
import 'package:toolkit_app/pages/vehicle_page.dart';
import 'package:toolkit_app/pages/planet_home_page.dart';
import 'package:toolkit_app/pages/settings_page.dart';
import 'package:toolkit_app/tabs/categories_tab.dart';
import 'package:toolkit_app/tabs/home_tab.dart';
import 'package:toolkit_app/tabs/orders_tab.dart';
import 'package:toolkit_app/tabs/places_tab.dart';
import 'package:toolkit_app/widgets/cart_button.dart';
import 'package:toolkit_app/widgets/custom_drawer.dart';
import 'package:toolkit_app/pages/features/todo_page.dart';

import 'features/contact_home_page.dart';
import 'features/giphy_page.dart';

class HomePage extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(StringValues.homeNews),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(StringValues.homeProducts),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: CategoriesTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(StringValues.homeStores),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlacesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(StringValues.homeMyRequests),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: OrdersTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(StringValues.homeListVehicles),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: VehiclePage(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(StringValues.homePlanetary),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlanetHomePage(),
        ),
        SettingsPage(CustomDrawer(_pageController)),
        CalculateImcPage(CustomDrawer(_pageController)),
        CurrencyConverterPage(CustomDrawer(_pageController)),
        GiphyPage(CustomDrawer(_pageController)),
        ContactHomePage(CustomDrawer(_pageController)),
        TodoPage(CustomDrawer(_pageController)),
        ChatPage(CustomDrawer(_pageController)),
      ],
    );
  }
}
