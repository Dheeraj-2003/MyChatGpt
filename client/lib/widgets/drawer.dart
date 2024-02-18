import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.99),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        "Hey there !",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 22, color: Colors.white),
                      ),
                      leading: Image.asset(
                        "assets/robot.png",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )),
          ListTile(
            title: Text(
              "Your recent chats",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
