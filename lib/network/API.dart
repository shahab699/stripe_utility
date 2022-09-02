import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:stripe_utility/res/strings.dart';
import 'package:stripe_utility/utilities/myToast.dart';

import 'models.dart';



class MyApi{

    static Future <dynamic> callPostApi({String? url,dynamic body,Map<String,dynamic>? parameters,Map<String,dynamic>?myHeaders,dynamic modelName}) async {
        try{
          var dio= Dio();
          var connectivityResult = await (Connectivity().checkConnectivity());
          if(connectivityResult != ConnectivityResult.none){
            Response _response= await dio.post(url!,options: Options(headers: myHeaders),data: body,queryParameters: parameters);
            switch(_response.statusCode){
              case 200:
                dynamic  modelobj = await Models.getModelObject(modelName, _response.data);
                if(modelobj.code==1)
                  return modelobj;
                else
                  ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
                return null;

              default:
                ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
                return null;
            }
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading:"No internet");
            return null;
          }


        } on DioError catch (ex){

          if(ex.response!=null){
            switch(ex.response!.statusCode){
              case 400:
                ApplicationToast.getErrorToast(durationTime: 3,heading: ex.response!.data["Message"]);
                return null;
              case 401:
                ApplicationToast.getErrorToast(durationTime: 3,heading: ex.response!.data["Unauthorized acces"]);
                return null;
              default:
                ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
                return null;
            }
          }
          else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
          }


        } on Exception catch (ex){
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
          return null;
        }
    }



    static Future <dynamic> callGetApi({String? url,Map<String,dynamic>? parameters,
      Map<String,dynamic>?myHeaders,dynamic modelName}) async {
      try{
        var dio= Dio();
        var connectivityResult = await (Connectivity().checkConnectivity());
        if(connectivityResult != ConnectivityResult.none){
          Response _response= await dio.get(url!,options: Options(headers: myHeaders),queryParameters: parameters);
          switch(_response.statusCode){
            case 200:
              dynamic  getModelObj = await Models.getModelObject(modelName, _response.data);
              if(getModelObj.code==1)
                 return getModelObj;
              else
                ApplicationToast.getErrorToast(durationTime: 3, heading: getModelObj.message);
              return null;

            default:
              ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
              return null;
          }
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: "No internet");
          return null;
        }


      } on DioError catch (ex){

        if(ex.response!=null){
          switch(ex.response!.statusCode){
            case 400:
              ApplicationToast.getErrorToast(durationTime: 3,heading: ex.response!.data["Message"]);
              return;
            case 401:
              ApplicationToast.getErrorToast(durationTime: 3,heading: ex.response!.data["Unauthorized access"]);
              return;
            default:
              ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
              return;
          }
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
        }
      } on Exception catch (ex){
        ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.badHappenedError);
        return;
      }
    }




}