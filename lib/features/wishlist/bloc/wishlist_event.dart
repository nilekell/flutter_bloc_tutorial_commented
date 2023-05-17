part of 'wishlist_bloc.dart';

// this class is the base class for all events that are related to the wishlist feature
@immutable
abstract class WishlistEvent {}

// this class represents the event to initialise the wishlist
class WishlistInitialEvent extends WishlistEvent{}

// this class represents the event to remove an item from the wishlist
// takes productDataModel as a parameter which is the product to be removed
class WishlistRemoveFromWishlistEvent extends WishlistEvent{
  WishlistRemoveFromWishlistEvent({required this.productDataModel});

  final ProductDataModel productDataModel;

}
