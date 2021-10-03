package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class FriendRequestEvent extends Event
   {
      
      public static const const_921:String = "FBE_REQUESTS";
       
      
      public function FriendRequestEvent()
      {
         super(const_921,false,false);
      }
   }
}
