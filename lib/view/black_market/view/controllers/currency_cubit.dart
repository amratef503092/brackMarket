import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renters/core/utility/assets_manger/assets_manager.dart';
import 'package:renters/core/utility/text_manager/text_manger.dart';
import 'package:renters/view/black_market/data/repo/currency_repo.dart';

import '../../../../core/models/coin_model.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState>
{
  CurrencyCubit() : super(CurrencyInitial());
  CurrencyRepo dataCoinRepo = CurrencyRepoImpl();

  List<CoinModel> currencyList =
  [
    CoinModel(
      name: TextManager.unitedStatesDollar,
      logo: AssetsManager.unitedStateLogo,
      price: 0,
      url:  "https://www.tradingview.com/chart/?symbol=FX_IDC%3AUSDEGP"
    ),
    CoinModel(
      name: TextManager.euro,
      logo: AssetsManager.euroImage,
      price: 0,
      url: "https://www.tradingview.com/chart/?symbol=FX_IDC%3AEUREGP",
    ),
    CoinModel(
      name: TextManager.biritch,
      logo: AssetsManager.biritch,
      price: 0,
      url: "https://www.tradingview.com/chart/?symbol=FX_IDC%3AGBPEGP",
    ),
    CoinModel(
      name: TextManager.sudiaRiyal,
      logo: AssetsManager.sudiaRyal,
      price: 0,

    ),
  CoinModel(
      name: TextManager.kuwaiti,
      logo: AssetsManager.kuwaiti,
      price: 0,
    ),
  
    
      CoinModel(
      name: TextManager.emarates,
      logo: AssetsManager.emarates,
      price: 0,

    ),
     CoinModel(
      name: TextManager.qatar,
      logo: AssetsManager.qatar,
      price: 0,
    ),
    CoinModel(
      name: TextManager.jordan,
      logo: AssetsManager.jordn,
      price: 0,
    ),
    CoinModel(
      name: TextManager.bahrain,
      logo: AssetsManager.bahrain,
      price: 0,
    ),
    CoinModel(
      name: TextManager.oman,
      logo: AssetsManager.oman,
      price: 0,
    ),
    
       CoinModel(
      name: TextManager.chf,
      logo: AssetsManager.switzerland,
      price: 0,
    ),
      CoinModel(
      name: TextManager.canadian,
      logo: AssetsManager.canadian,
      price: 0,
    ),
    CoinModel(
      name: TextManager.australia,
      logo: AssetsManager.australia,
      price: 0,
    ),
    CoinModel(
      name: TextManager.laybian,
      logo: AssetsManager.laybian,
      price: 0,
    ),
    

    CoinModel(
      name: TextManager.china,
      logo: AssetsManager.china,
      price: 0,
    ),


  ];

  Future<void> geCurrencyData()
  async 
  {
    emit(CurrencyLoading());
    final result = await dataCoinRepo.getCryptoData();
    result.fold((l) => emit(CurrencyError(l.message)), 
    (r) 
    {
     
        for (int i = 0; i <currencyList.length; i++) 
           {

            r[i].forEach((key, value) 
            {
           
              currencyList[i] = 
              currencyList[i].
              copyWith(price: double.parse(value));

                  
            });
           }
      
           

      emit(CurrencyLoaded());
    });

  }
}
