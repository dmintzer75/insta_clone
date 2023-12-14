import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int pageIndex) {
    
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Screen'),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _page = index;
          });
        },
        children: const [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Search'),
          ),
          Center(
            child: Text('Add'),
          ),
          Center(
            child: Text('Favorite'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        backgroundColor: customTheme.bottomAppBarTheme.color,
        activeColor: customTheme.primaryColor,
        inactiveColor: customTheme.disabledColor,
        iconSize: 32,
        onTap: (index) {
          navigationTapped(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10),
              child: Icon(
                _page == 0 ? Icons.home : Icons.home_outlined,
                // color: _page == 0 ? customTheme.primaryColor : Colors.grey,
              ),
            ),
            // label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 1 ? Icons.search_outlined : Icons.search,
              // color: _page == 1 ? customTheme.primaryColor : Colors.grey,
            ),
            // label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 2 ? Icons.add_circle : Icons.add_circle_outline,
            ),
            // label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 3 ? Icons.favorite : Icons.favorite_border,
            ),
            // label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 4 ? Icons.account_circle : Icons.account_circle_outlined,
            ),
            // label: 'Profile',
          ),
        ],
      ),
    );
  }
}
