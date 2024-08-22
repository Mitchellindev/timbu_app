import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timbu_app/bloc/product_bloc.dart';
import 'package:timbu_app/data/models/product_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(LoadProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timbu Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ProductBloc>().add(LoadProductEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is ProductErrorState) {
            return Text(state.error);
          }
          if (state is ProductSuccessState) {
            List<Item> productList = state.productModel.items;
            return productList.isNotEmpty
                ? ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: product.isAvailable == true
                            ? const Text(
                                'Available',
                                style: TextStyle(color: Colors.green),
                              )
                            : const Text(
                                'Not available',
                                style: TextStyle(color: Colors.red),
                              ),
                        trailing: Text(
                          '₦${product.currentPrice[index].ngn[0].toString()}',
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('No data found'),
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
