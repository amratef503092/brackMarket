import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renters/view/gold/data/repo/gold_repo.dart';

import '../../../../core/models/coin_model.dart';
import '../../../../core/utility/assets_manger/assets_manager.dart';
import '../../../../core/utility/text_manager/text_manger.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> 
{
  GoldCubit() : super(GoldInitial());
  GoldRepo dataCoinRepo = GoldRepoImpl();
  List<CoinModel> currencyList =
  [
    CoinModel(
      name: TextManager.kartGold24,
      logo: AssetsManager.coin,
      price: 0,
    ),
    CoinModel(
      name: TextManager.kartGold22,
      logo: AssetsManager.coin,
      price: 0,
    ),
    CoinModel(
      name: TextManager.kartGold21,
      logo: AssetsManager.coin,
      price:0,
    ),
    CoinModel(
      name: TextManager.kartGold18,
      logo: AssetsManager.coin,
      price: 0,
    ),
    // CoinModel(
    //   name: TextManager.kartGold12,
    //   logo: AssetsManager.coin,
    //   price: 0,
    // ),
    // CoinModel(
    //   name: TextManager.ounceOFGOLD,
    //   logo: AssetsManager.gold,
    //   price: 0,
    // ),
    // CoinModel(
    //   name: TextManager.goldCoin,
    //   logo: AssetsManager.coin,
    //   price: 0,
    // ),

  ];
  void getGoldData() async
  {
    emit(GoldLoading());
    final result = await dataCoinRepo.getGoldData();
    result.fold((l) => emit(GoldError(message: l.message)), (r) 
    {
      for (int i = 0; i < currencyList.length; i++)
      {
       r[i].forEach((key, value)
        {
          currencyList[i] = currencyList[i].copyWith(price: double.parse(value));
         }); 
      }
        });
        emit(GoldLoaded());
  }
}
