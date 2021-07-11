import 'dart:developer';

final String apiKey = '2075b063336a440991b63d014f0d6850';
String baseUrl = 'newsapi.org';
final String from = '2021-07-04';
final String to = '2021-07-04';
final String sortBy = 'popularity';
String homeUrl =
    '/v2/everything?q=apple&from=$from&to=$to&sortBy=$sortBy&apiKey=$apiKey';
