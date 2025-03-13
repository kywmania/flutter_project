import 'dart:io';
import 'package:my_project/shopping_mall.dart';

void main() {
  ShoppingMall mall = ShoppingMall();

  while (true) {
    //메뉴 출력
    print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [5] 삭제한 장바구니 불러오기기 / [6] 장바구니 초기화',
    );

    switch (mall.menu()) {
      //메뉴 선택
      case 1:
        mall.showProducts();
        break;
      case 2:
        mall.addToCart();
        break;
      case 3:
        mall.showTotal();
        break;
      case 4: //종료할 건지 한 번 더 확인
        mall.confirmExit();
        break;
      case 5:
<<<<<<< HEAD
        print('삭제한 장바구니를 불러옵니다 !'); //삭제했던 장바구니 목록을 불러옴옴
        mall.totalPrice = mall.removedTotalPrice;
        mall.buyCart = mall.removedCart;
        break;
      case 6: //장바구니 상품목록, 가격 초기화
        if (mall.totalPrice == 0) {
          print('이미 장바구니가 비어있습니다 !');
        } else {
          print('장바구니를 초기화합니다 !'); //장바구니를 초기화 하면서 초기화 된 값을 다른 리스트에 저장
          mall.removedTotalPrice = mall.totalPrice;
          mall.totalPrice = 0;
          mall.removedCart.addAll(mall.buyCart);
          mall.buyCart.clear();
        }
=======
        mall.restoreRemovedCart();
        break;
      case 6: //장바구니 상품목록, 가격 초기화
        mall.clearCart();
>>>>>>> ef76e43 (객체지향 방식으로 함수 분리)
        break;
      default: //잘못된 메뉴 선택 시 출력
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
        break;
    }
  }
}
