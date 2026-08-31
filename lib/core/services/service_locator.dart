import 'package:dawak/core/di/auth_dependencies.dart';
import 'package:dawak/core/di/cart_dependencies.dart';
import 'package:dawak/core/di/categories_dependencies.dart';
import 'package:dawak/core/di/core_dependencies.dart';
import 'package:dawak/core/di/home_dependencies.dart';
import 'package:dawak/core/di/orders_dependencies.dart';
import 'package:dawak/core/di/products_dependencies.dart';
import 'package:dawak/core/di/profile_dependencies.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  registerCoreDependencies();
  registerAuthDependencies();
  registerProfileDependencies();
  registerCategoriesDependencies();
  registerHomeDependencies();
  registerProductsDependencies();
  registerOrdersDependencies();
  registerCartDependencies();
}
