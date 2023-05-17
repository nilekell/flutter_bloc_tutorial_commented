import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

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
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  },
                  icon: const Icon(Icons.favorite)),
                IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel
                    ));
                  }, icon: const Icon(Icons.shopping_bag))
            ],
          )
        ],
      ),
    );
  }
}
