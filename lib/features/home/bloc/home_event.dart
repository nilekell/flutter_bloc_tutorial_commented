part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
  
  final ProductDataModel clickedProduct;

  

}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  HomeProductCartButtonClickedEvent({required this.clickedProduct});

  final ProductDataModel clickedProduct;

  
  
}

class HomeWishlistButtonNavigateEvent extends HomeEvent{
  
}

class HomeCartButtonNavigateEvent extends HomeEvent{
  
}