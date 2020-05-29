from flask import Flask,render_template,request,redirect,url_for,make_response,jsonify,json
from flask_sqlalchemy import SQLAlchemy
import pymysql,time,os,redis
from datetime import timedelta
from sqlalchemy import and_,or_,not_
pymysql.install_as_MySQLdb()

app = Flask(__name__)
username='root'
pwd='hjzazz'
port='3306'
dbname='shop'
app.config['SQLALCHEMY_DATABASE_URI']='mysql+pymysql://'+username+':'+pwd+'@localhost:'+port+'/'+dbname
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False
#指定执行完操纵自动提交
app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN']=True
#创建SQLAlchemy的实例
db=SQLAlchemy(app)

r=redis.Redis(host='127.0.0.1',port='6379',db=1,decode_responses=True)


class Users(db.Model):
    __tablemame__='users'
    uid=db.Column(db.Integer(),primary_key=True)                    #用户id
    uzh=db.Column(db.String(20),unique=True,nullable=False)         #用户账号
    umm=db.Column(db.String(80),nullable=False)                     #用户密码
    uname=db.Column(db.String(80))                                   #用户名
    uxm=db.Column(db.String(80))                                     # 真实姓名
    utel=db.Column(db.String(20),unique=True,nullable=False)        #用户电话
    usr=db.Column(db.String(80))                                     #用户生日
    usex=db.Column(db.String(80))                                    #用户性别
    utx=db.Column(db.String(80))                                     #用户头像
    umb=db.Column(db.String(80))                                     #密保问题
    uda=db.Column(db.String(80))                                     #密保答案
    gooddd = db.relationship('GoodDd', backref=db.backref('users'))
    def __init__(self,uzh,umm,utel,uname=None,uxm=None,usr=None,usex=None,utx=None,umb=None,uda=None):
        self.uzh=uzh
        self.umm=umm
        self.uname=uname
        self.uxm=uxm
        self.utel=utel
        self.usr=usr
        self.usex=usex
        self.utx=utx
        self.umb=umb
        self.uda=uda
    def __repr__(self):
        return '<Users:%r>' %self.uname


class Admin(db.Model):
    __tablemame__ = 'admin'
    aid = db.Column(db.Integer(), primary_key=True)                  #管理员id
    azh = db.Column(db.String(20), unique=True, nullable=False)     #管理员账号
    amm = db.Column(db.String(80), nullable=False)                  #管理员密码
    def __init__(self,azh,amm):
        self.azh=azh
        self.amm=amm
    def __repr__(self):
        return '<Admin:%r>' % self.azh

class Goods(db.Model):
    __tablemame__='goods'
    gid=db.Column(db.Integer(),primary_key=True)            #商品id
    gname=db.Column(db.String(80))                          #商品名
    gms=db.Column(db.String(80))                            #商品描述
    gri=db.Column(db.String(80))                            #商品生产日期
    gbz=db.Column(db.String(80))                            #商品保质期
    gtp=db.Column(db.String(80))                            #商品图片
    gsl=db.Column(db.Integer)                               #商品数量
    gjg=db.Column(db.Float)                                 #商品价格
    glx=db.Column(db.String(80))                            #商品类型
    gsh=db.Column(db.String(10))                            #商品是否过审核
    gxs=db.Column(db.Integer)                               #商品销售量
    gzk=db.Column(db.Float)                                 #商品折扣
    def __init__(self,gname,gms,gri,gbz,gtp,gsl,gjg,glx,gsh=None,gxs=0,gzk=1):
        self.gname=gname
        self.gms=gms
        self.gri=gri
        self.gbz=gbz
        self.gtp=gtp
        self.gsl=gsl
        self.gjg=gjg
        self.glx=glx
        self.gsh=gsh
        self.gxs=gxs
        self.gzk=gzk
    def __repr__(self):
        return '<Goods:%r>' %self.gname

class Goodlx(db.Model):
    __tablename__='goodlx'
    lid=db.Column(db.Integer(),primary_key=True)         #商品类型id
    lname=db.Column(db.String(80))                       #商品类型名
    def __init__(self,lname):
        self.lname=lname
    def __repr__(self):
        return '<Goods:%r>' % self.lname

