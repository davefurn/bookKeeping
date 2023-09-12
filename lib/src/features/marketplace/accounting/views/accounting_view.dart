// Copyright 2023 Davefurn
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/views/tax_filing.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/app_error_widget.dart';
import 'package:bookkeep_app/src/riverpod/providers.dart';
import 'package:bookkeep_app/src/services/get_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widget/special_button_2.dart';
import '../../widget/tiles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/models.dart';

class AccountingView extends ConsumerStatefulWidget {
  const AccountingView({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountingView> createState() => _AccountingViewState();
}

class _AccountingViewState extends ConsumerState<AccountingView> {
  List<AllAcountingIndustriesModel>? value;
  late RefreshController refreshController;
  int accountingValue = 2;
  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  Widget? loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3,
            color: BookKeepingColors.mainColor,
            backgroundColor: BookKeepingColors.backgroundColour,
          ),
          4.sbH,
          Text('Loading accounting industries...',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: BookKeepingColors.mainColor,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
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
          'Accounting',
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
                    if (data?.statusCode == 200 && data != null) {
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
                                var _ = ref
                                    .refresh(allAccountingIndustriesProvider);
                                refreshController.refreshCompleted();
                              },
                              onLoading: () async {
                                int paginationModel = 100;
                                if (value!.length != paginationModel) {
                                  try {
                                    final a = await GetRequest
                                        .getAllAccountingIndustries();
                                    var b = (a!.data! as List)
                                        .map((e) => AllAcountingIndustriesModel
                                            .fromJson(e))
                                        .toList();
                                    value!.addAll(b);
                                    refreshController.loadComplete();
                                    setState(() {});
                                  } catch (_) {
                                    refreshController.refreshFailed();
                                  }
                                } else {
                                  refreshController.loadNoData();
                                }
                              },
                              child: ListView.separated(
                                itemCount: value!.length,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) =>
                                    value![index].categoryl.id == 2
                                        ? 24.sbH
                                        : const SizedBox.shrink(),
                                itemBuilder: (context, index) {
                                  return value![index].categoryl.id == 2
                                      ? TilesAccounting(
                                          allAcountingIndustriesModel:
                                              value![index],
                                          onpressed: () {
                                            print(index);
                                            pushTo(
                                                context,
                                                TaxFiling(
                                                  allAcountingIndustriesModel:
                                                      value![index++],
                                                  index: index++,
                                                ));
                                          },
                                        )
                                      : const SizedBox.shrink();
                                },
                              ),
                            )
                          : Center(
                              child: Text(
                              'No Industries yet for accounting',
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
                  loading: () => loadingWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
