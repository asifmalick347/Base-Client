import 'package:base_client/helpers/dialog_helper.dart';
import 'package:base_client/services/app_exceptions.dart';

class BaseController{

  void handleError(error){
    if(error is BadRequestException){
      DialogHelpers.showErrorDialog(title: 'Error', body: error.message.toString());
    } 
    else if(error is FetchDataException){
      DialogHelpers.showErrorDialog(title: 'Error', body: error.message.toString());
    }
    else if(error is ApiNotRespondingException){
      DialogHelpers.showErrorDialog(title: 'Error', body: error.message.toString());
    }
  }
}