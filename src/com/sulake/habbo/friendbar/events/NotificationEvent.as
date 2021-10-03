package com.sulake.habbo.friendbar.events
{
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import flash.events.Event;
   
   public class NotificationEvent extends Event
   {
      
      public static const const_883:String = "FBE_NOTIFICATION_EVENT";
       
      
      public var var_2966:int;
      
      public var notification:FriendNotification;
      
      public function NotificationEvent(param1:int, param2:FriendNotification)
      {
         super(const_883);
         this.var_2966 = param1;
         this.notification = param2;
      }
   }
}
