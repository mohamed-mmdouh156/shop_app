import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/ShopLayout/ShopCubit/ShopState.dart';
import 'package:shop_app/Model/HomeModel.dart';
import 'package:shop_app/Module/CategoriesScreen/CategoriesScreen.dart';
import 'package:shop_app/Module/FavoritesScreen/FavoritesScreen.dart';
import 'package:shop_app/Module/HomeScreen/HomeScreen.dart';
import 'package:shop_app/Module/SettingScreen/SettingScreen.dart';
import 'package:shop_app/Shared/Companent/constants.dart';
import 'package:shop_app/Shared/Network/EndPoints.dart';
import 'package:shop_app/Shared/Network/remote/DioHelper/DioHelper.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());

  ShopCubit get(context) => BlocProvider.of(context);

  List<Widget> HomeScreens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  int currentIndex = 0 ;

  void changeIndex(int index)
  {
    currentIndex = index ;
    emit(ShopChangeBottomNaviBar());
  }

  HomeModel? homeModel;

  void getHomeData()
  {
    emit(ShopHomeLoadingState());

    DioHelper.geData(
      url: HOME ,
      token: token,
    ).then((value) {

      homeModel = HomeModel.formJson(value.data);

      print(homeModel!.toString());
      emit(ShopHomeSuccessState());

    }).catchError((error){
      print('error when get home data : ${error.toString()}');
      emit(ShopHomeErrorState());
      
    });

  }

}