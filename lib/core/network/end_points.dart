const baseUrl = "https://newsapi.org/v2/";
const topHeadLine = "top-headlines?";
const country = "country=sa&";
const apiKey = "apiKey=071e56547767401aaccfb656647ab8c2";
const topHeadLineEndPoint = '$baseUrl$topHeadLine$country$apiKey';
String topHeadLineEndPointWithCategory(String category) =>
    '$baseUrl$topHeadLine$country$category$apiKey';
