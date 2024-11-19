import 'package:flutter/material.dart';
import 'package:flutter_trust/common/movie_screenn.dart';
import 'package:flutter_trust/features/bubu.dart';

class Tablods extends StatefulWidget {
  const Tablods({super.key});

  @override
  State<Tablods> createState() => _TablodsState();
}
 
class _TablodsState extends State<Tablods> with SingleTickerProviderStateMixin{
 late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
         appBar: AppBar(
        title: const Text('Welcome Kems', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 139, 117, 117),
      
    
          bottom: const PreferredSize(preferredSize: Size.fromHeight(40), child: TabBar (
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
            Tab(
              icon:  Icon(Icons.home),
           ),
          //  Tab(
          //    icon: Icon(Icons.notifications),
            
          //  ),
          //  Tab(
          //     icon: Icon(Icons.favorite)
            
          //  ),
           Tab(
            icon: Icon(Icons.settings)
           
           ),
          ],
          ),
          ),
        ),
        body: const TabBarView(children: [MovieScreen(), Viv()],
        ),
      ),
    );
  }
}