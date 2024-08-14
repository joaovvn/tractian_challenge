import 'package:get/get.dart';
import 'package:tractian_challenge/models/company_model.dart';
import 'package:tractian_challenge/services/company_service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  CompanyService service = CompanyService();
  RxList<Company> companies = <Company>[].obs;

  init() async {
    await loadCompanies();
  }

  Future<void> loadCompanies() async {
    isLoading.value = true;
    companies.assignAll(await service.getCompanies());
    isLoading.value = false;
  }
}
