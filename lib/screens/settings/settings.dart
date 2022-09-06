import 'package:ekraft/utils/slide.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> _options = [
    "FAQs",
    "About Us",
    "Request Call Back",
  ];

  void action(BuildContext context, int ix) {
    if (ix == 2) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            children: [
              const ListTile(
                title: Text(
                  "Request Call Back",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 8,
                ),
                child: Text(
                  "We usually respond within 24 hours",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Send Request"),
                ),
              )
            ],
          );
        },
      );
      return;
    }

    Navigator.push(
      context,
      slidingRoute(
        Scaffold(
          appBar: AppBar(
            title: Text(_options[ix]),
          ),
          body: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euismod nunc. "
              "Sed euismod, nisl sed lacinia lacinia, nunc nisl aliquam mauris, "
              "sit amet ultricies nunc nisl euism",
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_options[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => action(context, index),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: _options.length,
      ),
    );
  }
}
