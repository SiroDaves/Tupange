import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/puzzle.dart';
import '../../../core/utils/constants/app_constants.dart';

part 'category_selection_state.dart';

class CategorySelectionCubit extends Cubit<CategorySelectionState> {
  CategorySelectionCubit() : super(const CategorySelectionState(PuzzleCategory.planets));

  PuzzleCategory _category = PuzzleCategory.planets;
  final _puzzleCategorys = PuzzleCategory.values;

  void onNewCategorySelected(PuzzleCategory newCategory) {
    _category = newCategory;
    emit(CategorySelectionState(newCategory));
  }

  void onCategoryIncrease() {
    int currentCategory = _puzzleCategorys.indexOf(state.category);
    currentCategory = (currentCategory + 1) % _puzzleCategorys.length;
    onNewCategorySelected(_puzzleCategorys[currentCategory]);
  }

  void onCategoryDecrease() {
    int currentCategory = _puzzleCategorys.indexOf(state.category);
    currentCategory = (currentCategory - 1) % _puzzleCategorys.length;
    onNewCategorySelected(_puzzleCategorys[currentCategory]);
  }

  int get puzzleSize => AppConstants.kPuzzleCategory[_category]!;
  PuzzleCategory get puzzleCategory => _category;
}
