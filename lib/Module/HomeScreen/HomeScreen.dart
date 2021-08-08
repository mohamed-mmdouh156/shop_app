import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/ShopLayout/ShopCubit/ShopCubit.dart';
import 'package:shop_app/Layout/ShopLayout/ShopCubit/ShopState.dart';
import 'package:shop_app/Model/HomeModel.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit().get(context);
          return ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) => Container(),//homeBuilder(cubit.homeModel),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  // Widget homeBuilder(HomeModel model) {
  //   return Column(
  //     children: [
  //       CarouselSlider(
  //         items: model.data!.banners.map((e) {
  //           return Container(
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(15.0),
  //               image: DecorationImage(
  //                 image: NetworkImage('${e.image}'),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             // child: Image(
  //             //   image: NetworkImage('${e.image}'),
  //             //   width: double.infinity,
  //             //   fit: BoxFit.cover,
  //             // ),
  //           );
  //         }).toList(),
  //         options: CarouselOptions(
  //           height: 250.0,
  //           initialPage: 0,
  //           viewportFraction: 1.0,
  //           aspectRatio: 16/9,
  //           enableInfiniteScroll: true,
  //           reverse: false ,
  //           autoPlay: true,
  //           autoPlayInterval: Duration(seconds: 3),
  //           autoPlayAnimationDuration: Duration(milliseconds: 800 ,),
  //           autoPlayCurve: Curves.fastOutSlowIn,
  //           scrollDirection: Axis.horizontal,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
