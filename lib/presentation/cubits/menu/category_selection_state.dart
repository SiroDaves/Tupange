part of 'category_selection_cubit.dart';

class CategorySelectionState extends Equatable {
  final PuzzleCategory category;

  const CategorySelectionState(this.category);

  @override
  List<Object> get props => [category];
}
