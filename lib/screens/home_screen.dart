import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //create a variable that we will pass to selcted index in Navigation bar widget
  int _selectedPageIndex = 0;

  //list of widget to be displayed whent every button is cliked
  final List<Widget> _widgetOptions = [
    const Center(
      child: Text(
        'Learn 📗',
      ),
    ),
    const Center(
      child: Text(
        'Relearn 👨‍🏫',
      ),
    ),
    const Center(
      child: Text(
        'Unlearn 🐛',
      ),
    ),
  ];
  //function that will execute the switch
  void _onItemTapped(int index) {
    setState(() {
      /**
             * ! Just to remember
             * ! The setState() method tells the Flutter engine that the internal
             * ! state of an object has changed, so Flutter should check 
             * ! and then update the UI on the device accordingly.
             */
      //selectedPageIndex will update based on the index of the page we selected
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedPageIndex),
      ),
      bottomNavigationBar: NavigationBar(
        /**
         * ? The onDestinationSelected
         * ? property takes a function
         * ? that takes an int as an argument. 
         * ? The function is called when a user
         * ?  taps on a navigation bar item
         * ? (NavigationDestination). The int
         * ? argument represents the index of
         * ? the selected item
         */
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person_2_outlined),
            label: 'Learn',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.engineering_outlined),
            icon: Icon(Icons.engineering_outlined),
            label: 'Relearn',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark),
            label: 'Unearn',
          ),
        ],
      ),
    );
  }
}
