import 'dart:async';
import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchant_instance.dart';
import 'package:DeCarbon/api/merchants/merchants_profile_repository.dart';
import 'package:DeCarbon/models/MerchantProfile.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'merchants_profile_event.dart';
part 'merchants_profile_state.dart';

class MerchantsProfileBloc extends Bloc<MerchantsProfileEvent, MerchantsProfileState> {
  MerchantsProfileBloc() : super(MerchantsProfileInitial());

  @override
  Stream<MerchantsProfileState> mapEventToState(
    MerchantsProfileEvent event,
  ) async* {
    if (event is GetMerchantsProfile) {
      yield MerchantsProfileLoading();

      try {
        final response = await MerchantsProfileRepository.getMerchantProfile(
          loginId: event.loginId,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsProfileLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            MerchantInstance.instance.profile = MerchantProfile.fromJson(
                jsonDecode(response.toString())['result']);
            // MerchantInstance.instance.profile = jsonDecode(response.toString())['result'];
            yield MerchantsProfileLoaded(
                jsonDecode(response.toString())['result']);
          } else {
            yield MerchantsProfileLoadError();
          }
        }
      } catch (e) {
        yield MerchantsProfileLoadError();
      }
    } else if (event is UpdateMerchantsProfile) {
      yield MerchantsProfileUpdating();

      try {
        final response = await MerchantsProfileRepository.updateMerchant(
          data: event.postData,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsProfileUpdateError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsProfileUpdated();
          } else {
            yield MerchantsProfileUpdateError();
          }
        }
        print(response);
      } catch (e) {
        yield MerchantsProfileUpdateError();
      }
    }
  }
}
