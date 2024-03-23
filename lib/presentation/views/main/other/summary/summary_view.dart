import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profitei_flutter/core/constant/images.dart';
import 'package:profitei_flutter/presentation/blocs/summary/summary_fetch_cubit.dart';
import 'package:profitei_flutter/presentation/widgets/alert_card.dart';
import 'package:profitei_flutter/presentation/widgets/summary_card.dart';
import 'package:shimmer/shimmer.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
      ),
      body: Column(
        children: [
            Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BlocBuilder<RaffleSummaryFetchCubit, RaffleSummaryFetchState>(
                    builder: (context, state) {
                  //Result Empty and No Error
                  if (state is RaffleSummaryFetchSuccess && state.raffleSummary.isEmpty) {
                    return const AlertCard(
                      image: kEmpty,
                      message: "Sem Rifas!",
                    );
                  }                 
                  return GridView.builder(
                      itemCount: state.raffleSummary.length +
                          ((state is RaffleSummaryFetchLoading) ? 10 : 0),
                      padding: EdgeInsets.only(
                          top: 18,
                          left: 20,
                          right: 20,
                          bottom: (80 + MediaQuery.of(context).padding.bottom)),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 6,
                      ),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        if (state.raffleSummary.length > index) {
                          return SummaryCard(
                            product: state.raffleSummary[index],
                          );
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.white,
                          child: const SummaryCard(),
                        );
                      },
                  );
                })),
          ),
        ],
      ),
    );
  }
}
