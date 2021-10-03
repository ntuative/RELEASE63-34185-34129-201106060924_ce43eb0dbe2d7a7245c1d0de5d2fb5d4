package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_980:IAssetLoader;
      
      private var var_2567:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2567 = param1;
         this.var_980 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2567;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_980;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_980 != null)
            {
               if(!this.var_980.disposed)
               {
                  this.var_980.dispose();
                  this.var_980 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
