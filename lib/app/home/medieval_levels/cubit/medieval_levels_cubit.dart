import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'medieval_levels_state.dart';

class MedievalLevelsCubit extends Cubit<MedievalLevelsState> {
  MedievalLevelsCubit()
      : super(
          const MedievalLevelsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      const MedievalLevelsState(
          documents: [], errorMessage: '', isLoading: true),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('levels')
        .orderBy('opinion', descending: true)
        .snapshots()
        .listen((data) {
      emit(MedievalLevelsState(
          documents: data.docs, isLoading: false, errorMessage: ''));
    })
      ..onError((error) {
        emit(MedievalLevelsState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString()));
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
