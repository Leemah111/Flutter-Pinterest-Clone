import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<String> imageList = [
 'https://images.unsplash.com/photo-1638043881914-4423b7fa7210?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
 'https://images.unsplash.com/photo-1637637187692-9736fe7b7973?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
 'https://images.unsplash.com/photo-1637075067730-3c66299d5145?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
 'https://images.unsplash.com/photo-1624673130139-e04e46d8d680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=723&q=80',
 'https://images.unsplash.com/photo-1592420783569-f47d2a5cb2d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
 'https://images.unsplash.com/photo-1638170410099-6c16e012dbe9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: StaggeredGridView.countBuilder(
            crossAxisCount:2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount:imageList.length,
            itemBuilder:(context,index){
              return InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                     builder: (context) => SizedBox(
                       child: Image.network(imageList[index],
                       fit: BoxFit.cover,),
                       height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.height
                     ),
                     );
                },
                child: Container(
                  decoration:BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, 
                      image: imageList[index],
                      fit:BoxFit.cover
                    
                      ),
                  ),
                           
                ),
              );
            },
              staggeredTileBuilder:(index){
                return StaggeredTile.count(1, index.isOdd ? 1.2 : 1.8);
              
              },
          ),
        ),
      ),
      
    );
  }
}