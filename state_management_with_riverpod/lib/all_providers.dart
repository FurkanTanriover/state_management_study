import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_with_riverpod/model/cat_facts_model.dart';
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

final catFactsClientProvider = Provider<Dio>(
  (ref) {
    return Dio(BaseOptions(baseUrl: 'https://catfact.ninja/'));
  },
);

final catFactsProvider = FutureProvider.autoDispose
    .family<List<CatFactsModel>, Map<String, dynamic>>(
        (ref, parametreMapi) async {
  final _dio = ref.watch(catFactsClientProvider);
  final _result = await _dio.get('facts', queryParameters: parametreMapi);
  List<Map<String, dynamic>> _mapData = List.from(_result
      .data['data']); //List.from içindeki değerlerle yeni bir liste oluşturur
  List<CatFactsModel> _catFactsModelList =
      _mapData.map((e) => CatFactsModel.fromMap(e)).toList();

  return _catFactsModelList;
});
