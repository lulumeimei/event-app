// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:ticketapp/models/index.dart';

class Sales extends Equatable {
  static const PUBLIC = 'public';
  static const PRESALES = 'presales';

  final PublicSales publicSales;
  final List<PreSale> preSaleList;

  const Sales({
    required this.publicSales,
    required this.preSaleList,
  });

  factory Sales.fromJson(Map<String, dynamic> map) {
    List<PreSale> presales = [];

    for (Map<String, dynamic> presaleMap in map[Sales.PRESALES] ?? []) {
      PreSale preSale = PreSale.fromJson(presaleMap);
      presales.add(preSale);
    }
    return Sales(
      publicSales: PublicSales.fromJson(map[Sales.PUBLIC]),
      preSaleList: presales,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Sales.PUBLIC: publicSales.toJson(),
      Sales.PRESALES: preSaleList
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    };
  }

  @override
  List<Object?> get props => [
        publicSales,
        preSaleList,
      ];
}
