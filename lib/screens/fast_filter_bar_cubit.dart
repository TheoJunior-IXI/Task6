import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FastFilterCubit extends Cubit<String> {
  FastFilterCubit(super.initialState);

  void selectItem(String item) {
    emit(item);
  }
}

class FastFilterBarUsingCubit extends StatelessWidget {
  final List<String> items;

  const FastFilterBarUsingCubit({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FastFilterCubit(items.first),
      child: BlocBuilder<FastFilterCubit, String>(
        builder: (context, selectedItem) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<FastFilterCubit>().selectItem(items[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedItem == items[index]
                          ? Color.fromARGB(255, 145, 63, 188)
                          : Colors.grey,
                    ),
                    child: Text(
                      items[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}