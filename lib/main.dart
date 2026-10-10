import 'package:flutter/material.dart';
import 'dart:math';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

// Game Variables

int dice1 = 1;
int dice2 = 1;
int total = 2;

String imagePath = 'images/sad.png';
String result = 'You Lose!';

// Roll Function

void rollDice() {
  dice1 = Random().nextInt(6) + 1;
  dice2 = Random().nextInt(6) + 1;
  total = dice1 + dice2;

  if (total >= 10) {
    imagePath = 'images/happy.png';
    result = 'You Win!';
  } else {
    imagePath = 'images/sad.png';
    result = 'You Lose!';
  }
}

// Reset Function

void resetGame() {
  dice1 = 1;
  dice2 = 1;
  total = 2;
  imagePath = 'images/sad.png';
  result = 'You Lose!';
}

// MyApp

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFFFFD83D),
          onPrimary: const Color(0xFF4A3B00),
          secondary: const Color(0xFFFFA726),
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: const Color(0xFF333333),
          error: const Color(0xFFE53935),
          onError: Colors.white,
          tertiary: const Color(0xFF81C784),
          onTertiary: const Color(0xFF1B3A1E),
        ),
      ),

      home: const DiceScreen(),
    );
  }
}

// DiceScreen

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,

      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        leading: const Icon(Icons.casino),
        title: const Text(
          'Dice Game',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Total: $total',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 400,
                    height: 300,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: result == 'You Win!'
                          ? colors.tertiary
                          : colors.error,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: dice1),
                Dice(value: dice2),
              ],
            ),

            const SizedBox(height: 50),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: rollDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                    ),
                    child: const Text(
                      'Roll',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    onPressed: resetGame,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.secondary,
                      foregroundColor: colors.onSecondary,
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}