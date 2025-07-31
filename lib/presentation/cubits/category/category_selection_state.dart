part of 'category_selection_cubit.dart';

abstract class CategorySelectionState extends Equatable {
  const CategorySelectionState();

  @override
  List<Object> get props => [];
}

class NoGameSelected extends CategorySelectionState {}

class GameSelected extends CategorySelectionState {
  final Category category;

  const GameSelected({required this.category});

  @override
  List<Object> get props => [category];
}
