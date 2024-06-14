import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renters/data/repo/repo.dart';

import '../../../../core/models/coin_model.dart';
import '../../../../core/utility/assets_manger/assets_manager.dart';
import '../../../../core/utility/text_manager/text_manger.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit() : super(CryptoInitial());
  DataCoinRepo dataCoinRepo = DataCoinRepoImpl();
  List<CoinModel> currencyList = [
    // CoinModel(
    //   name: TextManager.usdt,
    //   logo: AssetsManager.usdtImage,
    //   price: 0,
    // ),
    CoinModel(
        name: TextManager.bitCoinTitle,
        logo: AssetsManager.bitcoin,
        price: "0",
        url: "https://www.tradingview.com/chart/?symbol=BITSTAMP%3ABTCUSD"),
    CoinModel(
      name: TextManager.ethereumTitle,
      logo: AssetsManager.ethereum,
      price: "0",
      url: "https://www.tradingview.com/chart/?symbol=BITSTAMP%3AETHUSD",
    ),
  ];
  void getCryptoData() async {
    emit(CryptoLoading());
    final result = await dataCoinRepo.getCyraptoData();
    result.fold((l) {
      print(l.message);
      emit(CryptoError(l.message));
    }, (r) {
      currencyList = [
        // CoinModel(
        //   name: TextManager.usdt,
        //   logo: AssetsManager.usdtImage,
        //   price: '62.15',
        // ),
        CoinModel(
          name: TextManager.bitCoinTitle,
          logo: AssetsManager.bitcoin,
          price: r['bitcoin']['usd'].toString(),
        ),
        CoinModel(
          name: TextManager.ethereumTitle,
          logo: AssetsManager.ethereum,
          price: r['ethereum']['usd'].toString(),
        ),
      ];
      emit(CryptoLoaded());
    });
  }
}
