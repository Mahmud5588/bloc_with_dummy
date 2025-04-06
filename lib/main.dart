import 'package:bloc_with_dummy/app.dart';
import 'package:bloc_with_dummy/core/di/service_locator.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<ProductBloc>())],
      child: MyApp(),
    ),
  );
}
