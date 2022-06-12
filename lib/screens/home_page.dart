import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> ChatsNames = ["Haseeb", "Bilal"];
  TextEditingController MyTextController = TextEditingController();

  addNames() {
    setState(() {
      ChatsNames.add(MyTextController.text);
      MyTextController.clear();
    });
    print(ChatsNames);

    deleteChats(i) {
      ChatsNames.removeAt(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ElevatedButton(
        onPressed: () {
          addNames();
        },
        child: Center(child: Text("ADD HOJAO")),
      )),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          TextField(
            controller: MyTextController,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: ChatsNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      tileColor: Colors.blueAccent,
                      title: Text("${ChatsNames[index]}"),
                      trailing: Icon(Icons.delete),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
