import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductPage extends StatelessWidget {
  final int id;
  const ProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProduct(id: id));
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        shadowColor: Colors.yellow,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, event) {
          if (event is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (event is ProductLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(event.product.title),
                Text(event.product.description),
                Text(event.product.price.toString()),
                Image.network(event.product.thumbnail),
              ],
            );
          }
          return const Center(child: Text("Error"));
        },
      ),
    );
  }
}
