import 'package:riverpod/riverpod.dart';
import 'package:state_management_with_riverpod/model/sayac_model.dart';

class SayacManager extends StateNotifier<SayacModel> {
  SayacManager() : super(SayacModel(0));

  void arttir() {
    state = SayacModel(state.sayacDegeri + 1);
  }

  void azalt() {
    state = SayacModel(state.sayacDegeri - 1);
  }
}
