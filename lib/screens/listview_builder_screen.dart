import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuildScreen extends StatefulWidget {
   
  const ListViewBuildScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuildScreen> createState() => _ListViewBuildScreenState();
}

class _ListViewBuildScreenState extends State<ListViewBuildScreen> {

  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        fetchData();
      }

    });
  }

  Future fetchData()async{

    if(isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    add9();

    isLoading = false;
    setState(() {});

    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn);

  }

  void add9(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5,6,7,8,9,].map((e) => lastId + e)
    );
    setState(() {});
  }

  Future<void> onRefresh()async{
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId);
    add9();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index){
                  return  FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image:  NetworkImage('https://picsum.photos/500/300?image=${imagesIds[index]}'),
                    );
                }
              ),
            ),
            
            if(isLoading)
             Positioned(
              bottom: 40,
              left: size.width * 0.5 - 30,
              child: const LoadingIcon()
              )
          ],
        ),
      ),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(color: AppTheme.primary,),
    );
  }
}