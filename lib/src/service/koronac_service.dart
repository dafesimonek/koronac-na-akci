import 'dart:math';

import 'package:koronac_na_akci/src/app_mode.dart';
import 'package:koronac_na_akci/src/state/koronac_state.dart';
import 'package:koronac_na_akci/src/state/state_holder.dart';
import 'package:koronac_na_akci/src/util.dart';

class KoronacService {
  StateHolder<KoronacState> get holder => getMy<StateHolder<KoronacState>>();

  KoronacState prepareDefaultState(AppMode mode) {
    return KoronacState((KoronacStateBuilder b) {
      b
        ..testedInfected = 500
        ..realToTestedRatio = 4
        ..groupSize = 10
        ..notIsolatedRatio = 0.5;
      _updateEstimates(b);
    });
  }

  void setTestedInfected(double newInfected) {
    holder.state = holder.state.rebuild((KoronacStateBuilder b) {
      b.testedInfected = newInfected.toInt();
      _updateEstimates(b);
    });
  }

  void _updateEstimates(KoronacStateBuilder ks) {
    ks.estimatedRealInfected = ks.testedInfected * ks.realToTestedRatio;
    ks.estimatedNotIsolated = ks.notIsolatedRatio * ks.estimatedRealInfected;

    final personNotInfectedProb = 1.0 - (ks.estimatedNotIsolated / 100000.0);
    final groupNotInfectedProb = pow(personNotInfectedProb, ks.groupSize);

    ks.infectionInGroupProbability = 1.0 - groupNotInfectedProb;
  }

  void setGroupSize(double newSize) {
    holder.state = holder.state.rebuild((KoronacStateBuilder b) {
      b.groupSize = newSize.toInt();
      _updateEstimates(b);
    });
  }

  void setRealToTestedRation(double newRatio) {
    holder.state = holder.state.rebuild((b) {
      b.realToTestedRatio = newRatio;
      _updateEstimates(b);
    });
  }

  void setNotIsolatedRatio(double newRatio) {
    holder.state = holder.state.rebuild((b) {
      b.notIsolatedRatio = newRatio;
      _updateEstimates(b);
    });
  }
}
