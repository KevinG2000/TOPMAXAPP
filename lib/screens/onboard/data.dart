
import 'package:salong/utils/strings.dart';

class OnBoardingItem {
  final String title;
  final String image;
  final String subTitle;
  final String subImage;

  const OnBoardingItem({this.title = "", this.image = "", this.subTitle = "", this.subImage = ""});
}

class OnBoardingItems {
  static List<OnBoardingItem> loadOnboardItem () {
    const fi = <OnBoardingItem> [
      OnBoardingItem(
        title: Strings.title1,
        image: 'assets/images/onboard/1.jpg',
        subTitle: Strings.subTitle1,
        subImage: 'assets/images/onboard/sub_image1.png',
      ),
      OnBoardingItem(
          title: Strings.title2,
        image: 'assets/images/onboard/2.jpg',
        subTitle: Strings.subTitle2,
        subImage: 'assets/images/onboard/sub_image2.png',
      ),
      OnBoardingItem(
          title: Strings.title3,
          image: 'assets/images/onboard/3.png',
        subTitle: Strings.subTitle3,
        subImage: 'assets/images/onboard/sub_image3.png',
      ),
    ];
    return fi;
  }
}