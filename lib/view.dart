import 'package:firebase/update.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final ref = FirebaseDatabase.instance.ref().child("Tasks");
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FirebaseAnimatedList(
      itemBuilder: ((context, snapshot, animation, index) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.green,
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                      onPressed: () {
                        ref.child(snapshot.key!).remove();
                      },
                      icon: Icon(Icons.remove)),
                  IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context,'/update');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdatePage(value: snapshot.key!)));
                      },
                      icon: Icon(Icons.update))
                ]),
                title: Text(
                  snapshot.value.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      }),
      query: ref,
    ));
  }
}
