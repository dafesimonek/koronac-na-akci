// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'koronac_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KoronacState> _$koronacStateSerializer =
    new _$KoronacStateSerializer();

class _$KoronacStateSerializer implements StructuredSerializer<KoronacState> {
  @override
  final Iterable<Type> types = const [KoronacState, _$KoronacState];
  @override
  final String wireName = 'KoronacState';

  @override
  Iterable<Object> serialize(Serializers serializers, KoronacState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'testedInfected',
      serializers.serialize(object.testedInfected,
          specifiedType: const FullType(int)),
      'groupSize',
      serializers.serialize(object.groupSize,
          specifiedType: const FullType(int)),
      'realToTestedRatio',
      serializers.serialize(object.realToTestedRatio,
          specifiedType: const FullType(double)),
      'notIsolatedRatio',
      serializers.serialize(object.notIsolatedRatio,
          specifiedType: const FullType(double)),
      'estimatedRealInfected',
      serializers.serialize(object.estimatedRealInfected,
          specifiedType: const FullType(double)),
      'estimatedNotIsolated',
      serializers.serialize(object.estimatedNotIsolated,
          specifiedType: const FullType(double)),
      'infectionInGroupProbability',
      serializers.serialize(object.infectionInGroupProbability,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  KoronacState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KoronacStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'testedInfected':
          result.testedInfected = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'groupSize':
          result.groupSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'realToTestedRatio':
          result.realToTestedRatio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'notIsolatedRatio':
          result.notIsolatedRatio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'estimatedRealInfected':
          result.estimatedRealInfected = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'estimatedNotIsolated':
          result.estimatedNotIsolated = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'infectionInGroupProbability':
          result.infectionInGroupProbability = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$KoronacState extends KoronacState {
  @override
  final int testedInfected;
  @override
  final int groupSize;
  @override
  final double realToTestedRatio;
  @override
  final double notIsolatedRatio;
  @override
  final double estimatedRealInfected;
  @override
  final double estimatedNotIsolated;
  @override
  final double infectionInGroupProbability;

  factory _$KoronacState([void Function(KoronacStateBuilder) updates]) =>
      (new KoronacStateBuilder()..update(updates)).build();

  _$KoronacState._(
      {this.testedInfected,
      this.groupSize,
      this.realToTestedRatio,
      this.notIsolatedRatio,
      this.estimatedRealInfected,
      this.estimatedNotIsolated,
      this.infectionInGroupProbability})
      : super._() {
    if (testedInfected == null) {
      throw new BuiltValueNullFieldError('KoronacState', 'testedInfected');
    }
    if (groupSize == null) {
      throw new BuiltValueNullFieldError('KoronacState', 'groupSize');
    }
    if (realToTestedRatio == null) {
      throw new BuiltValueNullFieldError('KoronacState', 'realToTestedRatio');
    }
    if (notIsolatedRatio == null) {
      throw new BuiltValueNullFieldError('KoronacState', 'notIsolatedRatio');
    }
    if (estimatedRealInfected == null) {
      throw new BuiltValueNullFieldError(
          'KoronacState', 'estimatedRealInfected');
    }
    if (estimatedNotIsolated == null) {
      throw new BuiltValueNullFieldError(
          'KoronacState', 'estimatedNotIsolated');
    }
    if (infectionInGroupProbability == null) {
      throw new BuiltValueNullFieldError(
          'KoronacState', 'infectionInGroupProbability');
    }
  }

  @override
  KoronacState rebuild(void Function(KoronacStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KoronacStateBuilder toBuilder() => new KoronacStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KoronacState &&
        testedInfected == other.testedInfected &&
        groupSize == other.groupSize &&
        realToTestedRatio == other.realToTestedRatio &&
        notIsolatedRatio == other.notIsolatedRatio &&
        estimatedRealInfected == other.estimatedRealInfected &&
        estimatedNotIsolated == other.estimatedNotIsolated &&
        infectionInGroupProbability == other.infectionInGroupProbability;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, testedInfected.hashCode),
                            groupSize.hashCode),
                        realToTestedRatio.hashCode),
                    notIsolatedRatio.hashCode),
                estimatedRealInfected.hashCode),
            estimatedNotIsolated.hashCode),
        infectionInGroupProbability.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KoronacState')
          ..add('testedInfected', testedInfected)
          ..add('groupSize', groupSize)
          ..add('realToTestedRatio', realToTestedRatio)
          ..add('notIsolatedRatio', notIsolatedRatio)
          ..add('estimatedRealInfected', estimatedRealInfected)
          ..add('estimatedNotIsolated', estimatedNotIsolated)
          ..add('infectionInGroupProbability', infectionInGroupProbability))
        .toString();
  }
}

class KoronacStateBuilder
    implements Builder<KoronacState, KoronacStateBuilder> {
  _$KoronacState _$v;

  int _testedInfected;
  int get testedInfected => _$this._testedInfected;
  set testedInfected(int testedInfected) =>
      _$this._testedInfected = testedInfected;

  int _groupSize;
  int get groupSize => _$this._groupSize;
  set groupSize(int groupSize) => _$this._groupSize = groupSize;

  double _realToTestedRatio;
  double get realToTestedRatio => _$this._realToTestedRatio;
  set realToTestedRatio(double realToTestedRatio) =>
      _$this._realToTestedRatio = realToTestedRatio;

  double _notIsolatedRatio;
  double get notIsolatedRatio => _$this._notIsolatedRatio;
  set notIsolatedRatio(double notIsolatedRatio) =>
      _$this._notIsolatedRatio = notIsolatedRatio;

  double _estimatedRealInfected;
  double get estimatedRealInfected => _$this._estimatedRealInfected;
  set estimatedRealInfected(double estimatedRealInfected) =>
      _$this._estimatedRealInfected = estimatedRealInfected;

  double _estimatedNotIsolated;
  double get estimatedNotIsolated => _$this._estimatedNotIsolated;
  set estimatedNotIsolated(double estimatedNotIsolated) =>
      _$this._estimatedNotIsolated = estimatedNotIsolated;

  double _infectionInGroupProbability;
  double get infectionInGroupProbability => _$this._infectionInGroupProbability;
  set infectionInGroupProbability(double infectionInGroupProbability) =>
      _$this._infectionInGroupProbability = infectionInGroupProbability;

  KoronacStateBuilder();

  KoronacStateBuilder get _$this {
    if (_$v != null) {
      _testedInfected = _$v.testedInfected;
      _groupSize = _$v.groupSize;
      _realToTestedRatio = _$v.realToTestedRatio;
      _notIsolatedRatio = _$v.notIsolatedRatio;
      _estimatedRealInfected = _$v.estimatedRealInfected;
      _estimatedNotIsolated = _$v.estimatedNotIsolated;
      _infectionInGroupProbability = _$v.infectionInGroupProbability;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KoronacState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$KoronacState;
  }

  @override
  void update(void Function(KoronacStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KoronacState build() {
    final _$result = _$v ??
        new _$KoronacState._(
            testedInfected: testedInfected,
            groupSize: groupSize,
            realToTestedRatio: realToTestedRatio,
            notIsolatedRatio: notIsolatedRatio,
            estimatedRealInfected: estimatedRealInfected,
            estimatedNotIsolated: estimatedNotIsolated,
            infectionInGroupProbability: infectionInGroupProbability);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
