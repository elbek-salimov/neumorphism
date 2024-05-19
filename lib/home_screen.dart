import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextButton
  bool _isPressed = false;
  // IconButton
  bool _isElevated = true;
  // CheckBox
  bool _isChecked = false;
  // Switch
  bool _isSwitched = false;
  // Progress
  double _progress = 0.3;

  // IconButton Logic
  void _setPressed(bool isPressed) {
    setState(() {
      _isPressed = isPressed;
    });
  }

  // Progress Logic
  void _updateProgress(Offset localPosition, double containerWidth) {
    setState(() {
      _progress = localPosition.dx / containerWidth;
      if (_progress < 0) _progress = 0;
      if (_progress > 1) _progress = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Neumorphism',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20, width: double.infinity),
          // TextButton --------------------------------------
          GestureDetector(
            onTapDown: (_) => _setPressed(true),
            onTapUp: (_) => _setPressed(false),
            onTapCancel: () => _setPressed(false),
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isPressed
                    ? [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(2, 2),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-2, -2),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
              ),
              child: const Text(
                'TextButton',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Container -------------------------------------------
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Center(
              child: Text(
                'Container',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // IconButton ----------------------------------
          GestureDetector(
            onTap: () {
              setState(() {
                _isElevated = !_isElevated;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 200,
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
                boxShadow: _isElevated
                    ? [
                        const BoxShadow(
                          color: Color(0xFFBEBEBE),
                          offset: Offset(10, 10),
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-10, -10),
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: const Icon(Icons.power_settings_new),
            ),
          ),
          const SizedBox(height: 20),
          // Text -----------------------------------------
          Text(
            'Text',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                shadows: [
                  const Shadow(
                      offset: Offset(3, 3),
                      color: Colors.black38,
                      blurRadius: 10),
                  Shadow(
                      offset: const Offset(-3, -3),
                      color: Colors.white.withOpacity(0.85),
                      blurRadius: 10)
                ],
                color: Colors.grey.shade300),
          ),
          const SizedBox(height: 20),
          // TextField -----------------------------------
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'TextField',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // CheckBox ------------------------------------
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: _isChecked
                  ? const Icon(Icons.check, color: Colors.green, size: 30)
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          // Switch ------------------------------------
          GestureDetector(
            onTap: () {
              setState(() {
                _isSwitched = !_isSwitched;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 60,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    left: _isSwitched ? 30 : 0,
                    right: _isSwitched ? 0 : 30,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: _isSwitched ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(2, 2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-2, -2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Progress Bar ---------------------------------
          GestureDetector(
            onPanUpdate: (details) {
              _updateProgress(details.localPosition, 300);
            },
            child: Container(
              width: 300,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: 300 * _progress,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
              boxShadow: [
                const BoxShadow(
                    offset: Offset(10, 10),
                    color: Colors.black38,
                    blurRadius: 20),
                BoxShadow(
                    offset: const Offset(-10, -10),
                    color: Colors.white.withOpacity(0.85),
                    blurRadius: 20)
              ],
            ),
            child: Center(
              child: Text(
                'ELBEK Mobile Dev',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    shadows: [
                      const Shadow(
                          offset: Offset(3, 3),
                          color: Colors.black38,
                          blurRadius: 10),
                      Shadow(
                          offset: const Offset(-3, -3),
                          color: Colors.white.withOpacity(0.55),
                          blurRadius: 10)
                    ],
                    color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
