part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props => [];
}
///  for Loading Products
class HomeCallProductsEvent extends HomeEvent{
  const HomeCallProductsEvent();
  @override
  List<Object> get props => [];

}