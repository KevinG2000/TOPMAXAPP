class Offers {
  final int id;
  final String name;
  final String image;
  final String discount;
  final String oldPrice;
  final String newPrice;
  final String couponCode;

  const Offers({this.id = -1, this.name = "", this.image = "", this.discount = "", this.oldPrice = "", this.newPrice = "", this
      .couponCode = ""});
}

class OffersList {
  static List<Offers> list() {
    const data = <Offers> [
      Offers(
        id: 1,
        name: 'Hair cut',
        image: 'assets/images/best_service/1.png',
        discount: '20',
        oldPrice: '200',
        newPrice: '160',
        couponCode: '123456'
      ),
      Offers(
          id: 2,
          name: 'Facial',
          image: 'assets/images/best_service/2.png',
          discount: '20',
        oldPrice: '200',
        newPrice: '160',
        couponCode: '741258'
      ),
      Offers(
          id: 3,
          name: 'hair Treatment',
          image: 'assets/images/best_service/3.png',
          discount: '15',
        oldPrice: '100',
        newPrice: '85',
        couponCode: '852369'
      ),
      Offers(
          id: 4,
          name: 'Makeup',
          image: 'assets/images/best_service/3.png',
          discount: '30',
        oldPrice: '100',
        newPrice: '70',
        couponCode: '789654'
      ),
      Offers(
          id: 5,
          name: 'Spa',
          image: 'assets/images/best_service/3.png',
          discount: '10',
        oldPrice: '50',
        newPrice: '45',
        couponCode: '369852'
      ),
      Offers(
          id: 6,
          name: 'Body Message',
          image: 'assets/images/best_service/1.png',
          discount: '50',
        oldPrice: '150',
        newPrice: '75',
        couponCode: 'asdcfv'
      ),
    ];
    return data;
}
}