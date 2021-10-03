package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class TutorialClothesChangeView implements ITutorialUIView
   {
       
      
      private var var_34:TutorialUI;
      
      private var var_1735:IWindowContainer;
      
      public function TutorialClothesChangeView(param1:IItemListWindow, param2:TutorialUI)
      {
         super();
         this.var_34 = param2;
         var _loc3_:IWindowContainer = param2.buildXmlWindow("tutorial_change_clothes") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = this.windowProcedure;
         param1.addListItem(_loc3_ as IWindow);
         this.var_34.prepareForTutorial();
      }
      
      public function get view() : IWindowContainer
      {
         return null;
      }
      
      public function get id() : String
      {
         return TutorialUI.const_392;
      }
      
      public function dispose() : void
      {
         this.var_34 = null;
         if(this.var_1735)
         {
            this.var_1735.dispose();
            this.var_1735 = null;
         }
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param2.name)
         {
            case "button_cancel":
               if(param1.type == WindowMouseEvent.const_44)
               {
                  this.var_34.showView(TutorialUI.const_95);
               }
         }
      }
   }
}
