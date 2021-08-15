import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/ShopLayout/ShopCubit/ShopCubit.dart';
import 'package:shop_app/Layout/ShopLayout/ShopCubit/ShopState.dart';
import 'package:shop_app/Model/CategoriesModel.dart';
import 'package:shop_app/Shared/Style/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context , state){},
      builder: (context , state){
        return Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.separated(
            itemBuilder: (context , index) => CategItem(ShopCubit().get(context).categoriesModel!.data!.data![index]),
            separatorBuilder: (context , index) => SizedBox(height: 15.0,),
            itemCount: ShopCubit().get(context).categoriesModel!.data!.data!.length,
            physics: BouncingScrollPhysics(),
          ),
        );
      },
    );
  }

  Widget CategItem (DataModel model){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row (
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              width: 170.0,
              child: Text(
                model.name!,
                style: TextStyle(
                  fontSize: 22.0,
                  color: defaultColor,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: defaultColor,
            ),
          ],
        ),
      ),
    );
  }



}
