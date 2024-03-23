import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:profitei_flutter/core/constant/colors.dart';
import 'package:profitei_flutter/domain/entities/summary/summary.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/router/app_router.dart';

class SummaryCard extends StatelessWidget {
  final RaffleSummary? product;
  final Function? onFavoriteToggle;
  final Function? onClick;
  const SummaryCard({
    super.key,
    this.product,
    this.onFavoriteToggle,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: product == null
          ? Shimmer.fromColors(
              baseColor: AppColors.primary100,
              highlightColor: Colors.white,
              child: buildBody(context),
            )
          : buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.of(context)
              .pushNamed(AppRouter.raffleDetails);
      },
      child: Card(
        elevation: 0.5,
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Expanded(
              child: product == null
                  ? Material(
                      child: GridTile(
                        footer: Container(),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    )
                  : Hero(
                      tag: product!.id,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: product!.image,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: AppColors.primary100,
                            highlightColor: Colors.white,
                            child: Container(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
            ),
            Padding(
                padding: const EdgeInsets.all(4),
                child: product == null
                    ? Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product!.name,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: product == null
                    ? Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    : Text(
                        r'R$' + product!.price.toString(),
                        style: const TextStyle(
                          color: AppColors.primary500,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4),
            ),
          ],
        ),
      ),
    );
  }
}
