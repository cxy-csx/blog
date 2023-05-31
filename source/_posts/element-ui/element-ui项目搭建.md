---
title: element-ui项目搭建
date: 2023-05-30 18:27:03
---

# Element Plus搭建流程

Element-UI和Element Plus都是基于Vue.js的UI组件库，它们有一些区别：

1. 维护者：Element-UI是饿了么团队开发和维护的，而Element Plus是由社区开发和维护的。
2. Vue版本支持：Element-UI支持Vue 2.x版本，而Element Plus同时支持Vue 2.x和Vue 3.x版本。
3. 样式：Element-UI使用的是基于LESS的自定义主题样式，而Element Plus使用的是基于SCSS的自定义主题样式。
4. 组件：Element Plus在Element-UI的基础上进行了一些扩展和改进，并添加了新的组件。Element Plus相对于Element-UI来说，更加现代化、功能更强大，提供了更多的组件和功能选项。
5. 文档和社区支持：Element-UI拥有较为完善的官方文档和活跃的社区支持，而Element Plus的文档和社区支持相对较新，正在不断完善和发展。

总的来说，Element Plus是对Element-UI的升级和扩展，提供了更好的兼容性和更多的功能选项，特别适用于Vue 3.x版本的项目。如果你正在开始一个新的项目或者正在使用Vue 3.x版本，推荐使用Element Plus。如果你已经在使用Element-UI并且项目依赖于Vue 2.x版本，可以继续使用Element-UI。

如果你想使用最简洁的步骤创建一个基于Element Plus的Vue项目，可以按照以下步骤进行操作：

1.安装 Vue CLI

```
npm install -g @vue/cli
```

2.创建新项目

```
vue create my-project --default
```

在命令中，将"my-project"替换为你想要为项目选择的名称。使用`--default`参数可以选择默认配置，跳过交互式设置。

3.进入项目目录：安装完成后，使用以下命令进入项目目录：

```
cd my-project
```

4.Element UI

```
npm install element-ui
```

编辑src/main.js中进行配置

```js
import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'

const app = createApp(App)
app.use(ElementPlus)
app.mount('#app')
```

这样就完成了Element UI的配置。

5.运行开发服务器

```
npm run serve
```

这将启动开发服务器，并在浏览器中打开项目
