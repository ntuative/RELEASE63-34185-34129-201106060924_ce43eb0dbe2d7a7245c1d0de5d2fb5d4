package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_810:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1113)
         {
            _structure = null;
            _assets = null;
            var_269 = null;
            var_295 = null;
            var_611 = null;
            var_586 = null;
            var_344 = null;
            if(!var_1386 && var_46)
            {
               var_46.dispose();
            }
            var_46 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_778 = null;
            var_1113 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_810[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_810[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_444:
               switch(_loc3_)
               {
                  case AvatarAction.const_861:
                  case AvatarAction.const_608:
                  case AvatarAction.const_407:
                  case AvatarAction.const_934:
                  case AvatarAction.const_419:
                  case AvatarAction.const_829:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_319:
            case AvatarAction.const_906:
            case AvatarAction.const_291:
            case AvatarAction.const_878:
            case AvatarAction.const_966:
            case AvatarAction.const_798:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
