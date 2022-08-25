import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/models/post_model.dart';
import 'package:la_vie/models/user_model.dart';
import 'package:la_vie/modules/search/searchscreen.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/cubit/appCubit/cubit.dart';

import '../../shared/cubit/appCubit/states.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.myPostsModel != null &&
              cubit.userCurrentModel?.data != null,
          builder: (BuildContext context) => DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                title: const Center(
                    child: Text(
                  'Discussion Forums',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                )),
              ),
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        navigateTo(context, const SearchScreen());
                      },
                      child: searchShap(context),
                    ),
                    TabBar(
                      labelColor: HexColor('#1ABC00'),
                      unselectedLabelColor: HexColor('#8A8A8A'),
                      indicatorColor: HexColor('#1ABC00'),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: const [
                        Tab(
                          child: Text(
                            'All Forums',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'My Forums',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        child: TabBarView(
                          children: [
                            Center(child: Text('ALl posts')),
                            SingleChildScrollView(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => buildPostItem(
                                    context,
                                    cubit.myPostsModel!.data![index],
                                    cubit.userCurrentModel!),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 8.0,
                                ),
                                itemCount: cubit.myPostsModel!.data!.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: HexColor('#1ABC00'),
                onPressed: () {
                  //navigateTo(context, CreateNewPostScreen);
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
          fallback: (BuildContext context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItem(context, PostData model, CurrentUserModel userModel) =>
      Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      '${userModel.data!.imageUrl}',
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${userModel.data!.firstName} ${userModel.data!.lastName}',
                              style: const TextStyle(
                                color: Colors.black,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                          ],
                        ),
                        Text(
                          'Date',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                model.title!,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: HexColor('#1ABC00'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.description!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                  color: HexColor('#8F8D8D'),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 5),
                child: Container(
                  height: 140.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.heart_broken,
                              size: 16.0,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${model.forumLikes!.length.toString()} Likes',
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                            Text(
                              '${model.forumComments!.length.toString()} Replies',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
