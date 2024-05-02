import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/repos/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepo _productsRepo;
  ProductsBloc({required ProductsRepo productsRepo})
      : _productsRepo = productsRepo,
        super(ProductsLoading()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(ProductsLoading());

      final result = await _productsRepo.getAll();

      final resultingState = result.fold(
        (failure) => ProductsFailure(msg: failure.msg),
        (products) => ProductsSuccess(products: products),
      );

      emit(resultingState);
    });
  }
}
