js中使用typeof能得到那些类型？
考点:数据类型，能区分值类型，对引用类型没办法区分
typeof undefined //undefined
typeof 'abc' //string	
typeof 123 //number
typeof true //boolean
typeof {} //object
typeof [] //object
typeof null //object
typeof console.log //function
解答：undefined number boolean object string function

何时使用===何时使用==
考点:强制类型转换（字符串拼接，==，if语句，逻辑运算符都会发生强制类型转换）
解答：if(obj.a == null){
	//相当于obj.a===null || obj.a===undefined的简写模式，其他判断基本使用===
}

js中有那些内置函数
考点:
解答：Object Array Boolean Number String Function Date RegExp Error


js变量按照存储方式区分为哪些类型，并描述其特点
考点:
答案：值类型和引用类型


如何理解JSON
考点:JSON只是一个js对象
解答：JSON是一种数据格式，也是一个js对象，有两个API:JSON.stringify({a:10,b:20})对象转换为字符串，JSON.parse('{"a":10,"b":20}'),将json字符串转化为json对象。

知识点
变量类型和变量计算
值类型和引用类型（数组，对象，函数）







如何准确判断一个变量是数组类型
解答：使用instanceof Array
var arr=[]
arr instanceof Array //true


写一个原型链继承的例子
	function Animal(){
		this.eat=function(){
			console.log("animal eat")
		}
	}

	function Dog(){
		this.bark=function(){
			console.log("dog bark")
		}
	}
	Dog.prototype = new Animal()
	var hashiqi=new Dog()

	解答：封装DOM查询的例子
	function Elem(id){
		this.elem = document.getElementById(id)
	}

	Elem.prototype.html=function(val){
		var elem=this.elem
		if(val){
			elem.innerHTML = val
			return this//链式操作
		}else{
			return elem.innerHTML
		}
	}

	Elem.prototype.on=function(type,fn){
		var elem=this.elem
		elem.addEventListener(type,fn)
		return this
	}


描述new一个对象的过程
·创建一个新对象
·this指向新对象
·执行代码，对this赋值
·返回this

zepto（或其他框架）源码中如何使用原型链

知识点
构造函数

构造函数-扩展
	var a={}其实是var a = new Object()的语法糖
	var a=[]其实是var a = new Array()的语法糖
	function Foo(){...}其实是 var Foo = new Funcion(...)
	使用instanceof判断一个函数是否是一个变量的构造函数
原型规则和示例
	·所有的引用类型（数组、对象、函数），都具有对象特征，即可自由扩展属性（除了"null"以外）
	·所有的引用类型，都有一个__proto__的属性（隐式原型），属性值是一个对象
	·所有的函数，都有一个prototype属性（显式原型），属性值是一个对象
	所有的引用类型
	·所有对象__proto__属性值指向它的构造函数的 "prototype"属性
	·当试图得到一个对象的某个属性时，如果这个对象本身没有这个属性，那么会去它的__proto__(即它的构造函数的prototype)中寻找
	var item
	for(item in f){
		//循环对象的属性，使用hasOwnProperty这个API来检测属性是否是来自原型的属性
		if(f.hasOwnProperty(item)){
			console.log(item)
		}
	}
原型链






作用域和闭包
题目：
	说一下对变量提升的理解
	说明this几种不同的使用场景
		作为构造函数执行
		作为对象的属性执行
		作为普通函数执行
		call apply bind
	创建10个<a标签>，点击的时候弹出来对应的序号
		var i 
		for(i=0;i<10;i++){(function(i){
			var a=document.createElement("a");
			a.innerHTML=i+"<br/>";
			a.addEventListener('click',function(e){
				e.preventDefault();
				alert(i);
			})
			document.body.appendChild(a)
		})(i)
		}
	如何理解作用域
		自由变量
		作用域链，即自由变量的查找
		闭包的两个场景
	实际开发中闭包的应用
		最主要用于封装变量，收敛权限
		function  isFristload(){
			var _list = []
			return function(id){
				if(_list.indexOf(id)>=0){
					return false
				}else{
					_list.push(id)
					return true
				}
			}
		}

		var fristload = isisFristload();
		fristload(10)//true
		fristload(10)//false
		fristload(20)//true
		·_list变量被封装起来，无法访问修改
