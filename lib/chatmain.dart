import 'package:flutter/material.dart';
import 'chatlist.dart';
import 'chathives.dart';
import 'tales.dart';
import 'appcolor.dart';
import 'notification_sound.dart';
import 'profile.dart';

class ChatMain extends StatefulWidget {
  const ChatMain({super.key});

  @override
  State<ChatMain> createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<String> _title = ['BeeHyv', 'Hives', 'Tales'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _notificationNav() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationSound(),
      ),
    );
  }

  void _profile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyProfile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackColor,
      appBar: AppBar(
        backgroundColor: AppColors.honeyColor,
        title: Text(
          _title[_selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          ChatListPage(),
          ChatHive(),
          TalesPage(),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.whiteBackColor,
        elevation: 20.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Vishal N',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                '+91 81243XXXXX',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppColors.honeyColor,
                radius: 20, // Reduced size of the circular avatar
                child: ClipOval(
                  child: Image.asset(
                    "images/dp/default_dp.png",
                    fit: BoxFit.cover,
                    width: 65, // Keeping image dimensions consistent
                    height: 65,
                  ),
                ),
              ),
              /*otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15, // Adjusted size for the other account picture
                  child: ClipOval(
                    child: Image.asset(
                      "images/modes/dark_mode1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],*/
              decoration: const BoxDecoration(
                color: AppColors.honeyColor,
              ),
            ),
            ListTile(
              title: const Text('My Profile'),
              leading: const Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              onTap: _profile,
            ),
            const ListTile(
              title: Text('New Hives'),
              leading: Icon(
                Icons.group_add_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text('Contacts'),
              leading: Icon(
                Icons.contacts_outlined,
                color: Colors.black,
              ),
            ),
            const ListTile(
              title: Text('Your Tales'),
              leading: Icon(
                Icons.auto_stories_outlined,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: const Text('Notification and Sounds'),
              leading: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
              ),
              onTap: _notificationNav,
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text('Invite Friends'),
              leading: Icon(
                Icons.person_add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.honeyColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: [
          _buildBottomNavigationBarItem(Icons.message_rounded, 'Buzz', 0),
          _buildBottomNavigationBarItem(Icons.groups_sharp, 'Hives', 1),
          _buildBottomNavigationBarItem(Icons.auto_stories_rounded, 'Tales', 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Colors.white.withOpacity(0.5)
                : Colors.transparent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3.0),
          child: Icon(
            icon,
            color: Colors.black,
            size: 22,
          ),
        ),
      ),
      label: label,
    );
  }
}
