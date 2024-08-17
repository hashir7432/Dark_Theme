import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Covid extends StatefulWidget {
  @override
  _Covid19AppState createState() => _Covid19AppState();
}

class _Covid19AppState extends State<Covid> {
  final String _apiUrl = 'https://api.covid19api.com/summary';
  final String _newsApiUrl = 'https://newsapi.org/v2/everything?q=covid19';

  Future<Covid19Data> _fetchCovid19Data() async {
    final response = await http.get(Uri.parse(_apiUrl));
    if (response.statusCode == 200) {
      return Covid19Data.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load COVID-19 data');
    }
  }

  Future<NewsData> _fetchNewsData() async {
    final response = await http.get(Uri.parse(_newsApiUrl));
    if (response.statusCode == 200) {
      return NewsData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('COVID-19 Cases:'),
            Text('Deaths:'),
            Text('Recoveries:'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final Covid19Data() = await _fetchCovid19Data();
                final NewsData() = await _fetchNewsData();
                // Display COVID-19 data and news updates
              },
              child: Text('Get COVID-19 Data'),
            ),
          ],
        ),
      ),
    );
  }
}

class Covid19Data {
  final int cases;
  final int deaths;
  final int recoveries;

  Covid19Data(
      {required this.cases, required this.deaths, required this.recoveries});

  factory Covid19Data.fromJson(Map<String, dynamic> json) {
    return Covid19Data(
      cases: json['cases'],
      deaths: json['deaths'],
      recoveries: json['recoveries'],
    );
  }
}

class NewsData {
  final List<NewsArticle> articles;

  NewsData({required this.articles});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      articles: json['articles']
          .map((article) => NewsArticle.fromJson(article))
          .toList(),
    );
  }
}

class NewsArticle {
  final String title;
  final String description;

  NewsArticle({required this.title, required this.description});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      description: json['description'],
    );
  }
}
