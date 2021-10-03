package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class FriendBarUpdateEvent extends Event
   {
      
      public static const const_794:String = "FBE_UPDATED";
       
      
      public function FriendBarUpdateEvent()
      {
         super(const_794,false,false);
      }
   }
}
