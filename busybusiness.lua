--kalas#1330

return (function()local nolIIIIlIl = "real";local nolIIIIlIl = "real";local nolIIIIlIl = "real";local nolIIllllI=47;local nolIIlllIl=298;local nolIIlllII=3;local nolIIlIllI=function(a)local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';a=string.gsub(a,'[^'..b..'=]','')return a:gsub('.',function(c)if c=='='then return''end;local d,e='',b:find(c)-1;for f=6,1,-1 do d=d..(e%2^f-e%2^(f-1)>0 and'1'or'0')end;return d end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(c)if#c~=8 then return''end;local g=0;for f=1,8 do g=g+(c:sub(f,f)=='1'and 2^(8-f)or 0)end;return string.char(g)end)end;local nolIIlllIl=45;local nolIIlIlIl=(function()local function a(b)local c={}for d=0,255 do c[d]={}end;c[0][0]=b[1]*255;local e=1;for f=0,7 do for d=0,e-1 do for g=0,e-1 do local h=c[d][g]-b[1]*e;c[d][g+e]=h+b[2]*e;c[d+e][g]=h+b[3]*e;c[d+e][g+e]=h+b[4]*e end end;e=e*2 end;return c end;local i=a{0,1,1,0}local function j(self,k)local l,d,g=self.S,self.i,self.j;local m={}local n=string.char;for o=1,k do d=(d+1)%256;g=(g+l[d])%256;l[d],l[g]=l[g],l[d]m[o]=n(l[(l[d]+l[g])%256])end;self.i,self.j=d,g;return table.concat(m)end;local function p(self,q)local r=j(self,#q)local s={}local t=string.byte;local n=string.char;for d=1,#q do s[d]=n(i[t(q,d)][t(r,d)])end;return table.concat(s)end;local function u(self,v)local l=self.S;local g,w=0,#v;local t=string.byte;for d=0,255 do g=(g+l[d]+t(v,d%w+1))%256;l[d],l[g]=l[g],l[d]end end;function new(v)local l={}local s={S=l,i=0,j=0,generate=j,cipher=p,schedule=u}for d=0,255 do l[d]=d end;if v then s:schedule(v)end;return s end;return new end)();local fev=getfenv or function()return _ENV end;local nolIIlIlII=(function()if not bit then local bit_=nil pcall(function()bit_=require('bit') end)bit=bit_ end local bit=bit or bit32 or(function()local a={_TYPE='module',_NAME='bit.numberlua',_VERSION='0.3.1.20120131'}local b=math.floor;local c=2^32;local d=c-1;local function e(f)local g={}local h=setmetatable({},g)function g:__index(i)local j=f(i)h[i]=j;return j end;return h end;local function k(h,l)local function m(n,o)local p,q=0,1;while n~=0 and o~=0 do local r,s=n%l,o%l;p=p+h[r][s]*q;n=(n-r)/l;o=(o-s)/l;q=q*l end;p=p+(n+o)*q;return p end;return m end;local function t(h)local u=k(h,2^1)local v=e(function(n)return e(function(o)return u(n,o)end)end)return k(v,2^(h.n or 1))end;function a.tobit(w)return w%2^32 end;a.bxor=t{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local x=a.bxor;function a.bnot(n)return d-n end;local y=a.bnot;function a.band(n,o)return(n+o-x(n,o))/2 end;local z=a.band;function a.bor(n,o)return d-z(d-n,d-o)end;local A=a.bor;local B,C;function a.rshift(n,D)if D<0 then return B(n,-D)end;return b(n%2^32/2^D)end;C=a.rshift;function a.lshift(n,D)if D<0 then return C(n,-D)end;return n*2^D%2^32 end;B=a.lshift;function a.tohex(w,E)E=E or 8;local F;if E<=0 then if E==0 then return''end;F=true;E=-E end;w=z(w,16^E-1)return('%0'..E..(F and'X'or'x')):format(w)end;local G=a.tohex;function a.extract(E,H,I)I=I or 1;return z(C(E,H),2^I-1)end;local J=a.extract;function a.replace(E,j,H,I)I=I or 1;local K=2^I-1;j=z(j,K)local L=y(B(K,H))return z(E,L)+B(j,H)end;local M=a.replace;function a.bswap(w)local n=z(w,0xff)w=C(w,8)local o=z(w,0xff)w=C(w,8)local N=z(w,0xff)w=C(w,8)local O=z(w,0xff)return B(B(B(n,8)+o,8)+N,8)+O end;local P=a.bswap;function a.rrotate(w,D)D=D%32;local Q=z(w,2^D-1)return C(w,D)+B(Q,32-D)end;local R=a.rrotate;function a.lrotate(w,D)return R(w,-D)end;local S=a.lrotate;a.rol=a.lrotate;a.ror=a.rrotate;function a.arshift(w,D)local T=C(w,D)if w>=0x80000000 then T=T+B(2^D-1,32-D)end;return T end;local U=a.arshift;function a.btest(w,V)return z(w,V)~=0 end;a.bit32={}local function W(w)return(-1-w)%c end;a.bit32.bnot=W;local function X(n,o,N,...)local T;if o then n=n%c;o=o%c;T=x(n,o)if N then T=X(T,N,...)end;return T elseif n then return n%c else return 0 end end;a.bit32.bxor=X;local function Y(n,o,N,...)local T;if o then n=n%c;o=o%c;T=(n+o-x(n,o))/2;if N then T=Y(T,N,...)end;return T elseif n then return n%c else return d end end;a.bit32.band=Y;local function Z(n,o,N,...)local T;if o then n=n%c;o=o%c;T=d-z(d-n,d-o)if N then T=Z(T,N,...)end;return T elseif n then return n%c else return 0 end end;a.bit32.bor=Z;function a.bit32.btest(...)return Y(...)~=0 end;function a.bit32.lrotate(w,D)return S(w%c,D)end;function a.bit32.rrotate(w,D)return R(w%c,D)end;function a.bit32.lshift(w,D)if D>31 or D<-31 then return 0 end;return B(w%c,D)end;function a.bit32.rshift(w,D)if D>31 or D<-31 then return 0 end;return C(w%c,D)end;function a.bit32.arshift(w,D)w=w%c;if D>=0 then if D>31 then return w>=0x80000000 and d or 0 else local T=C(w,D)if w>=0x80000000 then T=T+B(2^D-1,32-D)end;return T end else return B(w,-D)end end;function a.bit32.extract(w,H,...)local I=...or 1;if H<0 or H>31 or I<0 or H+I>32 then error'out of range'end;w=w%c;return J(w,H,...)end;function a.bit32.replace(w,j,H,...)local I=...or 1;if H<0 or H>31 or I<0 or H+I>32 then error'out of range'end;w=w%c;j=j%c;return M(w,j,H,...)end;a.bit={}function a.bit.tobit(w)w=w%c;if w>=0x80000000 then w=w-c end;return w end;local _=a.bit.tobit;function a.bit.tohex(w,...)return G(w%c,...)end;function a.bit.bnot(w)return _(y(w%c))end;local function a0(n,o,N,...)if N then return a0(a0(n,o),N,...)elseif o then return _(A(n%c,o%c))else return _(n)end end;a.bit.bor=a0;local function a1(n,o,N,...)if N then return a1(a1(n,o),N,...)elseif o then return _(z(n%c,o%c))else return _(n)end end;a.bit.band=a1;local function a2(n,o,N,...)if N then return a2(a2(n,o),N,...)elseif o then return _(x(n%c,o%c))else return _(n)end end;a.bit.bxor=a2;function a.bit.lshift(w,E)return _(B(w%c,E%32))end;function a.bit.rshift(w,E)return _(C(w%c,E%32))end;function a.bit.arshift(w,E)return _(U(w%c,E%32))end;function a.bit.rol(w,E)return _(S(w%c,E%32))end;function a.bit.ror(w,E)return _(R(w%c,E%32))end;function a.bit.bswap(w)return _(P(w%c))end;return a end)()local unpack=table.unpack or unpack;local a3;local a4;local a5;local a6=50;local a7={[22]=18,[31]=8,[33]=28,[0]=3,[1]=13,[2]=23,[26]=33,[12]=1,[13]=6,[14]=10,[15]=16,[16]=20,[17]=26,[18]=30,[19]=36,[3]=0,[4]=2,[5]=4,[6]=7,[7]=9,[8]=12,[9]=14,[10]=17,[20]=19,[21]=22,[23]=24,[24]=27,[25]=29,[27]=32,[32]=34,[34]=37,[11]=5,[28]=11,[29]=15,[30]=21,[35]=25,[36]=31,[37]=35}local a8={[0]='ABC','ABx','ABC','ABC','ABC','ABx','ABC','ABx','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','AsBx','ABC','ABC','ABC','ABC','ABC','ABC','ABC','ABC','AsBx','AsBx','ABC','ABC','ABC','ABx','ABC'}local a9={[0]={b='OpArgR',c='OpArgN'},{b='OpArgK',c='OpArgN'},{b='OpArgU',c='OpArgU'},{b='OpArgR',c='OpArgN'},{b='OpArgU',c='OpArgN'},{b='OpArgK',c='OpArgN'},{b='OpArgR',c='OpArgK'},{b='OpArgK',c='OpArgN'},{b='OpArgU',c='OpArgN'},{b='OpArgK',c='OpArgK'},{b='OpArgU',c='OpArgU'},{b='OpArgR',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgR'},{b='OpArgR',c='OpArgN'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgK',c='OpArgK'},{b='OpArgR',c='OpArgU'},{b='OpArgR',c='OpArgU'},{b='OpArgU',c='OpArgU'},{b='OpArgU',c='OpArgU'},{b='OpArgU',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgR',c='OpArgN'},{b='OpArgN',c='OpArgU'},{b='OpArgU',c='OpArgU'},{b='OpArgN',c='OpArgN'},{b='OpArgU',c='OpArgN'},{b='OpArgU',c='OpArgN'}}local function aa(ab,s,e,d)local ac=0;for i=s,e,d do ac=ac+string.byte(ab,i,i)*256^(i-s)end;return ac end;local function ad(ae,af,ag,ah)local ai=(-1)^bit.rshift(ah,7)local aj=bit.rshift(ag,7)+bit.lshift(bit.band(ah,0x7F),1)local ak=ae+bit.lshift(af,8)+bit.lshift(bit.band(ag,0x7F),16)local al=1;if aj==0 then if ak==0 then return ai*0 else al=0;aj=1 end elseif aj==0x7F then if ak==0 then return ai*1/0 else return ai*0/0 end end;return ai*2^(aj-127)*(1+al/2^23)end;local function am(ae,af,ag,ah,an,ao,ap,aq)local ai=(-1)^bit.rshift(aq,7)local aj=bit.lshift(bit.band(aq,0x7F),4)+bit.rshift(ap,4)local ak=bit.band(ap,0x0F)*2^48;local al=1;ak=ak+ao*2^40+an*2^32+ah*2^24+ag*2^16+af*2^8+ae;if aj==0 then if ak==0 then return ai*0 else al=0;aj=1 end elseif aj==0x7FF then if ak==0 then return ai*1/0 else return ai*0/0 end end;return ai*2^(aj-1023)*(al+ak/2^52)end;local function ar(ab,s,e)return aa(ab,s,e-1,1)end;local function as(ab,s,e)return aa(ab,e-1,s,-1)end;local function at(ab,s)return ad(string.byte(ab,s,s+3))end;local function au(ab,s)local ae,af,ag,ah=string.byte(ab,s,s+3)return ad(ah,ag,af,ae)end;local function av(ab,s)return am(string.byte(ab,s,s+7))end;local function aw(ab,s)local ae,af,ag,ah,an,ao,ap,aq=string.byte(ab,s,s+7)return am(aq,ap,ao,an,ah,ag,af,ae)end;local ax={[4]={little=at,big=au},[8]={little=av,big=aw}}local function ay(S)local az=S.index;local aA=string.byte(S.source,az,az)S.index=az+1;return aA end;local function aB(S,aC)local aD=S.index+aC;local aE=string.sub(S.source,S.index,aD-1)S.index=aD;return aE end;local function aF(S)local aC=S:s_szt()local aE;if aC~=0 then aE=string.sub(aB(S,aC),1,-2)end;return aE end;local function aG(aC,aH)return function(S)local aD=S.index+aC;local aI=aH(S.source,S.index,aD)S.index=aD;return aI end end;local function aJ(aC,aH)return function(S)local aK=aH(S.source,S.index)S.index=S.index+aC;return aK end end;local function aL(S)local aM=S:s_int()local aN={}for i=1,aM do local aO=S:s_ins()local aP=bit.band(aO,0x3F)local aQ=a8[aP]local aR=a9[aP]local aS={value=aO,op=a7[aP],A=bit.band(bit.rshift(aO,6),0xFF)}if aQ=='ABC'then aS.B=bit.band(bit.rshift(aO,23),0x1FF)aS.C=bit.band(bit.rshift(aO,14),0x1FF)aS.is_KB=aR.b=='OpArgK'and aS.B>0xFF;aS.is_KC=aR.c=='OpArgK'and aS.C>0xFF elseif aQ=='ABx'then aS.Bx=bit.band(bit.rshift(aO,14),0x3FFFF)aS.is_K=aR.b=='OpArgK'elseif aQ=='AsBx'then aS.sBx=bit.band(bit.rshift(aO,14),0x3FFFF)-131071 end;aN[i]=aS end;return aN end;local function aT(S)local aM=S:s_int()local aU={}for i=1,aM do local aV=ay(S)local k;if aV==1 then k=ay(S)~=0 elseif aV==3 then k=S:s_num()elseif aV==4 then k=aF(S)end;aU[i]=k end;return aU end;local function aW(S,ab)local aM=S:s_int()local aX={}for i=1,aM do aX[i]=a5(S,ab)end;return aX end;local function aY(S)local aM=S:s_int()local aZ={}for i=1,aM do aZ[i]=S:s_int()end;return aZ end;local function a_(S)local aM=S:s_int()local b0={}for i=1,aM do b0[i]={varname=aF(S),startpc=S:s_int(),endpc=S:s_int()}end;return b0 end;local function b1(S)local aM=S:s_int()local b2={}for i=1,aM do b2[i]=aF(S)end;return b2 end;function a5(S,b3)local b4={}local ab=aF(S)or b3;b4.source=ab;S:s_int()S:s_int()b4.numupvals=ay(S)b4.numparams=ay(S)ay(S)ay(S)b4.code=aL(S)b4.const=aT(S)b4.subs=aW(S,ab)b4.lines=aY(S)a_(S)b1(S)for _,v in ipairs(b4.code)do if v.is_K then v.const=b4.const[v.Bx+1]else if v.is_KB then v.const_B=b4.const[v.B-0xFF]end;if v.is_KC then v.const_C=b4.const[v.C-0xFF]end end end;return b4 end;function a3(ab)local b5;local b6;local b7;local b8;local b9;local ba;local bb;local bc={index=1,source=ab}assert(aB(bc,4)=='\27Lua','invalid Lua signature')assert(ay(bc)==0x51,'invalid Lua version')assert(ay(bc)==0,'invalid Lua format')b6=ay(bc)~=0;b7=ay(bc)b8=ay(bc)b9=ay(bc)ba=ay(bc)bb=ay(bc)~=0;b5=b6 and ar or as;bc.s_int=aG(b7,b5)bc.s_szt=aG(b8,b5)bc.s_ins=aG(b9,b5)if bb then bc.s_num=aG(ba,b5)elseif ax[ba]then bc.s_num=aJ(ba,ax[ba][b6 and'little'or'big'])else error('unsupported float size')end;return a5(bc,'@virtual')end;local function bd(be,bf)for i,bg in pairs(be)do if bg.index>=bf then bg.value=bg.store[bg.index]bg.store=bg;bg.index='value'be[i]=nil end end end;local function bh(be,bf,bi)local bj=be[bf]if not bj then bj={index=bf,store=bi}be[bf]=bj end;return bj end;local function bk(...)return select('#',...),{...}end;local function bl(bm,bn)local ab=bm.source;local bo=bm.lines[bm.pc-1]local b3,bp,bq=string.match(bn,'^(.-):(%d+):%s+(.+)')local br='%s:%i: [%s:%i] %s'bo=bo or'0'b3=b3 or'?'bp=bp or'0'bq=bq or bn;error(string.format(br,ab,bo,b3,bp,bq),0)end;local function bs(bm)local aN=bm.code;local bt=bm.subs;local bu=bm.env;local bv=bm.upvals;local bw=bm.varargs;local bx=-1;local by={}local bi=bm.stack;local bz=bm.pc;while true do local bA=aN[bz]local aP=bA.op;bz=bz+1;if aP<18 then if aP<8 then if aP<3 then if aP<1 then for i=bA.A,bA.B do bi[i]=nil end elseif aP>1 then local bg=bv[bA.B]bi[bA.A]=bg.store[bg.index]else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;bi[bA.A]=bB+bC end elseif aP>3 then if aP<6 then if aP>4 then local A=bA.A;local B=bA.B;local bf;if bA.is_KC then bf=bA.const_C else bf=bi[bA.C]end;bi[A+1]=bi[B]bi[A]=bi[B][bf]else bi[bA.A]=bu[bA.const]end elseif aP>6 then local bf;if bA.is_KC then bf=bA.const_C else bf=bi[bA.C]end;bi[bA.A]=bi[bA.B][bf]else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;bi[bA.A]=bB-bC end else bi[bA.A]=bi[bA.B]end elseif aP>8 then if aP<13 then if aP<10 then bu[bA.const]=bi[bA.A]elseif aP>10 then if aP<12 then local A=bA.A;local B=bA.B;local C=bA.C;local bD;local bE,bF;if B==0 then bD=bx-A else bD=B-1 end;bE,bF=bk(bi[A](unpack(bi,A+1,A+bD)))if C==0 then bx=A+bE-1 else bE=C-1 end;for i=1,bE do bi[A+i-1]=bF[i]end else local bg=bv[bA.B]bg.store[bg.index]=bi[bA.A]end else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;bi[bA.A]=bB*bC end elseif aP>13 then if aP<16 then if aP>14 then local A=bA.A;local B=bA.B;local bD;if B==0 then bD=bx-A else bD=B-1 end;bd(by,0)return bk(bi[A](unpack(bi,A+1,A+bD)))else local bf,bG;if bA.is_KB then bf=bA.const_B else bf=bi[bA.B]end;if bA.is_KC then bG=bA.const_C else bG=bi[bA.C]end;bi[bA.A][bf]=bG end elseif aP>16 then bi[bA.A]={}else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;bi[bA.A]=bB/bC end else bi[bA.A]=bA.const end else local A=bA.A;local bH=bi[A+2]local bf=bi[A]+bH;local bI=bi[A+1]local bJ;if bH==math.abs(bH)then bJ=bf<=bI else bJ=bf>=bI end;if bJ then bi[bA.A]=bf;bi[bA.A+3]=bf;bz=bz+bA.sBx end end elseif aP>18 then if aP<28 then if aP<23 then if aP<20 then bi[bA.A]=#bi[bA.B]elseif aP>20 then if aP<22 then local A=bA.A;local B=bA.B;local bK={}local aM;if B==0 then aM=bx-A+1 else aM=B-1 end;for i=1,aM do bK[i]=bi[A+i-1]end;bd(by,0)return aM,bK else local aE=bi[bA.B]for i=bA.B+1,bA.C do aE=aE..bi[i]end;bi[bA.A]=aE end else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;bi[bA.A]=bB%bC end elseif aP>23 then if aP<26 then if aP>24 then bd(by,bA.A)else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;if bB==bC==(bA.A~=0)then bz=bz+aN[bz].sBx end;bz=bz+1 end elseif aP>26 then local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;if bB<bC==(bA.A~=0)then bz=bz+aN[bz].sBx end;bz=bz+1 else local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;bi[bA.A]=bB^bC end else bi[bA.A]=bA.B~=0;if bA.C~=0 then bz=bz+1 end end elseif aP>28 then if aP<33 then if aP<30 then local bB,bC;if bA.is_KB then bB=bA.const_B else bB=bi[bA.B]end;if bA.is_KC then bC=bA.const_C else bC=bi[bA.C]end;if bB<=bC==(bA.A~=0)then bz=bz+aN[bz].sBx end;bz=bz+1 elseif aP>30 then if aP<32 then local aX=bt[bA.Bx+1]local bL=aX.numupvals;local bM;if bL~=0 then bM={}for i=1,bL do local bN=aN[bz+i-1]if bN.op==a7[0]then bM[i-1]=bh(by,bN.B,bi)elseif bN.op==a7[4]then bM[i-1]=bv[bN.B]end end;bz=bz+bL end;bi[bA.A]=a4(aX,bu,bM)else local A=bA.A;local B=bA.B;if not bi[B]==(bA.C~=0)then bz=bz+1 else bi[A]=bi[B]end end else bi[bA.A]=-bi[bA.B]end elseif aP>33 then if aP<36 then if aP>34 then local A=bA.A;local aM=bA.B;if aM==0 then aM=bw.size;bx=A+aM-1 end;for i=1,aM do bi[A+i-1]=bw.list[i]end else local A=bA.A;local bO,bI,bH;bO=assert(tonumber(bi[A]),'`for` initial value must be a number')bI=assert(tonumber(bi[A+1]),'`for` limit must be a number')bH=assert(tonumber(bi[A+2]),'`for` step must be a number')bi[A]=bO-bH;bi[A+1]=bI;bi[A+2]=bH;bz=bz+bA.sBx end elseif aP>36 then local A=bA.A;local C=bA.C;local aM=bA.B;local bP=bi[A]local bQ;if aM==0 then aM=bx-A end;if C==0 then C=bA[bz].value;bz=bz+1 end;bQ=(C-1)*a6;for i=1,aM do bP[i+bQ]=bi[A+i]end else bi[bA.A]=not bi[bA.B]end else if not bi[bA.A]==(bA.C~=0)then bz=bz+1 end end else local A=bA.A;local aH=bi[A]local bR=bi[A+1]local bf=bi[A+2]local bS=A+3;local bK;bi[bS+2]=bf;bi[bS+1]=bR;bi[bS]=aH;bK={aH(bR,bf)}for i=1,bA.C do bi[bS+i-1]=bK[i]end;if bi[bS]~=nil then bi[A+2]=bi[bS]else bz=bz+1 end end else bz=bz+bA.sBx end;bm.pc=bz end end;function a4(bR,bu,b2)local bT=bR.code;local bU=bR.subs;local bV=bR.lines;local bW=bR.source;local bX=bR.numparams;local function bY(...)local bi={}local bZ={}local b_=0;local c0,c1=bk(...)local bm;local c2,bn,bK;for i=1,bX do bi[i-1]=c1[i]end;if bX<c0 then b_=c0-bX;for i=1,b_ do bZ[i]=c1[bX+i]end end;bm={varargs={list=bZ,size=b_},code=bT,subs=bU,lines=bV,source=bW,env=bu,upvals=b2,stack=bi,pc=1}c2,bn,bK=pcall(bs,bm,...)if c2 then return unpack(bK,1,bn)else bl(bm,bn)end;return end;return bY end;return function(c3,bu)return a4(a3(c3),bu or fev(0))end end)();local nolIIllIll='\101\108\73\57\77\88\78\110\76\49\115\108\85\81\61\61';local nolIIlIIIl="\109\89\71\113\67\83\80\55\78\81\105\87\89\66\90\56\116\72\65\56\89\102\100\51\74\71\113\79\85\51\57\111\82\70\49\103\43\88\88\54\103\107\54\49\65\80\97\83\110\77\73\115\103\107\97\80\117\107\81\49\88\86\105\77\48\105\101\55\72\71\98\48\112\105\66\68\68\112\74\67\73\84\89\83\49\55\121\98\70\114\82\79\65\102\110\47\73\66\43\82\82\65\112\121\99\122\100\77\69\74\117\70\103\80\109\47\68\83\74\105\115\104\57\65\69\86\88\90\106\43\81\72\106\53\118\90\104\103\79\108\66\101\103\49\83\76\55\86\122\84\70\70\113\121\111\67\79\82\112\99\84\78\86\78\104\82\104\80\104\108\77\113\48\122\115\99\83\78\105\83\85\80\47\88\121\66\115\50\52\75\87\78\56\47\104\98\109\110\66\77\75\71\80\81\111\52\67\76\68\51\82\110\111\73\119\50\114\112\76\70\57\113\108\106\87\88\109\89\66\72\74\68\99\110\106\102\74\52\72\102\97\50\65\53\119\81\80\89\56\101\120\54\51\49\89\102\90\118\86\90\68\79\88\52\69\106\81\69\86\67\102\84\43\105\109\79\56\75\88\112\121\65\49\73\113\75\106\117\117\99\117\87\51\70\90\119\97\103\84\78\111\113\79\48\71\76\118\105\49\72\72\101\52\72\77\79\89\71\84\121\43\55\82\65\121\65\51\79\88\70\66\57\68\65\73\97\76\82\119\55\122\88\89\103\50\65\115\47\86\82\75\117\75\99\77\72\106\50\101\117\101\69\75\107\69\52\54\69\104\120\88\115\69\52\118\106\99\67\116\106\82\86\72\87\53\89\86\118\54\111\70\88\74\78\110\49\76\83\122\101\119\121\120\54\65\68\81\90\75\75\73\110\75\110\97\77\113\121\120\102\88\57\119\97\89\85\47\71\105\85\49\114\89\80\67\119\55\103\114\67\104\65\78\102\112\76\99\71\71\53\111\114\79\67\73\83\98\86\65\100\105\118\111\86\48\51\118\72\71\113\83\118\54\110\104\89\103\50\101\98\118\66\76\102\114\115\122\110\105\54\74\75\110\81\119\82\75\97\79\43\107\82\78\47\55\98\90\86\89\68\102\112\43\67\119\69\102\48\100\47\99\43\113\110\56\75\51\85\107\119\105\117\121\66\84\116\120\70\69\85\53\120\70\52\105\107\56\48\47\117\72\114\55\49\86\121\84\109\117\74\100\111\102\51\81\66\52\66\89\101\53\100\53\82\83\53\75\112\81\56\69\89\55\113\99\117\69\51\97\47\68\83\71\99\109\85\48\85\108\99\48\105\71\79\112\89\110\101\85\54\117\107\52\69\112\121\106\53\80\77\68\111\117\108\50\121\85\97\77\114\104\118\55\109\105\110\80\111\111\88\112\49\85\120\109\121\115\121\99\69\104\88\115\82\83\90\105\76\118\48\78\102\84\54\77\56\66\54\109\118\75\90\87\76\79\84\84\87\81\90\90\52\53\51\53\68\49\117\101\116\69\87\89\69\117\57\98\52\74\74\119\110\54\105\118\119\97\105\108\104\55\117\51\72\98\65\68\74\104\108\79\65\97\67\87\86\116\120\69\56\90\74\116\121\68\72\111\51\47\43\114\49\105\114\81\90\97\69\70\53\114\110\79\68\101\112\72\99\43\53\77\122\100\119\102\65\54\54\43\84\75\106\85\43\102\86\89\83\47\65\101\49\119\84\87\65\108\85\115\48\120\122\53\116\103\115\72\108\89\120\76\48\51\84\118\56\65\105\57\65\53\98\66\109\120\74\84\119\76\54\81\88\90\84\69\77\113\67\79\121\77\110\113\117\86\116\108\87\111\67\108\108\71\85\111\122\77\79\103\56\99\121\73\108\105\113\99\116\99\111\75\90\72\104\85\97\109\83\77\120\100\68\112\84\50\114\98\81\78\65\88\90\71\117\88\57\65\53\110\98\89\83\69\74\87\75\81\116\75\54\99\78\78\85\106\110\65\72\49\100\87\99\107\80\113\65\103\120\65\117\57\107\83\111\110\121\69\98\98\88\75\89\97\98\113\98\77\83\69\120\75\89\89\51\85\118\84\72\78\99\105\68\107\89\56\101\114\99\67\87\77\110\107\84\77\111\115\83\108\83\117\100\48\52\84\115\119\48\115\101\100\72\104\81\79\108\84\104\73\57\98\119\65\110\119\82\85\99\65\81\50\54\121\54\47\43\98\50\47\107\81\67\79\119\103\52\43\116\83\66\53\55\118\89\114\110\88\47\114\78\69\100\122\111\78\66\74\51\115\70\119\76\72\112\99\49\100\73\108\65\104\115\53\88\79\53\113\109\73\85\49\75\89\65\57\65\43\85\97\75\57\82\43\119\56\53\113\74\112\104\99\101\117\73\107\80\115\116\53\84\76\109\87\101\87\85\111\86\120\47\97\52\110\110\66\54\114\72\52\84\73\105\76\81\55\103\66\84\82\51\117\87\56\48\90\74\122\66\79\43\82\115\49\55\97\75\69\49\106\52\87\111\79\82\112\74\77\104\77\101\87\72\113\90\88\69\67\49\99\101\84\113\74\51\82\43\51\79\84\70\65\114\90\104\104\110\111\76\119\80\114\102\113\114\106\100\51\87\55\81\97\109\55\54\74\86\89\50\56\105\109\89\122\84\106\52\99\117\107\110\69\79\88\114\115\98\118\47\75\121\47\116\106\107\68\53\73\116\103\81\107\76\104\57\75\69\56\73\68\101\100\101\57\120\99\83\88\69\117\67\107\120\110\68\106\70\106\70\120\74\56\116\107\78\76\84\55\54\102\104\80\98\108\67\55\70\68\82\73\66\90\83\50\66\74\111\52\77\86\84\115\112\70\47\43\117\122\71\80\72\57\89\53\51\104\55\49\99\119\77\85\110\113\50\51\118\78\122\51\74\100\56\111\68\111\78\77\122\90\118\103\105\120\98\75\80\85\82\83\98\84\52\116\90\66\102\66\47\47\53\75\97\99\115\110\113\88\115\110\72\111\75\118\90\43\71\74\117\79\55\79\52\104\86\117\119\84\113\99\108\76\83\54\47\52\106\80\105\120\54\51\82\89\111\119\102\78\49\48\100\101\105\88\103\71\49\89\86\83\77\109\79\108\122\56\73\73\101\117\114\120\85\75\118\106\67\112\77\121\115\47\89\105\107\75\121\120\85\76\104\75\55\81\81\51\65\122\76\54\43\89\83\56\72\82\100\52\54\51\70\57\72\73\75\108\110\118\80\120\49\100\102\105\98\80\114\113\53\85\110\108\116\72\66\78\77\81\49\116\80\80\118\88\99\112\108\72\81\84\48\117\65\53\82\72\89\116\73\54\97\68\56\117\52\47\47\43\49\109\48\53\50\110\53\114\70\113\117\119\72\112\88\108\78\117\108\121\67\102\55\50\106\98\117\120\67\82\78\116\85\103\56\103\119\119\47\84\78\84\78\50\120\120\105\56\67\98\54\54\114\80\106\112\51\106\99\65\85\109\81\80\113\68\80\102\109\75\83\68\122\84\114\114\79\69\76\84\101\106\110\119\106\69\118\113\117\103\53\54\43\79\80\101\81\75\53\84\79\82\50\43\79\43\49\76\70\109\66\51\117\77\116\111\105\120\110\117\43\51\109\106\78\50\106\103\47\83\55\85\57\72\56\65\97\43\81\113\50\52\81\80\116\97\69\83\83\69\73\120\112\82\84\76\98\50\114\119\47\72\43\107\97\78\81\78\114\119\49\47\80\71\88\97\48\108\118\57\117\43\84\80\67\81\111\84\78\120\104\104\43\54\53\87\77\103\106\86\74\47\100\79\121\55\106\100\114\81\49\82\53\47\88\119\82\83\107\109\122\112\98\56\79\68\116\100\87\102\90\109\50\83\88\77\101\51\69\98\107\112\50\107\113\87\115\74\104\101\84\114\52\68\105\120\107\89\77\121\113\55\57\90\122\51\114\104\50\86\111\121\78\107\88\117\69\75\111\50\78\78\103\119\78\53\120\106\51\74\56\69\53\74\68\101\81\119\77\51\71\65\82\108\108\121\100\104\115\48\104\118\89\77\99\80\116\84\69\89\88\68\122\69\120\77\73\112\97\85\121\88\108\99\55\69\108\84\53\84\84\47\76\56\55\49\78\98\100\55\76\119\47\117\56\53\74\82\49\107\50\53\99\114\65\70\106\43\111\87\121\104\49\57\108\113\110\110\43\103\69\104\120\85\82\86\74\122\115\89\110\49\52\83\86\83\49\120\78\108\120\120\108\49\107\112\113\98\65\43\73\78\87\104\105\107\85\68\83\117\118\53\107\74\116\115\72\89\75\99\88\82\47\120\90\101\54\98\115\113\102\102\113\65\67\119\99\110\49\86\114\68\83\108\73\75\89\83\51\81\121\103\103\77\103\51\103\117\77\103\101\110\67\78\48\116\48\80\52\79\71\121\113\54\115\107\79\102\103\84\52\48\114\119\73\103\69\118\89\72\117\106\100\116\100\67\55\47\71\88\79\82\65\43\98\102\85\83\102\70\71\54\71\75\118\120\112\82\57\102\90\80\119\107\53\121\111\47\105\43\108\55\86\103\100\107\80\76\67\76\55\47\72\89\85\121\118\49\98\108\121\104\81\113\121\74\102\106\55\52\73\116\103\116\101\112\47\74\118\48\74\53\118\109\105\76\72\110\76\82\49\100\115\90\115\109\76\110\47\55\107\103\111\80\87\120\106\115\65\119\114\53\72\84\74\43\50\105\99\110\122\54\81\116\54\51\47\78\55\115\70\89\99\73\120\120\104\119\102\85\90\118\78\108\116\79\76\102\79\113\98\112\110\98\84\100\122\114\109\101\118\101\114\115\109\103\107\119\81\48\116\80\71\116\102\72\119\90\55\87\87\111\111\107\51\111\54\121\105\55\71\48\101\85\122\118\89\69\67\98\70\67\65\66\86\78\57\116\103\97\110\77\43\49\121\70\116\82\101\80\110\99\56\66\122\53\102\115\100\56\57\113\83\87\110\55\71\56\119\75\117\118\119\99\117\114\75\72\121\114\100\54\73\74\111\117\53\66\82\113\70\100\102\101\121\73\111\78\120\51\87\89\114\99\78\109\86\118\71\55\83\80\103\121\113\56\47\53\83\47\66\122\54\73\109\109\47\71\73\57\100\79\48\122\56\86\72\100\121\108\77\67\117\104\105\76\83\55\50\51\85\78\82\100\122\106\76\85\50\106\82\97\119\50\56\97\50\115\83\52\118\117\74\71\121\97\78\88\119\85\77\80\69\81\67\78\70\56\75\98\82\78\55\116\118\69\100\85\100\117\116\73\75\99\100\98\86\90\108\77\82\75\68\106\89\121\78\115\70\55\84\110\116\48\99\86\90\49\101\50\122\79\49\120\100\69\75\66\110\99\118\98\100\76\86\97\89\77\111\118\118\117\78\113\78\117\97\106\65\50\104\121\52\57\120\89\97\85\51\68\67\105\90\103\65\77\116\53\107\53\115\90\115\115\77\89\54\104\116\72\86\107\66\71\112\43\78\52\103\43\79\86\54\104\57\120\55\104\112\120\108\55\74\115\109\71\74\105\68\86\80\100\109\103\49\121\49\99\71\53\89\83\112\86\70\117\48\109\105\110\66\56\104\78\117\114\107\102\49\79\75\83\112\101\103\88\51\83\97\116\65\72\75\72\113\55\105\116\115\108\122\43\81\114\113\54\76\65\79\43\97\97\89\86\66\48\83\80\51\74\52\49\56\108\118\85\65\122\71\110\83\76\115\102\90\87\121\99\109\55\77\68\109\122\48\79\47\97\113\120\116\49\49\82\88\48\66\118\84\106\82\85\103\53\67\102\56\81\76\101\104\104\97\83\99\69\110\122\47\78\117\103\66\85\121\89\68\113\99\73\80\109\111\70\47\71\66\101\43\104\65\43\75\89\43\70\119\105\77\103\71\78\116\78\121\78\86\67\110\104\120\113\56\109\48\71\50\81\114\68\120\114\104\71\86\103\86\109\107\104\113\72\122\49\83\107\72\100\69\109\97\49\82\76\67\85\54\106\55\79\69\86\87\70\52\90\81\69\79\113\69\113\51\47\67\100\50\119\105\121\114\97\68\84\89\104\108\48\47\68\97\76\70\90\51\98\78\67\48\98\85\66\57\89\72\102\83\120\54\65\84\47\89\108\119\119\57\50\54\106\98\69\117\84\56\55\83\98\97\97\52\73\73\89\112\97\121\49\57\76\80\114\122\47\81\78\69\89\105\110\53\104\118\109\70\71\89\49\68\51\80\68\47\73\109\76\74\47\53\100\85\97\106\49\52\49\79\122\81\55\77\81\108\108\47\119\122\66\104\99\51\74\115\118\103\78\88\98\106\48\76\120\118\72\49\107\89\79\88\83\119\102\72\100\48\67\82\69\70\65\72\75\57\84\106\77\101\106\70\88\90\119\84\86\89\53\102\77\83\98\98\121\57\76\102\67\68\76\115\56\86\105\48\80\100\119\98\88\115\101\78\103\89\97\80\105\53\103\105\75\57\68\48\88\83\105\65\56\54\86\84\119\50\65\115\103\112\72\67\114\119\107\101\104\112\106\51\80\51\72\120\43\73\71\87\47\102\99\83\117\119\99\48\79\87\90\110\82\69\66\102\70\79\110\84\120\122\107\103\86\57\66\79\113\57\104\53\73\82\121\105\84\102\120\110\105\109\57\100\106\86\105\55\43\57\103\67\78\121\113\104\109\78\81\102\103\67\102\70\88\54\55\66\107\114\101\115\52\50\116\97\99\85\85\72\104\57\78\73\122\67\106\73\122\109\66\55\52\67\111\49\107\84\70\89\73\55\85\83\109\79\103\72\52\99\54\102\51\56\70\122\119\103\121\82\104\90\72\50\105\108\108\105\98\117\104\112\56\54\99\99\50\54\71\105\49\106\122\77\50\122\50\66\73\102\105\121\101\71\49\113\56\81\82\85\105\108\87\49\87\51\103\80\71\74\70\116\80\115\89\81\43\80\110\115\103\76\74\108\76\101\50\55\107\77\119\101\109\101\54\50\88\103\89\111\50\66\47\108\82\109\100\90\116\71\106\101\76\108\116\115\83\105\104\107\120\49\116\43\83\69\104\102\49\79\66\117\120\115\82\107\105\115\65\51\105\98\69\79\73\49\118\98\89\115\78\121\53\71\106\56\70\85\68\107\78\106\113\68\47\67\122\43\108\72\116\110\111\122\74\43\86\54\89\107\57\67\54\50\73\55\73\97\90\82\121\119\98\105\90\47\80\103\79\101\104\52\87\109\122\118\73\69\83\97\66\57\51\114\120\89\52\110\108\97\84\110\87\87\99\50\100\56\85\80\71\55\78\89\87\72\85\54\108\70\83\53\54\75\102\122\100\121\57\50\84\73\50\111\80\53\74\114\74\57\90\109\113\68\111\75\84\56\68\88\102\119\121\56\47\122\67\77\65\80\49\81\80\107\113\99\116\118\52\76\55\48\80\100\97\76\110\69\54\109\89\111\57\50\75\116\81\109\56\81\121\88\112\72\68\68\116\66\53\85\113\72\87\52\104\72\57\120\114\51\53\104\49\79\47\97\51\66\50\120\101\84\51\65\114\113\112\67\107\79\74\72\82\85\99\98\83\90\65\104\101\97\47\115\83\88\54\107\107\109\75\68\68\104\50\118\118\107\66\75\89\90\65\98\47\69\53\104\54\56\49\87\72\110\56\100\90\111\119\117\52\101\43\69\97\119\98\118\102\53\99\65\110\51\70\108\86\67\100\54\114\108\104\68\69\113\98\65\72\82\118\57\115\75\51\53\106\83\119\102\53\114\78\47\110\109\115\47\80\78\99\121\101\102\97\99\50\79\98\82\79\48\120\100\51\53\116\54\51\84\79\72\120\82\82\121\66\79\111\55\57\72\112\119\78\77\49\113\90\83\68\90\105\73\55\102\82\103\81\111\100\74\78\80\68\111\103\99\73\97\81\49\69\112\43\122\87\65\47\47\55\47\120\77\50\86\97\55\119\71\68\83\83\108\68\81\114\87\88\73\47\52\72\119\107\54\118\99\111\43\84\65\120\52\79\89\114\112\87\103\101\99\117\54\48\78\107\109\110\121\88\120\68\89\71\119\77\43\101\54\84\49\68\73\80\98\71\43\87\83\47\113\75\72\81\103\75\111\43\74\83\67\43\50\86\109\49\70\88\122\84\48\75\57\86\67\68\78\103\70\87\55\80\116\90\107\122\81\100\81\122\82\55\98\100\97\102\97\52\70\74\90\69\85\73\110\97\108\81\47\113\101\112\73\74\100\119\112\122\74\83\81\76\84\69\83\99\79\75\86\73\72\69\89\78\118\55\50\72\75\48\74\83\66\98\72\85\117\109\107\89\48\73\99\67\115\75\74\86\74\53\47\68\84\115\89\72\65\116\107\86\97\70\49\88\88\71\70\71\51\121\84\89\110\117\73\79\89\115\113\113\98\65\77\79\87\101\86\85\101\117\101\115\54\111\105\118\69\98\57\90\89\78\55\49\107\122\81\104\88\87\57\76\107\118\103\108\106\109\66\110\51\115\90\50\108\54\100\83\76\66\120\82\75\79\77\81\49\115\81\74\57\119\101\88\110\70\118\76\112\83\119\115\116\68\116\81\98\98\119\72\88\100\121\97\113\77\53\87\122\56\104\120\89\90\108\117\43\120\49\79\74\104\116\71\83\100\100\98\102\119\68\84\105\82\112\83\79\50\89\104\98\101\83\98\43\114\113\117\76\78\67\73\111\43\107\56\122\68\106\66\69\102\85\110\100\86\75\51\79\89\84\70\78\105\99\122\108\43\47\107\97\72\111\116\50\83\100\109\84\70\100\113\84\47\52\83\50\109\71\70\110\70\100\100\75\105\99\112\53\122\47\69\116\52\72\78\113\99\48\85\105\105\105\89\116\83\67\65\122\122\68\66\111\109\113\47\82\72\101\76\78\82\77\49\84\65\70\84\68\86\77\66\114\119\65\84\102\105\68\90\119\90\109\75\68\75\120\75\109\72\121\68\79\70\55\100\89\105\122\87\99\97\102\107\102\109\106\77\117\69\118\69\82\101\55\47\102\71\119\77\49\57\52\112\78\67\86\55\107\112\55\90\83\99\117\79\49\115\99\80\114\105\109\87\116\88\104\89\84\108\70\120\118\73\73\113\86\73\75\70\90\67\48\89\49\87\106\57\120\43\111\121\118\104\79\57\75\90\51\104\113\112\56\102\74\117\66\67\68\117\115\100\84\108\88\116\119\113\43\108\71\52\66\83\104\52\119\76\72\120\43\111\110\75\54\56\71\120\113\122\65\71\85\85\78\97\108\79\57\105\68\49\51\50\113\89\73\111\68\56\70\55\102\76\82\43\89\57\51\116\110\118\53\102\112\119\65\73\80\113\50\120\105\73\73\104\49\75\73\88\70\81\112\74\88\85\84\118\85\71\81\72\88\113\118\70\80\74\115\49\77\89\65\106\98\100\108\74\110\104\104\71\84\77\83\105\118\51\72\68\75\55\53\85\68\114\97\103\76\83\120\87\82\111\118\74\55\56\50\90\107\86\120\52\101\119\89\113\105\74\72\105\89\75\85\65\49\53\79\56\108\82\79\82\48\72\121\57\120\114\108\73\85\104\86\120\52\70\86\71\81\49\106\99\121\65\74\98\73\90\119\81\87\82\84\81\88\88\54\89\67\98\120\83\83\100\118\87\86\120\84\107\121\107\74\102\82\73\84\72\76\100\118\56\115\88\55\66\111\81\113\72\117\82\83\66\101\51\56\43\76\50\77\72\90\55\104\78\105\118\80\69\43\81\118\83\98\80\82\85\115\106\67\78\121\75\112\49\73\85\89\106\68\81\55\101\117\48\49\77\66\82\75\47\76\47\85\122\72\101\90\49\98\73\121\89\56\105\54\80\98\105\119\50\84\105\108\70\116\80\122\56\113\51\73\72\54\67\78\66\73\66\117\114\54\78\57\105\67\55\77\108\104\66\78\80\78\50\43\114\81\107\65\110\100\70\53\85\53\77\56\105\106\77\75\74\104\57\121\90\117\106\66\83\89\81\105\110\52\52\104\103\50\74\54\47\103\107\103\56\121\122\66\70\76\120\70\83\72\97\52\82\111\54\119\121\85\81\65\90\76\79\57\104\97\43\51\49\55\55\72\71\49\52\105\52\87\55\117\122\97\112\85\72\111\86\110\49\100\81\71\67\103\73\74\48\65\106\81\101\113\69\51\100\86\52\54\57\54\73\102\102\100\73\79\105\50\65\51\109\109\90\88\55\99\106\68\121\99\89\121\114\103\121\67\85\79\56\50\47\100\107\54\79\80\52\122\47\111\50\98\105\103\85\69\43\89\121\68\54\115\89\69\56\108\83\98\75\120\48\82\112\52\70\90\67\65\106\86\97\102\51\84\50\75\101\107\102\121\89\108\104\101\97\51\104\116\66\90\116\114\54\98\104\102\49\121\109\118\51\85\109\111\55\106\51\70\73\102\74\77\54\53\110\51\77\67\79\65\52\101\97\80\103\117\106\114\102\112\102\78\108\106\56\76\78\116\103\66\55\55\66\54\53\98\74\90\106\50\57\108\105\102\98\102\121\49\54\66\100\83\80\101\111\88\80\51\73\105\82\43\109\72\117\106\56\100\97\81\77\89\54\76\65\99\113\66\116\82\110\102\87\79\78\56\52\111\65\78\49\122\84\53\98\78\106\107\117\103\43\74\85\52\101\89\77\43\52\100\69\98\71\77\73\122\121\118\88\81\43\99\109\102\113\117\67\120\86\51\115\104\85\53\89\77\104\112\51\85\48\107\54\67\98\53\70\69\120\107\113\107\102\120\87\110\105\82\120\78\89\86\101\121\85\77\87\85\114\122\99\100\109\86\108\43\119\104\81\116\82\87\100\99\115\116\79\76\121\115\99\117\49\82\111\77\118\56\55\116\80\81\55\75\71\103\75\97\110\66\70\71\112\99\107\120\113\74\78\66\111\47\69\69\56\104\57\73\80\77\54\118\66\102\75\82\66\43\80\48\82\115\74\86\117\115\106\82\97\71\50\76\113\85\68\102\114\54\83\90\99\122\75\85\90\116\116\43\86\73\104\82\103\75\83\80\90\74\76\114\114\50\56\83\98\86\54\101\65\84\80\49\55\70\88\73\112\74\98\112\47\50\87\122\43\90\112\90\56\107\101\51\102\49\79\70\49\115\66\81\85\83\90\108\104\121\112\121\75\66\82\54\52\43\54\75\104\118\122\72\57\67\122\80\122\111\67\75\109\104\51\43\48\67\71\47\87\99\88\74\114\97\47\99\112\122\48\74\103\122\103\116\120\67\80\105\98\118\102\49\105\100\43\111\52\115\116\108\99\101\120\52\99\75\88\69\120\110\52\50\116\81\100\105\108\109\51\103\53\77\52\98\70\110\83\66\65\57\108\81\89\109\86\68\71\116\111\119\103\56\89\112\121\97\56\118\78\85\122\119\76\85\81\121\90\108\98\67\67\70\55\65\48\77\84\81\72\114\57\78\57\85\83\122\110\78\97\82\77\75\83\98\108\109\102\84\101\54\76\105\84\99\49\120\78\108\83\78\108\69\118\87\71\88\109\49\106\55\115\113\68\111\99\117\97\74\106\122\65\119\103\103\65\78\77\116\87\99\52\76\78\98\119\65\69\120\50\115\51\74\76\50\67\102\56\71\48\113\69\90\104\67\82\102\80\56\114\78\101\113\79\75\50\49\81\86\76\71\55\66\78\77\69\117\71\108\89\72\84\89\76\78\110\76\84\55\82\83\75\119\115\49\55\101\55\55\88\69\89\54\72\43\71\121\97\49\78\102\81\118\53\56\51\47\101\54\73\120\78\78\52\84\102\100\110\66\97\54\122\97\75\76\56\102\55\113\111\85\48\101\87\121\49\68\81\90\99\103\114\78\78\85\115\83\87\81\98\76\52\107\76\43\49\111\73\90\98\103\106\97\116\82\110\106\51\88\86\113\52\112\90\65\122\66\55\100\90\97\108\72\69\83\118\118\82\88\79\111\111\119\99\48\82\103\67\72\83\68\104\110\98\68\47\52\117\48\52\86\103\86\110\55\102\85\75\69\112\102\79\97\55\71\77\75\100\84\85\51\82\99\71\115\66\80\71\57\87\121\84\118\109\53\68\85\82\82\90\78\89\56\56\57\97\102\65\56\75\48\103\85\49\105\81\55\69\102\72\99\113\65\110\55\106\70\66\73\113\85\79\113\51\105\110\54\68\86\121\117\55\47\77\65\103\77\81\70\51\97\54\49\67\57\80\87\102\84\122\55\71\99\90\72\84\107\84\118\48\82\110\56\115\100\68\53\82\114\88\111\120\112\103\89\121\118\90\57\55\76\85\86\56\99\51\47\116\120\121\66\57\53\120\99\118\79\66\106\53\97\110\105\73\86\47\101\107\83\65\75\82\85\100\109\52\68\43\102\120\49\84\106\83\52\55\119\66\103\49\102\76\71\55\119\112\56\68\78\101\105\48\116\48\89\65\55\49\43\50\88\80\87\55\117\76\118\103\68\65\84\90\75\98\90\48\68\111\117\77\106\70\118\98\48\78\98\107\76\48\79\49\83\49\85\68\81\108\88\77\73\65\111\86\104\101\54\48\121\104\43\84\80\102\90\100\88\89\84\86\71\117\69\88\106\47\49\79\102\114\73\49\122\53\83\78\74\101\53\71\71\76\50\86\99\54\53\111\87\48\115\120\74\80\120\113\77\80\67\50\101\54\77\79\99\112\104\106\119\73\77\48\83\88\80\81\83\56\70\122\80\77\101\72\53\86\104\55\102\122\73\115\72\116\87\107\52\71\80\78\97\106\115\107\72\116\73\106\81\54\80\111\115\108\65\55\82\115\87\99\51\87\121\54\118\116\116\112\70\83\87\56\111\105\116\102\67\105\116\53\109\122\50\118\57\86\47\73\104\52\81\75\50\89\77\108\116\76\80\71\48\79\113\77\52\65\57\116\98\116\99\55\47\80\53\115\85\112\84\113\98\118\100\54\82\104\50\47\103\103\76\82\43\108\54\120\77\106\109\119\111\81\50\75\112\121\52\86\86\72\82\87\83\84\103\66\86\107\47\108\75\50\55\101\113\72\120\88\55\49\69\99\101\83\115\57\116\76\50\50\120\110\51\47\115\55\65\104\121\56\61";local nolIIllIII='cGdGMyktdmIsIzp7eE5xViI=';local nolIIllIIl='real';local nolIIlIIlI=function(a,b)local c=nolIIlIlIl(nolIIlIllI(a))local d=c["\99\105\112\104\101\114"](c,nolIIlIllI(b))return nolIIlIllI(d)end;local nolIIllIIl='real';local nolIIllIll='\101\108\73\57\77\88\78\110\76\49\115\108\85\81\61\61';local nolIIllIlI='QHZiQkloTlA+cEtBQWl3MDMzUA==';local nolIIlIIII='Oz8/NGtZYjtDaUkrRkErWloyOyNzUyVycTolSjNqJDQwaE4=bi12PyZmUDh0RiF1';function nolIIlIlll(a,b)local c=nolIIlIllI(a,b);local d=nolIIllIlI;return c,d end;return nolIIlIlII(nolIIlIIlI(nolIIllIll,nolIIlIIIl),getfenv(0))()end)()
