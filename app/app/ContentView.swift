//
//  ContentView.swift
//  app
//  工具demo页面：游戏客户端应用一般需要传入roleId,serverId：小组件数据服务接口传入参数
//  Created by lywn3525 on 2023/12/6.
//
//VStack:一类竖向布局的容器
//HStack:横向
//ZStack:Z轴向（用于层叠）

import SwiftUI


//扩展，支持Color直接设置16进制色值


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        let red = Double((hex >> 16) & 0xFF) / 255
        let green = Double((hex >> 8) & 0xFF) / 255
        let blue = Double(hex & 0xFF) / 255
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
var cBlue = Color(hex: 0x2079ee, alpha: 1)

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(hex: 0x2079ee, alpha: 0.5),Color.white], startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
            VStack {
                InfoInputView()
            }
            .padding()
        }
        
    }
}
//内容输入区
struct InfoInputView: View {
    //角色id
    @State private var roleId:String = ""
    //服务器id
    @State private var server:String = ""
    @State private var showAlert:Bool = false
    var body: some View {
        VStack{
            HStack{
                Text("小组件接口参数")
                    .font(.largeTitle)
                    .foregroundColor(cBlue)
            }
            HStack{
                Text("roleId:").font(.title).foregroundColor(cBlue).frame(width: 82.0)
                TextField("在此输入roleId", text: $roleId)
                //设置样式
                    
                    .padding(.all)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack{
                Text("server:").font(.title).foregroundColor(cBlue).frame(width: 82.0)
                TextField("在此输入server", text: $server)
                //设置样式
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all)
            }
            Spacer()
            HStack{
                Button {
                    print("清空成功")
                    roleId = ""
                    server = ""
                    showAlert = true
                } label: {
                    Text("清空")
                        .foregroundColor(Color(hex: 0x2079ee))
                        .padding()
                        .frame(width: 100.0)
                        .background(Color.white)
                        .cornerRadius(12)
                        
                }
                Button {
                    print("设置成功")
                    //TODO: [需要同步数据到小组件中，使用appGroups功能,并刷新小组件]
                } label: {
                    Text("设置")
                        .foregroundColor(Color(hex: 0x2079ee))
                        .padding()
                        .frame(width: 100.0)
                        .background(Color.white)
                        .cornerRadius(12)
                        
                }

            }.alert(isPresented: $showAlert) {
                Alert(title: Text("恭喜"), message: Text("清空成功啦"), dismissButton: .default(Text("OK")))
            }
        }
    }
}



//内容预览脚本，swiftui版本非最新无法使用宏，如#preview


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
