import 'package:flutter/material.dart';

class AnimatedListView extends StatefulWidget {
  const AnimatedListView({super.key});

  @override
  State<AnimatedListView> createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> {
  List<int> item = [];
  int count = 0;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listKey.currentState!
              .insertItem(0, duration: const Duration(milliseconds: 400));
          item = []
            ..add(count++)
            ..addAll(item);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Animated List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              listKey.currentState!.removeItem(0, (context, animation) => sizeIt(0, context, animation), duration: Duration(microseconds: 400));
              item.removeAt(0);
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: AnimatedList(
          key: listKey,
          initialItemCount: item.length,
          itemBuilder: (context, index, animation) {
            return slideIt(index, context, animation);
            // return SizeTransition(
            //   sizeFactor: animation,
            //   axis: Axis.vertical,
            //   child: Container(
            //     height: 100,
            //     width: double.maxFinite,
            //     child: Card(
            //       color: Colors.primaries[index % Colors.primaries.length],
            //       child: ListTile(
            //         title: Text(
            //           'Item ${item[index]}',
            //           style: Theme.of(context).textTheme.headlineSmall,
            //         ),
            //       ),
            //     ),
            //   ),
            // );
          }),
    );
  }

  Widget sizeIt(int index, BuildContext context, animation) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: Container(
        height: 100,
        width: double.maxFinite,
        child: Card(
          color: Colors.primaries[index % Colors.primaries.length],
          child: ListTile(
            title: Text(
              'Item ${item[index]}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget slideIt(int index, BuildContext context, animation){
   return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
          ).animate(animation),
          child: Container(
            height: 100,
            width: double.maxFinite,
            child: Card(
              color: Colors.primaries[index % Colors.primaries.length],
              child: ListTile(
                title: Text('Item ${item[index]}', style: Theme.of(context).textTheme.headlineSmall,),
              ),
            ),
          ),
        );
  }
}
