part of 'category_selection_cubit.dart';

abstract class CategorySelectionState extends Equatable {
  const CategorySelectionState();

  @override
  List<Object> get props => [];
}

class NoCategorySelected extends CategorySelectionState {}

class CategorySelected extends CategorySelectionState {
  final Category category;

  const CategorySelected({required this.category});

  @override
  List<Object> get props => [category];
}
