class BestService {
  final int id;
  final String name;
  final String image;
  final String location;
  final String rating;
  final String status;
  final List<String>? serviceList;
  final String service;

  const BestService({this.id = -1, this.name = "", this.image = "", this.location = "", this.rating = "", this.status = "",
  this.serviceList, this.service = ""});
}

class BestServiceList {
  static List<BestService> list() {
    const data = <BestService> [
      BestService(
          id: 1,
          name: 'Live Style Salon',
          image: 'assets/images/best_service/1.png',
          location: 'Captown biger city',
          rating: '4.0',
          status: 'open',
        serviceList: ['Styles', 'Trending', 'Modern', 'Casual'],
        service: '20',
      ),
      BestService(
          id: 2,
          name: 'Hoverlead Salon',
          image: 'assets/images/best_service/2.png',
          location: 'London park house',
          rating: '4.5',
          status: 'close',
        serviceList: ['Styles', 'Trending', 'Modern', 'Casual'],
        service: '20',
      ),
      BestService(
          id: 3,
          name: 'Man Style Park',
          image: 'assets/images/best_service/3.png',
          location: 'Newyork city road',
          rating: '4.5',
          status: 'close',
        serviceList: ['Styles', 'Trending', 'Modern', 'Casual'],
        service: '20',
      ),
    ];
    return data;
  }
}