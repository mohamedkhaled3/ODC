import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/components.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Notification',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: HexColor('#1A1F36'),
                          ),
                        ),
                        if (true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: HexColor('#DDDEE1'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Text(
                                          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#1A1F36'),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yesterday at 11:42 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#A5ACB8'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            longDivider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: HexColor('#1A1F36'),
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: HexColor('#DDDEE1'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Text(
                                          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#1A1F36'),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yesterday at 11:42 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#A5ACB8'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            longDivider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: HexColor('#1A1F36'),
                          ),
                        ),
                        if (true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: HexColor('#DDDEE1'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Text(
                                          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#1A1F36'),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yesterday at 11:42 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#A5ACB8'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            longDivider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: HexColor('#1A1F36'),
                          ),
                        ),
                        if (true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: HexColor('#DDDEE1'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Text(
                                          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#1A1F36'),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yesterday at 11:42 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#A5ACB8'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            longDivider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: HexColor('#1A1F36'),
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: HexColor('#DDDEE1'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Text(
                                          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#1A1F36'),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yesterday at 11:42 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#A5ACB8'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            longDivider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joy Arnold left 6 comments on Your Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: HexColor('#1A1F36'),
                          ),
                        ),
                        if (true)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: HexColor('#DDDEE1'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Text(
                                          '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#1A1F36'),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yesterday at 11:42 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor('#A5ACB8'),
                          ),
                        ),
                      ],
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

  void buildNotificationItem() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(
                'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Joy Arnold left 6 comments on Your Post',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor('#1A1F36'),
                    ),
                  ),
                  if (true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                width: 2,
                                height: double.infinity,
                                color: HexColor('#DDDEE1'),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                  child: Column(
                                children: [
                                  Text(
                                    '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.” ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('#1A1F36'),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Yesterday at 11:42 PM',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: HexColor('#A5ACB8'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
