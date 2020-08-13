import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget DrawerHeaderWidget() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Eduardo Mattos'), 
          accountEmail: Text('edukmattos@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: Text('EM'),
          ),
          otherAccountsPictures: <Widget>[
            CircleAvatar(
              child: Text('EM'),
            ),
          ],
        ),
      ]
    )
  );
}
