class NewsData {
  String? title;
  String? author;
  String? content;
  String? urlToImage;
  String? date;

  //let's create the constructor
  NewsData(
    this.title,
    this.author,
    this.content,
    this.date,
    this.urlToImage,
  );

  //we will use dummy data to generate the news,but you can use a third party api or your own backend to extract the data
  //I will copy the data from my previous code, you can create your own data , I used newsApi to get the data
  static List<NewsData> breakingNewsData = [
    NewsData(
        "CAN-2024 : la CAF confirme les dates de la compétition en Côte d'Ivoire",
        "Romain HOUEIX",
        "La 34e édition de la Coupe d'Afrique des Nations aura lieu en Côte d'Ivoire du 13 janvier au 11 février 2024, a annoncé jeudi la Confédération africaine de football (CAF).",
        "Publié le : 31/03/2023 - 10:27",
        "https://s.france24.com/media/display/455fd636-cf99-11ed-a9ac-005056bfb2b6/w:980/p:16x9/000_32BV3P2.webp"),
    NewsData(
        "CAN-2024 : le Sénégal, l'Algérie, la Tunisie et le Burkina valident leur qualification",
        "Romain HOUEIX",
        "La quatrième journée des éliminatoires de la CAN-2024 a permis aux premiers pays de valider leur qualification pour la phase finale en Côte d'Ivoire. Parmi eux : l'Algérie, la Tunisie, le Sénégal, le Burkina Faso et l'Afrique du Sud.",
        "Publié le : 09/04/2023 - 20:44",
        "https://s.france24.com/media/display/cd292f02-cee2-11ed-a16f-005056bf30b7/w:980/p:16x9/000_33BZ882.webp"),
    NewsData(
        "CAN 2024: deux stades baptisés en hommage à Laurent Pokou et Charles Konan Banny",
        "RFI",
        "La Côte d'Ivoire, pays organisateur de la CAN 2024, a rendu hommage à l'ancien buteur des Éléphants, Laurent Pokou, et l'ancien Premier ministre ivoirien, Charles Konan Banny, pour nommer les deux derniers stades qui abriteront les matches de la compétition, qui doit se dérouler du 13 janvier au 11 février 2024. ",
        "Publié le : 09/04/2023 - 20:44",
        "https://s.rfi.fr/media/display/1afb3934-cfa4-11ed-b744-005056a90284/w:980/p:16x9/000_8RD3RZ.webp"),
  ];

  
}