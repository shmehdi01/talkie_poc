import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkie/app/common/widgets/app_button.dart';
import 'package:talkie/app/domain/models/gender_enum.dart';
import 'package:talkie/app/pages/profile//create_image_page.dart';
import 'package:talkie/app/pages/profile//cubits/gender_selection/gender_selection_cubit.dart';
import 'package:talkie/app/pages/profile//widgets/card_gender.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({super.key});

  static Widget withBlocProvider() {
    return BlocProvider(
      create: (context) => GenderSelectionCubit(),
      child: const GenderSelectionPage(),
    );
  }

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<GenderSelectionCubit, GenderSelectionState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardGender(
                        text: 'Boy',
                        imagePath: 'boy.png',
                        isSelected: state.gender == Gender.boy,
                        onTap: () => context.read<GenderSelectionCubit>().setGender(Gender.boy),
                      ),
                      CardGender(
                        text: 'Girl',
                        imagePath: 'girl.png',
                        isSelected: state.gender == Gender.girl,
                        onTap: () => context.read<GenderSelectionCubit>().setGender(Gender.girl),
                      ),
                      CardGender(
                        text: 'Non Binary',
                        imagePath: 'non_binary.png',
                        isSelected: state.gender == Gender.nonBinary,
                        onTap: () => context.read<GenderSelectionCubit>().setGender(Gender.nonBinary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    text: 'Start',
                    onPressed: state.gender == null ? null : () {
                      CreateImagePage.navigate(context);
                    },
                    width: MediaQuery.sizeOf(context).width,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
