import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit for managing the password visibility state
class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(false);

  void toggleVisibility() => emit(!state);
}

class PasswordHidden extends StatelessWidget {
  const PasswordHidden({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Visibility',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => PasswordVisibilityCubit(),
        child: const PasswordVisibilityScreen(),
      ),
    );
  }
}

class PasswordVisibilityScreen extends StatelessWidget {
  const PasswordVisibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Visibility'),
      ),
      body: const Center(
        child: PasswordTextField(),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, isPasswordVisible) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () {
                  context.read<PasswordVisibilityCubit>().toggleVisibility();
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}