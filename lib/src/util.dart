import 'package:built_value/built_value.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:get_it/get_it.dart';
import 'package:koronac_na_akci/src/i69n/messages.i69n.dart';
import 'package:koronac_na_akci/src/state/state_holder.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final getMy = GetIt.instance.get;
final getMyAsync = GetIt.instance.getAsync;

StateHolder<STATE> getMyStateHolder<STATE>() =>
    GetIt.instance.get<StateHolder<STATE>>();

extension FindContextState on BuildContext {
  StateHolder<T>
      findStateHolder<T extends Built<dynamic, Builder<dynamic, dynamic>>>() {
    return this.read<StateHolder<T>>();
  }
}

extension ReadContextState on BuildContext {
  T readState<T extends Built<dynamic, Builder<dynamic, dynamic>>>() {
    return this.read<StateHolder<T>>().state;
  }
}

extension WatchContextState on BuildContext {
  T watchState<T extends Built<dynamic, Builder<dynamic, dynamic>>>() {
    return this.watch<StateHolder<T>>().state;
  }
}

extension MessagesContext on BuildContext {
  Messages get messages {
    return this.watch<StateHolder<Messages>>().state;
  }
}

extension Logging on Object {
  Logger get log => Logger(this.runtimeType.toString());
}
