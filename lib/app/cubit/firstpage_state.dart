part of 'firstpage_cubit.dart';

@immutable
class FirstpageState {
  final User? user;
  final bool isLoading;
  final String errorMessage;

  const FirstpageState(
      {required this.user,
      required this.isLoading,
      required this.errorMessage});
}
