class Gallery {
  final int id;
  final String name;
  final String image;

  const Gallery({this.id = -1, this.name = "", this.image = ""});
}

class GalleryList {
  static List<Gallery> list() {
    const data = <Gallery> [
      Gallery(
        id: 1,
        name: 'Hair Care',
        image: 'assets/images/gallery/1.png'
      ),
      Gallery(
          id: 2,
          name: 'Makeover',
          image: 'assets/images/gallery/2.png'
      ),
    ];
    return data;
}
}