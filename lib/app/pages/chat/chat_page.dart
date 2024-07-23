import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static Future<dynamic> navigate(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => withBlocProvider(), fullscreenDialog: true),
    );
  }

  static Widget withBlocProvider() {
    return ChatPage();
  }

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png',),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: _chats()),
            textField(),
          ],
        ),
      ),
    );
  }

  Widget _chats() {
    return ListView.builder(
      itemBuilder: (_, index) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Align(
            child: ChatTile(
              isIntro: index == 1,
            ),
            alignment: Alignment.centerLeft,
          ),
        );
      },
      itemCount: 2,
      reverse: true,
    );
  }

  Widget textField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          //color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                offset: Offset(0, 1),
                blurRadius: 3)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jane",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Type a message..',
                fillColor: Colors.white.withOpacity(.12),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                )),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final bool isIntro;

  const ChatTile({super.key, required this.isIntro});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isIntro ? Colors.black.withOpacity(.8): Color(0xFF877A4E),
      ),
      child: SizedBox(
          width: MediaQuery.sizeOf(context).width * .7,
          child: Text(
              "Taking a deep breath, Yuzu gently knocks on the door and whispers.Good morning, master. It's time to wake up. nyang")),
    );
  }
}
