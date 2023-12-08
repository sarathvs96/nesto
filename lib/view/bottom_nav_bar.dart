import 'package:flutter/material.dart';
import 'package:nesto/view/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_nav_bar_provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/person.png')
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/menu.png')
            ),
          ],
        ),
        body: Consumer<BottomNavBarProvider>(
          builder: (context, model, child) {
            return _buildBody(model.currentIndex);
          },
        ),
        bottomNavigationBar: Consumer<BottomNavBarProvider>(
          builder: (context, model, child) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: BottomNavigationBar(
                  backgroundColor:Colors.white,
                  currentIndex: model.currentIndex,
                  selectedItemColor: Color(0xff17479b),
                  onTap: (index) {
                    model.updateIndex(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,color: Color(0xff17479b),),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_box_outlined,color: Color(0xff17479b)),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_shopping_cart,color: Color(0xff17479b)),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.assignment_return_outlined,color: Color(0xff17479b)),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_3_outlined,color: Color(0xff17479b)),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Center(
          child: Text('1'),
        );
      case 2:
        return const Center(
          child: Text('2'),
        );
      case 3:
        return const Center(
          child: Text('3'),
        );
      case 4:
        return const Center(
          child: Text('4'),
        );
      default:
        return Container();
    }
  }
}
