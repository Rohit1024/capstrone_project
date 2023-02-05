import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/services/shared_preferences_service.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final displayActionBar;

  MyAppBar({this.displayActionBar = true});
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}

class _MyAppBarState extends State<MyAppBar> {
  PrefService prefService = PrefService();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return AppBar(
      elevation: 0.5,
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Text(
          'Easy-Shopping',
        ),
      ),
      actions: widget.displayActionBar == true
          ? [
              SizedBox(
                width: 20.0,
              ),
              _size.width >= 768
                  ? TextButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/orders');
                      },
                      child: MyText(
                        text: 'My Orders',
                        color: Colors.white,
                        size: 18.0,
                        weight: FontWeight.w500,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                width: 20.0,
              ),
              _size.width >= 768
                  ? TextButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/account');
                      },
                      child: MyText(
                        text: 'Account',
                        color: Colors.white,
                        size: 18.0,
                        weight: FontWeight.w500,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                width: 20.0,
              ),
              GetX<CartController>(builder: (controller) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Badge(
                    badgeColor: Colors.yellow[200]!,
                    badgeContent: MyText(
                      text: '${controller.cartItems.length}',
                    ),
                    child: Icon(Icons.shopping_cart),
                  ),
                );
              }),
              SizedBox(
                width: 20.0,
              ),
              _size.width >= 768
                  ? TextButton(
                      onPressed: () async {
                        await prefService.logout();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: MyText(
                        text: 'Logout',
                        color: Colors.white,
                        size: 18.0,
                        weight: FontWeight.w500,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                width: 20.0,
              ),
            ]
          : [],
    );
  }
}
