import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UpdatePage extends StatefulWidget {
  final Client client;
  final int id;
  final String note;

  const UpdatePage(
      {Key? key, required this.client, required this.id, required this.note})
      : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();
  Client client = http.Client();
  @override
  void initState() {
    controller.text = widget.note;
    super.initState();
  }

  void _updateNote(int id) {
    var updateUrl = Uri.parse("http://10.0.2.2:8000/notes/${id}/update/");
    client.put(updateUrl, body: {'body': controller.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                _updateNote(widget.id);
                Navigator.pop(context);
              },
              child: Text('Update Note'))
        ],
      ),
    );
  }
}
