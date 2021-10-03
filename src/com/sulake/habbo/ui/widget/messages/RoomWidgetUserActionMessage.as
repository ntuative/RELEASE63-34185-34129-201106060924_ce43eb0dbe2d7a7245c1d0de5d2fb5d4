package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_524:String = "RWUAM_WHISPER_USER";
      
      public static const const_628:String = "RWUAM_IGNORE_USER";
      
      public static const const_645:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_396:String = "RWUAM_KICK_USER";
      
      public static const const_538:String = "RWUAM_BAN_USER";
      
      public static const const_491:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_599:String = "RWUAM_RESPECT_USER";
      
      public static const const_643:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_528:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_518:String = "RWUAM_START_TRADING";
      
      public static const const_910:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_647:String = "RWUAM_KICK_BOT";
      
      public static const const_501:String = "RWUAM_REPORT";
      
      public static const const_487:String = "RWUAM_PICKUP_PET";
      
      public static const const_1919:String = "RWUAM_TRAIN_PET";
      
      public static const const_561:String = " RWUAM_RESPECT_PET";
      
      public static const const_450:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_581:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
