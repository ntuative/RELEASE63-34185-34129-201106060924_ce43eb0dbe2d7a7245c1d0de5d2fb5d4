package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2943:String;
      
      private var var_2922:String;
      
      public function WelcomeNotification(param1:String, param2:String)
      {
         super();
         this.var_2943 = param1;
         this.var_2922 = param2;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2943;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2922;
      }
   }
}
