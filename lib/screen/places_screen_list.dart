import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Placess'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreaTPlaces>(
        child: Center(
          child: const Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, greatPlaces, ch) 
          => greatPlaces.items.length <= 0 
          ? ch 
          : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(
                  greatPlaces.items[i].image,
                ),
              ),
              title: Text(greatPlaces.items[i].title),
              onTap: () {
                //  Go To Detail Page...
              },
            ),
          ),
      ),
      //  We have commented below
      //  because we do not want to show circular loading anymore.
      // body: Center(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }
}