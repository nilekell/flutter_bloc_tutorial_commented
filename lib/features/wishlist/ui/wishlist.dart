import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/data/wishlist_items.dart';
import 'package:flutter_bloc_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_project/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // instantiating the WishlistBloc so it can be used to manage the wishlist feature
  final wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // adding a specific event to the BLoC, the BloC then handles the specific event and updates the wishlist
    // the WishlistInitialEvent represents the event to initialise the wishlist
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
      ),
      // wrapping the ui body in a bloc consumer which listens to Wishlist State
      body: BlocConsumer<WishlistBloc, WishlistState>(
        // this bloc consumer listens to the wishlist Bloc
        bloc: wishlistBloc,
        // determines whether previous state differs from current state
        // this returns true or false, determining whether to call the listener or not 
        listenWhen: (previous, current) => current is WishlistActionState,
        // do stuff here based on WishlistBloc's state
        listener: (context, state) {},
        // ui will only build the current state is different from the previous state
        buildWhen: (previous, current) => current is !WishlistActionState,
        // return widget here based on WIshlistBloc's state
        builder: (context, state) {
          // checking if the type of state is WishlistSuccessState, WishlistActionState or WishlistInitialState
          switch (state.runtimeType) {
            case WishlistSuccessState:
              // assigning state as successState to build ui with current state
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                  // By passing the productDataModel and wishlistBloc to the WishlistTileWidget
                  // constructor, it can render the item's details and handle actions associated
                  // with the wishlist 
                  return WishlistTileWidget(
                    productDataModel: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc);
                });
            default:
              return Text('nothing');
          }
        },
    ));
  }
}