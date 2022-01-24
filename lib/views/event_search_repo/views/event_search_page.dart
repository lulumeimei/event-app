import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketapp/views/event_search_repo/bloc/event_search_bloc.dart';

class EventSearchPage extends StatefulWidget {
  const EventSearchPage({Key? key}) : super(key: key);

  @override
  _EventSearchPageState createState() => _EventSearchPageState();
}

class _EventSearchPageState extends State<EventSearchPage> {
  TextEditingController searchCon = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchCon.dispose();
  }

  _onSearchTriggered() {
    FocusScope.of(context).unfocus();
    if (searchCon.text.isEmpty) {
      return;
    }
    // TODO: perform search here
  }

  List<Widget> get _bodyContent {
    // show history seach
    List<Widget> widgetlist = [];
    return widgetlist;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventSearchBloc>(
      create: (context) => EventSearchBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<EventSearchBloc, EventSearchModel>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: TextFormField(
                  controller: searchCon,
                  onChanged: (String? val) {
                    context.read<EventSearchBloc>().add(
                          QueryStringChanges(
                            val: val ?? '',
                          ),
                        );
                  },
                  onEditingComplete:
                      state.eventSearchState is EventSearchInitial
                          ? _onSearchTriggered
                          : null,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search events',
                    suffixIcon: IconButton(
                      onPressed: state.eventSearchState is EventSearchInitial
                          ? _onSearchTriggered
                          : null,
                      icon: Icon(
                        Icons.search,
                        color: state.eventSearchState is EventSearchInitial
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              body: ListView(
                padding: EdgeInsets.all(
                  10.sp,
                ),
                children: _bodyContent,
              ),
            );
          },
        );
      }),
    );
  }
}
