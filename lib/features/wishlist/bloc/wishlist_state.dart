part of 'wishlist_bloc.dart';

// this class represents the base state of the wishlist features
@immutable
abstract class WishlistState {}

// this class represents the initial state of the wishlist 
class WishlistInitial extends WishlistState {}

// this class represents the state of the wishlist when an action occurs on the wishlist
abstract class WishlistActionState extends WishlistState {}

// this class represents the state of the wishlist afer an action
class WishlistSuccessState extends WishlistState {
  WishlistSuccessState({ required this.wishlistItems});

  final List<ProductDataModel> wishlistItems;
  
}