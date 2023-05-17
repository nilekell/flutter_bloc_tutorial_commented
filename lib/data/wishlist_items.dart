import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

// wishlistItems represents items in the wishlist

// wishlistItems is referenced in WishlistBloC class, 
// in the wishlistInitialEvent method to pass the list of wishlist items when emitting
// a WishlistSuccessState,
// and also in the wishlistRemoveFromWishlistEvent class, to remove items from the list 

List<ProductDataModel> wishlistItems = [];
// wishlistItems property is included as a named parameter
// in the constructor of WishlistSuccessState to store the list of wishlist items.

// wishlistItems is referenced in the Wishlist class (page stateful widget) and used in
// the ListView.builder to create multiple WishlistTileWidget instances

// wishlistItems list serves as a shared storage for the items in the wishlist. It is 
//referenced and modified in different parts of the code to manage the wishlist state,
// display wishlist items, and update the UI accordingly.