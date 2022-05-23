import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdatePage extends StatefulWidget {
  final String value;
  const UpdatePage({required this.value});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController updateController = TextEditingController();
  final ref= FirebaseDatabase.instance.ref().child("Tasks");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: ((value) {
                      if (value != null && value.isEmpty) {
                        return "Enter Updated Vallue";
                      }
                      return null;
                    }),
                    controller: updateController,
                    decoration: InputDecoration(
                        hintText: "Enter the update value",
                        border: OutlineInputBorder()),
                  ),
                  IconButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                          formKey.currentState!.save();
                        String text = updateController.text;
                        ref.child(widget.value).set(text);
                        Navigator.pushNamed(context, '/view');
                      },
                      icon: Icon(Icons.done))
                ],
              )),
        ),
      ),
    );
  }
}
