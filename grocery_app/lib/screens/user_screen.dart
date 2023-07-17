import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/profile_screen.dart';
import 'package:grocery_app/widgets/action_switch_view.dart';
import 'package:grocery_app/widgets/action_view.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/group_view.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  void _logoutView(BuildContext context) async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure want to logout of the system?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget user = Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        ),
        const Expanded(
          child: ListTile(
            title: Text('Dariene Robertson'),
            subtitle: Text(
              'darienerobertson@gmail.com',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              builder: (context) => const ProfileScreen(),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Edit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: user,
          ),
          GroupView(title: 'General Settings', children: [
            ActionView(
                icon: IconlyLight.location,
                title: 'History',
                description: 'See all history payment',
                onPress: () {},
                color: Colors.blue),
            ActionView(
                icon: IconlyLight.buy,
                title: 'Orders',
                description: 'Order your item to cart',
                onPress: () {},
                color: Colors.lime),
            ActionView(
                icon: IconlyLight.heart,
                title: 'Wishlist',
                description: 'Your favorites list',
                onPress: () {},
                color: Colors.red),
          ]),
          const SizedBox(
            height: 10,
          ),
          GroupView(title: 'Others', children: [
            ActionSwitchView(
                icon: themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                value: themeState.getDarkTheme,
                title: 'Theme',
                description: 'Change theme you want',
                onPress: (newValue) => themeState.setDarkTheme = newValue,
                color: Colors.green),
            ActionView(
                icon: IconlyLight.password,
                title: 'Password',
                description: 'Update new password & change password',
                onPress: () {},
                color: Colors.grey),
            ActionView(
                icon: IconlyLight.logout,
                title: 'Logout',
                description: 'Logout of the system',
                onPress: () => _logoutView(context),
                color: Colors.purple),
          ]),
        ],
      ),
    );
  }
}
