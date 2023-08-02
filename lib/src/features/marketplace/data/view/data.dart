

import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/model/models.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/views/tax_filing.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/app_error_widget.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/tiles_data.dart';

import 'package:bookkeep_app/src/riverpod/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widget/special_button_2.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';



class DataView extends ConsumerStatefulWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  ConsumerState<DataView> createState() => _DataViewState();
}

class _DataViewState extends ConsumerState<DataView> {
  List<AllAcountingIndustriesModel>? value;
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    var allAccountingIndustries = ref.watch(allAccountingIndustriesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BookKeepingColors.secondaryColor,
        iconTheme: const IconThemeData(
            color: BookKeepingColors.backgroundColour //change your color here
            ),
        title: Text(
          'Data',
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
                Icons.search,
                color: BookKeepingColors.backgroundColour,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            // 20.sbH,
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Please kindly choose an option',
            //     style: TextStyle(
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.w400,
            //       color: BookKeepingColors.secondaryColor,
            //     ),
            //   ),
            // ),
            32.sbH,
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: allAccountingIndustries.when(
                  data: (data) {
                    if (data?.statusCode == 200 &&
                        data != null &&
                        data.data['category']['id'] == 3) {
                      value = (data.data as List)
                          .map((e) => AllAcountingIndustriesModel.fromJson(e))
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
                              child: ListView.separated(
                                itemCount: value!.length,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) => 24.sbH,
                                itemBuilder: (context, index) {
                                  return TilesData(
                                    allAcountingIndustriesModel: value![index],
                                    onpressed: () {
                                      pushTo(
                                          context,
                                          TaxFiling(
                                            allAcountingIndustriesModel:
                                                value![index],
                                            index: index,
                                          ));
                                    }, 
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: Text(
                              'No Industries yet for accountting',
                              style: TextStyle(
                                  fontSize: 32.sp,
                                  color: BookKeepingColors.secondaryColor,
                                  fontWeight: FontWeight.w600),
                            ));
                    } else {
                      return Center(
                        child: AppErrorWidget(
                          retry: SpecialButton2(
                              backgroundColor: BookKeepingColors.mainColor,
                              textColor:
                                  BookKeepingColors.onboardingWhiteColour,
                              text: 'Retry',
                              onTap: () {
                                ref.invalidate(allAccountingIndustriesProvider);
                                allAccountingIndustries =
                                    ref.read(allAccountingIndustriesProvider);
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
                            ref.invalidate(allAccountingIndustriesProvider);
                            allAccountingIndustries =
                                ref.read(allAccountingIndustriesProvider);
                          }

                          // ref.refresh(
                          //   allAccountingIndustries as Refreshable<void>,

                          // ),
                          ),
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(
                      value: 20,
                      backgroundColor: BookKeepingColors.mainColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
