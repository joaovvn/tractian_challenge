import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/constants/app_colors.dart';
import 'package:tractian_challenge/constants/app_types.dart';
import 'package:tractian_challenge/constants/app_urls.dart';
import 'package:tractian_challenge/models/company_model.dart';
import 'package:tractian_challenge/models/node_model.dart';

class CompanyService extends GetConnect {
  // Fetches all companies
  Future<List<Company>> getCompanies() async {
    try {
      Response response = await get(AppUrls.getCompanies);
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> data = jsonDecode(response.bodyString ?? "");
        List<Company> companies =
            data.map<Company>((company) => Company.fromJson(company)).toList();
        return companies;
      } else {
        throw Exception('Failed to load companies!');
      }
    } catch (e) {
      // Show a warning with the exception
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.mainColor,
      );
      return List<Company>.empty();
    }
  }

  // Fetches all locations for a company
  Future<List<NodeModel>> getCompanyLocations(String companyId) async {
    try {
      Response response = await get(AppUrls.getCompanyLocations(companyId));
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> data = jsonDecode(response.bodyString ?? "");
        List<NodeModel> locations = data
            .map<NodeModel>((location) =>
                NodeModel.fromJson(location, type: AppTypes.location))
            .toList();
        return locations;
      } else {
        throw Exception('Failed to load locations!');
      }
    } catch (e) {
      // Show a warning with the exception
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.mainColor,
      );
      debugPrint(e.toString());
      return List<NodeModel>.empty();
    }
  }

  // Fetches all assets for a company
  Future<List<NodeModel>> getCompanyAssets(String companyId) async {
    try {
      Response response = await get(AppUrls.getCompanyAssets(companyId));
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> data = jsonDecode(response.bodyString ?? "");
        List<NodeModel> locations = data
            .map<NodeModel>((location) => NodeModel.fromJson(location))
            .toList();
        return locations;
      } else {
        throw Exception('Failed to load assets!');
      }
    } catch (e) {
      // Show a warning with the exception
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.mainColor,
      );
      return List<NodeModel>.empty();
    }
  }
}
