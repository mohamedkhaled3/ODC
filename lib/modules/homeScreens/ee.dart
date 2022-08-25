import 'package:flutter/material.dart';

import '../../shared/components/constant.dart';

class ItemBlogShown extends StatelessWidget {
  const ItemBlogShown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, {index}) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  imageBlogs[index],
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "5 Tips to treat plants",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SingleChildScrollView(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          const Text(
                        "leaf, in botany, any usually "
                        "leaf, in botany, any usually ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(),
                      itemCount: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
