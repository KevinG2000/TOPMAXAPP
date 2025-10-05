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
        name: 'Bachata Workout',
        image: 'assets/images/nearby/1.png',
        location: 'Iron District Munich',
        rating: '4.0',
        status: 'starting soon'
      ),
      NearBy(
        id: 2,
        name: 'Hiphop Workout',
        image: 'assets/images/nearby/2.png',
        location: 'Cologne Studio',
        rating: '4.5',
        status: 'live'
      ),
      NearBy(
          id: 3,
          name: 'Reaggeton Workout',
          image: 'assets/images/nearby/3.png',
          location: 'Muscle Lab Pulheim',
          rating: '4.5',
          status: 'finished'
      ),
    ];
    return data;
}
}