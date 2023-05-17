import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/cart.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

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
                    cartBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel));
                  }, icon: const Icon(Icons.shopping_bag))
            ],
          )
        ],
      ),
    );
  }
}
