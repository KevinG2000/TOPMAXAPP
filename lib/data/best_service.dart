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
          name: 'Leg Press',
          image: 'assets/images/best_service/1.png',
          location: 'AI Fitness Center',
          rating: '4.0',
          status: 'open',
        serviceList: ['Add Tracking', 'Maximum Value', 'Progress Chart', 'Delete'],
        service: '20',
      ),
      BestService(
          id: 2,
          name: 'Sit Up',
          image: 'assets/images/best_service/2.png',
          location: 'AI Fitness Center',
          rating: '4.5',
          status: 'close',
        serviceList: ['Add Tracking', 'Maximum Value', 'Progress Chart', 'Delete'],
        service: '20',
      ),
      BestService(
          id: 3,
          name: 'Running',
          image: 'assets/images/best_service/3.png',
          location: 'Outdoor Fitness',
          rating: '4.5',
          status: 'close',
        serviceList: ['Add Tracking', 'Maximum Value', 'Progress Chart', 'Delete'],
        service: '20',
      ),
    ];
    return data;
  }
}