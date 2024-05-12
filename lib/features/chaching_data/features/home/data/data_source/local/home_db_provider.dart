import 'package:advanced_flutter/features/chaching_data/core/helper/log_helper.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/data/data_source/local/home_db_service.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/data/model/products_model.dart';

class HomeDataBaseProvider{
  final HomeDataBaseService _homeDataBaseService;

  HomeDataBaseProvider({required HomeDataBaseService homeDataBaseService,})
  :_homeDataBaseService=homeDataBaseService;

  /// Read From DB
   Future<ProductsModel?> getProducts() async{
     try {
       return await _homeDataBaseService.getAll();
     } catch (e) {
       // Log or handle the error appropriately
       logger.e('Error retrieving categories: $e');
       return null;
     }
   }

  /// Insert To DB
  Future<void> insertProducts({required ProductsModel post}) async {
    try {
      await _homeDataBaseService.insertItem(object: post);
    } catch (e) {
      // Handle insertion errors
      logger.e('Error inserting Products: $e');
    }
  }

  /// Is Data Available
  Future<bool> isPostDataAvailable() async {
    return await _homeDataBaseService.isDataAvailable();
  }
}