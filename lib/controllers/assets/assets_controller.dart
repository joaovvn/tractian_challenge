import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/constants/app_filters.dart';
import 'package:tractian_challenge/models/node_model.dart';
import 'package:tractian_challenge/services/company_service.dart';

class AssetsController extends GetxController {
  RxBool isLoading = false.obs;
  CompanyService service = CompanyService();
  RxList<NodeModel> nodes = <NodeModel>[].obs;
  TextEditingController filterController = TextEditingController();
  RxInt selectedFilter = AppFilters.none.obs;
  late String companyId;

  init(String companyId) async {
    this.companyId = companyId;
    await loadAssetsandLocations();
  }

  Future<void> loadAssetsandLocations() async {
    isLoading.value = true;
    List<NodeModel> locations = await service.getCompanyLocations(companyId);
    List<NodeModel> assets = await service.getCompanyAssets(companyId);
    // Map for quick reference of nodes by ID
    final Map<String, NodeModel> nodeMap = {};
    // Set to track IDs to include
    final Set<String> idsToInclude = {};
    final List<NodeModel> roots = [];

    // Combine locations and assets into a single list
    List<NodeModel> allNodes = [...locations, ...assets];

    // Add all locations and assets to the map and organize the hierarchy
    for (NodeModel node in allNodes) {
      // Add the node to the map
      nodeMap[node.id] = node;
    }

    // Adds IDs to the Set
    for (NodeModel node in nodeMap.values) {
      _includeIds(node.id, idsToInclude, nodeMap);
    }

    for (NodeModel node in nodeMap.values) {
      // If its ID matches the filtered IDs
      if (idsToInclude.contains(node.id)) {
        NodeModel? parent = nodeMap[node.parentId] ?? nodeMap[node.locationId];
        if (parent != null && idsToInclude.contains(parent.id)) {
          parent.childrenNodes.add(node);
        } else {
          // Add root nodes if they have no parentId or locationId
          roots.add(node);
        }
      }
    }

    nodes.assignAll(roots);

    isLoading.value = false;
  }

  void _includeIds(
      String nodeId, Set<String> idsToInclude, Map<String, NodeModel> nodeMap) {
    NodeModel node = nodeMap[nodeId]!;

    // Verifies the filters
    bool matchesFilter = (filterController.text.isNotEmpty &&
            node.name
                .toLowerCase()
                .contains(filterController.text.toLowerCase())) ||
        node.sensorType == AppFilters.getFilterType(selectedFilter.value) ||
        node.status == AppFilters.getFilterType(selectedFilter.value) ||
        (filterController.text.isEmpty &&
            selectedFilter.value == AppFilters.none) ||
        idsToInclude.contains(node.id);

    if (matchesFilter) {
      if (!idsToInclude.contains(node.id)) {
        // Add Node ID to the set
        idsToInclude.add(node.id);
      }

      // Add parent or location IDs to the set
      if (node.parentId != null && idsToInclude.add(node.parentId!)) {
        _includeIds(node.parentId!, idsToInclude, nodeMap);
      }
      if (node.locationId != null && idsToInclude.add(node.locationId!)) {
        _includeIds(node.locationId!, idsToInclude, nodeMap);
      }
    }
  }
}
