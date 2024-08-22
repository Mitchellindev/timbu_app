import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timbu_app/data/models/product_model.dart';
import 'package:timbu_app/data/repositories/product_repostory.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc(this._productRepository) : super(ProductInitialState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await _productRepository.getProducts();
        emit(ProductSuccessState(productModel: products));
      } catch (e) {
        emit(ProductErrorState(error: e.toString()));
      }
    });
  }
}
