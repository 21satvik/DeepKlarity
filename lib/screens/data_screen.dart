import 'package:cached_network_image/cached_network_image.dart';
import 'package:deepklarity/main.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  static const routeName = '/data';

  @override
  Widget build(BuildContext context) {
    final size = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: size,
          itemBuilder: (context, index) {
            final product = box.getAt(index);
            return Card(
              color: const Color.fromRGBO(225, 85, 113, 1),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  // leading: CircleAvatar(
                  //   radius: 25,
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: FadeInImage(
                  //     placeholder: const AssetImage('assets/loader.gif'),
                  //     image: CachedNetworkImageProvider(product!.productURL),
                  //   ).image,
                  // ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      placeholder: (context, url) =>
                          Image.asset('assets/loader.gif'),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/loader.gif'),
                      imageUrl: product!.productURL,
                    ),
                  ),
                  title: Text(
                    product.productName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(product.productDescription),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.productRating.toString(),
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Text(
                        'stars',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
