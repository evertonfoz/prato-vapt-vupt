import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
