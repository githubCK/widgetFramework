//
//  widgetBundle.swift
//  widget
//
//  Created by lywn3525 on 2023/12/6.
//

import WidgetKit
import SwiftUI
//需要实现一个 JsonToWidgetKit的工具库
//import JsonToWidgetKit

@main
struct widgetBundle: WidgetBundle {
    var body: some Widget {
        widget()
        // TODO: [看这里]
//        JsonToWidget(
//        //  属性参数设置参考
//            defaultJson:"",//默认的布局json数据，小组件内有个getTimeLine可用于刷新
//            dataUrl:"",//一个数据服务接口，
//        //  defaultJson和dataUrl的关系说明：
//        //  defaultJson包含全部的小组件视图内容，比如一个内部有多个文字和图片（其属性渲染参考excel里的text和image）
//        //  dataUrl获取数据后，用来更新defaultJson,生成新的json数据用于渲染（方便做小组件内容的更新，如设置某个组件文字内容，隐藏或者显示某个组件）
//            kind:"",//小组件标识，用于客户端主动刷新小组件时使用，相当于id
//            suiteName:"",//当前小组件的数据通讯同步标识，这个是appgroups功能，每个小组件都唯一，相当于一个共享数据表，可以设置和更新小组件，比如游戏客户端需要传入角色和服务器，以供数据服务接口调用
//        )
    }
}


//dataUrl获取的数据格式参考：

//{
//    "id":"widget_display",
//    "data":{
//        "player":{
//            "type":"text", //player为defaultJson中某个组件的name（唯一）
//            "content":"玩家名"//即修改其内容为content（玩家们）
//        },
//        "userSettingDouble0":{
//            "type":"state",
//            "selected":"qxzl"
//         },
//         "display_qxzl_game_state":{
//              "type":"state",
//              "selected":"meet",
//         },
//         "image_qxzl_small_level":{
//               "type":"image",
//               "content":"image_display_jianbian1.png"
//         },
//         "qxzl_level":{
//                "type":"text",
//                "content":"钻石1段"
//         },
//         "userSettingDouble1":{
//                "type":"state",
//                "selected":"qxzl"
//        }
//    }
//}
