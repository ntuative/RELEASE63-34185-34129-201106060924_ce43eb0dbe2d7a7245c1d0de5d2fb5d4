package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_477:RoomObjectLocationCacheItem = null;
      
      private var var_220:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_477 = new RoomObjectLocationCacheItem(param1);
         this.var_220 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_477;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_220;
      }
      
      public function dispose() : void
      {
         if(this.var_477 != null)
         {
            this.var_477.dispose();
            this.var_477 = null;
         }
         if(this.var_220 != null)
         {
            this.var_220.dispose();
            this.var_220 = null;
         }
      }
   }
}
