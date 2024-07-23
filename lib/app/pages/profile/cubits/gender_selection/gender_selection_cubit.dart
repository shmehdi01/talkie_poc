import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talkie/app/domain/models/gender_enum.dart';

part 'gender_selection_state.dart';

class GenderSelectionCubit extends Cubit<GenderSelectionState> {
  GenderSelectionCubit() : super(GenderSelectionState());

  void setGender(Gender gender) {
    emit(GenderSelectionState(gender: gender));
  }
}
