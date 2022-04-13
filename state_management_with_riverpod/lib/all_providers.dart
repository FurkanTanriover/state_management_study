import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_with_riverpod/model/bina_model.dart';
import 'package:state_management_with_riverpod/model/cat_facts_model.dart';
import 'package:state_management_with_riverpod/model/sayac_model.dart';
import 'package:state_management_with_riverpod/sayac_manager.dart';

final titleProvider = Provider<String>((ref) => "Riverpod Basics");
final titleProvider2 = Provider<String>((ref) => "State Notifier");
final textProvider = Provider<String>((ref) {
  return "Butona basılma sayısı";
});
final tokenProvider = Provider<String>(((ref) =>
    "Token aeb9a97833b3063a226904c1e4e738133a0f35274c7e8fd362d7433dbe8d11f0"));

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

final boaClientProvider = Provider<Dio>(
  (ref) {
    var token = ref.watch(tokenProvider);
    return Dio(BaseOptions(
        baseUrl: 'https://boatakip.com/api/',
        headers: {"Authorization": token}));
  },
);

final binaModelProvider = FutureProvider<List<BinaModel>>((ref) async {
  final _dio = ref.watch(boaClientProvider);
  final _result = await _dio.get('bina');
  List<Map<String, dynamic>> _mapData = List.from(_result.data[
      'binalar']); //List.from içindeki değerlerle yeni bir liste oluşturur
  List<BinaModel> _binaModelList =
      _mapData.map((e) => BinaModel.fromMap(e)).toList();

  return _binaModelList;
});
