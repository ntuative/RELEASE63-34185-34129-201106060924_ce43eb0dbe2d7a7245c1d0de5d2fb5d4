package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_754;
         param1["bitmap"] = const_641;
         param1["border"] = const_970;
         param1["border_notify"] = const_1909;
         param1["bubble"] = const_773;
         param1["bubble_pointer_up"] = const_1320;
         param1["bubble_pointer_right"] = const_1286;
         param1["bubble_pointer_down"] = const_1186;
         param1["bubble_pointer_left"] = const_1217;
         param1["button"] = const_616;
         param1["button_thick"] = const_745;
         param1["button_icon"] = const_1767;
         param1["button_group_left"] = const_869;
         param1["button_group_center"] = const_714;
         param1["button_group_right"] = const_1005;
         param1["canvas"] = const_815;
         param1["checkbox"] = const_740;
         param1["closebutton"] = const_1343;
         param1["container"] = const_449;
         param1["container_button"] = const_882;
         param1["display_object_wrapper"] = const_768;
         param1["dropmenu"] = const_510;
         param1["dropmenu_item"] = const_495;
         param1["frame"] = const_387;
         param1["frame_notify"] = const_1711;
         param1["header"] = const_817;
         param1["html"] = const_1345;
         param1["icon"] = const_1150;
         param1["itemgrid"] = const_1194;
         param1["itemgrid_horizontal"] = const_639;
         param1["itemgrid_vertical"] = const_997;
         param1["itemlist"] = const_1271;
         param1["itemlist_horizontal"] = const_439;
         param1["itemlist_vertical"] = const_438;
         param1["label"] = const_948;
         param1["maximizebox"] = const_1953;
         param1["menu"] = const_1839;
         param1["menu_item"] = const_1808;
         param1["submenu"] = const_1218;
         param1["minimizebox"] = const_1960;
         param1["notify"] = const_1725;
         param1["null"] = const_1001;
         param1["password"] = const_1008;
         param1["radiobutton"] = const_914;
         param1["region"] = const_412;
         param1["restorebox"] = const_1897;
         param1["scaler"] = const_582;
         param1["scaler_horizontal"] = const_1758;
         param1["scaler_vertical"] = const_1796;
         param1["scrollbar_horizontal"] = const_610;
         param1["scrollbar_vertical"] = const_912;
         param1["scrollbar_slider_button_up"] = const_1367;
         param1["scrollbar_slider_button_down"] = const_1337;
         param1["scrollbar_slider_button_left"] = const_1181;
         param1["scrollbar_slider_button_right"] = const_1321;
         param1["scrollbar_slider_bar_horizontal"] = const_1334;
         param1["scrollbar_slider_bar_vertical"] = const_1314;
         param1["scrollbar_slider_track_horizontal"] = const_1146;
         param1["scrollbar_slider_track_vertical"] = const_1329;
         param1["scrollable_itemlist"] = const_1931;
         param1["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
         param1["scrollable_itemlist_horizontal"] = const_1263;
         param1["selector"] = const_757;
         param1["selector_list"] = const_705;
         param1["submenu"] = const_1218;
         param1["tab_button"] = const_830;
         param1["tab_container_button"] = const_1215;
         param1["tab_context"] = const_388;
         param1["tab_content"] = const_1350;
         param1["tab_selector"] = const_814;
         param1["text"] = const_782;
         param1["input"] = const_975;
         param1["toolbar"] = const_1829;
         param1["tooltip"] = const_417;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
