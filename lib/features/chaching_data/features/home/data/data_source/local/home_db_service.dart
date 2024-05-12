import 'package:advanced_flutter/features/chaching_data/config/constants/db_keys.dart';
import 'package:advanced_flutter/features/chaching_data/core/helper/log_helper.dart';
import 'package:advanced_flutter/features/chaching_data/core/repos/interface_repos.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/data/model/products.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/data/model/products_model.dart';
import 'package:hive/hive.dart';

class HomeDataBaseService implements InterfaceRepository<ProductsModel> {
  /// Box Key
  static const String _key = DbKeys.dbProducts;

  /// Product Box
  late final Box<ProductsModel> _productBox;

  /// init DB
  Future<void> initDatabase() async {
    try {
      Hive.registerAdapter(ProductsModelAdapter());
      Hive.registerAdapter(ProductsAdapter());
      _productBox = await Hive.openBox(_key);
      logger.d('Success on initializing dataBase for *ProductsModel*');
    } catch (e) {
      logger.e('Error initializing dataBase for *ProductsModel*');
    }
  }

  @override
  Future<ProductsModel?> getAll() async {
    try {
      if (_productBox.isOpen && _productBox.isNotEmpty) {
        return _productBox.get(_key);
      } else {
        return null;
      }
    } catch (e) {
      logger.e('Error initializing dataBase: $e');
    }
    return null;
  }

  @override
  Future<void> insertItem({required ProductsModel object}) async {
    try {
      await _productBox.put(_key, object);
    } catch (e) {
      logger.e('Error inserting into dataBase: $e');
    }
  }

  @override
  Future<bool> isDataAvailable() async {
    try {
      return _productBox.isEmpty;
    } catch (e) {
      logger.e('Error checking if box is empty: $e');
      return true;
    }
  }
}
