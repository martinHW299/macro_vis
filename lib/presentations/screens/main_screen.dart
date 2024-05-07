import 'package:flutter/material.dart';
import 'package:macro_vision_1/presentations/views/preview_view.dart';
import 'package:macro_vision_1/presentations/views/result_view.dart';
import 'package:macro_vision_1/presentations/views/users_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final screens = [
      const PreviewView(),
      const ResultView(),
      const UsersView()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Macro Vision',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
        ),
        backgroundColor: colors.primary,
      ),
      body: IndexedStack(
        index: selectedNavBarIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedNavBarIndex,
        onTap: (value) {
          setState(() {
            selectedNavBarIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.post_add),
            activeIcon: const Icon(Icons.post_add),
            label: 'Subir Comida',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.restaurant_rounded),
            activeIcon: const Icon(Icons.restaurant_rounded),
            label: 'Resultado',
            backgroundColor: colors.secondary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person_outline),
            label: 'Perfil',
            backgroundColor: colors.tertiary,
          )
        ],
      ),
    );
  }
}
