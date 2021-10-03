package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_359:int = 1;
      
      public static const const_229:int = 2;
      
      public static const const_280:int = 3;
      
      public static const const_321:int = 4;
      
      public static const const_200:int = 5;
      
      public static const const_429:int = 1;
      
      public static const const_888:int = 2;
      
      public static const const_960:int = 3;
      
      public static const const_770:int = 4;
      
      public static const const_272:int = 5;
      
      public static const const_958:int = 6;
      
      public static const const_957:int = 7;
      
      public static const const_267:int = 8;
      
      public static const const_411:int = 9;
      
      public static const const_2157:int = 10;
      
      public static const const_783:int = 11;
      
      public static const const_646:int = 12;
       
      
      private var var_453:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_453 = new Array();
         this.var_453.push(new Tab(this._navigator,const_359,const_646,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_574));
         this.var_453.push(new Tab(this._navigator,const_229,const_429,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_574));
         this.var_453.push(new Tab(this._navigator,const_321,const_783,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1318));
         this.var_453.push(new Tab(this._navigator,const_280,const_272,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_574));
         this.var_453.push(new Tab(this._navigator,const_200,const_267,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_909));
         this.setSelectedTab(const_359);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_321;
      }
      
      public function get tabs() : Array
      {
         return this.var_453;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_453)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_453)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_453)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
