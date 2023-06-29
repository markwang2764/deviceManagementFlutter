import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialColumn extends StatelessWidget {
  final SpecialColumnItem item;
  const SpecialColumn({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 80,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(width: 15),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildTitle(), _buildFoot()],
          ))
        ],
      ),
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image:
                DecorationImage(image: AssetImage(item.url), fit: BoxFit.fill)),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.title,
          style: const TextStyle(fontSize: 16, color: Color(0xff2F3032)),
        ),
        const Icon(Icons.more_horiz, size: 20, color: Color(0xff8D8D8D))
      ],
    );
  }

  Widget _buildFoot() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 4,
      children: [
        Text(
          '${item.articleCount} 篇文章',
          style: const TextStyle(
              fontSize: 12, height: 1, color: Color(0xff86909c)),
        ),
        Container(
          width: 2,
          height: 2,
          decoration: const BoxDecoration(
              color: Color(0xff86909c), shape: BoxShape.circle),
        ),
        Text('${item.attentionCount} 人关注',
            style: const TextStyle(
                fontSize: 12, height: 1, color: Color(0xff86909c))),
      ],
    );
  }
}

class SpecialColumnItem {
  final String url;
  final String title;
  final int articleCount;
  final int attentionCount;
  SpecialColumnItem(
      {required this.url,
      required this.title,
      required this.articleCount,
      required this.attentionCount});
}
