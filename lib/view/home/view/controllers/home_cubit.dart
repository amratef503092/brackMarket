import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/coin_model.dart';
import '../../../../core/utility/assets_manger/assets_manager.dart';
import '../../../../core/utility/text_manager/text_manger.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>
{
  HomeCubit() : super(HomeInitial());
  List<CoinModel> currencyList =
  [
    CoinModel(
      name: TextManager.usdt,
      logo: AssetsManager.usdtImage,
      price: 0,
    ),
    CoinModel(
      name: TextManager.kartGold21,
      logo: AssetsManager.coin,
      price: 0,
    ),
    CoinModel(
      name: TextManager.marketDifference,
      logo: AssetsManager.dollarSymbol,
      price:0,
    ),
    CoinModel(
      name: TextManager.usdInLondonMarket,
      logo: AssetsManager.dollarSymbol,
      price:0,
    ),
    CoinModel(
      name: TextManager.investingParallelMarket,
      logo: AssetsManager.dollarSymbol,
      price:0,
    ),


  ];
}
