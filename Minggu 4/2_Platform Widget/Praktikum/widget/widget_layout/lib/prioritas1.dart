import 'package:flutter/material.dart';

class halamanSatu extends StatefulWidget {
  const halamanSatu({super.key});

  @override
  State<halamanSatu> createState() => _halamanSatuState();
}

class _halamanSatuState extends State<halamanSatu> {

  int _selectedIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material App"),
        backgroundColor: Color.fromARGB(255, 65, 63, 63),
      ),
      drawer: const NavigationDrawer(),
      body: const Center(
        child: Text("This is MaterialApp"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
      ),
    
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                // onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("home"),
                // onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
                // onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.workspaces),
                title: Text("Workflow"),
                // onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}