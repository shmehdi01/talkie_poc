import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talkie/app/common/widgets/app_button.dart';
import 'package:talkie/app/pages/profile//voice_libarary_page.dart';
import 'package:talkie/style/app_color.dart';

class CreateCharacterPage extends StatefulWidget {
  const CreateCharacterPage({super.key});

  static Future<dynamic> navigate(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => withBlocProvider(), fullscreenDialog: true),
    );
  }

  static Widget withBlocProvider() {
    return CreateCharacterPage();
  }

  @override
  State<CreateCharacterPage> createState() => _CreateCharacterPageState();
}

class _CreateCharacterPageState extends State<CreateCharacterPage> {
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _fromCreateCharacter(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: kAccentColor,
                      ),
                    ),
                  ),
                ),
                Expanded(child: PrimaryButton(text: 'Next', onPressed: () {
                  VoiceLibraryPage.navigate(context);
                }))
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _fromCreateCharacter() {
    return Column(
      children: [
        CardLabel(
          label: 'Name*',
          child: TextFormField(
            decoration: InputDecoration(hintText: "Character's Name"),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CardLabel(
          label: 'Intro*',
          child: TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            minLines: 3,
            decoration: InputDecoration(
              hintText:
                  'Adding an interesting introduction can enhance the appeal of your character',
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CardLabel(
          label: 'Description *',
          child: TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            minLines: 3,
            decoration: InputDecoration(
              hintText:
                  'Add settings to enrich the chat persona of your character. ex) Name, Age, Job, Likes, Dislikes',
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CardLabel(
          label: 'First Message *',
          child: TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            minLines: 3,
            decoration: InputDecoration(
              hintText:
                  "A character's first line or prologue that stimulates curiosity and charm",
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CardLabel(
          label: 'Voice *',
          child: StrokeButton(
            onPressed: () {
              VoiceLibraryPage.navigate(context);
            },
            text: "Add Voice",
          ),
        ),
      ],
    );
  }
}

class CardLabel extends StatelessWidget {
  final String label;
  final Widget child;

  const CardLabel({super.key, required this.child, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: kCardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(
            height: 10,
          ),
          child,
        ],
      ),
    );
  }
}
