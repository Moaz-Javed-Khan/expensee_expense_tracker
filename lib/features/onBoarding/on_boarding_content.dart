class OnboardingContent {
  String image = "a";
  String title = "b";
  String description = "c";

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: "Gain total control\nof your money",
    image: "assets/onBoarding1.png",
    description: "Become you own money manager\nand make every cent count",
  ),
  OnboardingContent(
    title: 'Know where your\nmoney goes',
    image: "assets/onBoarding2.png",
    description:
        "Track your transaction easily,\nwith categories and financial report",
  ),
  OnboardingContent(
    title: 'Planning\nahead ',
    image: "assets/onBoarding3.png",
    description: "Setup your budget for each category\nso you in comtrol",
  ),
];