class GoodDd(db.Model):
    __tablename__='gooddd'
    did=db.Column(db.Integer(),primary_key=True)                                #订单id
    good=db.Column(db.String(255),nullable=False)                                #商品
    uid=db.Column(db.Integer(),db.ForeignKey('users.uid'),nullable=False)      #用户id
    dxd=db.Column(db.String(80))                                                #下单时间
    djq=db.Column(db.String(80))                                                #订单金钱
    dwc=db.Column(db.String(80))                                                #订单完成时间
    ddz=db.Column(db.String(80))                                                #订单地址
    def __init__(self,good,uid,dxd,ddz,djq,dwc=None):
        self.good=good
        self.uid=uid
        self.dxd=dxd
        self.ddz=ddz
        self.djq=djq
        self.dwc=dwc
    def __repr__(self):
        return '<GoodDd:%r>' % self.cid

#db.drop_all()
db.create_all()


@app.route('/')
def hello_world():
    return 'Hello World!'

@app.errorhandler(404)
def page_notfound(e):
    return render_template('404.html'),404

@app.route('/index')
def index():
    uid=request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods1 = db.session.query(Goods).limit(10).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    sgood=db.session.query(Goods).order_by(Goods.gjg).limit(20).all()
    lis=[]
    for i in goodlx:
        x=0
        for j in goods:
            if i.lname==j.glx and x<3:
                lis.append(j)
                x+=1
    return render_template('index.html',a=locals())

@app.route('/about')
def about():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('about.html',a=locals())

@app.route('/checkout',methods=['GET','POST'])
def checkout():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    gcar = getgcar('yonghu' + str(uid), goods)
    goodsnum = [y for x, y in r.hgetall('yonghu1').items()]
    money=round(getmoney('yonghu'+uid,goods),2)
    print(money)
    l=len(gcar)
    return render_template('checkout.html',a=locals())

@app.route('/contact')
def contact():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return  render_template('contact.html',a=locals())

@app.route('/faqs')
def faqs():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('faqs.html',a=locals())

@app.route('/help')
def help():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('help.html',a=locals())

@app.route('/icons')
def icons():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('icons.html',a=locals())

@app.route('/payment')
def payment():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('payment.html',a=locals())

@app.route('/payment_test',methods=['post'])
def payment_test():
    uid = request.cookies.get('uid')
    good = r.hgetall('yonghu'+uid)
    djq = request.form.get('money')
    ddz = request.form.get('ddz')
    dxd = time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime(time.time()))
    gooddd = GoodDd(str(good),int(uid),dxd,ddz,djq)
    db.session.add(gooddd)
    r.delete('yonghu'+uid)
    return render_template('xiadan.html')

@app.route('/privacy')
def privacy():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return  render_template('privacy.html',a=locals())

@app.route('/product',methods=['POST','GET'])
def product():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    sgood = db.session.query(Goods).order_by(Goods.gjg).limit(20).all()
    if request.method=='GET':
        glx=request.args.get('glx')
        goods=db.session.query(Goods).filter(Goods.glx==glx).all()
    else:
        goodname=request.form.get('Search')
        goods=db.session.query(Goods).filter(Goods.gname.like('%'+ goodname +'%')).all()
    return render_template('product.html', a=locals())


@app.route('/single')
def single():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    gid = request.args.get('gid')
    good = db.session.query(Goods).filter(Goods.gid == gid).first()
    good1 = db.session.query(Goods).filter(Goods.glx == good.glx).limit(3).all()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('single.html',a=locals())

@app.route('/terms')
def terms():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return  render_template('terms.html',a=locals())

@app.route('/typography')
def typography():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    goodlx = db.session.query(Goodlx).all()
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    return render_template('typography.html',a=locals())

@app.route('/login')
def login():
    uzh = request.args.get('uzh')
    user = db.session.query(Users).filter(Users.uzh == uzh).first()
    path = str(request.referrer)
    path=path.replace('http://127.0.0.1:5000/', '')
    rep=make_response(redirect(url_for(path)))
    rep.set_cookie('uid',str(user.uid))
    return rep


@app.route('/login_yz',methods=['GET','POST'])
def login_yz():
    zh=request.form.get('uzh')
    mm=request.form.get('umm')
    user=db.session.query(Users).filter(Users.uzh==zh).first()
    if user==None:
        yz='no1'
        return jsonify(yz)
    elif user.umm==mm:
        yz='yes'
        rep = make_response(jsonify(yz))
        rep.set_cookie('uid', str(user.uid))
        return rep
    else:
        yz='no'
        return jsonify(yz)



@app.route('/sign_yz',methods=['GET','POST'])
def sign_yz():
    uzh=request.form.get('uzh')
    umm = request.form.get('umm')
    umm2=request.form.get('umm2')
    utel = request.form.get('utel')
    user1=db.session.query(Users).filter(Users.uzh==uzh).first()
    user2=db.session.query(Users).filter(Users.utel==utel).first()
    if user1!=None:
        yz='no1'
    elif user2!=None:
        yz='no2'
    elif umm!=umm2:
        yz='no3'
    else:
        yz='yes'
        user = Users(uzh, umm, utel)
        db.session.add(user)
    return jsonify(yz)

