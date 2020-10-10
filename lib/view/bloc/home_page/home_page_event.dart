import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent {}

class NavigateToMainPage extends HomePageEvent {}

class NavigateToProductsPage extends HomePageEvent {}

class NavigateToServicesPage extends HomePageEvent {}

class NavigateToProfilePage extends HomePageEvent {}

class NavigateToStorePage extends HomePageEvent {}

class NavigateToWishListPage extends HomePageEvent {}

class NavigateToCartPage extends HomePageEvent {}

class NavigateToRegistrationAsAMerchantPage extends HomePageEvent {}
