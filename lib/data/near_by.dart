class NearBy {
  final int id;
  final String name;
  final String image;
  final String location;
  final String rating;
  final String status;

  const NearBy({this.id = -1, this.name = "", this.image = "", this.location = "", this.rating = "", this.status = ""});
}

class NearByList {
  static List<NearBy> list() {
    const data = <NearBy> [
      NearBy(
        id: 1,
        name: 'Aristo Gents Salon',
        image: 'assets/images/nearby/1.png',
        location: 'Captown City',
        rating: '4.0',
        status: 'open'
      ),
      NearBy(
        id: 2,
        name: 'Hiphop Salon',
        image: 'assets/images/nearby/2.png',
        location: 'Montan Plaza',
        rating: '4.5',
        status: 'close'
      ),
      NearBy(
          id: 3,
          name: 'Modern BB Shop',
          image: 'assets/images/nearby/3.png',
          location: 'Nobin Tower',
          rating: '4.5',
          status: 'close'
      ),
    ];
    return data;
}
}