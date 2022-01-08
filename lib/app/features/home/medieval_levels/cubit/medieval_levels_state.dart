part of 'medieval_levels_cubit.dart';

@immutable
class MedievalLevelsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  final bool isLoading;
  final String errorMessage;

  const MedievalLevelsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
