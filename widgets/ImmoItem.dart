import 'package:flutter/material.dart';
import 'package:immo_manager/widgets/ImmoItemTrait.dart';
import 'package:transparent_image/transparent_image.dart';

class Immoitem extends StatelessWidget {
  const Immoitem(
      {super.key,
      required this.header,
      required this.localisation,
      required this.label,
      required this.imgUrl,
      required this.occupation});
  final String header;
  final String localisation;
  final String label;
  final String imgUrl;
  final String occupation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                imgUrl,
              ),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(194, 33, 149, 243),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(header,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Row(
                      children: [
                        ImmoItemTrait(
                          label: label,
                          localisation: localisation,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
