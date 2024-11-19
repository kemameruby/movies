import 'package:flutter/material.dart';
import 'package:flutter_trust/pages/more.dart';
import 'package:provider/provider.dart';

import '../pages/moree2.dart';
import 'movie_provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF121212),
        // appBar: AppBar(
        //   title: const Text('popular movies,'),
        //   backgroundColor: const Color(0xFF1F1F1F),
        // ),
        body: Provider.of<MovieProvider>(context).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(children: [
                  ChangeNotifierProvider<MovieProvider>(
                    create: (context) => MovieProvider()..cloud(),
                    child: Consumer<MovieProvider>(
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Popular movies,',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    itemCount: value.slide.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white)),
                                            height: 500,
                                            width: 200,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      'https://image.tmdb.org/t/p/original${value.slide[index].posterPath}',
                                                      fit: BoxFit.cover,
                                                      height: 200,
                                                      width: 200,
                                                    )),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                    height: 100,
                                                    width: 200,
                                                    decoration: const BoxDecoration(
                                                        // color: Colors.white70
                                                        //     .withOpacity(0.5),
                                                        ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            value.slide[index]
                                                                    .title ??
                                                                '',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                highlightColor:
                                                                    Colors
                                                                        .white70,
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => Moree(
                                                                                primaryMe: value.slide[index].id ?? 0,
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        137,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'More',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // const Text(
                                                              //   'Likes',
                                                              //   style: TextStyle(
                                                              //       fontSize: 15,
                                                              //       color: Colors
                                                              //           .white),
                                                              // )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ChangeNotifierProvider<MovieProvider>(
                                create: (context) =>
                                    MovieProvider()..melody('day'),
                                child: Consumer<MovieProvider>(
                                    builder: (context, value, child) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Trending movies,',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 17,
                                        ),
                                        SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                              itemCount: value.smoothie.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: Colors
                                                                    .white)),
                                                        height: 600,
                                                        width: 200,
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                child: Image
                                                                    .network(
                                                                  'https://image.tmdb.org/t/p/original${value.smoothie[index].posterPath}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 200,
                                                                  width: 200,
                                                                )),
                                                   Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                    height: 100,
                                                    width: 200,
                                                    decoration: const BoxDecoration(
                                                        // color: Colors.white70
                                                        //     .withOpacity(0.5),
                                                        ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            value.smoothie[index]
                                                                    .title ??
                                                                '',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                highlightColor:
                                                                    Colors
                                                                        .white70,
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => Moree(
                                                                                primaryMe: value.smoothie[index].id ?? 0,
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        137,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'More',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // const Text(
                                                              //   'Likes',
                                                              //   style: TextStyle(
                                                              //       fontSize: 15,
                                                              //       color: Colors
                                                              //           .white),
                                                              // )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      )
                                                    ]);
                                              }),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ChangeNotifierProvider<MovieProvider>(
                                create: (context) => MovieProvider()..coin(),
                                child: Consumer<MovieProvider>(
                                  builder: (context, value, child) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Popular tv Series,',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 200,
                                              child: ListView.builder(
                                                  itemCount:
                                                      value.cracker.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .white)),
                                                            height: 500,
                                                            width: 200,
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    child: Image
                                                                        .network(
                                                                      'https://image.tmdb.org/t/p/original${value.cracker[index].posterPath}',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height:
                                                                          200,
                                                                      width:
                                                                          200,
                                                                    )),
                                                                Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                    height: 100,
                                                    width: 200,
                                                    decoration: const BoxDecoration(
                                                        // color: Colors.white70
                                                        //     .withOpacity(0.5),
                                                        ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            value.cracker[index]
                                                                    .originalName??
                                                                '',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                highlightColor:
                                                                    Colors
                                                                        .white70,
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => More2(
                                                                                primaryMe: value.cracker[index].id ?? 0,
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        137,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'More',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // const Text(
                                                              //   'Likes',
                                                              //   style: TextStyle(
                                                              //       fontSize: 15,
                                                              //       color: Colors
                                                              //           .white),
                                                              // )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          )
                                                        ]);
                                                  }),
                                            )
                                          ]),
                                    );
                                  },
                                ),
                              ),
                              ChangeNotifierProvider<MovieProvider>(
                                create: (context) => MovieProvider()..bars(),
                                child: Consumer<MovieProvider>(
                                  builder: (context, value, child) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Top rated,',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            SizedBox(
                                              height: 200,
                                              child: ListView.builder(
                                                  itemCount: value.juice.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .white)),
                                                            height: 500,
                                                            width: 200,
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    child: Image
                                                                        .network(
                                                                      'https://image.tmdb.org/t/p/original${value.juice[index].posterPath}',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height:
                                                                          200,
                                                                      width:
                                                                          200,
                                                                    )),
                                                               Positioned(
                                                  bottom: 0,
                                                  child: Container(
                                                    height: 100,
                                                    width: 200,
                                                    decoration: const BoxDecoration(
                                                        // color: Colors.white70
                                                        //     .withOpacity(0.5),
                                                        ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            value.juice[index]
                                                                    .title ??
                                                                '',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                highlightColor:
                                                                    Colors
                                                                        .white70,
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => Moree(
                                                                                primaryMe: value.juice[index].id ?? 0,
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 80,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        137,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'More',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // const Text(
                                                              //   'Likes',
                                                              //   style: TextStyle(
                                                              //       fontSize: 15,
                                                              //       color: Colors
                                                              //           .white),
                                                              // )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          )
                                                        ]);
                                                  }),
                                            )
                                          ]),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ));
  }
}
