import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkie/app/common/widgets/app_button.dart';
import 'package:talkie/app/pages/profile//create_character_page.dart';
import 'package:talkie/style/app_color.dart';

class CreateImagePage extends StatefulWidget {
  const CreateImagePage({super.key});

  static Future<dynamic> navigate(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => withBlocProvider(), fullscreenDialog: true),
    );
  }

  static Widget withBlocProvider() {
    return CreateImagePage();
  }

  @override
  State<CreateImagePage> createState() => _CreateImagePageState();
}

class _CreateImagePageState extends State<CreateImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      appBar: AppBar(
        title: Text('Create Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    faceImageWidget(context),
                    SizedBox(height: 22,),
                    imagePromptWidget(context),

                  ],
                ),
              ),
            ),
            PrimaryButton(text: 'Generate', onPressed: () {
              CreateCharacterPage.navigate(context);
            }, width: MediaQuery.sizeOf(context).width,)
          ],
        ),
      ),
    );
  }

  Container faceImageWidget(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: kCardColor, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Face Image (Optional)"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  decoration: BoxDecoration(
                      color: kCardLightColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Image.asset('assets/images/face_icon.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Upload a face image\nto imitate its features",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Container imagePromptWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: kCardColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Image Prompt (Optional)"),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: kCardLightColor,
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "e.g. soft moonlight, a girl in red velvet dress, silver hair, wide angle, anime style",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
