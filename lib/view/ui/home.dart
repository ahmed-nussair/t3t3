import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t3t3/view/bloc/home_page/bloc.dart';
import 'package:t3t3/view/ui/home_pages/feedback_page.dart';
import 'file:///D:/projects/flutter/t3t3/lib/view/ui/merchant_page.dart';
import 'package:t3t3/view/ui/home_pages/register_as_a_merchant_page.dart';
import 'package:t3t3/view/ui/screen_util.dart';

import 'home_pages/cart_page.dart';
import 'home_pages/home_page.dart';
import 'home_pages/login_as_a_merchant_page.dart';
import 'home_pages/products_page.dart';
import 'home_pages/profile_page.dart';
import 'home_pages/store_page.dart';
import 'home_pages/wishlist_page.dart';

class Home extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return BlocProvider(
      create: (_) => HomePageBloc(),
      child: SafeArea(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            return Scaffold(
              key: _key,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(_screenUtil.setHeight(150)),
                child: AppBar(
                  backgroundColor: Color(0xff9b7448),
                  centerTitle: true,
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Text(
                                'Search For a Product',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff6a6a6a),
                                ),
                              ),
                              Positioned(
                                right: 0.0,
                                bottom: 0.0,
                                top: 0.0,
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xff6a6a6a),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_screenUtil.setWidth(20)),
                        child: Icon(
                          Icons.camera_alt,
                          size: _screenUtil.setSp(70),
                        ),
                      ),
                    ],
                  ),
                  leading: GestureDetector(
                      onTap: () {
                        _key.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.dehaze,
                        size: _screenUtil.setSp(70),
                      )),
                ),
              ),
              drawer: Container(
                width: _screenUtil.setWidth(700),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/logo.png',
                        height: MediaQuery.of(context).size.width / 3,
                      ),
                    ),
                    Flexible(
                      child: Divider(
                        color: Color(0xff9b7448),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToMainPage());
                              Navigator.of(context).pop();
                            },
                            title:
                                _drawerItem(context, Icons.home, 'Main Page'),
                          ),
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToProfilePage());
                              Navigator.of(context).pop();
                            },
                            title: _drawerItem(
                                context, Icons.person_outline, 'Profile'),
                          ),
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToLoginAsAMerchantPage());
                              Navigator.of(context).pop();
                            },
                            title: _drawerItem(context, Icons.business_center,
                                'Login As a Merchant'),
                          ),
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToStorePage());
                              Navigator.of(context).pop();
                            },
                            title:
                                _drawerItem(context, Icons.store, 'Your Store'),
                          ),
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToWishListPage());
                              Navigator.of(context).pop();
                            },
                            title: _drawerItem(
                                context, Icons.favorite, 'Wishlist'),
                          ),
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToCartPage());
                              Navigator.of(context).pop();
                            },
                            title: _drawerItem(
                                context, Icons.shopping_cart, 'Your Cart'),
                          ),
                          ListTile(
                            onTap: () {
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(NavigateToFeedbackPage());
                              Navigator.of(context).pop();
                            },
                            title: _drawerItem(
                                context, Icons.feedback, 'Feedback'),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            title: _drawerItem(
                                context, Icons.exit_to_app, 'Sign Out'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: state is MainPageState
                  ? Center(child: HomePage())
                  : state is ProductsPageState
                      ? Center(
                          child: ProductsPage(),
                        )
                      : state is ServicesPageState
                          ? Center(
                              child: ProductsPage(),
                            )
                          : state is ProfilePageState
                              ? Center(
                                  child: ProfilePage(),
                                )
                              : state is StorePageState
                                  ? Center(
                                      child: StorePage(
                                        onLoggingInAsAMerchant: () {
                                          BlocProvider.of<HomePageBloc>(context)
                                              .add(
                                                  NavigateToLoginAsAMerchantPage());
                                        },
                                      ),
                                    )
                                  : state is WishListState
                                      ? Center(
                                          child: WishListPage(),
                                        )
                                      : state is FeedbackPageState
                                          ? Center(
                                              child: FeedbackPage(),
                                            )
                                          : state is CartPageState
                                              ? Center(
                                                  child: CartPage(),
                                                )
                                              : state is RegisterAsAMerchantPageState
                                                  ? Center(
                                                      child:
                                                          RegisterAsAMerchantPage(),
                                                    )
                                                  : state is LoginAsAMerchantPageState
                                                      ? Center(
                                                          child:
                                                              LoginAsAMerchantPage(
                                                            onRegisteringAsAMerchant:
                                                                () {
                                                              BlocProvider.of<
                                                                          HomePageBloc>(
                                                                      context)
                                                                  .add(
                                                                      NavigateToRegistrationAsAMerchantPage());
                                                            },
                                                          ),
                                                        )
                                                      : state is MerchantPageState
                                                          ? Center(
                                                              child:
                                                                  MerchantPage(),
                                                            )
                                                          : HomePage(),
            );
          },
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String title) {
    _screenUtil.init(context);
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Icon(
            icon,
            color: Color(0xff9b7448),
            size: _screenUtil.setSp(50),
          ),
        ),
        SizedBox(
          width: _screenUtil.setWidth(30),
        ),
        Flexible(
          flex: 5,
          child: Text(
            title,
            style: TextStyle(
              fontSize: _screenUtil.setSp(40),
            ),
          ),
        ),
      ],
    );
  }
}
