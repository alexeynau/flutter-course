import 'dart:async';
import 'package:flutter_12/features/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
// import 'package:module1_data/module1_data.dart';
// import 'package:module1_model/module1_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repositories/user_repository.dart';

part 'main_bloc.freezed.dart';

@injectable
class MainBloc {
  final UserRepository userRepository;
  final StreamController<MainBlocEvent> _eventController = StreamController();
  final StreamController<MainBlocState> _stateController = StreamController.broadcast();

  Stream<MainBlocState> get state => _stateController.stream;

  MainBloc({required this.userRepository}) {
    _eventController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
          _stateController.add(const MainBlocState.loading());
          _stateController.add(
            MainBlocState.loaded(
              userModel: await userRepository.getDefaultUser(),
            ),
          );
        },
        setUser: (event) async => _stateController.add(
          MainBlocState.loaded(
            userModel: await userRepository.getUserById(event.userId),
          ),
        ),
      );
    });
  }

  void add(MainBlocEvent event) {
    if (_eventController.isClosed) return;
    _eventController.add(event);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

@freezed
class MainBlocState with _$MainBlocState {
  const factory MainBlocState.loading() = MainLoadingState;
  const factory MainBlocState.loaded({required UserModel userModel}) = MainLoadedState;
}

@freezed
class MainBlocEvent with _$MainBlocEvent {
  const factory MainBlocEvent.init() = _MainInitEvent;
  const factory MainBlocEvent.setUser({required int userId}) = _MainSetEvent;
}
