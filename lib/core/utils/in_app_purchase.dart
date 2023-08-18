import 'dart:async';
import 'package:gpt_flutter/core/config/comom.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class Iap {
  
  Iap._();

  static final Iap shared = Iap._();

   List<ProductDetails>? products;

  //持有
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  load() {
        loadProducts();
  }

  init() {
    final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    }) as StreamSubscription<List<PurchaseDetails>>;
  }


  ///加载产品, 打开app就先加载, 加载错误不显示,或者显示其它页面, 循环加载

  //TODO: 替换id
  Future<List<ProductDetails>?> loadProducts() async {
    // Set literals require Dart 2.2. Alternatively, use
// `Set<String> _kIds = <String>['product1', 'product2'].toSet()`.
    const Set<String> _kIds = <String>{'product1', 'product2'};
    try{
      final ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      // Handle the error.
      return null;
    }
    products = response.productDetails;
    }catch (e){

      logDev('load product failure.');
      Future.delayed(Duration(seconds: 3),(){
        loadProducts();
      });

    }
           return null;
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // _showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            _deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
          }
        }

        //这里要完成他, 不然下次买会出错
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }

  //TODO: 价格改变的时候通知用户.. 不然用户不会自动续订.... (还不如新建订阅...避免用户没确认而导致没续订..!!! )
  // 定价很重要, 后面尽量不要改

  ///TODO: 后台验证?
  _verifyPurchase(PurchaseDetails purchaseDetails) {}

  ///TODO: 无效的购买
  _handleInvalidPurchase(PurchaseDetails purchaseDetails) {}

  ///TODO: 购买成功,后台添加数据
  Future<bool> _deliverProduct(PurchaseDetails purchaseDetails) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

 


  purchase(ProductDetails productDetails) {

    if (products == null) {
      return;
    }
   
final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
  // if (_isConsumable(productDetails)) {
  //   InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  // } else {
  //   InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  // }

  //订阅型, 非消耗品
  InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }


// //TODO: ???
//   _isConsumable(ProductDetails productDetails) {

//   }

  Future<bool> restore() async {
    await InAppPurchase.instance.restorePurchases();
    return true;

  }


  release() {
    _subscription.cancel();
  }


}
