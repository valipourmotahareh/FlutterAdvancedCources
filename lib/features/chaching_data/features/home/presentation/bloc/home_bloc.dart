import 'package:advanced_flutter/features/chaching_data/core/resources/data_state.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/data/model/products_model.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/presentation/bloc/home_status/products_status.dart';
import 'package:advanced_flutter/features/chaching_data/features/home/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part  'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  late final String privacyPolicy;
  late final String aboutUs;
  late final String termsCondition;
  late final String helpSupport;

  HomeBloc(this._homeRepository)
      : super(HomeState(
    homeProductsStatus: HomeProductsStatusInit(),
  )) {
    on<HomeCallProductsEvent>(_onHomeCallAppSettingsDataEvent);
  }

  /// on call Call Featured Product Data Event
  Future<void> _onHomeCallAppSettingsDataEvent(
      HomeCallProductsEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(
      state.copyWith(
        newHomeProductsStatus: HomeProductsStatusLoading(),
      ),
    );

    final DataState dataState = await _homeRepository.fetchProducts();

    /// Success
    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          newHomeProductsStatus:
          HomeProductsStatusCompleted(dataState.data as ProductsModel),
        ),
      );
    }

    /// Failed
    if (dataState is DataFailed) {
      emit(state.copyWith(
        newHomeProductsStatus:
        HomeProductsStatusError(dataState.error as String),
      ));
    }
  }
}


