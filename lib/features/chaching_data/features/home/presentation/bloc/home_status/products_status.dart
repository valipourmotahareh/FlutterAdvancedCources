import 'package:advanced_flutter/features/chaching_data/features/home/data/model/products_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeProductsStatus {}

class HomeProductsStatusInit extends HomeProductsStatus {}

class HomeProductsStatusLoading extends HomeProductsStatus {}

class HomeProductsStatusError extends HomeProductsStatus {
  final String errorMsg;
  HomeProductsStatusError(this.errorMsg);
}

class HomeProductsStatusCompleted extends HomeProductsStatus {
  final ProductsModel products;
  HomeProductsStatusCompleted(this.products);
}