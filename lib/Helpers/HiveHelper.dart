import 'package:hive/hive.dart';

class HiveHelper{
 static const onboardingBox = "onboarding";
  static void setOnboarding(){
   Hive.box(onboardingBox).put("OnboardingKey", true);
 }
 static bool GetonboardingBox(){
   if( Hive.box(onboardingBox).isEmpty){
          return true;
   }
   return false;
 }
}