import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/constants/app_dimens.dart';

part 'fact_state.dart';

class FactCubit extends Cubit<FactState> {
  late Timer _timer;
  Timer? userInteractionTimer;
  late List<String> setFacts;
  int currentFactIdx = 0;
  bool hasUserInteracted = false;

  void newFact() {
    // start user interaction timer
    userInteractionTimer?.cancel();
    userInteractionTimer = Timer(AppDimens.kS20, () {
      // reset back - so that auto updating works again
      hasUserInteracted = false;
    });

    // get and update new fact
    updateFact(force: true);

    // this disables the timer temporary, thus not refreshing fact until next cycle
    hasUserInteracted = true;
  }

  void updateFact({bool force = false}) {
    if (!force) {
      // if there is no `force`, to update fact, then only apply the limiting checks
      if (hasUserInteracted) return;
    }

    int idx = Random().nextInt(setFacts.length);
    while (idx == currentFactIdx) {
      idx = Random().nextInt(setFacts.length);
    }

    currentFactIdx = idx;

    final fact = setFacts[currentFactIdx];
    emit(FactState(fact: fact));
  }

  FactCubit({required List<String> facts}) : super(const FactState()) {
    setFacts = facts;
    setFacts.shuffle();

    // update fact for the first time
    updateFact();

    _timer = Timer.periodic(AppDimens.kS20, (_) => updateFact());
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
