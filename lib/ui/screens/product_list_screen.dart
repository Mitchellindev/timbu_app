import 'package:flutter/material.dart';
import 'package:timbu_app/api/timbu_api_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timbu Products'),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            final data = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final product = data['items'][index];
                        return ListTile(
                          title: Text(product['name']),
                          subtitle: product['is_available'] == true
                              ? const Text(
                                  'Available',
                                  style: TextStyle(color: Colors.green),
                                )
                              : const Text(
                                  'Not available',
                                  style: TextStyle(color: Colors.red),
                                ),
                          trailing: Text(
                              '₦${product['current_price'][0]['NGN'][0].toStringAsFixed(2)}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
        // viewModel.isLoading
        //     ? const Center(child: CircularProgressIndicator())
        //     : viewModel.errorMessage.isNotEmpty
        //         ? Center(child: Text(viewModel.errorMessage))
        //         : ListView.builder(
        //             itemCount: viewModel.products.length,
        //             itemBuilder: (context, index) {
        //               final product = viewModel.products[index];
        //               return ProductListItem(product: product);
        //             },
        //           ),
        );
  }
}
