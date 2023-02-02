import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practicefirebase/models/brew.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);

    // if (brews != null) {
    //   int count = 1;
    //   for (var brew in brews) {
    //       print("${count}: ${brew?.name}");
    //       print("${count}: ${brew?.sugars}");
    //       print("${count}: ${brew?.strength}");
    //     }
    //     count++;
    // }

    // if (brews != null) {
    //   for (var doc in brews.docs) {
    //     print(doc.data());
    //   }
    // }

    return ListView.builder(
      itemCount: brews!.length,
      itemBuilder: (context, index) {
        return BrewTile(brew:brews[index]);
      },
    );
    // return Container();
  }
}
