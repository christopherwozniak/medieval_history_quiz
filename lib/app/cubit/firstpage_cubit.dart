import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'firstpage_state.dart';

class FirstpageCubit extends Cubit<FirstpageState> {
  FirstpageCubit()
      : super(
          const FirstpageState(user: null, isLoading: false, errorMessage: ''),
        );
  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(const FirstpageState(user: null, isLoading: true, errorMessage: ''));
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(FirstpageState(user: user, isLoading: false, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              FirstpageState(
                user: null,
                isLoading: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
