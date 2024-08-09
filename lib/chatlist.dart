import 'package:flutter/material.dart';
import 'appcolor.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackColor,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'SpiderMan',
            subtitle: 'Give me your MJ Bro!',
            time: 'Mon',
            unreadCount: null,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'BatMan',
            subtitle: 'Inhale that\'s Fear',
            time: '8:07 PM',
            unreadCount: 3,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'SuperMan',
            subtitle: 'Kryptonian',
            time: '8:06 PM',
            unreadCount: 1,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'IronMan',
            subtitle: 'Last Night',
            time: '8:05 PM',
            unreadCount: 2,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Captain America',
            subtitle: 'Let go and get',
            time: '8:05 PM',
            unreadCount: 2,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Thor',
            subtitle: 'Bring me Thanos',
            time: '8:02 PM',
            unreadCount: 4,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Black Widow',
            subtitle: 'I Love You',
            time: '7:09 PM',
            unreadCount: null,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Loki',
            subtitle: 'For all of us',
            time: '7:09 PM',
            unreadCount: 4,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Thanos',
            subtitle: 'Insect',
            time: '7:09 PM',
            unreadCount: 2,
          ),
          ChatItem(
            avatar: 'images/dp/default_dp.png',
            title: 'Doctor Strange',
            subtitle: 'Let\'s get into Multiverse',
            time: '7:09 PM',
            unreadCount: 3,
          ),
        ],
      ),
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
