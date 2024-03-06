import 'package:DeCarbon/api/APIProvider.dart';

class AppStoreAPIRepository {
  APIProvider _apiProvider;

  AppStoreAPIRepository(this._apiProvider);

  // Observable<List<AppContent>> getTop100FreeApp(){
  //   return Observable.fromFuture(_apiProvider.getTopFreeApp(TOP_100))
  //   .flatMap(_convertFromEntry)
  //   .flatMap((List<AppContent> list){
  //     return Observable.fromFuture(_loadAndSaveTopFreeApp(list, ''));
  //   });
  // }

  // Observable<List<AppContent>> getTop10FeatureApp(){
  //   return Observable.fromFuture(_apiProvider.getTopFeatureApp(TOP_10))
  //   .flatMap(_convertFromEntry)
  //   .flatMap((List<AppContent> list){
  //     return Observable.fromFuture(_loadAndSaveFeatureApp(list, ''));
  //   });
  // }

  // Observable<AppContent> getAppDetail(String id){
  //   return Observable.fromFuture(_apiProvider.getAppDetail(id))
  //   .flatMap((LookupResponse response){
  //     return Observable.just(response.results[0]);
  //   })
  //   .flatMap((AppContent appContent){
  //     return Observable.fromFuture(_loadAndSaveAppDetail(appContent));
  //   });
  // }

  // Observable<List<AppContent>> _convertFromEntry(TopAppResponse response){
  //   List<AppContent> appContent = [];
  //   for(Entry entry in response.feed.entry){
  //     appContent.add(AppContent.fromEntry(entry));
  //   }
  //   return Observable.just(appContent);
  // }

  // Future<List<AppContent>> _loadAndSaveFeatureApp(List<AppContent> list, String searchKey) async{
  //   for(var i = 0; i < list.length ; i++){
  //     AppContent app = list[i];
  //     app.order = i;
  //     app.isFeatureApp = 1;
  //     await _dbAppStoreRepository.saveOrUpdateFeatureApp(app);
  //   }
  //   List<AppContent> appList = await _dbAppStoreRepository.loadFeaturesApp(searchKey);
  //   return appList;
  // }

  // Future<List<AppContent>> _loadAndSaveTopFreeApp(List<AppContent> list, String searchKey) async{
  //   for(var i = 0; i < list.length ; i++){
  //     AppContent app = list[i];
  //     app.order = i;
  //     app.isFreeApp = 1;
  //     await _dbAppStoreRepository.saveOrUpdateTopFreeApp(app);
  //   }
  //   List<AppContent> appList = await _dbAppStoreRepository.loadTopFreeApp(searchKey);
  //   return appList;
  // }

  // Future<AppContent> _loadAndSaveAppDetail(AppContent appContent) async{
  //   await _dbAppStoreRepository.saveOrUpdateDetailApp(appContent);
  //   AppContent appDb = await _dbAppStoreRepository.loadAppDetail(appContent.trackId);
  //   return appDb;
  // }

}
