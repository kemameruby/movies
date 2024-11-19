import 'package:flutter/material.dart';
import 'package:flutter_trust/features/model2.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../features/model.dart';
class MovieProvider extends ChangeNotifier {
 
 bool _isLoading = false;
 bool get isLoading => _isLoading;
 void pie(bool delicious) {
   _isLoading = delicious;
   notifyListeners();
 }


 List<Video> _videos = [];
List<Video> get videos => _videos;
Results? _alto;
Results? get singers => _alto;
  void altos(Results? tenor){
    _alto = tenor;
    
    notifyListeners();
  }

  // for popular movies
 List<Movies> _slide =[];
List<Movies> get slide => _slide;
Movies? _single;
void burger(List<Movies>popcorn) {
  _slide = popcorn;
  notifyListeners();
}

  // for movie details
Movies? get  cake => _single;
 void single(Movies? slip){
   _single = slip;
   notifyListeners();
 }

  //  for trending 
  List<Movies> _top =[];
  List<Movies> get top => _top;
  List<Movies> _creamy =[];
  void milk(List<Movies>sweet) {
    _top = sweet;
    notifyListeners();
  }
  List<Movies> get smoothie => _creamy;
   void creamy(List<Movies> top) {
    _creamy = top;
    notifyListeners();
   }
    // for series
   List<Results> _cracker =[];
  List<Results> get cracker => _cracker;
  void salty(List<Results>soft) {
    _cracker = soft;
    notifyListeners();
  }
  // List<Movies> get tasty => _crunchy;
  //  void crunchy(List<Movies> cracker) {
  //   _crunchy = cracker;
  //   notifyListeners();
  //  }

    //  for top related
  List<Movies> _juice =[];
  List<Movies> get juice => _juice;
  List<Movies> _fanta = [];
  void coke(List<Movies> chocolate) {
    _juice = chocolate;
    notifyListeners();
  }
List<Movies> get sugar => _fanta;
void fanta (List<Movies> juice) {
  _fanta = juice;
  notifyListeners();
}
  


  //  for purpular movies
  void cloud() async {
  pie(true);
    try{
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie'), headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
      });
      if(response.statusCode ==200){
        pie(false);
        final movies =  json.decode(response.body);
        List<dynamic> movieList = movies['results'];
        final ourList = movieList.map((e){return Movies.fromJson(e);}).toList();
     burger(ourList);
      }
    // ignore: empty_catches
    }catch(e){
    }
  }

  //  for movie details
    void rejoice(int id) async {
      try{
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id'), headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
      });
      if(response.statusCode ==200){
  
        final movies =  json.decode(response.body);
        final movie = Movies.fromJson(movies);
        
        single(movie);
      }
    }catch(e){
      print('soke $e');
    }
    }
    //  details for series
    void voice(int id) async {
      try{
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$id'), headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
      });
      if(response.statusCode ==200){
  
        final movies =  json.decode(response.body);
        final movie = Movies.fromJson(movies);
        
        single(movie);
      }
    }catch(e){}
    }
   


    //  for trending movies
  // void sky() async {
  // pie(true);
  //   try{
  //     final response = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/day'), headers: {
  //       'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
  //     });
  //     if(response.statusCode ==200){
  //       final movies =  json.decode(response.body);
  //       List<dynamic> movieList = movies['results'];
  //       final ourList = movieList.map((e){return Movies.fromJson(e);}).toList();
  //     print('movies $movieList');
  //    milk(ourList);
  //     }
  //   }catch(e){
  //   print('our error $e');
  //   }
  // }
   void melody(String day) async {
      try{
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/$day'), headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
      });
      if(response.statusCode ==200){
      pie(false);
        final movies =  json.decode(response.body);
        final List<dynamic> movie = movies['results'];
        print('dddddd $movie');
        final salad = movie.map((e)=> Movies.fromJson(e)).toList();
        creamy(salad);
      }
   }catch(e){}
}

   // for tv series
  void coin() async {
    pie(true);
    try{
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/popular'), headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
      });
      if(response.statusCode ==200){
        final movies =  json.decode(response.body);
        List<dynamic> movieList = movies['results'];
        final ourList = movieList.map((e){return Results.fromJson(e);}).toList();
      print('moviessiries $movieList');
      salty(ourList);
      }
    }catch(e){
      print('sho $e');
    }
  }
  // void symphony() async {
  //     try{
  //     final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/popular'), headers: {
  //       'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
  //     });
  //     if(response.statusCode ==200){
  //     pie(false);
  //       final movies =  json.decode(response.body);
  //       final List<dynamic> movie = movies['results'];
  //       final munch = movie.map((e)=> Movies.fromJson(e)).toList();
  //       crunchy(munch);
  //     }
  //  }catch(e){
  //   print('sew $e');
  //  }
   
  // }



  // for top rated
 void bars() async {
    pie(true);
    try{
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated'), headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
      });
      if(response.statusCode ==200){
        final movies =  json.decode(response.body);
        List<dynamic> movieList = movies['results'];
        final ourList = movieList.map((e){return Movies.fromJson(e);}).toList();
      print('movies $movieList');
     coke(ourList);
      }
    }catch(e){
    }
  }
  //  void harmony() async {
  //     try{
  //     final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated'), headers: {
  //       'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U'
  //     });
  //     if(response.statusCode ==200){
  //     pie(false);
  //       final movies =  json.decode(response.body);
  //       final List<dynamic> movie = movies['results'];
  //       final drink = movie.map((e)=> Movies.fromJson(e)).toList();
  //       fanta(drink);
  //     }
  //  }catch(e){}
  // }

  void getMovieVideos(int movieId) async {
  try {
    pie(true);
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=0af5969626ba8ed48777835b264e4fb8'),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U',
      },
    );

    if (response.statusCode == 200) {
      pie(false);
      final data = json.decode(response.body);
      List<dynamic> videoList = data['results'];
      final videoObjects = videoList.map((e) => Video.fromJson(e)).toList();
      _videos = videoObjects;
      notifyListeners();
    }
  // ignore: empty_catches
  } catch (e) {
    print('objectssss $e');
  }
}


void getResults(int movieId) async {
  final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/tv/$movieId'),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWY1OTY5NjI2YmE4ZWQ0ODc3NzgzNWIyNjRlNGZiOCIsIm5iZiI6MTczMDg4NzY3MC44NDkzNzg4LCJzdWIiOiI2NzJiMjkzMzUwZTE1ZThmNWE1ODQwZmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0D2a21E0rWDanf5-V53enYqOx6qEr9E7ILhECr-kP9U',
      },
    );
  
  try {
    (true);
    

    if (response.statusCode == 200) {
      

      final data = json.decode(response.body);
    
    final mmso =Results.fromJson(data);
      
    altos(mmso);

    
    }
  // ignore: empty_catches
  } catch (e) {
     
     print('our series $e');
  }
}
}