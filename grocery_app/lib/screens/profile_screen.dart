import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/group_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        GroupView(
          title: 'Personal Info',
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(IconlyLight.calendar),
                      labelText: 'Fullname',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(IconlyLight.calendar),
                      labelText: 'Email',
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(IconlyLight.calendar),
                      labelText: 'Date of birth',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(IconlyLight.calendar),
                      labelText: 'Gender',
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            tileMode: TileMode.repeated),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  margin: const EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: content,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150,
            alignment: Alignment.bottomCenter,
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.transparent,
            icon: const Icon(
              IconlyLight.arrowLeft,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
