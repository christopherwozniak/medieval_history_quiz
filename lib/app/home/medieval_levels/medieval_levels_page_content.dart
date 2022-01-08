import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medieval_history_quiz/app/home/medieval_levels/cubit/medieval_levels_cubit.dart';

class MedievalLevelsPageContent extends StatelessWidget {
  const MedievalLevelsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedievalLevelsCubit()..start(),
      child: BlocBuilder<MedievalLevelsCubit, MedievalLevelsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Something went wrong:${state.errorMessage}'));
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        document['basic'],
                      ),
                      Text(
                        document['medium'],
                      ),
                      Text(
                        document['hard'],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
