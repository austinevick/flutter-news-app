class Constants {
  static final String TOP_HEADLINE_URL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=033ee963e4cc4515960f4a0f772795bf";

  static String headlinesKeyword(String keyword){
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=033ee963e4cc4515960f4a0f772795bf";
  }
}