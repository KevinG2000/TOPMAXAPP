class PopularCategory {
  final int id;
  final String name;
  final String image;
  final String places;

  const PopularCategory({this.id = -1, this.name = "", this.image = "", this.places = ""});
}

class PopularCategoryList {
  static List<PopularCategory> list() {
    const data = <PopularCategory> [
      PopularCategory(
        id: 1,
        name: 'Hair Cut',
        image: 'assets/images/popular_category/1.png',
        places: '78',
      ),
      PopularCategory(
        id: 2,
        name: 'Style Saving',
        image: 'assets/images/popular_category/2.png',
        places: '82',
      ),
      PopularCategory(
        id: 3,
        name: 'Hair Treatment',
        image: 'assets/images/popular_category/3.png',
        places: '52',
      ),
      PopularCategory(
        id: 4,
        name: 'Body Message',
        image: 'assets/images/popular_category/4.png',
        places: '11',
      ),

    ];
    return data;
}
}