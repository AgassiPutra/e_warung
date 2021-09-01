import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class ListWarung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('WARUNG'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            buildListViewbyIndex(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildListViewbyIndex() {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('Warung ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
