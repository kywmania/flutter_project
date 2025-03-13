import 'dart:io';
import 'package:my_project/shopping_mall.dart';

int? menu() {
  stdout.write('원하시는 메뉴를 선택해주세요 !');
  String menuStr = stdin.readLineSync() ?? '0';
  return int.tryParse(menuStr);
}

void main() {
  ShoppingMall mall = ShoppingMall();

  while (true) {
    //메뉴 출력
    print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [5] 프로그램 즉시 종료 / [6] 장바구니 초기화',
    );

    switch (menu()) {
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
        print('정말 종료하시겠습니까 ? \n 5를 입력하면 종료됩니다 !');
        if (menu() == 5) {
          exit(0);
        } else {
          print('종료하지 않습니다.');
        }
        break;
      case 5:
        exit(0);
      case 6: //장바구니 상품목록, 가격 초기화화
        if (mall.totalPrice == 0) {
          print('이미 장바구니가 비어있습니다 !');
        } else {
          print('장바구니를 초기화합니다 !');
          mall.totalPrice = 0;
          mall.buyCart.clear();
        }
        break;
      default: //잘못된 메뉴 선택 시 출력
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
        break;
    }
  }
}
