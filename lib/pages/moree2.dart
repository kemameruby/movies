
import 'package:flutter/material.dart';
import 'package:flutter_trust/common/movie_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class More2 extends StatefulWidget {

 final int primaryMe;

  const More2({super.key, required this.primaryMe});

  @override
  State<More2> createState() => _More2State();
}

class _More2State extends State<More2> {
 var format = DateFormat('d/M/y');
 
  get videoKey => null;

   void initState() {
    super.initState();
     print('our erro ${widget.primaryMe}');
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFF121212),
     extendBody: true,
     extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0, automaticallyImplyLeading: false,
        leading: Container(decoration:
        const BoxDecoration(shape: BoxShape.rectangle, color: Colors.transparent),
         height: 10, width: 5, 
         child: IconButton(onPressed: () {Navigator.of(context).pop();} ,
         icon: const Icon(Icons.arrow_back), color: Colors.white,),
         ),
        ),
      body: ChangeNotifierProvider< MovieProvider>(
        create: (context) => MovieProvider()..getResults(widget.primaryMe),
        child: Consumer< MovieProvider>(
          builder: (context, value, child){
            if(value.singers==null) {
              return const Text('Another error ', style:const TextStyle(color: Colors.white, fontSize: 25));
            }
            return  SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(value.singers?.originalName??'', 
                      style:const TextStyle(color: Colors.white, fontSize: 25)
                      ),
                       Image.network('https://image.tmdb.org/t/p/original${value.singers?.posterPath}', fit: BoxFit.cover,height: 500,width: 400,),
                       const SizedBox(height: 15,),
                       const Text('Description', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                       Text(value.cake?.overview??'', style: const TextStyle(color: Colors.white, fontSize: 15, ),),
                       const SizedBox(height: 15,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Release Date', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                            Text(
                              format.format(value.cake?.releaseDate?? DateTime.now()), 
                            style: const TextStyle(color: Colors.white, fontSize: 15,)
                            ),
                          ],
                        ),
                    const SizedBox(height: 20),
                   
                        const Text('Trailer',
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                        ChangeNotifierProvider<MovieProvider>(
                          create: (context) =>  MovieProvider()..getMovieVideos(widget.primaryMe),
                        
                          child: Consumer<MovieProvider>(
                            builder: (context, value, _) {
                              print('sound ${widget.primaryMe}');
                              if(value.videos.isEmpty){
                                return const Center(child: Text('No video', style: TextStyle(color: Colors.white, fontSize: 25),));
                              }
                              return YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: value.videos[0].key,
                                  flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                                ),
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Colors.white,
                              );
                            }
                          ),
                        ),
                    const SizedBox(height: 30,),

                   ]
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}