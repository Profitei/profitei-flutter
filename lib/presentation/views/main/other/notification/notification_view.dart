import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Notification 1"),
              subtitle: Text("Notification 1 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 2"),
              subtitle: Text("Notification 2 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 3"),
              subtitle: Text("Notification 3 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 4"),
              subtitle: Text("Notification 4 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 5"),
              subtitle: Text("Notification 5 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 6"),
              subtitle: Text("Notification 6 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 7"),
              subtitle: Text("Notification 7 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 8"),
              subtitle: Text("Notification 8 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 9"),
              subtitle: Text("Notification 9 description"),
              trailing: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Notification 10"),
              subtitle: Text("Notification 10 description"),
              trailing: Icon(Icons.notifications),
            ),
            
          ],
        ),
      ),
    );
  }
}
