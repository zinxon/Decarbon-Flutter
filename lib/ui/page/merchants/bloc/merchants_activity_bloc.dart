import 'dart:async';
import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchants_activity_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'merchants_activity_event.dart';
part 'merchants_activity_state.dart';

class MerchantsActivityBloc
    extends Bloc<MerchantsActivityEvent, MerchantsActivityState> {
  MerchantsActivityBloc() : super(MerchantsActivityInitial());

  @override
  Stream<MerchantsActivityState> mapEventToState(
    MerchantsActivityEvent event,
  ) async* {
    if (event is GetMerchantsActivityList) {
      yield MerchantsActivityListLoading();

      try {
        final response = await MerchantsActivityRepository.getActivityList(
          merchantsId: event.merchantsId,
          storeId: event.storeId,
          loginId: event.loginId,
          loginType: event.loginType,
          limit: event.limit,
          offset: event.offset,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsActivityListLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsActivityListLoaded(
                jsonDecode(response.toString())['result']);
          } else {
            yield MerchantsActivityListLoadError();
          }
        }
      } catch (e) {
        yield MerchantsActivityListLoadError();
      }
    } else if (event is CreateMerchantsActivity) {
      yield MerchantsActivityUploading();

      try {
        final response = await MerchantsActivityRepository.createActivity(
          data: event.postData,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsActivityUploadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsActivityUploaded();
          } else {
            yield MerchantsActivityUploadError();
          }
        }
      } catch (e) {
        yield MerchantsActivityUploadError();
      }
    } else if (event is GetMerchantsActivityDetails) {
      yield MerchantsActivityDetailsLoading();

      try {
        final response = await MerchantsActivityRepository.getSpecificActivity(
          merchantsId: event.merchantsId,
          storeId: event.storeId,
          loginId: event.loginId,
          loginType: event.loginType,
          activityId: event.activityId,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsActivityDetailsLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsActivityDetailsLoaded(
              jsonDecode(response.toString())['result'],
            );
          } else {
            yield MerchantsActivityDetailsLoadError();
          }
        }
      } catch (e) {
        yield MerchantsActivityDetailsLoadError();
      }
    } else if (event is DeleteSpecificMerchantsActivity) {
      yield MerchantsActivityDeleteLoading();

      try {
        final response =
            await MerchantsActivityRepository.deleteSpecificMerchantsActivity(
          merchantsId: event.merchantsId,
          storeId: event.storeId,
          loginId: event.loginId,
          loginType: event.loginType,
          activityId: event.activityId,
        );
        print(response);
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsActivityDeleteError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsActivityDeleteLoaded();
          } else {
            yield MerchantsActivityDeleteError();
          }
        }
      } catch (e) {
        yield MerchantsActivityDeleteError();
      }
    }
  }
}
