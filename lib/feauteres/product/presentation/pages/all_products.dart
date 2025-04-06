import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_event.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProducts());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("All Products"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, event) {
          if (event is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (event is ProductsLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  onSubmitted: (value) {
                    if (value.isEmpty) {
                      context.read<ProductBloc>().add(FetchProducts());
                    } else {
                      context.read<ProductBloc>().add(
                        SearchProduct(word: value),
                      );
                    }
                    searchController.clear();
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final product = event.products.products[index];
                      return ListTile(
                        title: Text(event.products.products[index].title),
                        subtitle: Text(
                          event.products.products[index].description,
                        ),
                        trailing: Text(
                          event.products.products[index].price.toString(),
                        ),
                        leading: Image.network(
                          event.products.products[index].thumbnail,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(id: product.id),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: event.products.limit,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
