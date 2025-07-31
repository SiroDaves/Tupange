import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category.dart';
import '../../../core/utils/app_utils.dart';
import '../level/level_selection_cubit.dart';

part 'category_selection_state.dart';

class CategorySelectionCubit extends Cubit<CategorySelectionState> {
  final LevelSelectionCubit _levelSelectionCubit;

  CategorySelectionCubit(this._levelSelectionCubit)
      : super(NoCategorySelected());

  late Category _category;

  Category get category => _category;

  void onSelected(Category category) async {
    _category = category;

    AppUtils.logger(
      'CategorySelectionCubit tapped: $category: level: ${_levelSelectionCubit.state.level}',
    );
  }
}
