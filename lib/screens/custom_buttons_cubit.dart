
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/utils/icons.dart';

// Define the states for the Cubit
enum AppState { initial, showText, showImage, showCircle }

// Define the Cubit
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial);

  void showText() => emit(AppState.showText);
  void showImage() => emit(AppState.showImage);
  void showCircle() => emit(AppState.showCircle);
  void reset() => emit(AppState.initial);
}

// ignore: camel_case_types
class option extends StatelessWidget {
  const option({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AppCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuery.height * 0.60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      switch (state) {
                        case AppState.initial:
                          return Image.asset(cubit);
                        case AppState.showText:
                          return const Text('This is some text.');
                        case AppState.showImage:
                          return Image.asset(cubit);
                        case AppState.showCircle:
                          return const CircleAvatar(
                            backgroundColor: Colors.red,
                          );
                        default:
                          return const Text('Unknown state');
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: mediaQuery.height * 0.40,
                  width: double.infinity,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<AppCubit>().showText();
                        },
                        child: const Text('Show text'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AppCubit>().showImage();
                        },
                        child: const Text('Show cubit image'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AppCubit>().showCircle();
                        },
                        child: const Text('Show the red circle'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AppCubit>().reset();
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}