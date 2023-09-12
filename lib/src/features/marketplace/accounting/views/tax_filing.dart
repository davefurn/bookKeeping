import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/model/models.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/model/tax_filing_models.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/views/further_page.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/app_error_widget.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/card.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/special_button_2.dart';
import 'package:bookkeep_app/src/riverpod/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TaxFiling extends ConsumerStatefulWidget {
  final AllAcountingIndustriesModel? allAcountingIndustriesModel;
  final int index;
  const TaxFiling(
      {Key? key,
      required this.allAcountingIndustriesModel,
      required this.index})
      : super(key: key);

  @override
  ConsumerState<TaxFiling> createState() => _TaxFilingState();
}

class _TaxFilingState extends ConsumerState<TaxFiling> {
  List<TaxFilingModel>? value;
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  Widget loadingWidget() {
    return const Center(
      child:  CircularProgressIndicator(
        strokeWidth: 3,
        color: BookKeepingColors.mainColor,
        backgroundColor: BookKeepingColors.backgroundColour,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var specificIndustry = ref.watch(specificIndustryProvider(widget.index));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BookKeepingColors.secondaryColor,
        iconTheme:
            const IconThemeData(color: BookKeepingColors.backgroundColour),
        title: Text(
          widget.allAcountingIndustriesModel!.name.toString(),
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: BookKeepingColors.backgroundColour,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: BookKeepingColors.backgroundColour,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          20.sbH,
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Available listings for you',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: BookKeepingColors.secondaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: specificIndustry.when(
              data: (data) {
                if (data?.statusCode == 200 && data != null) {
                  value = (data.data as List)
                      .map((e) => TaxFilingModel.fromJson(e))
                      .toList();

                  return value!.isNotEmpty
                      ? SmartRefresher(
                          controller: refreshController,
                          enablePullUp: true,
                          physics: const ClampingScrollPhysics(),
                          onRefresh: () async {
                            value!.clear();
                            setState(() {});
                            //   paginationModel.page = 1;
                            //   paginationModel.total = 100;
                            //   var _ = await ref
                            //       .refresh(allAccountingIndustriesProvider().future);
                            //   refreshController.refreshCompleted();
                          },
                          onLoading: () async {
                            // if (value!.length != paginationModel.total) {
                            //   try {
                            //     paginationModel.page += 1;
                            //     final a =
                            //         await GetRequest.getHistory(paginationModel);
                            //     var b = (a!.data!['data']['data'] as List)
                            //         .map((e) => HistoryModel.fromJson(e))
                            //         .toList();
                            //     value!.addAll(b);
                            //     refreshController.loadComplete();
                            //     setState(() {});
                            //   } catch (_) {
                            //     refreshController.refreshFailed();
                            //   }
                            // } else {
                            //   refreshController.loadNoData();
                            // }
                          },
                          child: ListView.builder(
                            itemCount: value!.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                pushTo(
                                    context,
                                    FurtherPage(
                                      index: index,
                                      taxFilingModel: value![index],
                                    ));
                              },
                              child: Cards(
                                index: index,
                                description: value![index].serviceDescription,
                                image: 'assets/images/sample_image.jpeg',
                                price: '₦50,000.00',
                                rating: '4.5',
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                          'No Industries yet for  ${widget.allAcountingIndustriesModel!.name.toString()},',
                          style: TextStyle(
                              fontSize: 32.sp,
                              color: BookKeepingColors.secondaryColor,
                              fontWeight: FontWeight.w600),
                        ));
                } else {
                  return Center(
                    child: AppErrorWidget(
                      retry: SpecialButton2(
                          text: 'Retry',
                          onTap: () {
                            ref.invalidate(specificIndustryProvider);
                            specificIndustry = ref
                                .read(specificIndustryProvider(widget.index));
                          }

                          // ref.refresh(
                          //   allAccountingIndustries as Refreshable<void>,

                          // ),
                          ),
                    ),
                  );
                }
              },
              error: (Object error, StackTrace stackTrace) => Center(
                child: AppErrorWidget(
                  retry: SpecialButton2(
                      text: 'Retry',
                      onTap: () {
                        ref.invalidate(specificIndustryProvider);
                        specificIndustry =
                            ref.read(specificIndustryProvider(widget.index));
                      }

                      // ref.refresh(
                      //   allAccountingIndustries as Refreshable<void>,

                      // ),
                      ),
                ),
              ),
              loading: () => loadingWidget()
            ),
          ),
        ],
      ),
    );
  }
}