考点：
	执行上下文
		·范围：一段<script>或者一个函数
		·全局：会先将变量定义和函数声明提到前面
		·函数：先将变量定义、函数声明、this、arguments提到前面
		代码示例：
			console.log(a)//undefined  变量定义了，但是未赋值
			var a = 100

			fn('zhangsan') //'zhangsan' 20
			function fn(name){
				age=20
				console.log(name,age)
				var age
			}

			fn()//不会报错，因为fn是函数，提前声明
			function fn(){}//函数声明
			fn1()//报错，fn1是一个变量，提前声明后并未赋值，执行会报错
			var fn1=function(){}//函数表达式
	this
		·this要在执行时才能确认值，定义时无法确认
	作用域
	作用域链
	闭包


异步和同步的区别是什么？分别举一个异步和同步的例子
	解答：同步会阻塞代码执行，而异步不会。alert是同步的，setTimeout是异步的
关于setTimeout的笔试题

前端使用异步的场景有哪些
	定时任务：setTimeout ,setInverval
	网络请求：ajax请求，动态<img>加载
	事件绑定
考点：
	·什么是异步（对比同步）
	·前端使用异步的场景
		定时任务：setTimeout ,setInverval
		网络请求：ajax请求，动态<img>加载
		事件绑定
	·异步和单线程


AMD CMD CommonJs和ES6对比
AMD RequireJS对模块定义的规范化产出
	define(['package/lib'],function(lib){
		function foo(){
			lib.log('hello,world');
		}

		return{
			foo:foo
		}
	})
	通过define定义模块，第一个参数是模块所依赖的包，依赖前置，异步模块定义，通过require加载模块

	CMD SeaJS对模块定义的规范化产出
	define(function(require,exports,module){
		var $=require('jquery');//通过require引入依赖

	})
	依赖就近，同步，

ComminJs nodejs定义的模块化规范
	exports.area=function(r){
		return Math.PI*r*r;
	};

ES6 export/import来导出/导入模块


webAPI
	·编写一个通用的事件监听函数
		解答：
		function bindEvent(elem,type,selector,fn){
			if(fn==null){
				fn=selector;
				selector=null;
			}
			elem.addEventListener(type,function(e){
				var target
				if(selector){
					target=e.target;
					if(target.matches(selector)){
						fn.call(target,e)
					}
				}else{
					fn(e)
				}
			})
		}
	·描述时间冒泡流程

	·对于一个无限下拉加载图片的页面，如何给每个图片绑定事件

	知识点
	·通用事件绑定
		function binEvent(elem,type,fn){
			elem.addEventListener(type,fn)
		}
		(IE低版本中，用attachEvent绑定事件)
	·事件冒泡
		<body>
			<div id='div1'>
				<p id='p1'>激活</p>
				<p id='p2'>取消</p>
				<p id='p3'>取消</p>
				<p id='p4'>取消</p>
			</div>
			<div>
				<p id='p5'>取消</p>
				<p id='p6'>取消</p>
			</div>
			<script>
				var elm1=document.getElementById('p1');
				var body=document.body
				binEvent(elm1,'click',function(e){
					e.stopPropatation();//阻止默认事件
					alert('激活');
				})
				binEvent(body,'click',function(e){
					alert('取消');
				})			
			</script>
		</body>
		利用事件冒泡机制，将取消时间绑定在body上，下面的取消按钮点击事件发生后，会冒泡到body上，激活按钮使用stopPropatation()来阻止事件冒泡
	·代理
		<div id='div1'>
			<a href=''>a1</a>
			<a href=''>a2</a>
			<a href=''>a3</a>
			<a href=''>a4</a>
			<a href=''>a5</a>
		</div>
		<script>
			var div1=document.getElementById('div1');
			div.addEventListener('click',function(e){
				var target=e.target;//target可以获取点击事件的来源
				if(target.nodeName='A'){
					alert(targrt.innerHTML)
				}
			})
		</script>
		div1中的a动态变化，要求点击A标签，弹出其中内容


