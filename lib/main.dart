import 'package:flutter/material.dart';
import 'package:generic_bloc/cars_view.dart';
import 'package:generic_bloc/people_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generic Bloc'),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const PeopleView(),
                        ),
                      );
                    },
                    child: const Text('People'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CarsView(),
                        ),
                      );
                    },
                    child: const Text('Cars'),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
