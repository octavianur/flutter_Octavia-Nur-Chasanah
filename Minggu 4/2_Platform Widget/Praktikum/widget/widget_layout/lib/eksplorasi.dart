import 'package:flutter/material.dart';

class eksplorasi extends StatefulWidget {
  @override
  State<eksplorasi> createState() => _eksplorasiState();
}

class _eksplorasiState extends State<eksplorasi> {
  final List<String> learningTopics = [
    "Learn Flutter",
    "Learn ReactJs",
    "Learn VueJs",
    "Learn TailwindCSS",
    "Learn UI/UX",
    "Learn Figma",
    "Learn Digital Marketing",
  ];

  int _selectedIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff6200EE),
        title: Text(
          "My Flutter App",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search, color: Colors.white,)
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: learningTopics.length,
          separatorBuilder: (context, int index){
            return Divider(color: Colors.grey);
          }, 
          itemBuilder: (context, index) {
            final topic = learningTopics[index];
              return ListTile(
                title: Text(topic),
            );
          },  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            // Handle the "Add" button click here
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff03DAC5),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Pojok kanan bawah     
       bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info),label: 'Information'),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 228, 225, 225),
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xff6200EE),
      ),
    );
  }
}