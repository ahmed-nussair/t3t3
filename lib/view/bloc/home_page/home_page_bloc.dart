import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(InitialHomePageState());

  @override
  HomePageState get initialState => InitialHomePageState();

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is NavigateToProductsPage) {
      yield ProductsPageState();
    } else if (event is NavigateToServicesPage) {
      yield ServicesPageState();
    } else if (event is NavigateToProfilePage) {
      yield ProfilePageState();
    } else if (event is NavigateToStorePage) {
      yield StorePageState();
    } else if (event is NavigateToWishListPage) {
      yield WishListState();
    } else if (event is NavigateToCartPage) {
      yield CartPageState();
    } else if (event is NavigateToRegistrationAsAMerchantPage) {
      yield RegisterAsAMerchantPageState();
    } else if (event is NavigateToLoginAsAMerchantPage) {
      yield LoginAsAMerchantPageState();
    } else if (event is NavigateToMerchantPage) {
      yield MerchantPageState();
    } else if (event is NavigateToFeedbackPage) {
      yield FeedbackPageState();
    } else {
      yield MainPageState();
    }
  }
}
