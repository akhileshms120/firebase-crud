import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   final _key = GlobalKey<FormState>();
   late DatabaseReference _ref;
  TextEditingController _controller = TextEditingController();
  
  

  @override
  void initState() {
    
    super.initState();

    _controller = TextEditingController();
    _ref = FirebaseDatabase.instance.ref().child("Tasks");
  }



  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Store Data"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Form(
         key: _key,
          child: Column(
            
            children: [
              TextFormField(
                
                validator: (value) {
                  if(value!=null && value.isEmpty){
                    return "Enter the value here";

                  }
                  return null;
                },
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type here",
                  border: OutlineInputBorder()

                ),
              ),
              ElevatedButton.icon(onPressed: (){
                 if(!_key.currentState!.validate()){
                   return ;
                 }
                 _key.currentState!.save();
                 _ref.push().set(_controller.text).then((value) =>Navigator.pushNamed(context, "/view"));

                    print(_ref);
                    print(_controller.text);
            
              }, icon: Icon(Icons.taxi_alert), label: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}