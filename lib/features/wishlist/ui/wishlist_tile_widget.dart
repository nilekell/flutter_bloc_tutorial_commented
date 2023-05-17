import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_project/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  const WishlistTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

  // member of class that represents a specific product item to build the wishlist tile off of
  final ProductDataModel productDataModel;
  // member of class to receive events from the ui (stateless widget)
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(productDataModel.name),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    return null;
                  },
                  icon: const Icon(Icons.favorite)),
                IconButton(
                  onPressed: () {
                    // adding an event to the BLoC, the BloC then handles the event and updates the wishlist
                    // the WishlistRemoveFromWishlistEvent requires the product to be removed, as a parameter,
                    // so the class can be instantiated
                    wishlistBloc.add(WishlistRemoveFromWishlistEvent(productDataModel: productDataModel));
                  }, icon: const Icon(Icons.shopping_bag))
            ],
          )
        ],
      ),
    );
  }
}
