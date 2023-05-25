class LandingCardModel {
  String backgroundColor;
  String title;
  String desc;
  double value;
  String fontColor;

  LandingCardModel({
    required this.backgroundColor,
    required this.title,
    required this.desc,
    required this.value,
    required this.fontColor,
  });
}

var kDashCardTemp = [
  LandingCardModel(
    backgroundColor: '#2196f3',
    title: 'All Users',
    desc: '3.2K',
    fontColor: '#ffffff',
    value: 1.2,
  ),
  LandingCardModel(
    backgroundColor: '#009688',
    title: 'All Leasons',
    desc: '120+',
    fontColor: '#ffffff',
    value: 3.2,
  ),
  LandingCardModel(
    backgroundColor: '#ef9a9a',
    title: 'Earn',
    desc: '\$25.99',
    fontColor: '#ffffff',
    value: 23,
  ),
];
