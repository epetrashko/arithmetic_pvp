import 'package:arithmetic_pvp/bloc/events/main_events.dart';
import 'package:arithmetic_pvp/bloc/states/main_states.dart';
import 'package:arithmetic_pvp/data/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/auth.dart';
import '../data/network_client.dart';
import '../data/storage.dart';

class MainBloc extends Bloc<SplashScreenEvent, MainState> {
  MainBloc() : super(MainStateLoading()) {
    on<SplashScreenEventStartLoading>((event, emit) async {
      final _getIt = GetIt.instance;

      Storage _storage = await Storage().init();

      final _client = NetworkClient();
      final storageCookie = _storage.getString("cookie", "");
      if (storageCookie != "") {
        _client.api.options.headers["cookie"] = storageCookie;
      }

      _getIt.registerSingleton(_client);
      _getIt.registerSingleton<Auth>(Auth(_client));
      _getIt.registerSingleton<Api>(Api(_client));
      _getIt.registerSingleton(_storage);
      await GetIt.instance.allReady();

      if (storageCookie != "") {
        // TODO : check if token is still valid (api call, for example: request profile info)
        emit(MainStateLoaded(true));
      } else {
        emit(MainStateLoaded(false));
      }
    });
  }
}
