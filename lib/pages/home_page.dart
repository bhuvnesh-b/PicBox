import 'package:finstagram/pages/feed_page.dart';
import 'package:finstagram/pages/profile_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _Homgepagestate();
  }
}

class _Homgepagestate extends State<HomePage> {
  int _currpage = 0;

  final List<Widget> _pages = [
    FeedPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text(
        "Finstagram",
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.add_a_photo_rounded)
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0
              ),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.logout_sharp
            )
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currpage],
    );
  }


  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currpage,
      onTap: (ind){
        setState(() {
          _currpage = ind;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Feed',
          icon: Icon(
            Icons.feed,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.account_box,
          ),
        ),
      ] 

    );
  }
}