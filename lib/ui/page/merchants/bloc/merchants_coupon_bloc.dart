import 'dart:async';
import 'dart:convert';

import 'package:DeCarbon/api/merchants/merchants_coupon_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'merchants_coupon_event.dart';
part 'merchants_coupon_state.dart';

class MerchantsCouponBloc
    extends Bloc<MerchantsCouponEvent, MerchantsCouponState> {
  MerchantsCouponBloc() : super(MerchantsCouponInitial());

  @override
  Stream<MerchantsCouponState> mapEventToState(
    MerchantsCouponEvent event,
  ) async* {
    if (event is GetMerchantsCouponList) {
      yield MerchantsCouponListLoading();

      try {
        final response = await MerchantsCouponRepository.getCouponList(
          merchantsId: event.merchantsId,
          storeId: event.storeId,
          loginId: event.loginId,
          loginType: event.loginType,
          limit: event.limit,
          offset: event.offset,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsCouponListLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsCouponListLoaded(
                jsonDecode(response.toString())['result']);
          } else {
            yield MerchantsCouponListLoadError();
          }
        }
      } catch (e) {
        yield MerchantsCouponListLoadError();
      }
    } else if (event is CreateMerchantsCoupon) {
      yield MerchantsCouponUploading();

      try {
        final response = await MerchantsCouponRepository.createCoupon(
          data: event.postData,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsCouponUploadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsCouponUploaded();
          } else {
            yield MerchantsCouponUploadError();
          }
        }
      } catch (e) {
        yield MerchantsCouponUploadError();
      }
    } else if (event is GetMerchantsCouponDetails) {
      yield MerchantsCouponDetailsLoading();

      try {
        final response = await MerchantsCouponRepository.getSpecificCoupon(
          merchantsId: event.merchantsId,
          storeId: event.storeId,
          loginId: event.loginId,
          loginType: event.loginType,
          couponId: event.couponId,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsCouponDetailsLoadError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsCouponDetailsLoaded(
              jsonDecode(response.toString())['result'],
            );
          } else {
            yield MerchantsCouponDetailsLoadError();
          }
        }
      } catch (e) {
        yield MerchantsCouponDetailsLoadError();
      }
    } else if (event is DeleteSpecificMerchantsCoupon) {
      yield MerchantsCouponDeleteLoading();

      try {
        final response = await MerchantsCouponRepository.deleteSpecificCoupon(
          merchantsId: event.merchantsId,
          storeId: event.storeId,
          loginId: event.loginId,
          loginType: event.loginType,
          couponId: event.couponId,
        );
        if (response.statusCode < 200 || response.statusCode > 299) {
          yield MerchantsCouponDeleteError();
        } else {
          if (jsonDecode(response.toString())['success']) {
            yield MerchantsCouponDeleteLoaded();
          } else {
            yield MerchantsCouponDeleteError();
          }
        }
      } catch (e) {
        yield MerchantsCouponDeleteError();
      }
    }
  }
}
