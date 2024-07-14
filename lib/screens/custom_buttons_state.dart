
import 'package:flutter/material.dart';
import 'package:task6/utils/icons.dart';

// ignore: camel_case_types
class options extends StatefulWidget {
  const options({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _optionsState createState() => _optionsState();
}

// ignore: camel_case_types
class _optionsState extends State<options> {
  int _selectedIndex = 0;

  void _changeState(int newState) {
    setState(() {
      _selectedIndex = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
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
                    child: _selectedIndex == 0
                        ? Image.asset(cubit)
                        : _selectedIndex == 1
                            ? const Text('using set state.')
                            : _selectedIndex == 2
                                ? Image.asset(cubit)
                                : _selectedIndex == 3
                                    ? const CircleAvatar(
                                        backgroundColor: Colors.red,
                                      )
                                    : const Text('Unknown state'),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.40,
                  width: double.infinity,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _changeState(1);
                        },
                        child: const Text('Show text'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _changeState(2);
                        },
                        child: const Text('Show cubit image'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _changeState(3);
                        },
                        child: const Text('Show the red circle'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _changeState(0);
                        },
                        child: const Text('Reset'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}