@app.route('/addtocar',methods=['GET','POST'])
def addtocar():
    if request.method=='POST':
        uid=request.cookies.get('uid')
        if uid==None:
             yz='no'
        else:
            yh='yonghu'+str(uid)
            gid=request.form.get('gid')
            if r.hget(yh,gid):
                yz='no1'
                return jsonify(yz)
            else:
                r.hset(yh,gid,1)
            print(r.hgetall(yh))
            yz='yes'
        return jsonify(yz)

@app.route('/gxcar',methods=['post'])
def gxcar():
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    uid = 'yonghu' + str(request.cookies.get('uid'))
    gid = request.form.get('gid')
    num = request.form.get('num')
    r.hset(uid,gid,num)
    money=round(getmoney(uid,goods),3)
    return jsonify(money)

@app.route('/delfcar',methods=['POST'])
def delfcal():
    goods = db.session.query(Goods).order_by(Goods.gxs).all()
    uid='yonghu'+str(request.cookies.get('uid'))
    gid=request.form.get('id')
    r.hdel(uid,gid)
    money=getmoney(uid,goods)
    return jsonify(money)

@app.route('/zhuxiao',methods=['POST','GET'])
def zhuxiao():
    yz='yes'
    rep=make_response(jsonify(yz))
    rep.delete_cookie('uid')
    return rep

@app.route('/grxx')
def grxx():
    uid=request.cookies.get('uid')
    user=db.session.query(Users).filter(Users.uid==uid).first()
    return render_template('grxx.html',a=locals())

@app.route('/gxxx',methods=['POST','GET'])
def gxxx():
    uid = request.cookies.get('uid')
    user = db.session.query(Users).filter(Users.uid == uid).first()
    user.uname=request.form.get('uname')
    user.uxm=request.form.get('uxm')
    user.utel=request.form.get('utel')
    user.usex=request.form.get('usex')
    user.usr=request.form.get('usr')
    user.umb=request.form.get('umb')
    user.uda=request.form.get('uda')
    file = request.files.get('utx')
    if file!=None:
        os.remove(user.utx)
        fname = file.filename
        nowtime = time.strftime('%Y%m%d%H%M%S', time.localtime(time.time()))
        fname = 'static/images/user/' + str(nowtime) + fname
        file.save(fname)
        user.utx=fname
    db.session.add(user)
    return redirect('/grxx')

@app.route('/houtai/index')
def htindex():
    aid=request.cookies.get('aid')
    if aid==None:
        return '你还未登录管理员请先<a href="/houtai/login">登录</a> '
    else:
        admin=db.session.query(Admin).filter(Admin.aid==aid).first()
        gooddds = db.session.query(GoodDd).all()
        return render_template('houtai/index.html',a=locals())

@app.route('/houtai/accounts')
def htaccounts():
    aid=request.cookies.get('aid')
    if aid==None:
        return '你还未登录管理员请先<a href="/houtai/login">登录</a> '
    else:
        admin=db.session.query(Admin).filter(Admin.aid==aid).first()
        return render_template('houtai/accounts.html',a=locals())

@app.route('/houtai/add_product',methods=['POST','GET'])
def htadd_product():
    if request.method=='GET':
        aid=request.cookies.get('aid')
        if aid==None:
            return '你还未登录管理员请先<a href="/houtai/login">登录</a> '
        else:
            admin=db.session.query(Admin).filter(Admin.aid==aid).first()
            goodlx=db.session.query(Goodlx).all()
            return render_template('houtai/add-product.html',a=locals())
    elif request.method=='POST':
        gname = request.form.get('gname')
        gms = request.form.get('gms')
        glx = request.form.get('glx')
        gjg = round(float(request.form.get('gjg')),2)
        gsl = int(request.form.get('gsl'))
        gri = request.form.get('gri')
        gbz = request.form.get('gbz')
        gtp = request.files.get('uploadfile')
        if gtp!=None:
            fname = gtp.filename
            nowtime = time.strftime('%Y%m%d%H%M%S', time.localtime(time.time()))
            fname = 'static/images/good/' + str(nowtime) + fname
            gtp.save(fname)
            gtpurl = fname
        else:gtpurl='null'
        good=Goods(gname,gms,gri,gbz,gtpurl,gsl,gjg,glx)
        db.session.add(good)
        return '添加商品完成，请<a href="/houtai/add_product">继续添加</a> '

