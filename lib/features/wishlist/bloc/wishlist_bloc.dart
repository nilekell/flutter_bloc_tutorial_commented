import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/wishlist_items.dart';
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

// This class manages state and handles events related to the wishlist feature
// This class defines event handlers for WishlistInitialEvent and WishlistRemoveFromWishlistEvent
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  // this method handles the wishlistInitialEvent by emitting events to the BlocConsumer
  // which inherits from WishlistBloc and WishlistState
  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    // creating a new instance of WishlistSuccessState with the updated WishListItems
    // emit() notifies listeners that a new state is available, which can be used to update the ui
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }                         

  // this method handles the wishlistRemoveFromWishlistEvent by emitting events to the BlocConsumer
  FutureOr<void> wishlistRemoveFromWishlistEvent(WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    // removing a specific item from the list
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
