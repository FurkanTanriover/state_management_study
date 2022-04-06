import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_with_riverpod/model/sayac_model.dart';
import 'package:state_management_with_riverpod/sayac_manager.dart';

final titleProvider = Provider<String>((ref) => "Riverpod Basics");
final titleProvider2 = Provider<String>((ref) => "State Notifier");
final textProvider = Provider<String>((ref) {
  return "Butona basılma sayısı";
});

final sayacStateProvider = StateProvider<int>((ref) {
  return 0;
});

// çağırdığımız yerde .notifier diyerek SayacManagera direkt provider ile SayacModele erişebiliriz
final sayacNotifierProvider =
    StateNotifierProvider<SayacManager, SayacModel>((ref) {
  return SayacManager();
});

final ciftMiProvider = Provider<bool>((ref) {
  var sayacModel = ref.watch(sayacNotifierProvider);
  if (sayacModel.sayacDegeri % 2 == 0) {
    return true;
  } else {
    return false;
  }
});