@app.route('/houtai/edit_product',methods=['POST','GET'])
def htedit_product():
    if request.method=='GET':
        aid=request.cookies.get('aid')
        if aid==None:
            return '你还未登录管理员请先<a href="/houtai/login">登录</a> '
        else:
            admin=db.session.query(Admin).filter(Admin.aid==aid).first()
            goodlx = db.session.query(Goodlx).all()
            gid=request.args.get('gid')
            good=db.session.query(Goods).filter(Goods.gid==gid).first()
            return render_template('houtai/edit-product.html',a=locals())
    elif request.method=='POST':
        gid = request.form.get('gid')
        good=db.session.query(Goods).filter(Goods.gid==gid).first()
        good.gname = request.form.get('gname')
        good.gms = request.form.get('gms')
        good.glx = request.form.get('glx')
        good.gjg = round(float(request.form.get('gjg')), 2)
        good.gsl = int(request.form.get('gsl'))
        good.gri = request.form.get('gri')
        good.gbz = request.form.get('gbz')
        gtp = request.files.get('uploadfile')
        if gtp != None:
            os.remove(good.gtp)
            fname = gtp.filename
            nowtime = time.strftime('%Y%m%d%H%M%S', time.localtime(time.time()))
            fname = 'static/images/good/' + str(nowtime) + fname
            gtp.save(fname)
            gtpurl = fname
        else:
            gtpurl = 'null'
        good.gtp=gtpurl
        db.session.add(good)
        return '更新商品完成，请<a href="/houtai/products">继续选择商品更新</a> '

@app.route('/houtai/login')
def htlogin():
    aid=request.cookies.get('aid')
    admin=db.session.query(Admin).filter(Admin.aid==aid).first()
    return render_template('houtai/login.html',a=locals())


@app.route('/houtai/zx')
def htzhuxiao():
    aid = request.cookies.get('aid')
    admin = db.session.query(Admin).filter(Admin.aid == aid).first()
    rep=make_response(redirect(url_for('htlogin')))
    rep.delete_cookie('aid')
    return rep


@app.route('/houtai/login_yz',methods=['POST','GET'])
def htlogin_yz():
    azh=request.form.get('azh')
    amm=request.form.get('amm')
    admin=db.session.query(Admin).filter(Admin.azh==azh).first()
    if admin==None:
        yz='no1'
        return jsonify(yz)
    elif admin.amm!=amm:
        yz='no2'
        return jsonify(yz)
    else:
        yz='yes'
        admin = db.session.query(Admin).filter(Admin.azh == azh).first()
        rep = make_response(jsonify(yz))
        rep.set_cookie('aid', str(admin.aid))
        return rep


@app.route('/houtai/products')
def htproducts():
    aid=request.cookies.get('aid')
    if aid==None:
        return '你还未登录管理员请先<a href="/houtai/login">登录</a> '
    else:
        admin=db.session.query(Admin).filter(Admin.aid==aid).first()
        goods=db.session.query(Goods).all()
        goodlx=db.session.query(Goodlx).all()
        return render_template('houtai/products.html',a=locals())

@app.route('/houtai/scgood')
def htscgood():
    gid=request.args.get('gid')
    good=db.session.query(Goods).filter(Goods.gid==gid).first()
    db.session.delete(good)
    return redirect(url_for('htproducts'))

# @app.route('/am')
# def am():
#     admin=Admin('hj','zazz')
#     db.session.add(admin)
#     return 'ok'
#
# @app.route('/lx')
# def lx():
#     lx=['食品','饰品','家具','清洁剂','书本','厨房用具','调味品','沐浴品','打扫用具','家用电器','手机','电脑',]
#     for i in lx:
#         goodlx=Goodlx(i)
#         db.session.add(goodlx)
#     return 'ok'


@app.route('/test')
def test():
    gooddds = db.session.query(GoodDd).all()
    for goodd in gooddds:
        dic=dict(goodd.good)
        print(dic)

    return 'ok'

@app.route('/def')
def getgcar(yh,goods):
    gcar=[]
    rgid=r.hkeys(yh)
    for j in rgid:
        for i in goods:
            if i.gid==int(j):
                gcar.append(i)
    return gcar

def getmoney(yh,goods):
    money=0
    rgid = r.hgetall(yh)
    for x,y in rgid.items():
        for i in goods:
            if i.gid == int(x):
                money+=i.gjg*int(y)
    return money

if __name__ == '__main__':
    app.run(debug=True)
