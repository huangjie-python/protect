-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `azh` varchar(20) NOT NULL,
  `amm` varchar(80) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `azh` (`azh`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'hj','zazz');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gooddd`
--

DROP TABLE IF EXISTS `gooddd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gooddd` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `good` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `dxd` varchar(80) DEFAULT NULL,
  `djq` varchar(80) DEFAULT NULL,
  `dwc` varchar(80) DEFAULT NULL,
  `ddz` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `gid` (`good`),
  KEY `uid` (`uid`),
  CONSTRAINT `gooddd_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gooddd`
--

LOCK TABLES `gooddd` WRITE;
/*!40000 ALTER TABLE `gooddd` DISABLE KEYS */;
INSERT INTO `gooddd` VALUES (5,'{\'4\': \'2\', \'12\': \'2\', \'22\': \'2\'}',1,'2020-03-28-20-26-42','16783.8',NULL,'我家'),(6,'{\'4\': \'9\', \'12\': \'1\'}',1,'2020-03-28-20-43-45','662.1',NULL,'他家'),(8,'{\'4\': \'1\', \'5\': \'1\', \'3\': \'1\', \'12\': \'1\', \'22\': \'1\', \'23\': \'1\', \'32\': \'1\', \'43\': \'1\'}',1,'2020-03-28-20-50-12','11234.6',NULL,'他家'),(9,'{\'4\': \'1\', \'5\': \'1\', \'13\': \'1\'}',1,'2020-03-28-20-51-38','385.8',NULL,'我家'),(10,'{\'3\': \'1\'}',1,'2020-03-28-20-51-54','10.9',NULL,'我家'),(11,'{\'11\': \'1\', \'21\': \'4\', \'32\': \'1\'}',1,'2020-03-28-20-52-14','5869',NULL,'我家'),(12,'{\'5\': \'1\'}',1,'2020-03-28-20-52-30','32.9',NULL,'我家'),(13,'{\'31\': \'5\'}',1,'2020-03-28-20-52-53','214.5',NULL,'我家'),(14,'{\'33\': \'1\', \'42\': \'1\', \'53\': \'1\'}',1,'2020-03-28-20-53-10','204.5',NULL,'我家'),(15,'{\'3\': \'1\', \'52\': \'1\', \'51\': \'1\', \'53\': \'1\'}',1,'2020-03-28-20-53-39','537.9',NULL,'我家'),(16,'{\'23\': \'1\', \'32\': \'1\', \'43\': \'1\', \'53\': \'1\'}',1,'2020-03-28-20-54-00','2937.9',NULL,'我家');
/*!40000 ALTER TABLE `gooddd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodlx`
--

DROP TABLE IF EXISTS `goodlx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goodlx` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodlx`
--

