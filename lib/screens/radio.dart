import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioSelectionCubit extends Cubit<int> {
  RadioSelectionCubit() : super(0);

  void selectRadio(int index) {
    if (index != state) {
      emit(index);
    }
  }
}

class RadioSelectionScreen extends StatelessWidget {
  final List<String> radioOptions =
      List.generate(20, (index) => 'Option ${index + 1}');

  RadioSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioSelectionCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Radio Selection'),
        ),
        body: Center(
          child: BlocBuilder<RadioSelectionCubit, int>(
            builder: (context, selectedRadioIndex) {
              return ListView.builder(
                itemCount: radioOptions.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(radioOptions[index]),
                    value: index,
                    groupValue: selectedRadioIndex,
                    onChanged: (value) {
                      context.read<RadioSelectionCubit>().selectRadio(value!);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}