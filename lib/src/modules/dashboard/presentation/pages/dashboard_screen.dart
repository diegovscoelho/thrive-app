import 'package:flutter/material.dart';
import 'package:thrive/src/core/utils/app_styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
          selectedLabelStyle: AppStyles.secondaryButtonStyle,
          unselectedLabelStyle: AppStyles.secondaryButtonStyle,
          backgroundColor: Color(0xFF0C0C1D),
          selectedItemColor: Color(0xFF434370),
          unselectedItemColor: Color(0xFF434370),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0f0c29), Color(0xFF24243e), Color(0xFF302b63)],
          ),
        ),
      ),
    );
  }
}