LOCK TABLES `goodlx` WRITE;
/*!40000 ALTER TABLE `goodlx` DISABLE KEYS */;
INSERT INTO `goodlx` VALUES (1,'食品'),(2,'饰品'),(3,'家具'),(4,'清洁剂'),(5,'书本'),(6,'厨房用具'),(10,'家用电器'),(11,'手机'),(12,'电脑');
/*!40000 ALTER TABLE `goodlx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(80) DEFAULT NULL,
  `gms` varchar(80) DEFAULT NULL,
  `gri` varchar(80) DEFAULT NULL,
  `gbz` varchar(80) DEFAULT NULL,
  `gtp` varchar(80) DEFAULT NULL,
  `gsl` int(11) DEFAULT NULL,
  `gjg` float DEFAULT NULL,
  `glx` varchar(80) DEFAULT NULL,
  `gsh` varchar(10) DEFAULT NULL,
  `gxs` int(11) DEFAULT NULL,
  `gzk` float DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (3,'良品铺子 黄骅脆冬枣 35gx1袋装','空心无核红枣蜜饯果干河北特产脆枣子大枣','2020-3-14','360天','static/images/good/202003181913113.png',100,10.9,'食品',NULL,NULL,1),(4,'想念（XIANGNIAN）原味小麦粉5kg','馒头粉 面条粉 饺子包子中筋粉 家庭装通用小麦粉  色泽自然 保留小麦麦香 精研细磨','2020-3-14','360天','static/images/good/202003141741284.png',100,24.9,'食品',NULL,NULL,1),(5,'东北农嫂黄白糯玉米【6袋*200g】','软糯香甜非转基因真空包装低脂健康谷类杂粮东北粘糯玉米 东北原产 非转基因 真空鲜食','2020-3-14','360天','static/images/good/202003141742595.png',100,32.9,'食品',NULL,NULL,1),(6,'三只松鼠_蜀香牛肉100g','休闲零食小吃麻辣牛肉肉脯手撕牛肉干美食','2020-3-14','360天','static/images/good/202003141744546.png',100,29.91,'食品',NULL,NULL,1),(7,'古越龙山 绍兴黄酒 500ml*6瓶','花雕酒糯米酒 半甜型 清醇三年  整箱装 送礼佳品  手工阿胶好搭档 ,实惠自饮, 店铺爆品,经典款, 口感温润甜和','2020-3-14','360天','static/images/good/202003141756107.png',100,60,'食品',NULL,NULL,1),(8,'伊利 安慕希希腊风味酸牛奶原味205g*16盒','家庭量贩 浓醇美味','2020-3-14','360天','static/images/good/202003141812588.png',100,88.2,'食品',NULL,0,1),(9,'伊利 谷粒多 谷物牛奶饮品 12*250ml','伊利 谷粒多 谷物牛奶饮品 红谷牛奶 粗粮牛奶  精选红谷 充盈活力','2020-3-14','360天','static/images/good/202003141814529.png',100,36,'食品',NULL,0,1),(10,'三只松鼠_酸辣粉130g','桶装速食方便面泡面正宗四川小吃','2020-3-14','360天','static/images/good/2020031418154410.png',100,16.9,'食品',NULL,0,1),(11,'男女单戒情侣对戒 12号','电影《哪吒之魔童降世》正版授权 Mover魔吻 哪吒封印之乾坤圈对戒 合金戒指饰品 \r\n哪吒同款乾坤圈戒指男女单戒情侣对戒  ','2020-3-14','360天','static/images/good/2020031418172711.png',100,235,'饰品',NULL,0,1),(12,'银饰项链首饰 S925银','电影《神偷奶爸》正版授权 Mover魔吻 小黄人心动大眼萌翻转吊坠 正版授权 编织吊坠  ','2020-3-14','360天','static/images/good/2020031418185612.png',100,438,'饰品',NULL,0,1),(13,'长草颜团子甜蜜约会银吊坠','长草颜团子正版授权 Mover魔吻 长草颜团子甜蜜约会银吊坠 银饰项链首饰 S925银\r\n长草颜团子 正版授权','2020-3-14','360天','static/images/good/2020031418200613.png',100,328,'饰品',NULL,0,1),(14,'全职高手叶修专属武器千机伞好运珠编织手绳手链','电影《全职高手》正版授权 Mover魔吻 全职高手叶修专属武器千机伞好运珠编织手绳手链 腕带直径约55-85mm\r\n全职高手同款手办编织手绳','2020-3-14','360天','static/images/good/2020031418210014.png',100,159,'饰品',NULL,0,1),(15,'3D硬金萌鼠足金手绳手串','周六福(ZHOULIUFU) 黄金手链手饰女士款 3D硬金萌鼠足金手绳手串 定价ADKQ164819 约1.28g 吃货鼠弟，寓意欢乐无忧  ','2020-3-14','360天','static/images/good/2020031418220815.png',100,809,'饰品',NULL,0,1),(16,'周生生(CHOW SANG SANG)足金六字大明咒结婚黄金戒指黄金指环 ','周生生(CHOW SANG SANG)足金六字大明咒结婚黄金戒指黄金指环 83215R计价\r\n寓意平安护身 ','2020-3-14','360天','static/images/good/2020031418230916.png',100,1259,'饰品',NULL,0,1),(17,'钻石世家 18K金钻石项链','钻石世家 18K金钻石项链 爱随心动 简约款项链女款 2019春夏新款\r\n爱随心动吊坠项链  ','2020-3-14','360天','static/images/good/2020031418240417.png',100,799,'饰品',NULL,0,1),(18,'Promessa钻石吊坠项坠不含项链01257P','周生生(CHOW SANG SANG)珠宝饰品Promessa钻石吊坠项坠不含项链01257P 钻石','2020-3-14','360天','static/images/good/2020031418250718.png',100,5150,'饰品',NULL,0,1),(19,'印象眸 和田玉青玉貔貅牌挂件玉牌吊坠','【东方美饰 以玉点缀】每满499减100，黄金商品除外；代写心意卡哦！ ','2020-3-14','360天','static/images/good/2020031418261519.png',100,199,'饰品',NULL,0,1),(20,'18K金钻石吊坠女士钻石项链','Leysen1855莱绅通灵珠宝 百变风情-花样年华 18K金钻石吊坠女士钻石项链送老婆礼物首饰明星同款官方正品\r\n花样年华 钻石吊坠 三色可选 花型吊坠  ','2020-3-14','360天','static/images/good/2020031418282820.png',100,1240,'饰品',NULL,0,1),(21,'A家家具沙发 ','北欧客厅布艺沙发可拆洗小户型三人位懒人沙发简约现代客厅家具布艺木质其他 ADS-025A 米黄色三人位','2020-3-14','360天','static/images/good/20200314183058',100,1399,'家具',NULL,0,1),(22,'左右真皮沙发','现代中式大户型客厅皮质家具组合转角贵妃位皮艺沙发DZY2835 转二反向+休单（C1011米黄色）','2020-3-14','360天','static/images/good/2020031418315522.png',100,7929,'家具',NULL,0,1),(23,'真皮软靠公主皮艺床','天惠子 床 欧式床 木质实木橡木床1.5米双人实木床1.8m高箱储物床抽屉婚床皮质真皮软靠公主皮艺床 框架款单床+2柜','2020-3-14','360天','static/images/good/2020031418330523.png',100,2750,'家具',NULL,0,1),(24,'ZINUS/际诺思北欧简约现代铁艺铁架床','ZINUS/际诺思北欧简约现代铁艺铁架床1.5米1.8米可拆卸家庭单人学生儿童北欧风格 光阴 150*200cm（黑色）高18cm','2020-3-14','360天','static/images/good/2020031418340424.png',100,1199,'家具',NULL,0,1),(25,'简约现代时尚家具衣柜','全友家私 简约现代时尚家具衣柜 卧室人造板衣橱家居大衣柜组合衣柜 106302 四门衣柜','2020-3-14','360天','static/images/good/2020031418350525.png',100,1399,'家具',NULL,0,1),(26,'忆斧至家 (YF) 衣柜',' 整体衣柜推拉门 简约现代板式2门烤漆衣柜卧室家具环保人造板大衣柜 1.2米两门衣柜','2020-3-14','360天','static/images/good/2020031418355026.png',100,1880,'家具',NULL,0,1),(27,'北欧白蜡木桌椅组合北欧餐桌','狄雷斯/DILEISI 北欧白蜡木桌椅组合北欧餐桌小户型家用6人长方形简约现代木质家具A-07# 1.4M【餐桌】','2020-3-14','360天','static/images/good/2020031418364927.png',100,1699,'家具',NULL,0,1),(28,'古宜G520小户型折叠茶几',' 钢琴烤漆餐桌伸缩现代多功能用途储物凳6人餐厅简约现代人造板茶几 白色茶几【配4凳】','2020-3-14','360天','static/images/good/2020031418375729.png',100,1880,'家具',NULL,0,1),(29,'中国台湾康朴乐儿童学习桌椅套装套餐',' 贵族书桌+MATCH椅 可升降学习桌椅\r\n贵族书桌 Match椅，可升降倾斜桌，铝合金背管，美观不生锈  ','2020-3-14','360天','static/images/good/2020031418390328.png',100,2600,'家具',NULL,0,1),(30,'蜗家简易多层鞋架',' 组装防尘鞋柜简约现代经济型铁艺收纳架特价K127 荷塘花\r\n加高脚 加固 拆一层放靴子  ','2020-3-14','360天','static/images/good/2020031418395730.png',100,28,'家具',NULL,0,1),(31,'威猛先生 深层净力洁厕啫哩（柠檬草香）750g*4',' 除菌 洁厕剂 马桶清洁剂 【新老包装随机发】\r\n去除厕所污垢，厕所黄金组合更加实惠 ','2020-3-14','360天','static/images/good/2020031418413031.png',100,42.9,'清洁剂',NULL,0,1),(32,'【泡沫喷雾】花王(KAO) 日本进口 泡沫型厨房洗洁精喷剂 深层去油污 400ml 瓶装','强力去污 轻松除油 强力去除重油污，泡沫丰富强力分解，一喷一擦轻松除油，保护厨具不伤材质。','2020-3-14','360天','static/images/good/2020031418424732.png',100,38,'清洁剂',NULL,0,1),(33,'威猛先生 日常台面喷雾单瓶装 350g+350g',' 厨房清油污多表面清洁剂 免水洗 桌面 燃气灶 微波炉清洁 魔洁瓶 \r\n轻松去除每日油污，一喷一擦，无需过水','2020-3-14','360天','static/images/good/2020031418441733.png',100,28.5,'清洁剂',NULL,0,1),(34,'【4瓶】艾雪兰500g油污清洁剂 强力清洁不伤手油烟净','500g*4瓶 强力清洁 不伤手 免拆洗  ','2020-3-14','360天','static/images/good/2020031418450334.png',100,29.8,'清洁剂',NULL,0,1),(35,'【地板瓷砖都可用】Frosch 德国 菲洛施 家居多用清洁剂（PH值中性）多功能清洁剂 1L','德国皮肤科认证，温和亲肤不伤手；一瓶多用，可用于多种场景清洁多种污渍，适用于真皮、地板、家居、瓷砖等清洁，也可手洗毛巾小件衣物等.','2020-3-14','360天','static/images/good/2020031418461235.png',100,43,'清洁剂',NULL,0,1),(36,'蓝月亮 卫诺洁厕液 马桶清洁剂500g*2瓶优惠装 ','清怡罗兰香氛 去污除垢杀菌无毒无刺激香氛不刺鼻专业卫浴清洁，超凡洁净高效瓦解水垢尿垢，除菌率高达99.9%，无毒无刺激，香氛不刺鼻 ','2020-3-14','360天','static/images/good/2020031418470636.png',100,17.9,'清洁剂',NULL,0,1),(37,'老管家洗衣机槽清洗剂','老管家洗衣机槽清洗剂除垢剂清洁剂无香味滚筒全自动波轮内筒清洁剂非杀菌消毒液','2020-3-14','360天','static/images/good/2020031418480137.png',100,19.8,'清洁剂',NULL,0,1),(38,'仕马抽油烟机清洗剂500ml','油烟净厨房强力去重油污净清洁剂厨房除油剂强力除垢去油焕新 温和无刺激 ','2020-3-14','360天','static/images/good/2020031418491338.png',100,15.9,'清洁剂',NULL,0,1),(39,'finish 光亮碗碟 洗碗机专用多效合一小型洗涤块 24块装 油污清洁剂','多效合一，一块搞定，强力清洗，预防水垢，漂洗功能，适用于小型洗碗机','2020-3-14','360天','static/images/good/2020031418502439.png',100,49,'清洁剂',NULL,0,1),(40,'老管家洗衣机槽清洗剂清洁剂滚筒全自动波轮内筒除垢剂盒装 375g ','老管家出品\r\n活性氧生物酶 去污 除垢 适用各洗衣机','2020-3-14','360天','static/images/good/2020031418510640.png',100,16.8,'清洁剂',NULL,0,1),(41,'福尔摩斯探案集全10册','少儿版侦探悬疑推理小说神探夏洛克 6-12-15岁青少年侦探悬疑推理小说小学生课外阅读书培养观察力 推理能力  ','2020-3-14','360天','static/images/good/2020031418524241.png',100,39.8,'书本',NULL,0,1),(42,'三体全集3册 ','观想宇宙黑暗森林死神永生刘慈欣科幻小说全套悬疑科学幻想小说读物三体书流浪地球作者著新华书店正版','2020-3-14','360天','static/images/good/2020031418532342.png',100,37,'书本',NULL,0,1),(43,'小学生必背古诗词75首 ','彩图注音版小书虫阅读系列小学生一二三年级语文新课标必读丛书班主任推荐儿童文学读物国学经典 刘敬余','2020-3-14','360天','static/images/good/2020031418540843.png',100,10.9,'书本',NULL,0,1),(44,'神奇的专注力训练游戏书全套四册','3-4-5-6-8-10岁幼儿童早教益智注意力找不同走迷宫大冒险思维图形大猜想数字大爆炸宝','2020-3-14','360天','static/images/good/2020031418544944.png',100,54,'书本',NULL,0,1),(45,'【学校指定】快乐读书吧三年级上册 ','全套3册 稻人书 安徒生童话格林童话必读经典书目 叶圣陶正版全集上 小学小学生课外阅','2020-3-14','360天','static/images/good/2020031418552445.png',100,50.4,'书本',NULL,0,1),(46,'6册 中华上下五千年正版全套','青少年小学生漫画版图解趣味中国历史故事儿童史记读物 7-9-10-12岁小学生课外阅读书籍','2020-3-14','360天','static/images/good/2020031418561846.png',100,68,'书本',NULL,0,1),(47,'海底两万里正版完整版','凡尔纳原著初中生版必读课外书七年级下册青少年原版世界经典名著小学生版四五六年级书籍','2020-3-14','360天','static/images/good/2020031418570447.png',100,9.9,'书本',NULL,0,1),(48,'大唐兴亡三百年全集7册',' 又名血腥的盛唐 全集 王觉仁正版书 历史小说书籍 书唐朝历史的兴起','2020-3-14','360天','static/images/good/2020031418580048.png',100,220.56,'书本',NULL,0,1),(49,'毛泽东诗词鉴赏','(手迹出处权威，可以作为语言表达之外具象化的补充。)','2020-3-14','360天','static/images/good/2020031418584649.png',100,17.5,'书本',NULL,0,1),(50,'正版 刘薰宇著 给孩子的数学三书 ','原来数学可以这样学 全3册 随机送笔记本*1中小学生课外阅读书籍科普百科自然科学数理化','2020-3-14','360天','static/images/good/2020031418593850.png',100,43.8,'书本',NULL,0,1),(51,'爱仕达（ASD）WG8332QN 32cm炒锅','不易生锈 无涂层锅 精铁锅 可立盖炒菜锅 电磁炉明火通用\r\n不易生锈 可立盖 电磁炉通用 防滑设计  ','2020-3-14','360天','static/images/good/2020031419062551.png',100,249,'厨房用具',NULL,0,1),(52,'苏泊尔(SUPOR) 好帮手304不锈钢双层复底蒸锅','SZ26B5白色蒸笼汤锅 26cm玻璃盖燃气灶电磁炉通用蒸煮锅锅具\r\n【循环蒸汽设计	三层复合锅底	分离式蒸格】','2020-3-14','360天','static/images/good/2020031419071552.png',100,139,'厨房用具',NULL,0,1),(53,'炊大皇(COOKER KING)炒锅','不粘锅麦饭石平底锅炒菜锅 磁炉通用 不沾锅少油烟铝合金平底锅 32cm','2020-3-14','360天','static/images/good/2020031419075353.png',100,139,'厨房用具',NULL,0,1),(54,'彩帮描金青瓷陶瓷黄酒白酒具套装','酒壶高脚小酒杯套件清酒具\r\n破碎补发，购买无忧！  ','2020-3-14','360天','static/images/good/2020031419084454.png',100,699,'厨房用具',NULL,0,1),(55,'纳丽雅 调料盒 玻璃调味罐 调味瓶套装 十一件套','油瓶油壶醋壶厨房用品 各种调料一套整合，居家好帮手防漏调料瓶酱油醋瓶  ','2020-3-14','360天','static/images/good/2020031419092355.png',100,88,'厨房用具',NULL,0,1),(56,'苏泊尔(SUPOR)精钢刀具七件套装','不锈钢厨房菜刀剪刀套装组合切肉片斩骨刀 TK1506E\r\n苏泊尔官方授权，正品保障，365天全国联保','2020-3-14','360天','static/images/good/2020031419102656.png',100,269,'厨房用具',NULL,0,1),(57,'十八子作刀具套装 厨房全套菜刀套装 家用七件套不锈钢切菜水果刀S1309','刀身5铬钼钒钢，锋利之刃，孔雀开屏造型，美观大方，鱼肚式手柄，舒适顺手','2020-3-14','360天','static/images/good/2020031419111357.png',100,418,'厨房用具',NULL,0,1),(58,'炊大皇(COOKER KING)筷 WG14962 10双','鸡翅木材质 手工精制无漆无蜡 实木筷子\r\n鸡翅木材质，手工精制，无漆无蜡 ！','2020-3-14','360天','static/images/good/2020031419120358.png',100,39,'厨房用具',NULL,0,1),(59,'炊大皇(COOKER KING)筷 WG14962 10双','鸡翅木材质 手工精制无漆无蜡 实木筷子\r\n鸡翅木材质，手工精制，无漆无蜡 ！','2020-3-14','360天','static/images/good/2020031419120358.png',100,39,'厨房用具',NULL,0,1),(60,'爱仕达（ASD) G系列不锈钢七件套铲子 ','厨房配件 平铲锅铲汤勺漏勺面捞漏铲饭勺套装 国产SSQ-07G\r\n优质不锈钢基质 时尚外观 铲勺捞组合 ','2020-3-14','360天','static/images/good/2020031419124859.png',100,89,'厨房用具',NULL,0,1),(61,'青苹果 加厚耐热玻璃茶壶花茶过滤冷水壶 ','明火加热煮茶牛奶凉水壶大容量防爆水具茶具套装组合装 5件套 透明 加厚耐热玻璃材质，可明火，易清洗、无异味  ','2020-3-14','360天','static/images/good/2020031419133860.png',100,69,'厨房用具',NULL,0,1),(62,'美的（Midea）电压力锅 WCS5025 ','一锅双胆电高压锅立体加压定时功能微电脑按键式底盘加热压力饭煲 3-6人 5L','2020-3-14','360天','static/images/good/2020031419143961.png',100,179,'家用电器',NULL,0,1),(63,'戴森(Dyson) 吸尘器 V10 Fluffy ','60分钟续航 家用除螨 无线 整机过滤 手持式吸尘器 吸力强劲 大户型力荐','2020-3-14','360天','static/images/good/2020031419153062.png',100,3900,'家用电器',NULL,0,1),(64,'科沃斯（ECOVACS）地宝绝尘S扫地机器人 CEN556',' 全自动智能规划清洁 拖扫吸式 家用吸尘器\r\n绝尘升级款，千帕吸力，大水箱真湿拖，APP智控，机器高约7.4厘米  ','2020-3-14','360天','static/images/good/2020031419161363.png',100,799,'家用电器',NULL,0,1),(65,'海尔（Haier）空气净化器 KJ480F-N860C ','氨基酸除甲醛除雾霾二手烟pm2.5除菌净化机负离子氧吧 抗菌必备，货量有限！氨基酸长效除醛技术，CSV降噪风道，降醛除霾','2020-3-14','360天','static/images/good/20200314191714',100,2399,'家用电器',NULL,0,1),(66,'东菱(Donlim）多士炉TA-8600面包机','不锈钢内胆烤面包机2片烤吐司机多功能三明治早餐机全自动吐司机 清新萌系颜值 7档烧色 不锈钢内胆【送配套防尘盖+一年延保】  ','2020-3-14','360天','static/images/good/2020031419185565.png',100,69,'家用电器',NULL,0,1),(67,'九阳（Joyoung）L18-Y909高速破壁料理机 ','家用1.75L/升加热多功能榨汁养生辅食豆浆机绞肉机搅拌机冷热干磨一机三用 精钢杯体 IMD触控 可炖煮  ','2020-3-14','360天','static/images/good/2020031419193666.png',100,299,'家用电器',NULL,0,1),(68,'TCL 55V6 55英寸 全场景AI 全面屏人工智能语音 16GB大内存 4K超高清网络智慧平板电视','Handfree免唤醒 全场景AI 2GB+16GB 全面屏设计  点击升级新一代圆角全面屏+金属外观电视','2020-3-14','360天','static/images/good/2020031419210167.png',100,2099,'家用电器',NULL,0,1),(69,'坚果（JmGO）J7 家用投影仪 300英寸 ','1080P全高清HDR 3200流明 安卓智能 电视 可投屏 蓝牙Wi-Fi 内置音箱 家庭影院\r\n旗舰J7','2020-3-14','360天','static/images/good/2020031419221368.png',100,4475,'家用电器',NULL,0,1),(70,'海尔（Haier）BCD-541WDPJ 541升对开门冰箱 ','大空间容量 风冷变频无霜 一天不到1度电 家用电冰箱DEO净味技术，三重过滤，食材长久保鲜，呵护家人健康！','2020-3-14','360天','static/images/good/2020031419234269.png',100,4099,'家用电器',NULL,0,1),(71,'比佛利（BEVERLY）BVL1D100NET国米联名款 10公斤洗干一体机 全自动滚筒洗衣机 ','羊毛洗 钛色 水魔方 6种材质空气洗 国际羊毛绿标认证 6档贴心烘干 搭配水魔方科技水流护色护形 自动投放洗涤','2020-3-14','360天','static/images/good/2020031419245670.png',100,8000,'家用电器',NULL,0,1),(72,'Apple iPhone 11 128G 白色 移动联通电信4G全网通手机','iPhone新品-双卡双待-双摄-多配色选择','2020-3-14','360天','static/images/good/2020031419263171.png',100,5999,'手机',NULL,0,1),(73,'华为/荣耀(honor) 荣耀9X 全网通版 6GB+128GB ','魅海蓝 移动联通电信4G全面屏手机 双卡双待 荣耀手机  麒麟810 4000mAh超强续航 4800万超清夜拍 6.59英寸升降全面屏 ','2020-3-14','360天','static/images/good/2020031419274472.png',100,1558,'手机',NULL,0,1),(74,'华为(HUAWEI) Mate30 Pro 5G 全网通版 8GB+256GB 丹霞橙',' 麒麟990 5GSoC芯片 超感光徕卡电影四摄 移动联通电信5G手机 华为mate30pro\r\n','2020-3-14','360天','static/images/good/2020031419284073.png',100,6198,'手机',NULL,0,1),(75,'小米(MI) Redmi K30 5G版本 深海微光 6GB内存128GB存储','全面屏索尼6400万后置四摄 4500mAh超长续航 30W快充 5G游戏学生拍照手机120Hz流速屏，前置挖孔双摄','2020-3-14','360天','static/images/good/2020031419301974.png',100,2299,'手机',NULL,0,1),(76,'小米 (MI)Redmi Note 8 4+64GB 曜石黑 ','4800万全场景四摄 4000mAh长续航 高通骁龙665小金刚学生大屏游戏智能移动联通电信全网通4G手机','2020-3-14','360天','static/images/good/2020031419310375.png',100,899,'手机',NULL,0,1),(77,'vivo NEX 3S 12G+256GB','骁龙865，双模5G，无界瀑布屏，6400万像素，LPDDR5急速运存 ','2020-3-14','360天','static/images/good/2020031419320776.png',100,5298,'手机',NULL,0,1),(78,'OPPO Reno3 元气版 8GB+128GB',' 天镜白 一体化双模5G 视频双防抖 30W VOOC闪充 4800万超清四摄 全网通全面屏拍照游戏智能手机','2020-3-14','360天','static/images/good/2020031419331677.png',100,2999,'手机',NULL,0,1),(79,'小米(MI) 小米CC9e 6GB+128GB 蓝色（深蓝星球） ','全网通 移动联通电信4G手机 屏幕指纹  4800万三摄 小米CC9 e 前置3200万自拍 / 索尼4800万超广角三摄 /骁龙665处理器 ','2020-3-14','360天','static/images/good/2020031419343778.png',100,1548,'手机',NULL,0,1),(80,'OPPO K5 6G+128G 极地阳光 ','6400万超清四摄护眼水滴屏全网通4G全面屏拍照游戏智能手机\r\n','2020-3-14','360天','static/images/good/2020031419354079.png',100,1799,'手机',NULL,0,1),(81,'一加 OnePlus 7T Pro 8GB+256GB 海月蓝 全网通4G手机',' 2K+90Hz流体屏 骁龙855Plus旗舰 4800万超广角 /一加7tpro1+7t  吃鸡神器，指环支架，','2020-3-14','360天','static/images/good/2020031419363480.png',100,4399,'手机',NULL,0,1),(82,'【走进芯十代】联想(Lenovo)小新14 笔记本','电脑十代i7轻薄便携超薄本14英寸商务办公学生游戏本(i7-1065G7 8G 512GSSD MX250 2G独显)轻奢灰','2020-3-14','360天','static/images/good/2020031419391981.png',100,5799,'电脑',NULL,0,1),(83,'惠普(hp) 光影精灵5代 ','九代酷睿i7 15.6英寸创意设计笔记本电脑（ i7-9750H 512GB GTX1650 高色域 ）','2020-3-14','360天','static/images/good/2020031419401182.png',100,6699,'电脑',NULL,0,1),(84,'联想(Lenovo) 拯救者Y7000',' 2019新款 15.6英寸游戏本笔记本电脑（i5-9300H 8GB 1TB+256GB GTX1650 4G独显 黑）','2020-3-14','360天','static/images/good/2020031419405983.png',100,6099,'电脑',NULL,0,1),(85,'【苏宁易购定制款】HUAWEI/华为平板 M5 青春版 ','10.1英寸智能语音平板电脑 3GB+32GB WiFi版 香槟金在线教育推荐款，智能语音平板，动手不如动口，听音乐看电影张口即来','2020-3-14','360天','static/images/good/2020031419414484.png',100,1599,'电脑',NULL,0,1),(86,'华硕顽石(ASUS)六代FL8700FJ ','15.6英寸学生游戏本笔记本电脑(八代英特尔酷睿 i7-8565U 4G 512G MX230 银色)','2020-3-14','360天','static/images/good/2020031419422785.png',100,4990,'电脑',NULL,0,1),(87,'宏碁(acer)新蜂鸟swift3移动超能版 SF313 ','13.5英寸金属本轻薄本笔记本电脑（i5-1035G4 8G 512GB 核显 100%sRGB 指纹识别 Win10）','2020-3-14','360天','static/images/good/2020031419431886.png',100,4799,'电脑',NULL,0,1),(88,'小米（MI）RedmiBook13全面屏超轻薄本','(全新十代酷睿i5-10210U 8G 512G SSD MX250 2G独显 )笔记本电脑 手环疾速解锁 游戏 超长续航 月光银','2020-3-14','360天','static/images/good/2020031419440587.png',100,4499,'电脑',NULL,0,1),(89,'雷神(THUNDEROBOT)911MT','15.6英寸窄边框全面屏轻薄发烧游戏本设计笔记本电脑（I7-9750H 8G GTX1650 512GB高速固态）','2020-3-14','360天','static/images/good/2020031419445388.png',100,6588,'电脑',NULL,0,1),(90,'联想ThinkPad E14（3CCD）','第十代英特尔®酷睿™i5 14英寸笔记本电脑 i5-10210U 8G 128G SSD+1T 2G独显 FHD','2020-3-14','360天','static/images/good/2020031419455289.png',100,5499,'电脑',NULL,0,1),(91,'外星人Alienware area-51m ','17.3英寸游戏笔记本电脑(九代i9-9900K 128G 4TG固态+1T机械 RTX2080 8G显存 144Hz )','2020-3-14','360天','static/images/good/2020031419464390.png',100,36500,'电脑',NULL,0,1),(92,'桂格（Quaker）早餐谷物 膳食纤维 即食燕麦片 袋装1478g','好东西','2020-3-14','360天','static/images/good/202003181831042.png',100,26.9,'食品',NULL,0,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uzh` varchar(20) NOT NULL,
  `umm` varchar(80) NOT NULL,
  `uname` varchar(80) DEFAULT NULL,
  `uxm` varchar(80) DEFAULT NULL,
  `utel` varchar(20) NOT NULL,
  `usr` varchar(80) DEFAULT NULL,
  `usex` varchar(80) DEFAULT NULL,
  `utx` varchar(80) DEFAULT NULL,
  `umb` varchar(80) DEFAULT NULL,
  `uda` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uzh` (`uzh`),
  UNIQUE KEY `utel` (`utel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'161','161',NULL,NULL,'161',NULL,NULL,NULL,NULL,NULL),(2,'123','123',NULL,NULL,'123',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-29 14:43:03
