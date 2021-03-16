1，下载安装node.js，并配置node.js环境
2，创建发布目录 mkdir ./node/server/
3, 进入server目录，开始使用express生成器生成项目
   npm install express-generator -g 全局安装express生成器
   express --view=pug mainapp 生成项目 mainapp就是主入库类
4，进入mainapp目录cd mainapp 安装依赖并启动 npm i;  npm start
    启动后 浏览器访问 http://localhost:3000 ，成功后可看到 welcom to express

5，在Flutter项目中执行 flutter build web 构建web项目，完成后会在build目录下生成web包

6，拷贝web包中的内容到node/server/mainapp/public目录  cp -rf build/web/* node/server/mainapp/public
    为了区分不同的flutter项目，前提是主类名称相同的eg.. mainapp，建议拷贝时，区分 cp -rf build/web/* node/server/mainapp/public_web1 ...

7, 改造express，因为默认express是展示 views包下的网页的，而且默认不是html实现。将mainapp/views中文件全部删除即可
    同时修改 app.js，删除或注释掉
    //app.set('views', path.join(__dirname, 'views'));
    //app.set('view engine', 'pug');
    如果区分了文件夹eg.. public_web1,那么需要在app.js中
    app.use(express.static(path.join(__dirname, 'public'))); 下面增加 app.use(express.static(path.join(__dirname, 'public_web1')));

8, 保存修改，重新将服务npm start，再打开http://localhost:3000 即可看到我们的web程序了