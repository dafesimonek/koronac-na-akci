import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'koronac_state.g.dart';

abstract class KoronacState
    implements Built<KoronacState, KoronacStateBuilder> {
  static Serializer<KoronacState> get serializer => _$koronacStateSerializer;

  int get testedInfected;

  int get groupSize;

  double get realToTestedRatio;

  double get notIsolatedRatio;

  double get estimatedRealInfected;

  double get estimatedNotIsolated;

  double get infectionInGroupProbability;

  KoronacState._();
  factory KoronacState([void Function(KoronacStateBuilder) updates]) =
      _$KoronacState;
}
