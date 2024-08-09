import 'package:flutter/material.dart';
import 'appcolor.dart';

class ChatHive extends StatelessWidget {
  const ChatHive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackColor,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'CSE HUB',
            subtitle: 'DSP Previous ques',
            time: 'Mon',
            unreadCount: null,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Chess Team 2027',
            subtitle: 'Hey guys here the',
            time: '8:07 PM',
            unreadCount: 3,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Chess Team 2026',
            subtitle: 'Hey Guys here the',
            time: '8:06 PM',
            unreadCount: 1,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Deadpool 3 Gang',
            subtitle: '6 tickets pootachu',
            time: '8:05 PM',
            unreadCount: 2,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Ooty parithabangal',
            subtitle: 'Eehh photo send',
            time: '8:05 PM',
            unreadCount: 2,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Manmuttiyan Boys',
            subtitle: 'Naalaiku match ku',
            time: '8:02 PM',
            unreadCount: 4,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Shivagi Krishnamoorthi',
            subtitle: 'Eyy enna da panrin',
            time: '7:09 PM',
            unreadCount: null,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'IV Poorom Group',
            subtitle: 'Enna nadakuthu inga',
            time: '7:09 PM',
            unreadCount: 4,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Placement Info',
            subtitle: 'Only 8CGPA Eligible',
            time: '7:09 PM',
            unreadCount: 2,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Neeyum Naanum vera',
            subtitle: '42 page aa',
            time: '7:09 PM',
            unreadCount: 3,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 5.0,
        backgroundColor: AppColors.honeyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Adjust if needed
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class ChatItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String subtitle;
  final String time;
  final int? unreadCount;

  const ChatItem({
    super.key,
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.time,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 29,
          backgroundImage: AssetImage(avatar),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            const SizedBox(height: 10),
            if (unreadCount != null)
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.honeyColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        onTap: () {
          // Handle chat item tap
        },
      ),
    );
  }
}
