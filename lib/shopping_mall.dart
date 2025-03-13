import 'dart:io';
import 'package:my_project/product.dart';

class ShoppingMall {
  List<Product> products = [
    //상품 목록
    Product('shirt', 45000),
    Product('dress', 30000),
    Product('tShirt', 35000),
    Product('shorts', 38000),
    Product('socks', 5000),
  ];
  List<String> buyCart = []; //장바구니 리스트 초기화

  int totalPrice = 0; //장바구니에 담긴 상품 총 가격 저장해 놓는 변수

  void showProducts() {
    //상품 목록과 가격 출력
    for (int i = 0; i < products.length; i++) {
      print('${products[i].name} / ${products[i].price}원');
    }
  }

  void addToCart() {
    stdout.write('장바구니에 담을 상품 이름을 입력해 주세요 !');
    String? item = stdin.readLineSync(); //상품 이름 입력

    if (item == null || item.isEmpty) {
      //입력값이 null 또는 빈 값일 때 문구 출력하고 리턴
      print('입력값이 올바르지 않아요 !');
      return;
    }

    Product product = products.firstWhere(
      //검색한 상품 이름이 상품 목록에 있는지 확인, 없다면 빈 값을 반환
      (product) => item == product.name,
      orElse: () => Product('', 0),
    );

    if (product.name.isEmpty) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    buyCart.add(item); //장바구니 아이템 목록 추가

    stdout.write('상품 개수를 입력해 주세요 !');
    String qtyStr =
        stdin.readLineSync() ?? '0'; //상품 개수 입력, 입력 값이 null일 때 '0' 반환환
    int? qty = int.tryParse(qtyStr); //입력한 값 int?형으로 변환

    if (qty == null) {
      //입력값이 null 또는 0보다 적을 때 문구 출력 후 리턴
      print('입력값이 올바르지 않아요 !');
      return;
    } else if (qty <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
    } else {
      print('장바구니에 상품이 담겼어요 !');
    }

    totalPrice += product.price * qty; //장바구니 총 가격 (상품*개수)만큼 더하기기
  }

  void showTotal() {
    //장바구니에 담긴 상품 목록과 총 가격 출력력
    if (totalPrice == 0) {
      print('장바구니에 담긴 상품이 없습니다 !');
    } else {
      print('장바구니에 $buyCart(이)가 담겨있네요. 총 $totalPrice원 입니다 !');
    }
  }
}
