import 'package:flutter/material.dart';

class FeedbacksPage extends StatefulWidget {
  final String productName;
  const FeedbacksPage({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  State<FeedbacksPage> createState() => _FeedbacksPageState();
}

class _FeedbacksPageState extends State<FeedbacksPage> {
  List<String> feedbacks = [];

  void addFeedback(String feedback) {
    if (feedback.isEmpty) return;
    feedbacks.add(feedback);
    feedbackController.clear();
    setState(() {});
  }

  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'productname',
          child: Material(
            color: Colors.transparent,
            child: Text(widget.productName),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(feedbacks[index]),
          );
        },
        itemCount: feedbacks.length,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: feedbackController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: 'Enter your feedback',
                ),
                onSubmitted: addFeedback,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                addFeedback(feedbackController.text);
              },
              icon: const Icon(Icons.send_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
