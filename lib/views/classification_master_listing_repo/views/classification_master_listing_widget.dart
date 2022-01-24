import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketapp/views/classification_master_listing_repo/bloc/classification_master_listing_bloc.dart';

class ClassificationMasterListingWidget extends StatefulWidget {
  const ClassificationMasterListingWidget({Key? key}) : super(key: key);

  @override
  _ClassificationMasterListingWidgetState createState() =>
      _ClassificationMasterListingWidgetState();
}

class _ClassificationMasterListingWidgetState
    extends State<ClassificationMasterListingWidget> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() {
    context.read<ClassificationMasterListingBloc>().add(
          LoadClassificationMasterList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
