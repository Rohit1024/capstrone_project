import 'package:flutter/material.dart';

void main() {
  //* This fn is removing the hash symbol from the app url
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      //*These are the routes for our app
      routes: {
        '/': (context) => Login(),
        '/home': (context) => HomePage(),
        '/register': (context) => Register(),
        '/products': (context) => CategoryProducts(),
        '/cart': (context) => Cart(),
        '/cart/checkout': (context) => Checkout(),
        '/account': (context) => MyAccount(),
        '/orders': (context) => MyOrders(),
      },
    );
    return materialApp;
  }
}
