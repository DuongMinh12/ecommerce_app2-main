part of 'wishlist_bloc.dart';

@immutable
abstract class WishListState extends Equatable{
  const WishListState();

  @override
  List<Object?> get props => [];
}

class WishListLoading extends WishListState{
  @override
  List<Object?> get props => [];
}


class WishListLoaded extends WishListState{
  final WishList wishList;
  const WishListLoaded ({this.wishList = const WishList()});

  @override
  List<Object?> get props => [wishList];
}


class WishListError extends WishListState{
  @override
  List<Object?> get props => [];
}
