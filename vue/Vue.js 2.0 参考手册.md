# Vue.js 2.0 参考手册

# 基础教程

## Vue.js 2.0 安装教程

### 兼容性 

不支持 IE8 及其以下版本。支持支持所有[兼容 ECMAScript 5 的浏览器](http://caniuse.com/#feat=es5)。

### 更新日志 

### 独立版本 

#### CDN 

 推荐：[unpkg](https://unpkg.com/vue/dist/vue.js)

#### NPM

#### 独立构建 vs 运行时构建 

- 独立构建包括编译和支持 `template` 选项。 **它也依赖于浏览器的接口的存在，所以你不能使用它来为服务器端渲染。** 		
- 运行时构建不包括模板编译，不支持 `template` 选项。运行时构建，可以用 `render` 选项，但它只在单文件组件中起作用，因为单文件组件的模板是在构建时预编译到 `render` 函数中，运行时构建只有独立构建大小的30%，只有  16 Kb min+gzip大小。 

#### CSP 环境 

### 命令行工具 

### 开发版本 

### Bower

### AMD 模块加载器 



## Vue 介绍

### Vue.js 是什么 

**渐进式框架**。自底向上增量开发

 Vue.js 的目标是通过尽可能简单的 API 实现**响应的数据绑定**和**组合的视图组件**。 

### 起步

### 声明式渲染 

```vue
<div id="app"> 
  {{ message }}
</div> 

//或
<div id="app-2">
	<span v-bind:title="message">
  		Hover your mouse over me for a few seconds to see my dynamically bound title!
	</span>
</div>

var app = new Vue({
	el: '#app',
	data: {
    	message: 'Hello Vue!'
	}
})
```

`v-bind` 属性被称为**指令**。指令带有前缀 `v-`，以表示它们是 Vue.js 提供的特殊属性

### 条件与循环 

```vue
<div id="app-3">
	<p v-if="seen">Now you see me</p>
</div>

var app3 = new Vue({
  el: '#app-3',
  data: {
  	seen: true
  }
})
```

不仅可以绑定 DOM 文本到数据，也可以绑定 DOM **结构**到数据。而且，Vue.js 也提供一个强大的过渡效果系统，可以在 Vue 插入/删除元素时自动应用[过渡效果](https://vuefe.cn/guide/transitions.html)。 

`v-for` 指令可以绑定数据到数据来渲染一个列表：

```vue
<div id="app-4">
  <ol>
    <li v-for="todo in todos">
    	{{ todo.text }}
    </li>
  </ol>
</div>

var app4 = new Vue({
  el: '#app-4',
  data: {
    todos: [
      { text: 'Learn JavaScript' },
      { text: 'Learn Vue' },
      { text: 'Build something awesome' }
    ]
  }
})
```



### 处理用户输入 

用 `v-on` 指令绑定一个监听事件： 

```vue
<div id="app-5">
  <p>{{ message }}</p>
  <button v-on:click="reverseMessage">Reverse Message</button>
</div>

var app5 = new Vue({
  el: '#app-5',
  data: {
    message: 'Hello Vue.js!'
  },
  methods: {
    reverseMessage: function () {
      this.message = this.message.split('').reverse().join('')
    }
  }
})
```

 `v-model` 指令，在表单输入和应用状态中做双向数据绑定

```vue
<div id="app-6">
  <p>{{ message }}</p>
  <input v-model="message">
</div>


var app6 = new Vue({
  el: '#app-6',
  data: {
    message: 'Hello Vue!'
  }
})
```

### 用组件构建（应用） 

 在 Vue 里，一个组件实质上是一个拥有预定义选项的一个 Vue 实例

```vue
<div id="app-7">
  <ol>
    <todo-item v-for="todo in todos" v-bind:todo="todo"></todo-item>
  </ol>
</div>

Vue.component('todo-item', {
  props: ['todo'],
  template: '<li>{{ todo.text }}</li>'
})

var app7 = new Vue({
  el: '#app-7',
  data: {
    todos: [
      { text: 'Learn JavaScript' },
      { text: 'Learn Vue' },
      { text: 'Build something awesome' }
    ]
  }
})
```

### 与自定义元素的关系 

Vue.js 组件非常类似于**自定义元素**——它是 [Web 组件规范](https://www.w3.org/wiki/WebComponents/)的一部分。实际上 Vue.js 的组件语法参考了该规范。例如 Vue 组件实现了 [Slot API](https://github.com/w3c/webcomponents/blob/gh-pages/proposals/Slots-Proposal.md) 与 `is` 特性。但是，有几个关键的不同： 

1. Web 组件规范仍然远未完成，并且没有浏览器实现。相比之下，Vue.js 组件不需要任何补丁，并且在所有支持的浏览器（IE9 及更高版本）之下表现一致。必要时，Vue.js 组件也可以放在原生自定义元素之内。		 
2. Vue.js 组件提供了原生自定义元素所不具备的一些重要功能，比如组件间的数据流，自定义事件系统，以及动态的、带特效的组件替换。 

### 准备好探索更广阔的世界了？ 



## Vue 实例

### 构造器 

通过构造函数 `Vue` 创建一个 **Vue 的根实例** 启动

在文档中经常会使用 `vm` 这个变量名表示 Vue 实例。（MVVM）

在实例化 Vue 时，需要传入一个**选项对象**，它可以包含数据、模板、挂载元素、方法、生命周期钩子等选项。

可以扩展 `Vue` 构造器，从而用预定义选项创建可复用的**组件构造器**： 

```javascript
var MyComponent = Vue.extend({
	// 扩展选项
})
// 所有的 `MyComponent` 实例都将以预定义的扩展选项被创建
var myComponentInstance = new MyComponent()
```

### 属性与方法 

每个 Vue 实例都会**代理**其 `data` 对象里所有的属性

注意只有这些被代理的属性是**响应的**。如果在实例创建之后添加新的属性到实例上，它不会触发视图更新。

除了 data 属性， Vue 实例暴露了一些有用的实例属性与方法。这些属性与方法都有前缀 `$`，以便与代理的 data 属性区分。

注意，不要在实例属性或者回调函数中（如 `vm.$watch('a', newVal => this.myMethod())`）使用[箭头函数](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Functions/Arrow_functions)。因为箭头函数绑定父上下文，所以 `this` 不会像预想的一样是 Vue 实例，而是 `this.myMethod` 未被定义。 

### 实例生命周期 

有一些其它的钩子，在实例生命周期的不同阶段调用，如 `created`、`mounted`、 `updated` 、`destroyed` 。钩子的 `this` 指向调用它的 Vue 实例。一些用户可能会问 Vue.js 是否有“控制器”的概念？答案是，没有。组件的自定义逻辑可以分布在这些钩子中。 

### 生命周期图示 

内容较多~~



## 模板语法

在底层的实现上， Vue 将模板编译成虚拟 DOM 渲染函数。结合响应系统，在应用状态改变时， Vue 能够智能地计算出重新渲染组件的最小代价并应用到 DOM 操作上。 

如果熟悉虚拟 DOM 并且偏爱 JavaScript 的原始力量，你也可以不用模板，直接写渲染（render）函数，使用可选的 JSX 语法。 

### 插值 

#### 文本 

数据绑定最常见的形式就是使用 “Mustache” 语法（双大括号）的文本插值： 

```vue
<span>Message: {{ msg }}</span>
```

通过使用 v-once 指令，你也能执行一次性地插值，当数据改变时，插值处的内容不会更新。但请留心这会影响到该节点上所有的数据绑定： 

```vue
<span v-once>This will never change: {{ msg }}</span>
```

> 通过指令我们可以对文本值进行一次性赋值操作，只进行第一次的数据渲染，如果再次改变值，文本值也不会改变
>
> 应用场景 ： 一般是用在组件树中传递时，导致组件数据一层一层传递时，变改了不需要改变的场景，用v-once可以避免在组件数中只需用一次性赋值操作

#### 纯 HTML 

使用 `v-html` 指令： 

```vue
<div v-html="rawHtml"></div>
```

被插入的内容都会被当做 HTML —— 数据绑定会被忽略。注意，你不能使用 `v-html` 来复合局部模板，因为 Vue 不是基于字符串的模板引擎。组件更适合担任 UI 重用与复合的基本单元。 

你的站点上动态渲染的任意 HTML 可能会非常危险，因为它很容易导致 [XSS 攻击](https://en.wikipedia.org/wiki/Cross-site_scripting)。请只对可信内容使用 HTML 插值，**绝不要**对用户提供的内容插值。 

#### 属性 

Mustache 不能在 HTML 属性中使用，应使用 v-bind 指令： 

```vue
<div v-bind:id="dynamicId"></div>
```

这对布尔值的属性也有效 —— 如果条件被求值为 false 的话该属性会被移除： 

```vue
<button v-bind:disabled="someDynamicCondition">Button</button>
```

#### 使用 JavaScript 表达式 

对于所有的数据绑定， Vue.js 都提供了完全的 JavaScript 表达式支持。

有个限制就是，每个绑定都只能包含**单个表达式**。 

模板表达式都被放在沙盒中，只能访问全局变量的一个白名单，如 `Math` 和 `Date` 。你不应该在模板表达式中试图访问用户定义的全局变量。 

#### 过滤器 

过滤器应该被添加在 **mustache 插值**的尾部，由“管道符”指示： 

```vue
{{ message | capitalize }}
```

Vue 2.x 中，过滤器只能在 mustache 绑定中使用。为了在指令绑定中实现同样的行为，你应该使用计算属性。 

过滤器函数总接受表达式的值作为第一个参数。 

过滤器可以串联： 

```
{{ message | filterA | filterB }}
```

过滤器是 JavaScript 函数，因此可以接受参数： 

```
{{ message | filterA('arg1', arg2) }}
```

这里，字符串 `'arg1'` 将传给过滤器作为第二个参数， `arg2` 表达式的值将被求值然后传给过滤器作为第三个参数。 

### 指令 

指令（Directives）是带有 `v-` 前缀的特殊属性。指令属性的值预期是**单一 JavaScript 表达式**（除了 `v-for`）。指令的职责就是当其表达式的值改变时相应地将某些行为应用到 DOM 上。 

#### 参数 

一些指令能接受一个“参数”，在指令后以冒号指明。例如， `v-bind` 指令被用来响应地更新 HTML 属性；v-on` 指令，它用于监听 DOM 事件 

#### 修饰符 

修饰符（Modifiers）是以半角句号 `.` 指明的特殊后缀，用于指出一个指定应该以特殊方式绑定。例如，`.prevent` 修饰符告诉 `v-on` 指令对于触发的事件调用 `event.preventDefault()`： 

```vue
<form v-on:submit.prevent="onSubmit"></form>
```

### 缩写 

`Vue.js 为两个最为常用的指令提供了特别的缩写： 

### `v-bind` 缩写 

```vue
<!-- 完整语法 -->
<a v-bind:href="url"></a>
<!-- 缩写 -->
<a :href="url"></a>
```

### `v-on` 缩写 

```vue
<!-- 完整语法 -->
<a v-on:click="doSomething"></a>
<!-- 缩写 -->
<a @click="doSomething"></a>
```



## 列表渲染

### v-for

`v-for` 指令需要以 `item in items` 形式的特殊语法， `items` 是源数据数组并且 `item` 是数组元素迭代的别名。 

#### 基本用法 

```vue
<ul id="example-1">
  <li v-for="item in items">
    {{ item.message }}
  </li>
</ul>
```

```javascript
var example1 = new Vue({
  el: '#example-1',
  data: {
    items: [
      {message: 'foo' },
      {message: 'Bar' }
    ]
  }
})
```

在 `v-for` 块中，我们拥有对父作用域属性的完全访问权限。 `v-for` 还支持一个可选的第二个参数为当前项的索引。 

```vue
<ul id="example-2">
  <li v-for="(item, index) in items">
  	{{ parentMessage }} - {{ index }} - {{ item.message }}
  </li>
</ul>
```

你也可以用 `of` 替代 `in` 作为分隔符

```vue
<div v-for="item of items"></div>
```

#### Template v-for 

可以用带有 `v-for` 的`<template>`标签来渲染多个元素块。例如： 

```vue
<ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider"></li>
  </template>
</ul>
```

#### 对象迭代 v-for 

你也可以用 `v-for` 通过一个对象的属性来迭代。 

```vue
<ul id="repeat-object" class="demo">
  <li v-for="value in object">
  	{{ value }}
  </li>
</ul>
```

可以提供第二个的参数为键名： 

```vue
<div v-for="(value, key) in object">
	{{ key }} : {{ value }}
</div>
```

第三个参数为索引： 

```vue
<div v-for="(value, key, index) in object">
	{{ index }}. {{ key }} : {{ value }}
</div>
```

在遍历对象时，是按 Object.keys() 的结果遍历，但是不能保证它的结果在不同的 JavaScript 引擎下是一致的。 

#### 整数迭代 v-for 

`v-for` 也可以取整数。在这种情况下，它将重复多次模板。 

```vue
<div>
	<span v-for="n in 10">{{ n }}</span>
</div>
```

#### 组件 和 v-for 

在自定义组件里，你可以像任何普通元素一样用 `v-for` 。 

```vue
<my-component v-for="item in items"></my-component>
```

然而他不能自动传递数据到组件里，因为组件有自己独立的作用域。为了传递迭代数据到组件里，我们要用 `props` ： 

```vue
<my-component v-for="(item, index) in items"v-bind:item="item"v-bind:index="index"></my-component>
```

不自动注入 `item` 到组件里的原因是，因为这使得组件会紧密耦合到 `v-for` 如何运作。在一些情况下，明确数据的来源可以使组件可重用。 

### key 

当 Vue.js 用 `v-for` 正在更新已渲染过的元素列表时，它默认用 “就地复用” 策略。如果数据项的顺序被改变，而不是移动 DOM 元素来匹配数据项的顺序， Vue 将简单复用此处每个元素，并且确保它在特定索引下显示已被渲染过的每个元素。这个类似 Vue 1.x 的 `track-by="$index"` 。 

这个默认的模式是有效的，但是只适用于不依赖子组件状态或临时 DOM 状态（例如：表单输入值）的列表渲染输出。 

为了跟踪每个节点的身份，需要为每项提供一个唯一 `key` 属性。这个特殊的属性相当于 Vue 1.x 的 `track-by` ，但它的工作方式类似于一个属性，所以你需要用 `v-bind` 来绑定动态值： 

```vue
<div v-for="item in items" :key="item.id">
	<!-- 内容 -->
</div>
```

建议尽可能使用 `v-for` 来提供 `key`。 

因为它是 Vue 识别节点的一个通用机制， `key` 并不特别与 `v-for` 关联。 

### 数组更新检测 

#### 变异方法 

Vue 包含一组观察数组的变异方法，所以它们也将会触发视图更新。这些方法如下： 

- `push()` 	
  - `pop()` 
  - `shift()` 
  - `unshift()` 
  - `splice()` 
  - `sort()` 
  - `reverse()` 

#### 重塑数组 

变异方法(mutation method)，会改变被这些方法调用的原始数组。非变异(non-mutating method)方法，例如： `filter()`, `concat()`, `slice()` 。这些不会改变原始数组，但总是返回一个新数组。当使用用非变异方法时，可以用新数组替换旧数组

Vue 实现了一些智能启发式方法来最大化 DOM 元素重用，所以用一个含有相同元素的数组去替换原来的数组是非常高效的操作。 

#### 注意事项 

由于 JavaScript 的限制， Vue 不能检测以下变动的数组： 

1. 当你直接设置一个项的索引时，例如： `vm.items[indexOfItem] = newValue` 	
   2. 当你修改数组的长度时，例如： `vm.items.length = newLength` 

第一种情况解决方法： 

``` javascript
// Vue.set
Vue.set(example1.items, indexOfItem, newValue)
```

```javascript
// Array.prototype.splice
example1.items.splice(indexOfItem, 1, newValue)
```

第二种情况解决方法，使用 `splice`： 

```javascript
example1.items.splice(newLength)
```

### 显示过滤/排序结果 

 可以创建返回过滤或排序数组的计算属性。 

或者，可以使用 method 方法 



## 计算属性

### 基础例子 

```javascript
computed: {
  // a computed getter
  reversedMessage: function () {
  // this points to the vm instance
  return this.message.split('').reverse().join('')
}
```

#### 	计算缓存 vs Methods 

可以通过调用表达式中的method来达到同样的效果： 

```javascript
// in component
  methods: {
    reverseMessage: function () {
    return this.message.split('').reverse().join('')
  }
}
```

不同的是**计算属性是基于它的依赖缓存**。计算属性只有在它的相关依赖发生改变时才会重新取值。这就意味着只要 `message` 没有发生改变，多次访问 `reversedMessage` 计算属性会立即返回之前的计算结果，而不必再次执行函数。 

这也同样意味着如下计算属性将不会更新，因为 `Date.now()` 不是响应式依赖： 

```vue
computed: {now: function () {return Date.now()}}
```

#### 	计算属性 vs Watched Property 

Vue.js 提供了一个方法 `$watch` ，它用于观察 Vue 实例上的数据变动。当一些数据需要根据其它数据变化时， `$watch` 很有用。不过，通常更好的办法是使用计算属性而不是一个命令式的 `$watch` 回调。

#### 计算 setter 

计算属性默认只有 getter ，不过在需要时你也可以提供一个 setter ： 

```javascript
computed: {
	fullName: {
		// getter
		get: function () {
			return this.firstName + ' ' + this.lastName
		},
		// setter
		set: function (newValue) {
			var names = newValue.split(' ')
			this.firstName = names[0]
			this.lastName = names[names.length - 1]
		}
	}
}
```

现在在运行 `vm.fullName = 'John Doe'` 时， setter 会被调用， `vm.firstName` 和 `vm.lastName` 也会被对应更新。 

### 	观察 Watchers 

虽然计算属性在大多数情况下更合适，但有时也需要一个自定义的 watcher 。当你想要在数据变化响应时，执行异步操作或昂贵操作时(限制频率)，这是很有用的。 

除了 `watch` 选项之外，还可以使用 vm.$watch API 命令。 



## Class 与 Style 绑定

在 `v-bind` 用于 `class` 和 `style` 时，表达式的结果类型除了字符串之外，还可以是对象或数组。 

### 	绑定 HTML Class 

#### 对象语法 

可以传给 `v-bind:class` 一个对象，以动态地切换 class 。 

```vue
// class active 的更新将取决于数据属性 isActive 是否为真值 。
<div v-bind:class="{ active: isActive }"></div>
```

可以在对象中传入更多属性用来动态切换多个 class 。此外， `v-bind:class` 指令可以与普通的 class 属性共存。如下模板: 

```vue
<div class="static"
v-bind:class="{ active: isActive, 'text-danger': hasError }">
</div>
```

可以直接绑定数据里的一个对象： 

```vue
<div v-bind:class="classObject"></div>
data: {
  classObject: {
    active: true,
    'text-danger': false
  }
}
```

可以绑定返回对象的计算属性。这是一个常用且强大的模式： 

```vue
<div v-bind:class="classObject"></div>
data: {
  isActive: true,
  error: null
},
computed: {
  classObject: function () {
    return {
      active: this.isActive && !this.error,
      'text-danger': this.error && this.error.type === 'fatal',
    }
  }
}
```

#### 数组语法 

可以把一个数组传给 `v-bind:class` ，以应用一个 class 列表： 

```vue
<div v-bind:class="[activeClass, errorClass]">
```

如果想根据条件切换列表中的 class ，可以用三元表达式： 

```vue
<div v-bind:class="[isActive ? activeClass : '', errorClass]">
```

不过，当有多个条件 class 时这样写有些繁琐。可以在数组语法中使用对象语法： 

```vue
<div v-bind:class="[{ active: isActive }, errorClass]">
```

### 绑定内联样式 

#### 	对象语法 

`v-bind:style` 的对象语法看着非常像 CSS ，其实它是一个 JavaScript 对象。 CSS 属性名可以用驼峰式或短横分隔命名： 

```vue
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
```

直接绑定到一个样式对象通常更好，让模板更清晰： 

```vue
<div v-bind:style="styleObject"></div>
```

同样的，对象语法常常结合返回对象的计算属性使用。 

#### 	数组语法 

`v-bind:style` 的数组语法可以将多个样式对象应用到一个元素上： 

```vue
<div v-bind:style="[baseStyles, overridingStyles]">
```

#### 自动添加前缀 

当 `v-bind:style` 使用需要特定前缀的 CSS 属性时，如 `transform` ，Vue.js 会自动侦测并添加相应的前缀。 



## 表单控件绑定

### 	基础用法 

可以用 `v-model` 指令在表单控件元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。

`v-model` 并不关心表单控件初始化所生成的值。因为它会选择 Vue 实例数据来作为具体的值。 

#### 	文本 

```vue
<input v-model="message" placeholder="edit me">
<p>Message is: {{ message }}</p>
```

### 多行文本 

```vue
<span>Multiline message is:</span>
<p style="white-space: pre">{{ message }}</p>
<br>
<textarea v-model="message" placeholder="add multiple lines"></textarea>
```

### 复选框 

单个勾选框，逻辑值： 

```vue
<input type="checkbox" id="checkbox" v-model="checked">
<label for="checkbox">{{ checked }}</label>
```

多个勾选框，绑定到同一个数组： 

```vue
<input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
<label for="jack">Jack</label>
<input type="checkbox" id="john" value="John" v-model="checkedNames">
<label for="john">John</label>
<input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
<label for="mike">Mike</label>
<br>
<span>Checked names: {{ checkedNames }}</span>
```

#### 单选按钮 

```vue
<input type="radio" id="one" value="One" v-model="picked">
<label for="one">One</label>
<br>
<input type="radio" id="two" value="Two" v-model="picked">
<label for="two">Two</label>
<br>
<span>Picked: {{ picked }}</span>
```

#### 选择列表 

单选列表: 

```vue
<select v-model="selected">
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<span>Selected: {{ selected }}</span>
```

多选列表（绑定到一个数组）： 

```vue
<select v-model="selected" multiple>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<br>
<span>Selected: {{ selected }}</span>
```

动态选项，用 `v-for` 渲染： 

```vue
<select v-model="selected">
  <option v-for="option in options" v-bind:value="option.value">{{ option.text }}
  </option>
</select>
<span>Selected: {{ selected }}</span>
```

### 绑定 value 

对于单选按钮，勾选框及选择列表选项， `v-model` 绑定的 value 通常是静态字符串（对于勾选框是逻辑值）： 

```vue
<!-- 当选中时，`picked` 为字符串 "a" -->
<input type="radio" v-model="picked" value="a">
<!-- `toggle` 为 true 或 false -->
<input type="checkbox" v-model="toggle">
<!-- 当选中时，`selected` 为字符串 "abc" -->
<select v-model="selected">
  <option value="abc">ABC</option>
</select>
```

绑定 value 到 Vue 实例的一个动态属性上，这时可以用 `v-bind` 实现，并且这个属性的值可以不是字符串。 

#### 	复选框 

```vue
<input
   type="checkbox"
   v-model="toggle"
   v-bind:true-value="a"
   v-bind:false-value="b">
```

#### 单选按钮 

```vue
<input type="radio" v-model="pick" v-bind:value="a">
```

#### 选择列表设置 

```vue
<select v-model="selected">
  <!-- 内联对象字面量 -->
  <option v-bind:value="{ number: 123 }">123</option>
</select>
```

### 修饰符 

#### .lazy 

在默认情况下， `v-model` 在 `input` 事件中同步输入框的值与数据，但你可以添加一个修饰符 `lazy` ，从而转变为在 `change` 事件中同步： 

```vue
<!-- 在 "change" 而不是 "input" 事件中更新 -->
<input v-model.lazy="msg" >
```

#### .number 

自动将输入值转为 Number 类型（如果原值的转换结果为 NaN 则返回原值）

```vue
<input v-model.number="age" type="number">
```

#### .trim 

自动过滤用户输入的首尾空格： 

```vue
<input v-model.trim="msg">
```



## 事件处理器

### 监听事件 

可用 `v-on` 指令监听 DOM 事件来触发一些 JavaScript 代码。 

```vue
<div id="example-1">
<button v-on:click="counter += 1">增加 1</button>
<p>这个按钮被点击了 {{ counter }} 次。</p>
</div>
```

```vue
var example1 = new Vue({el: '#example-1',data: {counter: 0}})
```

### 方法事件处理器 

`v-on` 可以接收一个定义的方法来调用。 

### 内联处理器方法 

也可以用内联 JavaScript 语句。

有时也需要在内联语句处理器中访问原生 DOM 事件。可以用特殊变量 `$event` 把它传入方法： 

```vue
<button v-on:click="warn('Form cannot be submitted yet.', $event)">Submit</button>
```

```javascript
// ...
methods: {
warn: function (message, event) {
// 现在我们可以访问原生事件对象
if (event) event.preventDefault()
alert(message)
}
}
```

### 事件修饰符 

调用 `event.preventDefault()` 或 `event.stopPropagation()` 。最好不要在 methods 中实现：methods 只有纯粹的数据逻辑，而不是去处理 DOM 事件细节。 

 Vue.js 为 `v-on` 提供了 **事件修饰符**。通过由点(.)表示的指令后缀来调用修饰符。 

- `.stop` 	
  - `.prevent` 
  - `.capture` 
  - `.self` 

```vue
<!-- 阻止单击事件冒泡 -->
<a v-on:click.stop="doThis"></a>
<!-- 提交事件不再重载页面 -->
<form v-on:submit.prevent="onSubmit"></form>
<!-- 修饰符可以串联  --><a v-on:click.stop.prevent="doThat"></a>
<!-- 只有修饰符 -->
<form v-on:submit.prevent></form>
<!-- 添加事件侦听器时使用时间捕获模式 -->
<div v-on:click.capture="doThis">...</div>
<!-- 只当事件在该元素本身（而不是子元素）触发时触发回调 -->
<div v-on:click.self="doThat">...</div>
```

### 按键修饰符 

 Vue 允许为 `v-on` 在监听键盘事件时添加按键修饰符： 

```vue
<!-- 只有在 keyCode 是 13 时调用 vm.submit() -->
<input v-on:keyup.13="submit">
```

 Vue 为最常用的按键提供了别名： 

```vue
<!-- 同上 -->
<input v-on:keyup.enter="submit">
<!-- 缩写语法 -->
<input @keyup.enter="submit">
```

全部的按键别名： 

- enter	 
  - tab 
  - delete (捕获 “删除” 和 “退格” 键) 
  - esc 
  - space 
  - up 
  - down 
  - left 
  - right 

可以通过全局 `config.keyCodes` 对象自定义按键修饰符别名： 

```javascript
// 可以使用 v-on:keyup.f1
Vue.config.keyCodes.f1 = 112
```

### 为什么在 HTML 中监听事件? 

可能注意到这种事件监听的方式违背了关注点分离（separation of concern）传统理念。不必担心，因为所有的 Vue.js 事件处理方法和表达式都严格绑定在当前视图的 ViewModel 上，它不会导致任何维护上的困难。实际上，使用 `v-on` 有几个好处： 

1. 扫一眼 HTML 模板便能轻松定位在 JavaScript 代码里对应的方法。		 
   2. 因为你无须在 JavaScript 里手动绑定事件，你的 ViewModel 代码可以是非常纯粹的逻辑，和 DOM 完全解耦，更易于测试。	 
2. 当一个 ViewModel 被销毁时，所有的事件处理器都会自动被删除。



## 条件渲染

### v-if 

使用 `v-if` 、`v-else`： 

```vue
<h1 v-if="ok">Yes</h1>
<h1 v-else>No</h1>
```

#### template v-if 

如果我们想切换多个元素呢？此时我们可以把一个 ` 元素当做包装元素，并在上面使用 `v-if`，最终的渲染结果不会包含它。 

```vue
<template v-if="ok">
  <h1>Title</h1>
  <p>Paragraph 1</p>
  <p>Paragraph 2</p>
</template>
```

#### v-else

可以用 `v-else` 指令给 `v-if` 或 `v-show` 添加一个 “else” 块： 

```vue
<div v-if="Math.random() > 0.5">
Sorry
</div>
<div v-else>Not sorry</div>
```

`v-else` 元素必须紧跟在 `v-if` 或 `v-show` 元素的后面——否则它不能被识别。 

#### v-show 

另一个根据条件展示元素的选项是 `v-show` 指令。用法大体上一样： 

```vue
<h1 v-show="ok">Hello!</h1>
```

不同的是有 `v-show` 的元素会始终渲染并保持在 DOM 中。`v-show` 是简单的切换元素的 CSS 属性 `display` 。 

> 注意 `v-show` 不支持`<template>`语法。 

### v-if   vs.   v-show 

`v-if` 是真实的条件渲染，因为它会确保条件块在切换当中适当地销毁与重建条件块内的事件监听器和子组件。 

`v-if` 也是**惰性的**：如果在初始渲染时条件为假，则什么也不做——在条件第一次变为真时才开始局部编译（编译会被缓存起来）。 

相比之下， `v-show` 简单得多——元素始终被编译并保留，只是简单地基于 CSS 切换。 

一般来说， `v-if` 有更高的切换消耗而 `v-show` 有更高的初始渲染消耗。因此，如果需要频繁切换使用 `v-show` 较好，如果在运行时条件不大可能改变则使用 `v-if` 较好。 



## 组件

### 什么是组件？ 

在较高层面上，组件是自定义元素， Vue.js  的编译器为它添加特殊功能。在有些情况下，组件也可以是原生 HTML 元素的形式，以 is 特性扩展。 

### 使用组件 

#### 注册 

要注册一个全局组件，你可以使用 `Vue.component(tagName, options)`。 例如： 

```javascript
Vue.component('my-component', {
// 选项
})
```

对于自定义标签名，Vue.js 不强制要求遵循 [W3C规则](https://www.w3.org/TR/custom-elements/#concepts) （小写，并且包含一个短杠），尽管遵循这个规则比较好。 

组件在注册之后，便可以在父实例的模块中以自定义元素`<my-component></my-component> ` 的形式使用。要确保在初始化根实例 **之前** 注册了组件 

#### 局部注册 

通过使用组件实例选项注册，可以使组件仅在另一个实例/组件的作用域中可用

```vue
var Child = {
template: '<div>A custom component!</div>'
}
new Vue({
// ...
components: {
// <my-component> 将只在父模板可用
  'my-component': Child
 }
})
```

这种封装也适用于其它可注册的 Vue 功能，如指令。 

#### DOM 模版解析说明 

当使用 DOM 作为模版时, 你会受到 HTML 的一些限制，因为 Vue 只有在浏览器解析和标准化 HTML 后才能获取模版内容。尤其像这些元素 `ul` ， `li`， `select` ， `table` 限制了能被它包裹的元素， `option` 只能出现在其它元素内部。 

在自定义组件中使用这些受限制的元素时会导致一些问题，例如： 

```vue
<table>
<my-row>...</my-row>
</table>
```

自定义组件 `my-row`被认为是无效的内容，因此在渲染的时候会导致错误。变通的方案是使用特殊的 `is` 属性： 

```vue
<table> 
<tr is="my-row"></tr> 
</table> 
```

**应当注意，如果您使用来自以下来源之一的字符串模板，这些限制将不适用：** 

- `<script type="text/x-template">` 
- JavaScript内联模版字符串
- `.vue` 组件

  ​因此，有必要的话请使用字符串模版。 

#### `data` 必须是函数 

使用组件时，大多数选项可以被传入到 Vue 构造器中，有一个例外： `data` 必须是函数。 

这种规则的存在意义：组件共享值，增减变动会影响所有组件。应该返回新对象来避免。

#### 构成组件 

组件意味着协同工作，它们之间必然需要相互通信：父组件要给子组件传递数据，子组件需要将它内部发生的事情告知给父组件。然而，在一个良好定义的接口中尽可能将父子组件解耦是很重要的。

在 Vue.js 中，父子组件的关系可以总结为 **props down, events up** 。父组件通过 **props** 向下传递数据给子组件，子组件通过 **events** 给父组件发送消息。

### Props 

#### 使用Props传递数据 

组件实例的作用域是**孤立的**。这意味着不能并且不应该在子组件的模板内直接引用父组件的数据。可以使用 props 把数据传给子组件。 

prop 是父组件用来传递数据的一个自定义属性。子组件需要显式地用 `props` 选项 声明 “prop”： 

```javascript
Vue.component('child', {
// 声明 
props props: ['message'],
// 就像 data 一样，prop 可以用在模板内
// 同样也可以在 vm 实例中像 “this.message” 这样使用 
template: '<span>{{ message }}</span>' 
})
```

然后向它传入一个普通字符串： 

```vue
<child message="hello!"></child>
```

#### camelCase vs. kebab-case 

HTML 特性不区分大小写。当使用非字符串模版时，名字形式为 camelCase 的 prop 用作特性时，需要转为 kebab-case（短横线隔开） 

如果你使用字符串模版，不用在意这些限制。 

#### 	动态 Props 

可以用 `v-bind` 绑定动态 props 到父组件的数据。每当父组件的数据变化时，也会传导给子组件

```vue
<div> 
  <input v-model="parentMsg"> 
  <br> 
  <child v-bind:my-message="parentMsg"></child> 
</div> 
```

使用 `v-bind` 的缩写语法通常更简单： 

```vue
<child :my-message="parentMsg"></child> 
```

#### 字面量语法 vs 动态语法 

常犯的一个错误是使用字面量语法传递数值。如果想传递一个实际的 JavaScript 数字，需要使用 `v-bind` ，从而让它的值被当作 JavaScript 表达式计算： 

```vue
<!-- 传递实际的数字 --> 
<comp v-bind:some-prop="1"></comp> 
```

#### 单向数据流 

prop 是单向绑定的：当父组件的属性变化时，将传导给子组件，但是不会反过来。

每次父组件更新时，子组件的所有 prop 都会更新为最新值。这意味着你**不应该**在子组件内部改变 prop 。如果你这么做了，Vue 会在控制台给出警告。 

通常有两种改变 prop 的情况： 

1. prop 作为初始值传入，子组件之后只是将它的初始值作为本地数据的初始值使用；	
   2. prop 作为需要被转变的原始值传入。 

更确切的说这两种情况是： 

1. 定义一个局部 data 属性，并将 prop 的初始值作为局部数据的初始值。		 

   2. 定义一个 computed 属性，此属性从 prop 的值计算得出。	 

注意在 JavaScript 中对象和数组是引用类型，指向同一个内存空间，如果 prop 是一个对象或数组，在子组件内部改变它**会影响**父组件的状态。 

#### Prop 验证 

组件可以为 props 指定验证要求。如果未指定验证要求，Vue 会发出警告。当组件给其他人使用时这很有用。 

prop 是一个对象而不是字符串数组时，它包含验证要求： 

```javascript
Vue.component('example', {
props: {
// 基础类型检测 （`null` 意思是任何类型都可以） 
propA: Number,
// 多种类型 
propB: [String, Number],
// 必传且是字符串 
propC: {
type: String,
required: true 
},
// 数字，有默认值 
propD: {
type: Number,
default: 100 
},
// 数组／对象的默认值应当由一个工厂函数返回 
propE: {
type: Object,
default: function () {
return { message: 'hello' }
}
},
// 自定义验证函数 
propF: {
validator: function (value) {
return value > 10 
}
}
}
})
```

`type` 可以是下面原生构造器： 

- String	 
  - Number 
  - Boolean 
- Function 
- ​Object 
- Array 

`type` 也可以是一个自定义构造器，使用 `instanceof` 检测。 

当 prop 验证失败了， Vue 将拒绝在子组件上设置此值。 

### 	自定义事件 

如果子组件要把数据传递回去，那就是自定义事件！ 

#### 	使用 `v-on` 绑定自定义事件 

每个 Vue 实例都实现了事件接口(Events interface)，即： 

- 使用 `$on(eventName)` 监听事件	 
  - 使用 `$emit(eventName)` 触发事件 

Note that Vue’s event system is separate from the browser’s [EventTarget API](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget). Though they work similarly, `$on` and `$emit` are **not** aliases for `addEventListener` and `dispatchEvent`. 

父组件可以在使用子组件的地方直接用 `v-on` 来监听子组件触发的事件。 

​	下面是一个例子： 

```vue
<div id="counter-event-example"> 
<p>{{ total }}</p> 
<button-counter v-on:increment="incrementTotal"></button-counter> 
<button-counter v-on:increment="incrementTotal"></button-counter> 
</div> 
```

```javascript
Vue.component('button-counter', {
  template: '<button v-on:click="increment">{{ counter }}</button>',
  data: function () {
    return {
      counter: 0
    }
  },
  methods: {
    increment: function () {
      this.counter += 1
      this.$emit('increment')
    }
  },
})
new Vue({
  el: '#counter-event-example',
  data: {
    total: 0
  },
  methods: {
    incrementTotal: function () {
      this.total += 1
    }
  }
})
```

##### 给组件绑定原生事件 

可能想在某个组件的根元素上监听一个原生事件。可以使用 `.native` 修饰 `v-on` 。例如： 

```vue
<my-component v-on:click.native="doTheThing"></my-component>
```

#### 使用自定义事件的表单输入组件 

自定义事件也可以用来创建自定义的表单输入组件，使用 `v-model` 来进行数据双向绑定。表单控件进行数据绑定时的语法： 

```vue
<input v-model="something"> 
```

仅仅是一个语法糖： 

```vue
<input v-bind:value="something" v-on:input="something = $event.target.value"> 
```

所以在组件中使用时，它相当于下面的简写： 

```vue
<input v-bind:value="something" v-on:input="something = arguments[0]">
```

所以要让组件的 `v-model` 生效，它必须： 

- 接受一个 `value` 属性
- 在有新的 value 时触发 `input` 事件

#### 非父子组件通信 

在简单的场景下，使用一个空的 Vue 实例作为中央事件总线： 

```javascript
var bus = new Vue()
```

```javascript
// 触发组件 A 中的事件 
bus.$emit('id-selected', 1)
```

```javascript
// 在组件 B 创建的钩子中监听事件 
bus.$on('id-selected', function (id) {// ... })
```

在更多复杂的情况下，你应该考虑使用专门的 状态管理模式. 

### 使用 Slots 分发内容 

```vue
<app> 
  <app-header></app-header> 
  <app-footer></app-footer> 
</app> 
```

注意两点： 

1. `<app>` 组件不知道它的挂载点会有什么内容。挂载点的内容是由`<app>`的父组件决定的。		 
2. `<app>` 组件很可能有它自己的模版。 

为了让组件可以组合，我们需要一种方式来混合父组件的内容与子组件自己的模板。这个过程被称为 **内容分发** 。Vue.js 实现了一个内容分发 API ，使用特殊的 `slot` 元素作为原始内容的插槽。 

#### 编译作用域 

组件作用域简单地说是： 父组件模板的内容在父组件作用域内编译；子组件模板的内容在子组件作用域内编译。 

一个常见错误是试图在父组件模板内将一个指令绑定到子组件的属性/方法： 

```vue
<!-- 无效 --> 
<child-component v-show="someChildProperty"></child-component> 
```

假定 `someChildProperty` 是子组件的属性，上例不会如预期那样工作。父组件模板不应该知道子组件的状态。 

如果要绑定子组件内的指令到一个组件的根节点，应当在它的模板内这么做： 

```javascript
Vue.component('child-component', { 
  // 有效，因为是在正确的作用域内 
  template: '<div v-show="someChildProperty">Child</div>',
  data: function () {
    return {
      someChildProperty: true 
    }
  }
})
```

类似地，分发内容是在父组件作用域内编译。 

#### 	单个 Slot 

除非子组件模板包含至少一个 `<slot>` 插口，否则父组件的内容将会被**丢弃**。当子组件模板只有一个没有属性的 slot 时，父组件整个内容片段将插入到 slot 所在的 DOM 位置，并替换掉 slot 标签本身。 

最初在 `<slot>` 标签中的任何内容都被视为**备用内容**。备用内容在子组件的作用域内编译，并且只有在宿主元素为空，且没有要插入的内容时才显示备用内容。 

#### 具名Slots 

`<slot>` 元素可以用一个特殊的属性 `name` 来配置如何分发内容。多个 slot 可以有不同的名字。具名 slot 将匹配内容片段中有对应 `slot` 特性的元素。 

仍然可以有一个匿名 slot ，它是**默认 slot** ，作为找不到匹配的内容片段的备用插槽。如果没有默认的 slot ，这些找不到匹配的内容片段将被抛弃。  

在组合组件时，内容分发 API 是非常有用的机制。 

### 	动态组件 

多个组件可以使用同一个挂载点，然后动态地在它们之间切换。使用保留的 `<component>` 元素，动态地绑定到它的 `is` 特性： 

```javascript
var vm = new Vue({
el: '#example',
data: {
currentView: 'home' 
},
components: {
home: { /* ... */ },
posts: { /* ... */ },
archive: { /* ... */ }
}
})
```

```vue
<component v-bind:is="currentView">
<!-- 组件在 vm.currentview 变化时改变！ --> </component> 
```

也可以直接绑定到组件对象上： 

```javascript
var Home = {
template: '<p>Welcome home!</p>' 
}
var vm = new Vue({
el: '#example',
data: {
currentView: Home
}
})
```

#### `keep-alive` 

如果把切换出去的组件保留在内存中，可以保留它的状态或避免重新渲染。为此可以添加一个 `keep-alive` 指令参数： 

```vue
<keep-alive> 
<component :is="currentView"> 
<!-- 非活动组件将被缓存！ --> 
</component> 
</keep-alive> 
```

### 	杂项 

#### 	编写可复用组件 

Vue 组件的 API 来自三部分 - props, events 和 slots ： 

- **Props** 允许外部环境传递数据给组件		 
  - **Events** 允许组件触发外部环境的副作用 
- **Slots** 允许外部环境将额外的内容组合在组件中。 

  #### 子组件索引 

有时仍然需要在 JavaScript 中直接访问子组件。为此可以使用 `ref` 为子组件指定一个索引 ID 。

```vue
<div id="parent"> 
  <user-profile ref="profile">
  </user-profile> 
</div> 
```

```javascript
var parent = new Vue({ el: '#parent' })
// 访问子组件 
var child = parent.$refs.profile
```

当 `ref` 和 `v-for` 一起使用时， ref 是一个数组或对象，包含相应的子组件。 

`$refs` 只在组件渲染完成后才填充，并且它是非响应式的。它仅仅作为一个直接访问子组件的应急方案——应当避免在模版或计算属性中使用 `$refs` 。 

#### 	异步组件 

在大型应用中，我们可能需要将应用拆分为多个小模块，按需从服务器下载。为了让事情更简单， Vue.js 允许将组件定义为一个工厂函数，动态地解析组件的定义。Vue.js 只在组件需要渲染时触发工厂函数，并且把结果缓存起来，用于后面的再次渲染。 

工厂函数接收一个 `resolve` 回调，在收到从服务器下载的组件定义时调用。也可以调用 `reject(reason)` 指示加载失败。推荐配合使用 ：[Webpack 的代码分割功能](http://webpack.github.io/docs/code-splitting.html)： 

```javascript
Vue.component('async-webpack-example', function (resolve) {
// 这个特殊的 require 语法告诉 webpack 
// 自动将编译后的代码分割成不同的块， 
// 这些块将通过 Ajax 请求自动下载。 
require(['./my-async-component'], resolve)
})
```

可以使用 Webpack 2 + ES2015 的语法返回一个 `Promise` resolve 函数： 

```javascript
Vue.component(
  'async-webpack-example',
  () => System.import('./my-async-component')
)
```

Browserify 是不支持异步加载的。如果这个功能对你很重要，请使用 Webpack。 

#### 	组件命名约定 



当注册组件（或者 props）时，可以使用 kebab-case ，camelCase ，或 TitleCase 。

```javascript
// 在组件定义中 
components: {
// 使用 camelCase 形式注册 
'kebab-cased-component': { /* ... */ },
'camelCasedComponent': { /* ... */ },
'TitleCasedComponent': { /* ... */ }}
```

在 HTML 模版中，请使用 kebab-case 形式： 

```vue
<!-- 在HTML模版中始终使用 kebab-case -->
<kebab-cased-component></kebab-cased-component> 
<camel-cased-component></camel-cased-component> 
<title-cased-component></title-cased-component> 
```

当使用字符串模式时，可以不受 HTML 的 case-insensitive 限制，来引用你的组件和 prop： 

```vue
<!-- 在字符串模版中可以用任何你喜欢的方式! --> 
<my-component></my-component> 
<myComponent></myComponent> 
<MyComponent></MyComponent> 
```

如果组件未经 `slot` 元素传递内容，你甚至可以在组件名后使用 `/` 使其自闭合： 

```
<my-component/> 
```

这只在字符串模版中有效。因为自闭的自定义元素是无效的 HTML ，浏览器原生的解析器也无法识别它。 

#### 	递归组件 

组件在它的模板内可以递归地调用自己，不过，只有当它有 name 选项时才可以： 

```javascript
name: 'unique-name-of-my-component'
```

When you register a component globally using `Vue.component`, the global ID is automatically set as the component’s `name` option. 

```javascript
Vue.component('unique-name-of-my-component', {// ... })
```

If you’re not careful, recursive components can also lead to infinite loops: 

```javascript
name: 'stack-overflow',
template: '<div><stack-overflow></stack-overflow></div>'  
```

#### 	内联模版 

如果子组件有 inline-template 特性，组件将把它的内容当作它的模板，而不是把它当作分发内容。这让模板更灵活。 

```vue
<my-component inline-template> 
  <div> 
    <p>These are compiled as the component's own template.</p> 
    <p>Not parent's transclusion content.</p> 
  </div> 
</my-component> 
```

但是 inline-template 让模板的作用域难以理解。最佳实践是使用 template 选项在组件内定义模板或者在 `.vue` 文件中使用 `template` 元素。 

#### X-Templates 

另一种定义模版的方式是在 JavaScript 标签里使用 `text/x-template` 类型，并且指定一个id。

```vue
<script type="text/x-template" id="hello-world-template"> 
<p>Hello hello hello</p> 
</script> 
```

```javascript
Vue.component('hello-world', {
  template: '#hello-world-template' 
})
```

这在有很多模版或者小的应用中有用，否则应该避免使用，因为它将模版和组件的其他定义隔离了。 

#### 	使用 `v-once` 的低级静态组件(Cheap Static Component) 

尽管在 Vue 中渲染 HTML 很快，不过当组件中包含**大量**静态内容时，可以考虑使用 `v-once` 将渲染结果缓存起来： 

```javascript
Vue.component('terms-of-service', {
  template: '\
  <div v-once>\
  <h1>Terms of Service</h1>\... a lot of static content ...\
  </div>\
  '
})
```


## 对比其他框架

暂时跳过



# 高级教程

## Render 函数

### 基础 

Vue 推荐使用在绝大多数情况下使用 template 来创建你的 HTML。但有时需要 JavaScript 的完全编程的能力，这就是 **render 函数**，它比 template 更接近编译器。 

e.g.想生成一个带锚链接的标题： 

```javascript
Vue.component('anchored-heading', {
  render: function (createElement) {
    return createElement(
      'h' + this.level,   // tag name 标签名称
      this.$slots.default // 子组件中的阵列
    )
  },
  props: {
    level: {
      type: Number,
      required: true
    }
  }
})
```

在这个例子中，你需要知道当你不使用 `slot` 属性向组件中传递内容时，比如 `anchored-heading` 中的 `Hello world!`, 这些子元素被存储在组件实例中的 `$slots.default`中。

### `createElement` 参数 

如何在 `createElement` 函数中生成模板。这里是 `createElement` 接受的参数： 

```javascript
// @returns {VNode}
createElement(
  // {String | Object | Function}
  // 一个 HTML 标签，组件设置，或一个函数
  // 必须 Return 上述其中一个
  'div',
  // {Object}
  // 一个对应属性的数据对象
  // 您可以在 template 中使用.可选项.
  {
    // (下一章，将详细说明相关细节)
  },
  // {String | Array}
  // 子节点(VNodes). 可选项.
  [
    createElement('h1', 'hello world'),
    createElement(MyComponent, {
      props: {
        someProp: 'foo'
      }
    }),
    'bar'
  ]
)
```

#### 完整数据对象 

在 templates 中，`v-bind:class` 和 `v-bind:style` ，会有特别的处理，他们在 VNode 数据对象中，为最高级配置。 

```javascript
{
  // 和`v-bind:class`一样的 API
  'class': {
    foo: true,
    bar: false
  },
  // 和`v-bind:style`一样的 API
  style: {
    color: 'red',
    fontSize: '14px'
  },
  // 正常的 HTML 特性
  attrs: {
    id: 'foo'
  },
  // 组件 props
  props: {
    myProp: 'bar'
  },
  // DOM 属性
  domProps: {
    innerHTML: 'baz'
  },
  // 事件监听器基于 "on"
  // 所以不再支持如 v-on:keyup.enter 修饰器
  // 需要手动匹配 keyCode。
  on: {
    click: this.clickHandler
  },
  // 仅对于组件，用于监听原生事件，而不是组件使用 vm.$emit 触发的事件。
  nativeOn: {
    click: this.nativeClickHandler
  },
  // 自定义指令. 注意事项：不能对绑定的旧值设值
  // Vue 会为您持续追踨
  directives: [
    {
      name: 'my-custom-directive',
      value: '2'
      expression: '1 + 1',
      arg: 'foo',
      modifiers: {
        bar: true
      }
    }
  ],
  // 如果子组件有定义 slot 的名称
  slot: 'name-of-slot'
  // 其他特殊顶层属性
  key: 'myKey',
  ref: 'myRef'
}
```

#### 完整示例 

#### 约束 

##### VNodes 必须唯一 

所有组件树中的 VNodes 必须唯一。

如果你真的需要重复很多次的元素/组件，你可以使用工厂函数来实现。例如，下面这个例子 render 函数完美有效地渲染了 20 个重复的段落： 

```javascript
render: function (createElement) {
  return createElement('div',
    Array.apply(null, { length: 20 }).map(function () {
    return createElement('p', 'hi')    
  	})
  )
}
```

### 使用 JavaScript 代替模板功能 

无论什么都可以使用原生的 JavaScript 来实现，Vue 的 render 函数不会提供专用的 API。比如， template 中的 `v-if` 和 `v-for`: 

```vue
<ul v-if="items.length">  
  <li v-for="item in items">{{ item.name }}</li>
</ul>
<p v-else>No items found.</p>
```

这些都会在 render 函数中被 JavaScript 的 `if`/`else` 和 `map` 重写： 

```javascript
render: function (createElement) {
  if (this.items.length) {
    return createElement('ul', this.items.map(function (item) {
      return createElement('li', item.name)    
    }))  
  } else {
    return createElement('p', 'No items found.')  
  }
}
```

### 	JSX 

模板如此简单的情况下： 

```vue
<anchored-heading :level="1">
  <span>Hello</span> world!
</anchored-heading>
```

这就是会有一个 [Babel plugin](https://github.com/vuejs/babel-plugin-transform-vue-jsx) 插件，用于在 Vue 中使用 JSX 语法的原因，它可以让我们回到于更接近模板的语法上。 

```jsx
import AnchoredHeading from './AnchoredHeading.vue'
new Vue({
  el: '#demo',
  render (h) {
    return (
      <AnchoredHeading level={1}>
        <span>Hello</span> world!
      </AnchoredHeading>
    )
  }
})
```

将 `h` 作为 `createElement` 的别名是一个通用惯例，你会发现在 Vue 生态系统中，实际上必须用到 JSX，如果在作用域中 `h` 失去作用， 在应用中会触发报错。 

### 	函数化组件 

在这个例子中，我们标记组件为 `functional`， 这意味它是无状态（没有 `data`），无实例（没有 `this` 上下文）。
 一个 **函数化组件** 就像这样： 

```javascript
Vue.component('my-component', {
  functional: true,
  // 为了弥补缺少的实例
  // 提供第二个参数作为上下文
  render: function (createElement, context) {
    // ...
  },
  // Props 可选
  props: {
    // ...
  }
})
```

组件需要的一切都是通过上下文传递，包括： 

- `props`: 提供props 的对象	 
- `children`: VNode 子节点的数组 
- `slots`: slots 对象 
- `data`: 传递给组件的 data 对象 
- `parent`: 对父组件的引用 

在添加 `functional: true` 之后，锚点标题组件的 render 函数之间简单更新增加 `context` 参数，`this.$slots.default` 更新为 `context.children`，之后`this.level` 更新为 `context.props.level`。 

函数化组件只是一个函数，所以渲染开销也低很多。但同样它也有完整的组件封装，需要知道： 

- 程序化地在多个组件中选择一个	 
  - 在将 children, props, data 传递给子组件之前操作它们。 

e.g.一个依赖传入 props 的值的 `smart-list` 组件例子，它能代表更多具体的组件： 

```javascript
var EmptyList = { /* ... */ }
var TableList = { /* ... */ }
var OrderedList = { /* ... */ }
var UnorderedList = { /* ... */ }
Vue.component('smart-list', {
  functional: true,
  render: function (createElement, context) {
    function appropriateListComponent () {
      var items = context.props.items
      if (items.length === 0)           return EmptyList
      if (typeof items[0] === 'object') return TableList
      if (context.props.isOrdered)      return OrderedList
      return UnorderedList
    }
    return createElement(
      appropriateListComponent(),
      context.data,
      context.children
    )
  },
  props: {
    items: {
      type: Array,
      required: true
    },
    isOrdered: Boolean
  }
})
```

#### `slots()` 和 `children` 对比 



为什么同时需要 `slots()` 和 `children`。`slots().default` 不是和 `children` 类似的吗？例如：

```vue
<my-functional-component>
  <p slot="foo"> first</p>
  <p>second</p>
</my-functional-component>
```

对于这个组件，`children` 会给你两个段落标签，而 `slots().default` 只会传递第二个匿名段落标签，`slots().foo` 会传递第一个具名段落标签。同时拥有 `children` 和 `slots()` ，因此你可以选择让组件通过 `slot()` 系统分发或者简单的通过 `children` 接收，让其他组件去处理。 

### 	模板编译 

Vue 的模板实际是编译成了 render 函数。



## 插件

### 开发插件 

插件通常会为Vue添加全局功能。插件的范围没有限制——一般有下面几种： 

1. 添加全局方法或者属性，如: [vue-element](https://github.com/vuejs/vue-element) 		
   2. 添加全局资源：指令/过滤器/过渡等，如 [vue-touch](https://github.com/vuejs/vue-touch)	 
      3. 通过全局 mixin方法添加一些组件选项，如: [vuex](https://github.com/vuejs/vuex) 
      4. 添加 Vue 实例方法，通过把它们添加到 Vue.prototype 上实现。 
      5. 一个库，提供自己的 API，同时提供上面提到的一个或多个功能，如 [vue-router](https://github.com/vuejs/vue-router) 

Vue.js 的插件应当有一个公开方法 `install` 。这个方法的第一个参数是 `Vue` 构造器 , 第二个参数是一个可选的选项对象: 

```javascript
MyPlugin.install = function (Vue, options) {
  // 1. 添加全局方法或属性
  Vue.myGlobalMethod = function () {
    // 逻辑...
  }
  // 2. 添加全局资源
  Vue.directive('my-directive', {
    bind (el, binding, vnode, oldVnode) {
      // 逻辑...
    }
    ...
  })
  // 3. 注入组件
  Vue.mixin({
    created: function () {
      // 逻辑...
    }
    ...
  })
  // 4. 添加事例方法
  Vue.prototype.$myMethod = function (options) {
    // 逻辑...
  }
}
```

### 使用插件 

通过全局方法 Vue.use() 使用插件: 

```javascript
// 调用 `MyPlugin.install(Vue)`
Vue.use(MyPlugin)
//或
Vue.use(MyPlugin, { someOption: true })
```


## 单文件组件

### 介绍 

在很多Vue项目中，我们使用 `Vue.component` 来定义全局组件，紧接着用 `new Vue({ el: '#container '})` 在每个页面内指定一个容器元素。 

这种方案在只是使用 JavaScript 增强某个视图的中小型项目中表现得很好。然而在更复杂的项目中，或者当你的前端完全采用 JavaScript 驱动的时候，以下弊端就显现出来： 

- **全局定义(Global definitions)** 强制要求每个 component 中的命名不得重复	 
  - **字符串模板(String templates)** 缺乏语法高亮，在 HTML 有多行的时候，需要用到丑陋的 `\` 
  - **不支持CSS(No CSS support)** 意味着当 HTML 和 JavaScript 组件化时，CSS 明显被遗漏 
  - **没有构建步骤(No build step)** 限制只能使用 HTML 和 ES5 JavaScript,  而不能使用预处理器，如 Pug (formerly Jade) 和 Babel 

文件扩展名为 `.vue` 的 **single-file components(单文件组件)** 为以上所有问题提供了解决方法，并且还可以使用 Webpack 或 Browserify 等构建工具。 

### 起步 

#### 针对刚接触 JavaScript 模块开发系统的用户 

- **Node Package Manager (NPM)**: 阅读 [Getting Started guide](https://docs.npmjs.com/getting-started/what-is-npm) 直到 *10: Uninstalling global packages*章节.		 
  - **Modern JavaScript with ES2015/16**: 阅读 Babel 的 [Learn ES2015 guide](https://babeljs.io/docs/learn-es2015/). 你不需要立刻记住每一个方法，但是你可以保留这个页面以便后期参考。	 

#### 针对高级用户 



## 单元测试

### 配置和工具 

可以使用[Karma](http://karma-runner.github.io/)进行自动化测试。

### 简单的断言 

在测试的代码结构方面，你不必在你的组件中做任何特殊的事情使它们可测试。主要导出原始设置就可以了： 

```javascript
<template>
  <span>{{ message }}</span>
</template>
<script>
  export default {
    data () {
      return {
        message: 'hello!'
      }
    },
    created () {
      this.message = 'bye!'
    }
  }
</script>

```

当测试的组件时，所要做的就是导入对象和Vue然后使用许多常见的断言： 

```javascript
// 导入Vue.js和组件，进行测试
import Vue from 'vue'
import MyComponent from 'path/to/MyComponent.vue'
// 这里是一些Jasmine 2.0的测试，你也可以使用你喜欢的任何断言库或测试工具。
describe('MyComponent', () => {
  // 检查原始组件选项
  it('has a created hook', () => {
    expect(typeof MyComponent.created).toBe('function')
  })
  // 评估原始组件选项中的函数的结果
  it('sets the correct default data', () => {
    expect(typeof MyComponent.data).toBe('function')
    const defaultData = MyComponent.data()
    expect(defaultData.message).toBe('hello!')
  })
  // 检查mount中的组件实例
  it('correctly sets the message when created', () => {
    const vm = new Vue(MyComponent).$mount()
    expect(vm.message).toBe('bye!')
  })
  // 创建一个实例并检查渲染输出
  it('renders the correct message', () => {
    const Ctor = Vue.cextend(MyComponent)
    const vm = new Ctor().$mount()
    expect(vm.$el.textContent).toBe('bye!')
  })
})
```

### 编写可被测试的组件 

很多组件的渲染输出由它的props决定。

```javascript
<template>
  <p>{{ msg }}</p>
</template>
<script>
  export default {
    props: ['msg']
  }
</script>
```

可以在不同的props中，通过 `propsData` 选项断言它的渲染输出

```javascript
import Vue from 'vue'
import MyComponent from './MyComponent.vue'
// 挂载元素并返回已渲染的文本的工具函数 
function getRenderedText (Component, propsData) {
  const Ctor = Vue.extend(Component)
  const vm = new Ctor({ propsData }).$mount()
  return vm.$el.textContent
}
describe('MyComponent', () => {
  it('render correctly with different props', () => {
    expect(getRenderedText(MyComponent, {
      msg: 'Hello'
    })).toBe('Hello')
    expect(getRenderedText(MyComponent, {
      msg: 'Bye'
    })).toBe('Bye')
  })
})
```

### 主张异步更新 

由于Vue进行异步更新DOM的情况，一些依赖DOM更新结果的断言必须在`Vue nexttick`回调中进行： 

```javascript
// 在状态更新后检查生成的HTML
it('updates the rendered message when vm.message updates', done => {
  const vm = new Vue(MyComponent).$mount()
  vm.message = 'foo'
  // 在状态改变后和断言DOM更新前等待一刻
  Vue.nextTick(() => {
    expect(vm.$el.textContent).toBe('foo')
    done()
  })
})

```



## 服务端渲染

### 需要服务端渲染（SSR）吗？  

#### SEO（搜索引擎优化） 

在异步获取内容的页面上很需要进行搜索引擎优化的时候，服务端渲染就很重要。 

#### 客户端的网络比较慢 

用户可能在网络比较慢的情况下从远处访问网站 - 或者通过比较差的带宽。 这些情况下，尽量减少页面请求数量，来保证用户尽快看到基本的内容。 

可以用 [Webpack的代码拆分](https://webpack.github.io/docs/code-splitting.html) 避免强制用户下载整个单页面应用，但是，这样也远没有下载个单独的预先渲染过的HTML文件性能高。 

#### 客户端运行在老的(或者直接没有)JavaScript引擎上 

#### 服务端渲染 对比 预渲染(Prerendering) 

如果你只是用服务端渲染来改善一个少数的营销页面（如 首页，关于，联系 等等）的SEO，那你可以用**预渲染**替换。预渲染不像服务器渲染那样即时编译HTML,预渲染只是在构建时为了特定的路由生成特定的几个静态页面。其优势是预渲染的设置更加简单，可以保持前端是一个完整的静态站。 

你用webpack可以很简单地通过[prerender-spa-plugin](https://github.com/chrisvfritz/prerender-spa-plugin)来添加预渲染。 

### Hello World 

准备在行动中体验服务端渲染吧。服务端渲染(即SSR)听起来很复杂，不过一个简单的Node脚本只需要3步就可以实现这个功能: 

```javascript
// 步骤 1:创建一个Vue实例
var Vue = require('vue')
var app = new Vue({
  render: function (h) {
    return h('p', 'hello world')
  }
})
// 步骤 2: 创建一个渲染器
var renderer = require('vue-server-renderer').createRenderer()
// 步骤 3: 将 Vue实例 渲染成 HTML
renderer.renderToString(app, function (error, html) {
  if (error) throw error
  console.log(html)
  // => <p server-rendered="true">hello world</p>
})
```

- 一个Web服务器	 
  - 流式响应 
  - ​组件缓存 
- 构建过程 
- 路由 
- Vuex状态管理 

### 通过Express Web服务器实现简单的服务端渲染 

为了适应服务端渲染，我们需要进行一些修改，让它可以在浏览器和Node中渲染： 

- 在浏览器中，将我们的应用实例添加到全局上下文（ `window`）上,我们可以安装它。	 
  - 在Node中，导出一个工厂函数让我们可以为每个请求创建应用实例。 

### 流式响应 

Vue还支持**流式**渲染，优先选择适用于支持流的Web服务器。允许HTML一边生成一边写入相应流，而不是在最后一次全部写入。其结果是请求服务速度更快，没有缺点！ 

流做的事： 

1. 建立流	 
   2. 在应用响应前写入HTML 
2. 在可获得时将应用HTML写入响应 
   4. 在响应最后写入HTML 
3. 处理任何错误 

### 组件缓存 

特别注意： 不应该缓存组件包含子组件依赖全局状态（例如来自vuex的状态）。如果这么做，子组件（事实上是整个子树）也会被缓存。所以要特别注意带有slots片段或者子组件的情况。 

#### 	设置 

在警告情况之外的，我们可以用下面的方法缓存组件。 

首先，你需要提供给渲染器一个 [缓存对象](https://www.npmjs.com/package/vue-server-renderer#cache)。这有个简单的示例使用 [lru-cache](https://github.com/isaacs/node-lru-cache) 

```javascript
var createRenderer = require('vue-server-renderer').createRenderer
var lru = require('lru-cache')
var renderer = createRenderer({
  cache: lru(1000)
})
```

这将缓存高达1000个独立的渲染。然后对于你想缓存的组件，你可以为他们提供： 

- 一个唯一的`名字`	 
  - 一个 `serverCacheKey`函数，返回一个唯一的组件作用域 

例如: 

```javascript
Vue.component({
  name: 'list-item',
  template: '<li>{{ item.name }}</li>',
  props: ['item'],
  serverCacheKey: function (props) {
    return props.item.type + '::' + props.item.id
  }
})
```

#### 缓存的理想组件 

任何纯组件可以被安全缓存 -  这是保证给任何组件传递一样的数据产生相同的HTML。这些场景的例子包括： 

- 静态的组件 (例如 总是尝试一样的HTML,所以 `serverCacheKey` 函数可以被返回 `true`)	 
- 列表组件（当有大量列表，缓存他们可以改善性能） 
  - 通用UI组件 (例如 buttons, alerts, 等等 - 至少他们通过props获取数据而不是 slots或者子组件) 

### 构建过程，路由，和Vuex状态管理 



## 过渡效果

### 概述 

Vue提供应用过渡效果。包括以下工具： 

- 在 CSS 过渡和动画中自动应用 class	 
  - 可以配合使用第三方 CSS 动画库，如 Animate.css 
  - 在过渡钩子函数中使用 JavaScript 直接操作 DOM 
  - 可以配合使用第三方 JavaScript 动画库，如 Velocity.js 

### 单元素/组件的过渡 

Vue 提供了 `transition` 的封装组件，在下列情形中，可以给任何元素和组件添加 entering/leaving 过渡 

- 条件渲染 （使用 `v-if`）	 
- 条件展示 （使用 `v-show`） 
- 动态组件 
- 组件根节点 

典型的例子： 

```vue
<div id="demo">
<button v-on:click="show = !show">
Toggle
</button>
<transition name="fade">
<p v-if="show">hello</p>
</transition>
</div>
```

```javascript
new Vue({el: '#demo',data: {show: true}})
```

```css
.fade-enter-active, .fade-leave-active {
transition: opacity .5s
}
.fade-enter, .fade-leave-active {
opacity: 0
}
```

元素封装成过渡组件之后，在遇到插入或删除时，Vue 将 

1. 自动嗅探目标元素是否有 CSS 过渡或动画，并在合适时添加/删除 CSS 类名。		 
   2. 如果过渡组件设置了过渡的 JavaScript 钩子函数，会在相应的阶段调用钩子函数。 
2. 如果没有找到 JavaScript 钩子并且也没有检测到 CSS 过渡/动画，DOM 操作（插入/删除）在下一帧中立即执行。(注意：此指浏览器逐帧动画机制，与 Vue，和Vue的 `nextTick` 概念不同) 

#### 过渡的-CSS-类名 

会有 4 个(CSS)类名在 enter/leave 的过渡中切换 

1. `v-enter`: 定义进入过渡的开始状态。在元素被插入时生效，在下一个帧移除。		 
   2. `v-enter-active`: 定义进入过渡的结束状态。在元素被插入时生效，在 `transition/animation` 完成之后移除。 
2. `v-leave`:  定义离开过渡的开始状态。在离开过渡被触发时生效，在下一个帧移除。 
3. `v-leave-active`: 定义离开过渡的结束状态。在离开过渡被触发时生效，在 `transition/animation` 完成之后移除。 

`v-` 是这些类名的前缀。使用 `<name="my-transition>` 可以重置前缀，比如 `v-enter` 替换为 `my-transition-enter`。 

#### CSS 过渡 

常用的过渡都是使用 CSS 过渡。 

#### CSS 动画 

CSS 动画用法同 CSS 过渡，区别是在动画中 `v-enter` 类名在节点插入 DOM 后不会立即删除，而是在 `animationend` 事件触发时删除。 

#### 自定义过渡类名 

可以通过以下特性来自定义过渡类名： 

- `enter-class` 	
- `enter-active-class` 
- `leave-class` 
- `leave-active-class` 

他们的优先级高于普通的类名，这对于 Vue 的过渡系统和其他第三方 CSS 动画库，如 [Animate.css](https://daneden.github.io/animate.css/) 结合使用十分有用。 

#### 同时使用 Transitions 和 Animations 

Vue 为了知道过渡的完成，必须设置相应的事件监听器。它可以是 `transitionend` 或 `animationend` ，这取决于给元素应用的 CSS 规则。如果你使用其中任何一种，Vue 能自动识别类型并设置监听。 

但是，在一些场景中，你需要给同一个元素同时设置两种过渡动效，比如 `animation` 很快的被触发并完成了，而 `transition` 效果还没结束。在这种情况中，你就需要使用 `type` 特性并设置 `animation` 或 `transition` 来明确声明你需要 Vue 监听的类型。 

#### JavaScript 钩子 

可以在属性中声明 JavaScript 钩子 

```vue
<transition
v-on:before-enter="beforeEnter"
v-on:enter="enter"
v-on:after-enter="afterEnter"
v-on:enter-cancelled="enterCancelled"
v-on:before-leave="beforeLeave"
v-on:leave="leave"
v-on:after-leave="afterLeave"
v-on:leave-cancelled="leaveCancelled"
>
<!-- ... -->
</transition>
```

```javascript
// ...
methods: {
// --------
// 进入中
// --------
beforeEnter: function (el) {
// ...
},
// 此回调函数是可选项的设置
// 与 CSS 结合时使用
enter: function (el, done) {
// ...
done()
},
afterEnter: function (el) {
// ...
},
enterCancelled: function (el) {
// ...
},
// --------
// 离开时
// --------
beforeLeave: function (el) {
// ...
},
// 此回调函数是可选项的设置
// 与 CSS 结合时使用
leave: function (el, done) {
// ...
done()
},
afterLeave: function (el) {
// ...
},
// leaveCancelled 只用于 v-show 中
leaveCancelled: function (el) {
// ...
}
}
```

这些钩子函数可以结合 CSS `transitions/animations` 使用，也可以单独使用。 

当只用 JavaScript 过渡的时候， 在 `enter` 和 `leave` 中，回调函数 `done` 是必须的。 否则，它们会被同步调用，过渡会立即完成。 

推荐对于仅使用 JavaScript 过渡的元素添加 `v-bind:css="false"`，Vue 会跳过 CSS 的检测。这也可以避免过渡过程中 CSS 的影响。 

### 初始渲染的过渡 

可以通过 `appear` 特性设置节点的在初始渲染的过渡 

```vue
<transition appear>
<!-- ... -->
</transition>
```

这里默认和进入和离开过渡一样，同样也可以自定义 CSS 类名。 

```vue
<transition
appear
appear-class="custom-appear-class"
appear-active-class="custom-appear-active-class"
>
<!-- ... -->
</transition>
```

自定义 JavaScript 钩子： 

```vue
<transition
appear
v-on:before-appear="customBeforeAppearHook"
v-on:appear="customAppearHook"
v-on:after-appear="customAfterAppearHook"
>
<!-- ... -->
</transition>
```

### 多个元素的过渡 

对于原生标签可以使用 `v-if`/`v-else` 。

但是有一点需要注意： 

当有**相同标签名**的元素切换时，需要通过 `key` 特性设置唯一的值来标记以让 Vue 区分它们，否则 Vue 为了效率只会替换相同标签内部的内容。即使在技术上没有必要，**给在  组件中的多个元素设置 key  是一个更好的实践。** 

示例: 

```vue
<transition>
  <button v-if="isEditing" key="save">Save</button>
  <button v-else key="edit">Edit</button>
</transition>
```

也可以给通过给同一个元素的 `key` 特性设置不同的状态来代替 `v-if` 和 `v-else`

使用多个 `v-if` 的多个元素的过渡可以重写为绑定了动态属性的单个元素过渡。 例如： 

```vue
<transition>
<button v-if="docState === 'saved'" key="saved">
Edit
</button>
<button v-if="docState === 'edited'" key="edited">
Save
</button>
<button v-if="docState === 'editing'" key="editing">
Cancel
</button>
</transition>
```

可以重写为： 

```vue
<transition>
<button v-bind:key="docState">
{{ buttonMessage }}
</button>
</transition>
```

```javascript
// ...
computed: {
buttonMessage: function () {
switch (docState) {
case 'saved': return 'Edit'
case 'edited': return 'Save'
case 'editing': return 'Cancel'
}
}
}
```

#### 过渡模式 

`<transition>` 的默认行为 - 进入和离开同时发生。 

同时生效的进入和离开的过渡不能满足所有要求，所以 Vue 提供了 **过渡模式** 

- `in-out`: 新元素先进行过渡，完成之后当前元素过渡离开。		 
  - `out-in`: 当前元素先进行过渡，完成之后新元素过渡进入。 

  ​用 `out-in` 重写之前的开关按钮过渡： 

```vue
<transition name="fade" mode="out-in">
<!-- ... the buttons ... -->
</transition>
```

`in-out` 模式不是经常用到，但对于一些稍微不同的过渡效果还是有用的。

### 	多个组件的过渡 

不需要使用 `key` 特性。相反，我们只需要使用动态组件: 

```vue
<transition name="component-fade" mode="out-in">
<component v-bind:is="view"></component>
</transition>
```

```javascript
new Vue({
el: '#transition-components-demo',
data: {
view: 'v-a'
},
components: {
'v-a': {
template: '<div>Component A</div>'
},
'v-b': {
template: '<div>Component B</div>'
}
}
})
```

```css
.component-fade-enter-active, .component-fade-leave-active {
transition: opacity .3s ease;
}
.component-fade-enter, .component-fade-leave-active {
opacity: 0;
}
```

### 列表过渡 

使用 `<transition-group>` 组件。 

- 不同于 `<transition>`， 它会以一个真实元素呈现：默认为一个 `<span>`。你也可以通过 `tag` 特性更换为其他元素。	 
  - 元素 **一定需要** 指定唯一的 `key` 特性值 

#### 列表的进入和离开过渡 

#### 	列表的位移过渡 

例子内部的实现，Vue 使用了一个叫 [FLIP](https://aerotwist.com/blog/flip-your-animations/) 简单的动画队列
使用 transforms 将元素从之前的位置平滑过渡新的位置。 

需要注意的是使用 FLIP 过渡的元素不能设置为 `display: inline` 。作为替代方案，可以设置为 `display: inline-block` 或者放置于 flex 中 

FLIP 动画不仅可以实现单列过渡，多维网格的过渡也同样[简单](https://jsfiddle.net/chrisvfritz/sLrhk1bc/):

#### 列表的渐进过渡 

通过 data 属性与 JavaScript 通信 ，就可以实现列表的渐进过渡

#### 可复用的过渡 

要创建一个可复用过渡组件，你需要做的就是将 `<transition>` 或者 `<transition-group>` 作为根组件，然后将任何子组件放置在其中就可以了。 

### 动态过渡 

在 Vue 中即使是过渡也是数据驱动的！动态过渡最基本的例子是通过 `name` 特性来绑定动态值。 

```vue
<transition v-bind:name="transitionName">
  <!-- ... -->
</transition>
```

所有的过渡特性都是动态绑定。它不仅是简单的特性，通过事件的钩子函数方法，可以在获取到相应上下文数据。这意味着，可以根据组件的状态通过 JavaScript 过渡设置不同的过渡效果。 

最后，创建动态过渡的最终方案是组件通过接受 props 来动态修改之前的过渡。



## 过渡状态

### 状态动画 与 watcher 

通过 watcher 我们能监听到任何数值属性的数值更新。

#### 动态状态转换 

就像 Vue 的过渡组件一样，数据背后状态转换会实时更新，这对于原型设计十分有用。

#### 通过组件组织过渡 

很多的动画可以提取到专用的子组件。



## 混合

### 	基础 

混合是一种灵活的分布式复用 Vue 组件的方式。混合对象可以包含任意组件选项。以组件使用混合对象时，所有混合对象的选项将被混入该组件本身的选项。 

例子： 

```javascript
// 定义一个混合对象
var myMixin = {
  created: function () {
    this.hello()
  },
  methods: {
    hello: function () {
      console.log('hello from mixin!')
    }
  }
}
// 定义一个使用混合对象的组件
var Component = Vue.extend({
  mixins: [myMixin]
})
var component = new Component() // -> "hello from mixin!"
```

### 选项合并 

当组件和混合对象含有同名选项时，这些选项将以恰当的方式混合。比如，同名钩子函数将混合为一个数组，因此都将被调用。另外，混合对象的 钩子将在组件自身钩子 **之前** 调用 

值为对象的选项，例如 `methods`, `components` 和 `directives`，将被混合为同一个对象。 两个对象键名冲突时，取组件对象的键值对。 

注意： `Vue.extend()` 也使用同样的策略进行合并。 

### 	全局混合 

可以全局注册混合对象。 注意使用！ 一旦使用全局混合对象，将会影响到 **所有** 之后创建的 Vue 实例。使用恰当时，可以为自定义对象注入处理逻辑。 

```javascript
// 为自定义的选项 'myOption' 注入一个处理器。 
Vue.mixin({
  created: function () {
    var myOption = this.$options.myOption
    if (myOption) {
      console.log(myOption)
    }
  }
})
new Vue({
  myOption: 'hello!'
})
// -> "hello!"
```

谨慎使用全局混合对象，因为会影响到每个单独创建的 Vue 实例（包括第三方模板）。 也可以将其用作 Plugins 以避免产生重复应用 

### 	自定义选项混合策略 

自定义选项将使用默认策略，即简单地覆盖已有值。 如果想让自定义选项以自定义逻辑混合，可以向 `Vue.config.optionMergeStrategies` 添加一个函数： 

```javascript
Vue.config.optionMergeStrategies.myOption = function (toVal, fromVal) {
  // return mergedVal
}
```

对于大多数对象选项，可以使用 `methods` 的合并策略: 

```javascript
var strategies = Vue.config.optionMergeStrategies
strategies.myOption = strategies.methods
```

更多高级的例子可以在 [Vuex](https://github.com/vuejs/vuex) 1.x的混合策略里找到: 

```javascript
const merge = Vue.config.optionMergeStrategies.computed
Vue.config.optionMergeStrategies.vuex = function (toVal, fromVal) {
  if (!toVal) return fromVal
  if (!fromVal) return toVal
  return {
    getters: merge(toVal.getters, fromVal.getters),
    state: merge(toVal.state, fromVal.state),
    actions: merge(toVal.actions, fromVal.actions)
  }
}
```



## 路由

### 	官方路由 

对于大多数单页面应用，都推荐使用官方支持的[vue-router库](https://github.com/vuejs/vue-router)。

### 	从零开始简单的路由 

如果只需要非常简单的路由而不需要引入整个路由库，可以动态渲染一个页面级的组件像这样： 

```javascript
const NotFound = { template: '<p>Page not found</p>' }
const Home = { template: '<p>home page</p>' }
const About = { template: '<p>about page</p>' }
const routes = {
  '/': Home,
  '/about': About
}
new Vue({
  el: '#app',
  data: {
    currentRoute: window.location.pathname
  },
  computed: {
    ViewComponent () {
      return routes[this.currentRoute] || NotFound
    }
  },
  render (h) { return h(this.ViewComponent) }
})
```

结合HTML5 History API，可以建立一个非常基本但功能齐全的客户端路由器。

### 	整合第三方路由 

如果有非常喜欢的第三方路由，如[Page.js](https://github.com/visionmedia/page.js)或者 [Director](https://github.com/flatiron/director), 整合[很简单](https://github.com/chrisvfritz/vue-2.0-simple-routing-example/compare/master...pagejs)。 



## 深入响应式原理

Vue 最显著的一个功能是响应系统 ——  模型只是普通对象，修改它则更新视图。

### 	如何追踪变化 

把一个普通 Javascript 对象传给 Vue 实例来作为它的 `data` 选项，Vue 将遍历它的属性，用 [Object.defineProperty](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty) 将它们转为 getter/setter。这是 ES5 的特性，不能打补丁实现，这便是为什么 Vue 不支持 IE8 以及更低版本浏览器的原因。 

用户看不到 getter/setters，但是在内部它们让 Vue 追踪依赖，在属性被访问和修改时通知变化。这里需要注意的问题是浏览器控制台在打印数据对象时 getter/setter 的格式化并不同，所以你可能需要安装 [vue-devtools](https://github.com/vuejs/vue-devtools) 来获取更加友好的检查接口。 

每个组件实例都有相应的 **watcher** 程序实例，它会在组件渲染的过程中把属性记录为依赖，之后当依赖项的 `setter` 被调用时，会通知 `watcher` 重新计算，从而致使它关联的组件得以更新。 

### 	变化检测问题 

受现代 Javascript 的限制(以及 `Object.observe` 的废弃)，Vue **不能检测到对象属性的添加或删除**。因为 Vue 在初始化实例时将属性转为 `getter/setter`，所以属性必须在 `data` 对象上才能让 Vue 转换它，这样才能让它是响应的。例如： 

```javascript
var vm = new Vue({
data:{
a:1
}
})
// `vm.a` 是响应的
vm.b = 2
// `vm.b` 是非响应的
```

Vue 不允许在已经创建的实例上动态添加新的根级响应式属性（root-level reactive properties）。然而它可以使用 `Vue.set(object, key, value)` 方法将响应属性添加到嵌套的对象上： 

```javascript
Vue.set(vm.someObject, 'b', 2)
```

您还可以使用 `vm.$set` 实例方法，这也是全局 `Vue.set` 方法的别名： 

```javascript
this.$set(this.someObject,'b',2)
```

有时你想向已有对象上添加一些属性，例如使用 `Object.assign()` 或 `_.extend()` 方法来添加属性。但是，添加到对象上的新属性不会触发更新。在这种情况下可以创建一个新的对象，让它包含原对象的属性和新的属性： 

```javascript
// 代替 `Object.assign(this.someObject, { a: 1, b: 2 })`
this.someObject = Object.assign({}, this.someObject, { a: 1, b: 2 })
```

由于 Vue 不允许动态添加根级响应式属性，所以你必须在初始化实例前声明根级响应式属性，哪怕只是一个空值: 

```javascript
var vm = new Vue({
data: {
// 声明 message 为一个空值字符串
message: ''
},
template: '<div>{{ message }}</div>'
})
// 之后设置 `message` 
vm.message = 'Hello!'
```

如果你不在 data 对象中声明 `message`，Vue 将发出警告表明你的渲染方法正试图访问一个不存在的属性。 

这样的限制在背后是有其技术原因的，在依赖项跟踪系统中，它消除了一类边界情况，也使 Vue 实例在类型检查系统的帮助下运行的更高效。在代码可维护性方面上这也是重要的一点：`data` 对象就像组件状态的模式（Schema），在它上面声明所有的属性让组织代码更易于被其他开发者或是自己回头重新阅读时更加快速地理解。 

### 	异步更新队列 

Vue 执行 DOM 更新是**异步的**，只要观察到数据变化，Vue 就开始一个队列，将同一事件循环内所有的数据变化缓存起来。如果一个 watcher 被多次触发，只会推入一次到队列中。然后，在接下来的事件循环中，Vue 刷新队列并仅执行必要的 DOM 更新。Vue 在内部使用 `Promise.then` 和 `MutationObserver` 为可用的异步队列调用回调 `setTimeout(fn, 0)`. 

一般来讲，Vue 鼓励开发者沿着数据驱动的思路，尽量避免直接接触  DOM，但是有时我们确实要这么做。为了在数据变化之后等待 Vue 完成更新 DOM，可以在数据变化之后立即使用 `Vue.nextTick(callback)`。这样回调在 DOM 更新完成后就会调用。

`vm.$nextTick()` 这个实例方法在组件内使用特别方便，因为它不需要全局 `Vue`，它的回调 `this` 将自动绑定到当前的 Vue 实例上： 

```javascript
Vue.component('example', {
template: '<span>{{ message }}</span>',
data: function () {
return {
message: 'not updated'
}
},
methods: {
updateMessage: function () {
this.message = 'updated'
console.log(this.$el.textContent) // => 'not updated'
this.$nextTick(function () {
console.log(this.$el.textContent) // => 'updated'
})
}
}
})
```



## 生产环境部署

### 删除警告 

Vue 精简独立版本已经删除了所有警告

#### Webpack

使用 Webpack 的 [DefinePlugin](http://webpack.github.io/docs/list-of-plugins.html#defineplugin) 来指定生产环境，以便在压缩时可以让 UglifyJS 自动删除代码块内的警告语句。

#### Browserify

- 运行打包命令，设置 `NODE_ENV` 为 `"production"`。等于告诉 `vueify` 避免引入热重载和开发相关代码。	 
- 使用一个全局 [envify](https://github.com/hughsk/envify) 转换你的 bundle 文件。这可以精简掉包含在 Vue 源码中所有环境变量条件相关代码块内的警告语句。例如：	 

```sh
NODE_ENV=production browserify -g envify -e main.js | uglifyjs -c -m > build.js
```

- 使用 vueify 中包含的 extract-css 插件，提取样式到单独的css文件。	 

```sh
NODE_ENV=production browserify -g envify -p [ vueify/plugins/extract-css -o build.css ] -e main.js | uglifyjs -c -m > build.js
```

### 跟踪运行时错误 

如果在组件渲染时出现运行错误，错误将会被传递至全局 `Vue.config.errorHandler` 配置函数（如果已设置）

### 提取 CSS 

使用单文件组件时，`<style>` 标签在开发运行过程中会被动态实时注入。在生产环境中，你可能需要从所有组件中提取样式到单独的 CSS 文件中。



## 状态管理

### 类 Flux 状态管理的官方实现 

由于多个状态分散的跨越在许多组件和交互间各个角落，为了解决这个问题，Vue 提供 [vuex](https://github.com/vuejs/vuex)：

#### React 的开发者请参考以下信息 

redux 是 React 生态环境中最流行的 Flux 实现。Redux 事实上无法感知视图层，所以它能够轻松的通过一些[简单绑定](https://github.com/egoist/revue)和Vue一起使用。vuex区别在于它是一个专门为 vue 应用所设计。这使得它能够更好地和vue进行整合，同时提供简洁的API和改善过的开发体验。 

### 简单状态管理起步使用 

经常被忽略的是，Vue 应用中原始 `数据` 对象的实际来源 - 当访问数据对象时，一个 Vue 实例只是简单的代理访问。所以，如果你有一处需要被多个实例间共享的状态，可以简单地通过维护一份数据来实现共享

现在我们有了唯一的实际来源，但是，调试将会变为噩梦。任何时间，我们应用中的任何部分，在任何数据改变后，都不会留下变更过的记录。 

​	为了解决这个问题，我们采用一个简单的 **store 模式**： 

```javascript
var store = {
  debug: true,
  state: {
    message: 'Hello!'
  },
  setMessageAction (newValue) {
    this.debug && console.log('setMessageAction triggered with', newValue)
    this.state.message = newValue
  },
  clearMessageAction () {
    this.debug && console.log('clearMessageAction triggered')
    this.state.message = 'action B triggered'
  }
}
```

需要注意，所有 store 中 state 的改变，都放置在 store 自身的 action  中去管理。这种集中式状态管理能够被更容易地理解哪种类型的 mutation 将会发生，以及它们是如何被触发。当错误出现时，我们现在也会有一个  log 记录 bug 之前发生了什么。 

此外，每个实例/组件仍然可以拥有和管理自己的私有状态： 

```javascript
var vmA = new Vue({
  data: {
    privateState: {},
    sharedState: store.state
  }
})
var vmB = new Vue({
  data: {
    privateState: {},
    sharedState: store.state
  }
})
```

重要的是，注意你不应该在 action 中 替换原始的状态对象 - 组件和 store 需要引用同一个共享对象，mutation 才能够被观察 

接着我们继续延伸约定，组件不允许直接修改属于 store 实例的 state，而应执行 action 来分发 (dispatch) 事件通知 store 去改变，我们最终达成了 [Flux](https://facebook.github.io/flux/) 架构。这样约定的好处是，我们能够记录所有 store 中发生的 state 改变，同时实现能做到记录变更 (mutation) 、保存状态快照、历史回滚/时光旅行的先进的调试工具。 



## 自定义指令

### 简介 

Vue 也允许注册自定义指令。注意，在 Vue2.0 里面，代码复用的主要形式和抽象是组件——然而，有的情况下,你仍然需要对纯 DOM 元素进行底层操作,这时候就会用到自定义指令。 

当页面加载时，元素将获得焦点。事实上，你访问后还没点击任何内容，input 就获得了焦点。现在让我们完善这个指令： 

```javascript
// 注册一个全局自定义指令 v-focus
Vue.directive('focus', {
  // 当绑定元素插入到 DOM 中。
  inserted: function (el) {
    // 聚焦元素
    el.focus()
  }
})
```

也可以注册局部指令，组件中接受一个 `directives` 的选项： 

```javascript
directives: {
  focus: {
    // 指令的定义---
  }
}
```

然后你可以在模板中任何元素上使用新的 `v-focus` 属性： 

```javascript
<input v-focus>
```

### 钩子函数 

指令定义函数提供了几个钩子函数（可选）： 

- `bind`: 只调用一次，指令第一次绑定到元素时调用，用这个钩子函数可以定义一个在绑定时执行一次的初始化动作。		 
- `inserted`: 被绑定元素插入父节点时调用（父节点存在即可调用，不必存在于 document 中）。		 
- `update`: 被绑定元素所在的模板更新时调用，而不论绑定值是否变化。通过比较更新前后的绑定值，可以忽略不必要的模板更新。		 
- `componentUpdated`: 被绑定元素所在模板完成一次更新周期时调用。		 
- `unbind`: 只调用一次， 指令与元素解绑时调用。		 

### 钩子函数参数 

钩子函数被赋予了以下参数： 

- **el**: 指令所绑定的元素，可以用来直接操作 DOM 。	 
- **binding**: 一个对象，包含以下属性：
  -  **name**: 指令名，不包括 `v-` 前缀
  -  **value**: 指令的绑定值， 例如： `v-my-directive="1 + 1"`, value 的值是 `2`。
  - **oldValue**: 指令绑定的前一个值，仅在 `update` 和 `componentUpdated` 钩子中可用。无论值是否改变都可用。
  - **expression**: 绑定值的字符串形式。 例如 `v-my-directive="1 + 1"` ， expression 的值是 `"1 + 1"`。
  - **arg**: 传给指令的参数。例如 `v-my-directive:foo`， arg 的值是 `"foo"`。			 
  - **modifiers**: 一个包含修饰符的对象。 例如： `v-my-directive.foo.bar`, 修饰符对象 modifiers 的值是 `{ foo: true, bar: true }`。			 
- **vnode**: Vue 编译生成的虚拟节点。	 
- **oldVnode**: 上一个虚拟节点，仅在 `update` 和 `componentUpdated` 钩子中可用。	 

除了 `el` 之外，其它参数都应该是只读的，尽量不要修改他们。如果需要在钩子之间共享数据，建议通过元素的 [dataset](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dataset) 来进行。 

一个使用了这些参数的自定义钩子样例： 

```vue
<div id="hook-arguments-example" v-demo:hello.a.b="message"></div>
```

```javascript
Vue.directive('demo', {
  bind: function (el, binding, vnode) {
    var s = JSON.stringify
    el.innerHTML =
      'name: '       + s(binding.name) + '<br>' +
      'value: '      + s(binding.value) + '<br>' +
      'expression: ' + s(binding.expression) + '<br>' +
      'argument: '   + s(binding.arg) + '<br>' +
      'modifiers: '  + s(binding.modifiers) + '<br>' +
      'vnode keys: ' + Object.keys(vnode).join(', ')
  }
})
new Vue({
  el: '#hook-arguments-example',
  data: {
    message: 'hello!'
  }
})
```

### 函数简写 

大多数情况下，我们可能想在 `bind` 和 `update` 钩子上做重复动作，并且不想关心其它的钩子函数。可以这样写: 

```javascript
Vue.directive('color-swatch', function (el, binding) {
  el.style.backgroundColor = binding.value
})
```

### 对象字面量 

如果指令需要多个值，可以传入一个 JavaScript 对象字面量。记住，指令函数能够接受所有合法类型的 Javascript 表达式。 

```vue
<div v-demo="{ color: 'white', text: 'hello!' }"></div>
```

```javascript
Vue.directive('demo', function (el, binding) {
  console.log(binding.value.color) // => "white"
  console.log(binding.value.text)  // => "hello!"
})
```



# 迁移

## 从 Vuex 0.6.x 迁移到 1.0

### FAQ 

### 模板 

#### 片段实例 移除  

 每个组件有且仅有一个根节点。不再支持片段实例

### 生命周期钩子 

#### `beforeCompile` 移除 

 用 `created` 钩子来代替。 

#### `compiled` 替换 

 用 `mounted` 钩子来代替。 

#### `attached` 移除 

依赖其它钩子使用自定义的 dom 内部方法

#### `detached` 移除 

用自定义的 dom 内部的其他钩子代替

#### `init` 换名 

用新的 `beforeCreate` 钩子代替，他们本质上是一样的。为了与其他生命周期的钩子命名保持一致性，所以重新命名了这个钩子。

#### `ready` 替换 

使用新的 `mounted` 钩子代替，应该注意的是，通过使用 `mounted` 钩子，并不能保证该实例已经插入文档。所以还应该在钩子函数中包含 `Vue.nextTick`/`vm.$nextTick`

### `v-for` 

#### `v-for` 数组参数的顺序 改变 

当含有 `index` 时，以前传递的参数顺序是：`(index, value)`。现在变成了：`(value, index)` ，这样可以与js的新数组方法：`forEach`，`map` 保持一致。 

#### `v-for` 对象参数的顺序 改变 

当包含 `key` 时，对象的参数顺序是 `(key, value)`。现在改为了 `(value, key)`，这样可以和通用的对象迭代器（比如 lodash 的迭代器）保持一致。 

#### `$index` and `$key` 移除 

隐式申明的 `$index` 的 `$key` 两个变量在新版里面已经弃用了，取代的是在 `v-for` 中显式地申明。这可以使无经验的 Vue 开发者更好地理解代码，同样也可以使得在处理嵌套循环时更加清晰。 

#### `track-by` 替换 

`track-by` 被 `key`取代，和其他参数一样，如果没有 `v-bind`或者`:` 前缀，它将被作为一个字符串。大多数情况下， 我们想要能够动态绑定完整的表达式，而不是一个 key。

例如： 

```vue
<div v-for="item in items" track-by="id">
```

现在应该写成： 

```vue
<div v-for="item in items" v-bind:key="item.id">
```

#### `v-for` 排序值 改变

显然 `v-for="number in 10"` 将使得 `number` 从0到9迭代，现在变成了从1到10。 

### Props 

#### `coerce` Prop的参数 移除 

如果需要检查 prop 的值，创建一个内部的 computed 值，而不再在 props 内部去定义

这样有一些好处： 

- 你可以对保持原始 prop 值的操作权限。	 
- 通过给予验证后的值一个不同的命名，强制开发者使用显式申明。 

#### `twoWay` Prop 的参数 移除 

Props 现在只能单项传递。为了对父组件产生反向影响，子组件需要显式地传递一个事件而不是依赖于隐式地双向绑定。详见： 

- 自定义组件事件	 
- 自定义输入组件 (使用组件事件)	 
- 全局状态管理 

#### `v-bind` 的 `.once`和`.sync` 修饰符 移除 

Props 现在只能单向传递。为了对父组件产生反向影响，子组件需要显式地传递一个事件而不是依赖于隐式地双向绑定。详见： 

- 自定义组件事件	 
- 自定义输入组件 (使用组件事件)	 
- 全局状态管理 

#### 修改 Props 弃用 

组件内修改 prop 是反模式（不推荐的）的。根据渲染机制，当父组件重新渲染时，子组件的内部 prop 值也将被覆盖。 

大多数情况下，改变 prop 值可以用以下选项代替： 

- 通过 data 属性，用prop去设置一个data属性的默认值。	 
- 通过 computed 属性。 

#### 根实例的 Props 替换 

对于一个根实例来说 (比如：用 `new Vue({ ... })` 创建的实例)，只能用 `propsData` 而不是 `props` 。

### Built-In 指令 

#### `v-bind` 真/假值 改变 

在2.0中使用 `v-bind` 时，只有 `null`, `undefined` , 和 `false` 被看作是假。这意味着，`0` 和空字符串将被作为真值渲染。

对于枚举属性，除了以上假值之外，字符串 `"false"` 也会被渲染为 `attr="false"`。 

注意，对于其它钩子 (如 `v-if` 和 `v-show`)， 他们依然遵循 js 对真假值判断的一般规则。 

#### 用 `v-on` 监听原生事件 改变 

现在在组件上使用 `v-on` 只会监听自定义事件（组件用 `$emit` 触发的事件）。如果要监听根元素的原生事件，可以使用 `.native` 修饰符，比如： 

```vue
<my-component v-on:click.native="doSomething"></my-component>
```

#### 带有 `debounce` 的 `v-model`移除 

Debouncing 曾经被用来控制 Ajax 请求及其它高耗任务的频率。 Vue 中`v-model`的 `debounce` 属性参数使得在一些简单情况下非常容易实现这种控制。但实际上，这是控制了 **状态更新** 的频率，而不是控制高耗时任务本身。

使用 `debounce` 参数，便无法观察 “Typing” 的状态。因为无法对输入状态进行实时检测。然而，通过将 `debounce` 与 Vue 解耦，可以仅仅只延迟我们想要控制的操作，从而避开这些局限性

 这种方式的另外一个优点是：当包裹函数执行时间与延时时间相当时，将会等待较长时间。

#### 使用 `lazy` 或者 `number` 参数的 `v-model` 。 替换 

`lazy` 和 `number` 参数现在以修饰符的形式使用，而不是这样： 

```vue
<input v-model="name" lazy><input v-model="age" type="number" number>
```

现在写成这样： 

```vue
<input v-model.lazy="name"><input v-model.number="age" type="number">
```

#### 使用内联 `value`的`v-model` 移除 

`v-model` 不再以内联 `value` 方式初始化的初值了，显然他将以实例的 data 相应的属性作为真正的初值。

这意味着以下元素： 

```vue
<input v-model="text" value="foo">
```

在data选项中有下面写法的： 

```javascript
data: {
  text: 'bar'
}
```

将渲染 model 为 ‘bar’ 而不是 ‘foo’ 。同样，对 `<textarea>` 已有的值来说： 

```vue
<textarea v-model="text">
  hello world
</textarea>
```

必须保证 `text` 初值为 “hello world” 

#### `v-model` with `v-for` Iterated Primitive Values 移除

像这样的写法将失效： 

```vue
<input v-for="str in strings" v-model="str">
```

因为 `<input>` 将被编译成类似下面的 js 代码： 

```javascript
strings.map(function (str) {
  return createElement('input', ...)
})
```

这样，`v-model` 的双向绑定在这里就失效了。把 `str` 赋值给迭代器里的另一个值也没有用，因为它仅仅是函数内部的一个变量。 

替代方案是，你可以使用对象数组，这样`v-model` 就可以同步更新对象里面的字段了，例如： 

```vue
<input v-for="obj in objects" v-model="obj.str">
```

#### 带有 `!important` 的`v-bind:style` 移除

这样写将失效： 

```vue
<p v-bind:style="{ color: myColor + ' !important' }">hello</p>
```

如果确实需要覆盖其它的 `!important`，最好用字符串形式去写： 

```vue
<p v-bind:style="'color: ' + myColor + ' !important'">hello</p>
```

#### `v-el` 和`v-ref` 替换 

简单起见， `v-el` 和 `v-ref` 合并为一个 `ref` 属性了，可以在组件实例中通过 `$refs` 来调用。 绑定在一般元素上时，`ref` 指DOM元素，绑定在组件上时，`ref` 为一组件实例。

 因为 `v-ref` 不再是一个指令了而是一个特殊的属性，它也可以被动态定义了。这样在和`v-for` 结合的时候是很有用的

```vue
<p v-for="item in items" v-bind:ref="'item' + item.id"></p>
```

```vue
<p v-for="item in items" ref="items"></p>
```

和 1.x 中不同， `$refs` 不是响应的，因为它们在渲染过程中注册/更新。只有监听变化并重复渲染才能使它们响应。 

另一方面，设计`$refs`主要是提供给 js 程序访问的，并不建议在模板中过度依赖使用它。因为这意味着在实例之外去访问实例状态，违背了 Vue 数据驱动的思想。 

#### `v-show`后面使用`v-else` 移除

 `v-else` 不能再跟在 `v-show`后面使用。请在`v-if`的否定分支中使用`v-show`来代替。

### 自定义指令 简化 

在新版中，指令的使用范围已经大大减小了：现在指令仅仅被用于低级的 DOM 操作。大多数情况下，最好是把模板作为代码复用的抽象层。 

显要的改变有如下几点： 

- 指令不再拥有实例。意思是，在指令的钩子函数中不再拥有实例的 `this` 。替代的是，你可以在参数中接受你需要的任何数据。如果确实需要，可以通过 `el` 来访问实例。	 
- 类似 `acceptStatement` ，`deep` ， `priority` 等都已被弃用。
- 现在有些钩子的意义和以前不一样了，并且多了两个钩子函数。 

#### 指令 `.literal` 修饰符 移除 

 `.literal` 修饰符已经被移除，为了获取一样的功能，可以简单地提供字符串修饰符作为值。 

### 过渡 

#### `transition` 参数 替换 

Vue 的过渡系统有了彻底的改变，现在通过使用 `` 和 `` 来包裹元素实现过渡效果，而不再使用 `transition` 属性。

#### 可复用的过渡 `Vue.transition` 替换 

在新的过渡系统中，可以通过模板复用过渡效果。 

#### 过渡的 `stagger` 参数 移除 

如果希望在列表渲染中使用渐近过渡，可以通过设置元素的 `data-index` （或类似属性）来控制时间。

### 事件 

#### `events` 选项 移除 

`events` 选项被弃用。事件处理器现在在 `created` 钩子中被注册。

#### `Vue.directive('on').keyCodes` 替换 

新的简明配置 `keyCodes` 的方式是通过 `Vue.config.keyCodes`

#### `$dispatch` 和 `$broadcast` 替换 

`$dispatch` 和 `$broadcast` 已经被弃用。

对于`$dispatch` 和 `$broadcast`最简单的升级方式就是：通过使用事件中心，允许组件自由交流，无论组件处于组件树的哪一层。

这些方法的最常见用途之一是父子组件的相互通信。在这些情况下，你可以使用 `v-on`[`v-on`监听子组件上 $emit 的变化](http://vuejs.org/guide/components.html#Form-Input-Components-using-Custom-Events)。这可以允许你很方便的添加事件显性。 

然而，如果是跨多层父子组件通信的话， `$emit` 并没有什么用。相反，用集中式的事件中间件可以做到简单的升级。这会让组件之间的通信非常顺利，即使是兄弟组件。因为 Vue 通过事件发射器接口执行实例，实际上你可以使用一个空的 Vue 实例。 

### 过滤器 

#### 插入文本之外的过滤器 移除 

现在过滤器只能用在插入文本中 (`{{ }}` tags)。我们发现在指令（如：`v-model`， `v-on`等）中使用过滤器使事情变得更复杂。像`v-for` 这样的列表过滤器最好把处理逻辑作为一个计算属性放在js里面，这样就可以在整个模板中复用。 

总之，能在原生js中实现的东西，我们尽量避免引入一个新的符号去重复处理同样的问题。

##### 替换 `debounce` 过滤器 

不再这样写 

```vue
<input v-on:keyup="doStuff | debounce 500">
```

```javascript
methods: {
  doStuff: function () {
    // ...
  }
}
```

请使用 [lodash’s `debounce`](https://lodash.com/docs/4.15.0#debounce) (也有可能是 [`throttle`](https://lodash.com/docs/4.15.0#throttle)) 来直接控制高耗任务。

```vue
<input v-on:keyup="doStuff">
```

```javascript
methods: {
  doStuff: _.debounce(function () {
    // ...
  }, 500)
}
```

##### 替换 `limitBy` 过滤器 

不再这样写： 

```vue
<p v-for="item in items | limitBy 10">{{ item }}</p>
```

在 computed 属性中使用js内置方法： [`.slice` method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice#Examples)： 

```vue
<p v-for="item in filteredItems">{{ item }}</p>
```

```javascript
computed: {
  filteredItems: function () {
    return this.items.slice(0, 10)
  }
}
```

##### 替换 `filterBy` 过滤器 

不再这样写： 

```vue
<p v-for="user in users | filterBy searchQuery in 'name'">{{ user.name }}</p>
```

在 computed 属性中使用js内置方法 [`.filter` method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter#Examples)： 

```vue
<p v-for="user in filteredUsers">{{ user.name }}</p>
```

```javascript
computed: {
  filteredUsers: function () {
    var self = this
    return self.users.filter(function (user) {
      return user.name.indexOf(self.searchQuery) !== -1
    })
  }
}
```

js原生的 `.filter` 同样能实现很多复杂的过滤器操作，因为可以在计算 computed 属性中使用所有js方法。 

##### 替换 `orderBy` 过滤器 

不这样写： 

```vue
<p v-for="user in users | orderBy 'name'">{{ user.name }}</p>
```

而是在 computed 属性中使用 [lodash’s `orderBy`](https://lodash.com/docs/4.15.0#orderBy) (或者可能是 [`sortBy`](https://lodash.com/docs/4.15.0#sortBy))： 

```vue
<p v-for="user in orderedUsers">{{ user.name }}</p>
```

```javascript
computed: {
  orderedUsers: function () {
    return _.orderBy(this.users, 'name')
  }
}
```

甚至可以字段排序： 

```javascript
_.orderBy(this.users, ['name', 'last_login'], ['asc', 'desc'])
```

#### 过滤器参数符号 改变 

现在过滤器参数形式可以更好地与js函数调用方式一致，因此不用再用空格分隔参数，现在用圆括号括起来并用逗号分隔	 

#### 内置文本过滤器 移除 

尽管插入文本内部的过滤器依然有效，但是所有内置过滤器已经移除了。取代的是，推荐在每个区域使用更专业的库来解决。(比如用 [`date-fns`](https://date-fns.org/) 来格式化日期，用 [`accounting`](http://openexchangerates.github.io/accounting.js/) 来格式化货币)。 

##### 替换 `json` 过滤器 

Vue自动格式化好，无论是字符串，数字还是数组，对象。如果想用js的 `JSON.stringify` 功能去实现，你也可以把它写在方法或者计算属性里面。 

##### 替换 `capitalize` 过滤器 

```javascript
text[0].toUpperCase() + text.slice(1)
```

##### 替换 `uppercase` 过滤器 

```javascript
text.toUpperCase()
```

##### 替换 `lowercase` 过滤器 

```javascript
text.toLowerCase()
```

##### 替换 `pluralize` 过滤器 

NPM 上的 [pluralize](https://www.npmjs.com/package/pluralize) 库可以很好的实现这个功能。

##### Replacing the `currency` Filter 

对于简单的问题,可以这样做： 

```javascript
'$' + price.toFixed(2)
```

大多数情况下，仍然会有奇怪的现象(比如 `0.035.toFixed(2)` 向上取舍得到 `0.04`,但是 `0.045` 向下取舍却也得到 `0.04`)。解决这些问题可以使用 [`accounting`](http://openexchangerates.github.io/accounting.js/) 库来实现更多可靠的货币格式化。 

#### Two-Way Filters replaced 

While seemingly simple however, two-way filters can also hide a great deal of complexity - and even encourage poor UX by delaying state updates. Instead, components wrapping an input are recommended as a more explicit and feature-rich way of creating custom inputs. 


This increased modularity not only makes it easier to migrate to Vue 2, but also allows currency parsing and formatting to be: 
• unit tested in isolation from your Vue code 
• used by other parts of your application, such as to validate the payload to an API endpoint 

You may notice that: 
• Every aspect of our input is more explicit, using lifecycle hooks and DOM events in place of the hidden behavior of two-way filters. 
• We can now use v-model directly on our custom inputs, which is not only more consistent with normal inputs, but also means our component is Vuex-friendly. 
• Since we’re no longer using filter options that require a value to be returned, our currency work could actually be done asynchronously. That means if we had a lot of apps that had to work with currencies, we could easily refactor this logic into a shared microservice. 

### Slots 

#### 重名的 Slots 移除 

同一模板中的重名 `<slot>` 已经弃用。当一个 slot 已经被渲染过了，那么就不能在同一模板其它地方被再次渲染了。如果要在不同位置渲染同一内容，可一用prop来传递。 	 

#### `slot` 样式参数 移除 

通过具名 `<slot>` 插入的片段不再保持 `slot` 的参数。请用一个包裹元素来控制样式。或者用更高级方法：通过编程方式修改内容 ：render functions 。 	 

### 特殊属性 

#### `keep-alive` 属性 替换 

`keep-alive` 不再是一个特殊属性而是一个包裹组件，类似于 `<transition>`，这样可以在含多种状态子组件中使用 `<keep-alive>` 

当 `<keep-alive>` 含有不同子组件时，应该分别影响到每一个子组件。不仅是第一个而是所有的子组件都将被忽略。 

### 计算插值todaymark 

#### 属性内部的计算插值 移除 

属性内部的计算插值已经不能再使用了： 

```vue
<button class="btn btn-{{ size }}"></button>
```

应该写成行内表达式： 

```vue
<button v-bind:class="'btn btn-' + size"></button>
```

或者计算属性： 

```vue
<button v-bind:class="buttonClasses"></button>
```

```javascript
computed: {
  buttonClasses: function () {
    return 'btn btn-' + size  
  }
}
```

#### HTML 计算插值 移除 

HTML 的计算插值 (`{{{ foo }}}`) 已经弃用，取代的是 `v-html` 指令. 

#### 单次绑定替换 

单次绑定 (`{{* foo }}`) 已经弃用取代的是 [`v-once` directive](mk:@MSITStore:E:\bak\Vue.js%202.0%20参考手册.CHM::/api/#v-once) 。 

### 响应 

#### `vm.$watch` changed 

通过 `vm.$watch`创建的观察器现在将在组件渲染时被激活。这样可以让你在组件渲染前更新状态，不用做不必要的更新。比如可以通过观察组件的prop变化来更新组件本身的值。 

如果以前通过 `vm.$watch` 在组件更新后与 DOM 交互，现在就可以通过`updated`生命周期钩子来做这些。 

#### `vm.$set` 改变 

`vm.$set` 只是 [`Vue.set`](mk:@MSITStore:E:\bak\Vue.js%202.0%20参考手册.CHM::/api/#Vue-set) 的别名。 

#### `vm.$delete` 改变 

`vm.$delete` 现在只是： [`Vue.delete`](mk:@MSITStore:E:\bak\Vue.js%202.0%20参考手册.CHM::/api/#Vue-delete) 别名。 

#### `Array.prototype.$set` 弃用 

用 `Vue.set` 代替 

#### `Array.prototype.$remove` 移除 

用 `Array.prototype.splice` 代替，例如： 

```javascript
methods: {
  removeTodo: function (todo) {
    var index = this.todos.indexOf(todo)
    this.todos.splice(index, 1)
  }
}
```

或者更好的方法，直接给除去的方法一个index参数： 

```javascript
methods: {
  removeTodo: function (index) {
    this.todos.splice(index, 1)
  }
}
```

#### Vue实例上的`Vue.set` 和 `Vue.delete`移除 

`Vue.set` 和 `Vue.delete` 在实例上将不再起作用。现在都强制在实例的data选项中声明所有顶级响应值。如果删除实例属性或实例`$data`上的某个值，直接将它设置为null即可。 

#### 替换 `vm.$data` 移除 

现在禁止替换实例的 $data。这样防止了响应系统的一些极端情况并且让组件状态更加可控可预测（特别是对于存在类型检查的系统）。 

#### `vm.$get` 移除 

可以直接取回响应数据。 

### 围绕 DOM 的实例方法 

#### `vm.$appendTo` 移除 

使用 DOM 原生方法: 

```javascript
myElement.appendChild(vm.$el)
```

#### `vm.$before` 移除 

使用 DOM 原生方法： 

```javascript
myElement.parentNode.insertBefore(vm.$el, myElement)
```

#### `vm.$after` 移除 

使用 DOM 原生方法： 

```javascript
myElement.parentNode.insertBefore(vm.$el, myElement.nextSibling)
```

如果 `myElement` 是最后一个节点也可以这样写： 

```javascript
myElement.parentNode.appendChild(vm.$el)
```

#### `vm.$remove` 移除 

使用 DOM 原生方法： 

```
vm.$el.remove()
```

### 底层实例方法 

#### `vm.$eval` 移除 

尽量不要使用。 	 

#### `vm.$interpolate` 移除 

尽量不要使用。 

#### `vm.$log` 移除 

请使用 [Vue Devtools](https://github.com/vuejs/vue-devtools) 感受最佳debug体验。 

### 实例 DOM 选项 

#### `replace: false` 移除 

现在组件总是会替换掉他们被绑定的元素。为了模仿`replace: false`的行为，可以用一个和将要替换元素类似的元素将根组件包裹起来： 

```javascript
new Vue({
  el: '#app',
  template: '<div id="app"> ... </div>'
})
```

或者使用渲染函数： 

```javascript
new Vue({
  el: '#app',
  render: function (h) {
    h('div', {
      attrs: {
        id: 'app',
      }
    }, /* ... */)
  }
})
```

### 全局配置 

#### `Vue.config.debug` 移除 

不再需要，因为警告信息将默认在堆栈信息里输出。 

#### `Vue.config.async` 移除 

异步操作现在需要渲染性能的支持。 

#### `Vue.config.delimiters` 替换 

以 [模板选项](mk:@MSITStore:E:\bak\Vue.js%202.0%20参考手册.CHM::/api/#delimiters)的方式使用。这样可以在使用自定义分隔符时避免影响第三方模板。 

#### `Vue.config.unsafeDelimiters` 移除 

HTML 插入 [替换为 `v-html`](mk:@MSITStore:E:\bak\Vue.js%202.0%20参考手册.CHM::/迁移/25.html#HTML-Interpolation-removed). 

### 全局 API 

#### 带 `el` 的 `Vue.extend` 移除 

el 选项不再在 `Vue.extend`中使用。仅在实例创建参数中可用。  

#### `Vue.elementDirective` 移除 

用组件来代替 

#### `Vue.partial` 移除 

Partials have been removed in favor of more explicit data flow between components, using props. If you were dynamically binding the name of a partial, you can use a dynamic component. 

A benefit of functional components over partials is that they can be much more dynamic, because they grant you access to the full power of JavaScript.



## 从 Vue Router 0.7.x 迁移

### Router 初始化 

#### `router.start` 替换 

不再会有一个特殊的 API 用来初始化包含 Vue Router 的 app ，这意味着不再是： 

```javascript
router.start({
  template: '<router-view></router-view>'
}, '#app')
```

你只需要传一个路由属性给 Vue 实例： 

```javascript
new Vue({
  el: '#app',
  router: router,
  template: '<router-view></router-view>'
})
```

或者，如果你使用的是运行时构建 (runtime-only) 方式： 

```javascript
new Vue({
  el: '#app',
  router: router,
  render: h => h('router-view')
})
```

### Route 定义 

#### `router.map` 替换 

路由现在被定义为一个在 router 实例里的一个[`routes` 选项](http://router.vuejs.org/en/essentials/getting-started.html#javascript)数组。所以这些路由： 

```javascript
router.map({
  '/foo': {
    component: Foo
  },
  '/bar': {
    component: Bar
  }
})
```

会以这种方式定义： 

```javascript
var router = new VueRouter({
  routes: [
    { path: '/foo', component: Foo },
    { path: '/bar', component: Bar }
  ]
})
```

考虑到不同浏览器中遍历对象不能保证会使用相同的键值，这种数组的语法可以保证更多可预测的路由匹配。  

#### `router.on` 移除 

如果你需要在启动的 app 时通过代码生成路由，你可以动态地向路由数组推送定义来完成这个操作。举个例子： 

```javascript
// 普通的路由
var routes = [
  // ...
]
// 动态生成的路由
marketingPages.forEach(function (page) {
  routes.push({
    path: '/marketing/' + page.slug
    component: {
      extends: MarketingComponent
      data: function () {
        return { page: page }
      }
    }
  })
})
var router = new Router({
  routes: routes
})
```

如果你需要在 router 被实例化后增加新的路由，你可以把 router 原来的匹配方式换成一个包括你新添的加路由的匹配方式： 

```javascript
router.match = createMatcher(
  [{
    path: '/my/new/path',
    component: MyComponent
  }].concat(router.options.routes)
)
```

#### `subRoutes` 换名 

​	出于 Vue Router 和其他路由库一致性的考虑，重命名为[`children`](http://router.vuejs.org/en/essentials/nested-routes.html) 

#### `router.redirect` 替换 

现在用一个[路由定义的选项](http://router.vuejs.org/en/essentials/redirect-and-alias.html)作为代替。 举个例子，你将会更新： 

```javascript
router.redirect({
  '/tos': '/terms-of-service'
})
```

成像下面的`routes`配置里定义的样子： 

```javascript
{
  path: '/tos',
  redirect: '/terms-of-service'
}
```

#### `router.alias` 替换 

现在是你进行 alias 操作的[路由定义里的一个选项](http://router.vuejs.org/en/essentials/redirect-and-alias.html)。举个例子，你需要在你的`routes`定义里将： 

```javascript
router.alias({
  '/manage': '/admin'
})
```

配置这个样子： 

```javascript
{
  path: '/admin',
  component: AdminPanel,
  alias: '/manage'
}
```

如果你需要进行多次 alias 操作，你也可以使用一个数组语法去实现： 

```javascript
alias: ['/manage', '/administer', '/administrate']
```

#### 任意的 Route 属性 替换 

现在任意的 route 属性必须在新 meta 属性的作用域内，以避免和以后的新特性发生冲突。举个例子，如果你以前这样定义： 

```javascript
'/admin': {
  component: AdminPanel,
  requiresAuth: true
}
```

你现在需要把它更新成： 

```javascript
{
  path: '/admin',
  component: AdminPanel,
  meta: {
    requiresAuth: true
  }
}
```

如果在一个路由上访问一个属性，你仍然会通过 meta 。举个例子： 

```javascript
if (route.meta.requiresAuth) {
  // ...
}
```

### Route 匹配 

路由匹配现在使用 [path-to-regexp](https://github.com/pillarjs/path-to-regexp) 这个包，这将会使得工作与之前相比更加灵活。 

#### 一个或者更多的命名参数 改变 

语法稍微有些许改变，所以以`/category/*tags`为例，应该被更新为`/category/:tags+`。 

### 链接 

#### `v-link` 替换 

`v-link`指令已经被一个新的[`<route-link>` 组件](http://router.vuejs.org/en/api/router-link.html)指令替代，这一部分的工作已经被 Vue 2 中的组件完成。

Note that `target="_blank"` is not supported on `<route-link>`, so if you need to open a link in a new tab, you have to use `<a>` instead. 

#### `v-link-active` 替换 

`v-link-active`也因为指定了一个在[ `<route-link>` 组件](http://router.vuejs.org/en/api/router-link.html)上的 tag 属性而被弃用了。举个例子，你需要更新： 

```vue
<li v-link-active>
  <a v-link="'/about'">About</a>
</li>
```

成这个写法: 

```vue
<router-link tag="li" to="/about">
  <a>About</a>
</router-link>
```

`<a>`]标签将会成为真实的链接（并且可以获取到正确的跳转），但是激活的类将会被应用在外部的`<li>`标签上。 

### 编程导航 

#### `router.go` 改变 

`router.go` 已经被用来作为 [后退/前进导航](https://router.vuejs.org/en/essentials/navigation.html#routergon)，[`router.push` ](http://router.vuejs.org/en/essentials/navigation.html#routerpushlocation) 用来导向特殊页面。 	 

### 路由选择：Modes 

#### `hashbang: false` 移除 

Hashbangs 将不再为谷歌需要去爬去一个网址，所以他们将不再成为哈希策略的默认选项。 

#### `history: true` 替换 

所有路由模型选项将被简化成一个单个的[`mode` 选项](http://router.vuejs.org/en/api/options.html#mode)。 你需要更新： 

```javascript
var router = new VueRouter({
  history: 'true'
})
```

成这个写法： 

```javascript
var router = new VueRouter({
  mode: 'history'
})	 
```

#### `abstract: true` 替换 

所有路由模型选项将被简化成一个单个的[`mode` 选项](http://router.vuejs.org/en/api/options.html#mode)。 你需要更新： 

```javascript
var router = new VueRouter({  abstract: 'true'})
```

成这个写法： 

```javascript
var router = new VueRouter({  mode: 'abstract'})
```

### 路由选项：Misc 

#### `saveScrollPosition` 替换 

可以接受一个函数的[`scrollBehavior` 选项](http://router.vuejs.org/en/advanced/scroll-behavior.html)，所以滑动行为可以完全的被定制化处理 - 甚至为每次路由进行定制也可以满足。这将会开启很多新的可能，但是简单的复制旧的行为: 

```javascript
saveScrollPosition: true
```

你可以替换为: 

```javascript
scrollBehavior: function (to, from, savedPosition) {
  return savedPosition || { x: 0, y: 0 }
}
```

#### `root` 换名 

为了与[HTML 的``标签](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)保持一致性，重命名为`base`。  

#### `transitionOnLoad` 移除 

由于 Vue 的过渡系统`appear` transition control的存在，这个选项将不再需要。 

#### `suppressTransitionError` 移除 

出于简化钩子的考虑被移除。如果你真的需要抑制过渡错误，你可以使用 [`try`…`catch`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch)作为替代。 

### 路由挂钩 

#### `activate` 替换 

使用[`beforeRouteEnter`](http://router.vuejs.org/en/advanced/navigation-guards.html#incomponent-guards)这一组件进行替代。 

#### `canActivate` 替换 

使用[`beforeEnter`](http://router.vuejs.org/en/advanced/navigation-guards.html#perroute-guard) 在路由中作为替代。  

#### `deactivate` 移除 

使用`beforeDestroy` 或者 `destroyed` 钩子作为替代。 

#### `canDeactivate` 替换 

在组件中使用[`beforeRouteLeave`](http://router.vuejs.org/en/advanced/navigation-guards.html#incomponent-guards) 作为替代。 

#### `canReuse: false` 移除 

在新的 Vue 路由中将不再被使用。 	 

#### `data` 替换 

`$route`属性是响应式的，所有你可以就使用一个 watcher 去响应路由的改变，就像这样： 

```javascript
watch: {
  '$route': 'fetchData'
},
methods: {
  fetchData: function () {
    // ...
  }
}
```

#### `$loadingRouteData` 移除 

定义你自己的属性（例如：`isLoading`），然后在路由上的 watcher 中更新加载状态。举个例子，如果使用[axios](https://github.com/mzabriskie/axios)获取数据： 

```javascript
data: function () {
  return {
    posts: [],
    isLoading: false,
    fetchError: null
  }
},
watch: {
  '$route': function () {
    var self = this
    self.isLoading = true
    self.fetchData().then(function () {
      self.isLoading = false
    })
  }
},
methods: {
  fetchData: function () {
    var self = this
    return axios.get('/api/posts')
      .then(function (response) {
        self.posts = response.data.posts
      })
      .catch(function (error) {
        self.fetchError = error
      })
  }
}
```



## 从 Vuex 0.6.x 迁移到 1.0

### Store 的事件触发器 移除 

store 实例不再暴露事件触发器(event emitter)接口(`on`, `off`, `emit`)。

为了替换正在使用观察 store 自身触发事件的这些接口，（例如：`store.on('mutation', callback)`），我们引入新的方法 `store.subscribe`。在插件中的典型使用方式如下： 

```javascript
var myPlugin = store => {
  store.subscribe(function (mutation, state) {
    // Do something...
  })
}	 
```

#### 带字符串属性路径的 `store.watch` 替换 

#### 传入字符串属性路径的 `store.watch` 废弃 

`store.watch` 现在只接受函数。因此，下面例子你需要替换： 

```javascript
store.watch('user.notifications', callback)
```

为： 

```javascript
store.watch(
  // 当返回结果改变...
  function (state) {
    return state.user.notifications
  },
  // 执行回调函数
  callback
)
```

### 中间件 替换 

中间件被替换为插件。插件是接收 store 作为仅有参数的基本函数，能够监听 store 中的 mutation 事件： 

```javascript
const myPlugins = store => {
  store.subscribe('mutation', (mutation, state) => {
    // Do something...
  })
}
```