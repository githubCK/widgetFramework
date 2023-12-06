# 项目：根据json生成widget，并支持网络数据处理组件显示逻辑

## 思路：

1，实现一个固定json生成widget的功能，在当前项目中app/widget

2,   实现网络请求并处理默认json后生成新的json，渲染新的widget视图内容

3，抽离逻辑代码，导出部分客户端调用的接口等

4，创建新的Framework target，编译release供提供给客户端