Ajax
	·手动编写一个AJAX，不依赖第三方库
	·跨域的几种实现方式
		jsonp
		服务器端设置http header
	知识点
	XMLHttpRequest
		var xhr = new XMLHttpRequest();
		xhr.open('GET','/api',false);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
				if(xhr.stats==200){
					alert(xhr.responseText());
				}
			}
		}
		xhr.send(null)
		(ie低版本使用ActiveXObject来替代XMLHttpRequest)
	状态码
		readyState
			0:未初始化，还没有调用send方法
			1：载入，已调用send()方法，正在发送请求
			2：载入完成，send()方法执行完成，得到全部响应内容
			3：交互，正在解析响应内容
			4：完成，响应内容解析完成，可以再客户端调用
		status
			2xx:请求成功
			3xx:需要重定向，浏览器跳转
			4xx:客户端请求错误
			5xx：服务器段错误
	跨域
		什么是跨域
			·浏览器有同源策略，不允许AJAX访问其他域的接口
			·跨域条件：协议、域名、端口，有一个不同就算跨域
			·有3个标签允许跨域加载资源：img(用于打点统计)  link（使用CDN） script（可以使用jsonp）
		JSONP实现原理
			·加载一个页面
			·服务器段不一定真的有这个页面
			·服务器可以根据请求动态生成一个页面再返回
		代码示例
		<script>
			window.callback=function(data){
				console.log(data)//这既是跨域得到的数据
			}
		</script>
		<script src='.....'></script>//这个会返回callback({x:100,y:200})

存储
·请描述下cookie,seeionStorage和localStorage的区别
知识点
cookie
	本身同于客户端和服务端通信，但有本地存储功能，于是被借用。
	使用document=cookie 来获取和修改
	用于存储的缺点：太小，只有4kb,所有的HTTP都携带，影响效率，API简单，要封装
seeionStorage和localStorage
	html5专门为存储设置，最大5M。API简单易用

日期和Math
  #获取2017-06-10格式的日期
  	解答： 
  	function formatDate(dt){
  		if(!dt){
  			dt=new Date();
  		}
  		var year=dt.getFullYear();
  		var month=dt.getFullMonth+1;
  		var day=dt.getDate();
  		if(month<10){
  			month='0'+month
  		}
  		if(day<10){
  			day='0'+day
  		}
  		return year+'-'+month+'-'+day;
  	}
  #获取随机数，要求是长度一致的字符串格式
  	解答：
  		var random=MAth.random();
  		var random=random+'0000000000';
  		var random=random.slice(0,10);
  		console.log(random);
  #写一个能遍历对象和数组的通用forEach函数
  	解答：
  		function forEach(obj,fn){
  			var key;
  			if(obj instanceof Array){
  				obj.forEach(function(item,index){
  					fn(index,item);
  				})else{
  				  for(key in obj){
  				  	fn(key,obj[key]);
  				  }
  				}
  			}
  		}
  知识点
  	数组API:
  	forEach遍历所以元素 
  		var arr =[1,2,3]
  		arr.forEach(function(item,index){
  			console.log(index,item);
  		}) 
  	every判断所有元素是否都符合条件 
  		var arr =[1,2,3]
  		var result=arr.every(function(item,index){
  			if(item<5){
  				return true;
  			}
  		})
  		console.log(result);
  	some判断是否至少有一个元素符合条件
  		var arr =[1,2,3]
  		var result=arr.some(function(item,index){
  			if(item>2){
  				return true;
  			}
  		})
  		console.log(result);
  	sort 排序
  		var arr=[1,5,2,7,3,4]
  		var arr2 = arr.sort(function(a,b){
  			return a-b
  			//return b-a
  		})
  		console.log(arr2)
  	map对元素重新组装，生成新数组
  		var arr=[1,5,2,7,3,4]
  		var arr2=arr.map(function(item,index){
  			return "<b>"+item+"</b/>"
  		}) 
  		console.log(arr2)
  	filter过滤符合条件的元素
  		var arr=[1,5,2,7,3,4]
  		var arr2=arr.filter(function(item,index){
  			if(item>3){
  				return true;
  			}
  		}) 
  		console.log(arr2)




模块化
	#不使用模块化的情况
	#使用模块化
	#AMD
	#ComminJS




