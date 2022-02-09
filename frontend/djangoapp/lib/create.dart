import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreatePage extends StatefulWidget {
  final Client client;

  const CreatePage({Key? key, required this.client}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var createUrl = Uri.parse("http://10.0.2.2:8000/notes/create/");

  @override
  Widget build(BuildContext context) {
    TextEditingController controler = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controler,
          ),
          ElevatedButton(
              onPressed: () {
                widget.client.post(createUrl, body: {'body': controler.text});
                Navigator.pop(context);
              },
              child: Text('Create Note'))
        ],
      ),
    );
  }
}
