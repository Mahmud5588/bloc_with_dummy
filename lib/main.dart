import 'package:bloc_with_dummy/app.dart';
import 'package:bloc_with_dummy/core/di/service_locator.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feauteres/product/presentation/bloc/all_product/all_product_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductBloc>()),
        BlocProvider(create: (context) => sl<ProductsBloc>()),
      ],
      child: MyApp(),
    ),
  );
}
