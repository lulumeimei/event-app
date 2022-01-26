import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketapp/models/index.dart';
import 'package:ticketapp/views/event_detail_repo/bloc/event_detail_bloc.dart';

class EventDetailLoadedPage extends StatefulWidget {
  const EventDetailLoadedPage({Key? key}) : super(key: key);

  @override
  _EventDetailLoadedPageState createState() => _EventDetailLoadedPageState();
}

class _EventDetailLoadedPageState extends State<EventDetailLoadedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late TicketMaster ticketMaster;

    return BlocBuilder<EventDetailBloc, EventDetailModel>(
      builder: (context, state) {
        if (context.read<EventDetailBloc>().state.eventDetailState
            is EventDetailLoaded) {
          ticketMaster = (context.read<EventDetailBloc>().state.eventDetailState
                  as EventDetailLoaded)
              .ticketMaster;
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: false,
                pinned: true,
                floating: true,
                stretch: true,
                // title: Text(
                //   ticketMaster.name,
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                // ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    ticketMaster.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  background: Hero(
                    tag: ticketMaster.id,
                    child: Image.network(
                      ticketMaster.ticketImageList.isNotEmpty
                          ? ticketMaster.ticketImageList.first.url
                          : "https://myenglishmatters.com/wp-content/uploads/2020/11/placeholder.png",
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.srcOver,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.color
                              ?.withOpacity(.7)
                          : Colors.grey[850]!.withOpacity(.5),
                    ),
                  ),
                  collapseMode: CollapseMode.parallax,
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                ),
                expandedHeight: 230,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    tooltip: 'Favorite',
                    onPressed: () {},
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    tileColor:
                        (index % 2 == 0) ? Colors.white : Colors.green[50],
                    title: Center(
                      child: Text('$index',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 50,
                              color: Colors.greenAccent[400]) //TextStyle
                          ), //Text
                    ), //Center
                  ), //ListTile
                  childCount: 51,
                ), //SliverChildBuildDelegate
              ) //SliverList
            ], //<Widget>[]
          ),
        );
      },
    );
  }
}
