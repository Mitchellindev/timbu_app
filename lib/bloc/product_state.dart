part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitialState extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  final ProductModel productModel;

  const ProductSuccessState({required this.productModel});
}

final class ProductErrorState extends ProductState {
  final String error;

  const ProductErrorState({required this.error});
}
