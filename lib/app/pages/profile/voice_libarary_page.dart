import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talkie/app/common/widgets/app_button.dart';
import 'package:talkie/app/pages/profile/profile_page.dart';
import 'package:talkie/style/app_color.dart';



class VoiceLibraryPage extends StatefulWidget {
  const VoiceLibraryPage({super.key});

  static Future<dynamic> navigate(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => withBlocProvider(), fullscreenDialog: true),
    );
  }

  static Widget withBlocProvider() {
    return VoiceLibraryPage();
  }

  @override
  State<VoiceLibraryPage> createState() => _VoiceLibraryPageState();
}

class _VoiceLibraryPageState extends State<VoiceLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Voice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(16)
                ),
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return VoiceLibraryTile();
                  },
                  itemCount: 4,
                ),
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
                  ProfilePage.navigate(context);
                }))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VoiceLibraryTile extends StatelessWidget {
  const VoiceLibraryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset('assets/svg/icon_audio.svg'),
      title: Text('Charming Lady', style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),),
      subtitle: Row(
        children: [
          BadgeText('{gender}'),
          SizedBox(width: 8,),
          BadgeText('{age}'),
          SizedBox(width: 8,),
          BadgeText('{character}'),
        ],
      ),
      trailing: Image.asset('assets/images/uncheck_round.png'),
    );
  }
}

class BadgeText extends StatelessWidget {
  final String text;

  const BadgeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kAccentColor.withOpacity(.1)),
      child: Text(text, style: TextStyle(
        color: Colors.white, fontSize: 10,
      ),),
    );
  }
}
