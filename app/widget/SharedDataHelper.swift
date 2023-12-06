//
//  File.swift
//  widgetExtension
//
//  Created by lywn3525 on 2023/12/6.
//
//

import Foundation


// 确保在iOS 14及以上版本导入WidgetKit
#if canImport(WidgetKit)
import WidgetKit
#endif
import Foundation
import os

//此类的主要功能用于存储所有数据，就是数据持久化的概念
//此次需要处理JsonToWidget初始化时的各种数据
//应当需要存储默认Json数据，以支持网络请求后以该json为模板

class SharedDataHelper {
    private init() {
        
    }
    
    private static let sharedDefaults = UserDefaults(suiteName: "")//如何单例实现传入suitname是个代码问题

    static func set(_ value: Any?, forKey key: String) {
        SharedDataHelper.sharedDefaults?.set(value, forKey: key)
        refreshWidgetsIfNeeded(forKey: key)
    }

    static func get(forKey key: String) -> Any? {
        return SharedDataHelper.sharedDefaults?.value(forKey: key)
    }

    static func setEncodable<T: Encodable>(_ data: T, forKey key: String) {
        do {
            let jsonData = try JSONEncoder().encode(data)
            SharedDataHelper.sharedDefaults?.set(jsonData, forKey: key)
        } catch {
            os_log("Failed to encode object: %@", error.localizedDescription)
        }
    }

    static func getDecodable<T: Decodable>(forKey key: String) -> T? {
        guard let jsonData = SharedDataHelper.sharedDefaults?.data(forKey: key) else {
            return nil
        }
        do {
            let object = try JSONDecoder().decode(T.self, from: jsonData)
            return object
        } catch {
            os_log("Failed to decode object: %@", error.localizedDescription)
            return nil
        }
    }

    static func removeObject(forKey key: String) {
        SharedDataHelper.sharedDefaults?.removeObject(forKey: key)
    }

    // 刷新小组件的辅助方法
    private static func refreshWidgetsIfNeeded(forKey key: String) {
        if key == "roleId" {
            #if canImport(WidgetKit)
            if #available(iOS 14, *) {
                WidgetCenter.shared.reloadTimelines(ofKind: "小组件的kind")
            }
            #endif
        }
    }
}
