import 'package:flutter/material.dart';

void main() {
  runApp(const DescriAutonomous());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class DescriAutonomous extends StatelessWidget {
  const DescriAutonomous({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          descAutoo(),
        ]),
      ),
    );
  }
}

class descAutoo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 323,
          height: 123,
          padding: const EdgeInsets.all(24),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xB7F8B64C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 76,
                height: 75,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: OvalBorder(),
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 186,
                      height: 19,
                      child: Text(
                        'Nome do Serviço',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Actor',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: 195,
                      height: 22,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Actor',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.60,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 88,
                            top: 2,
                            child: SizedBox(
                              width: 107,
                              height: 20,
                              child: Text(
                                'Agendamento',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Actor',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.60,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Go back!'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
