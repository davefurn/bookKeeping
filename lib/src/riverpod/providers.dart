import 'package:bookkeep_app/src/services/get_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allAccountingIndustriesProvider = FutureProvider.autoDispose(
    (ref) => GetRequest.getAllAccountingIndustries());

final specificIndustryProvider = FutureProvider.autoDispose.family(
    (ref, int id) => GetRequest.getServiceProviders(id));
