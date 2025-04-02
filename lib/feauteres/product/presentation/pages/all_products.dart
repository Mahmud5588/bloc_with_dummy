import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/all_product/all_product_bloc.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/all_product/all_product_state.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_event.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: BlocBuilder<ProductsBloc, AllProductState>(
        builder: (context, event) {
          if (event is AllProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (event is AllProductLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final product = event.products.products[index];
                return ListTile(
                  title: Text(event.products.products[index].title),
                  subtitle: Text(event.products.products[index].description),
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
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
