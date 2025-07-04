c
      parameter(nsite=2**9,ntrans=10**4,nth=1,nmc=1,nti=10,
     & maxtime=500,nno=10**3)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension sx(nsite,0:1), sy(nsite,0:1), sz(nsite,0:1)
      dimension sxp(nsite), syp(nsite), syq(nsite)
      dimension thez(nsite)
      dimension e(nsite), eo(nsite)
      dimension im(nsite,0:nsite/2), ip(nsite,0:nsite/2)
      dimension wgt(nsite), wgtd(nsite,nsite)
c
      dimension aje(nsite,maxtime),ajeje(0:nsite/2,0:maxtime)
      dimension ajejet(0:nsite/2,0:maxtime)
c
c     parameters
c
       pi=4.0*datan(1.d0); api=8.0*datan(1.d0); kseed=2;
c
       ia=1; ib=0; 
       at=1.d-2;
       temp=1.d1; beta=1.d0/temp; 
       ajx=-1.d0; ajy=-0.8d0; ajz=-0.5d0; ah=0.d0;
       alpha=1.3d0;
c
       thex=ah*at;       
c
       do lr=1,nsite; wgt(lr)=0.d0; end do
       do lr=1,nsite/2
          wgt(lr)=1.d0/(dble(lr)**alpha)
       end do
c
       do i=1,nsite; do j=1,nsite;
          if(i.ne.j) then;
             ij=min(abs(i-j),nsite-abs(i-j))
             wgtd(i,j)=1.d0/(dble(ij)**alpha)
          else
             wgtd(i,j)=0.d0
          end if
       end do; end do
c       
c       zr=0.d0; do lr=1,nsite/2; zr=zr+wgt(lr); end do
       zr=1.d0
c
       ap1=0.4144907717d0
       ap3=1.d0-4.d0*ap1
c
c       
       do i=1,nsite; do lr=0,nsite/2
          im(i,lr)=i-lr; if(im(i,lr).lt.1)     im(i,lr)=im(i,lr)+nsite;
          ip(i,lr)=i+lr; if(ip(i,lr).gt.nsite) ip(i,lr)=ip(i,lr)-nsite;
       end do; end do   
c
c       
cccc
      open(21, file='b.d',  status='old')
      read(21,121) kseed1
 121  format(i4)
      call sgrnd(kseed1)
cccc
c
c     
c     random initial state
c
      do i=1,nsite; do k=0,1 
         z1=grnd()
         sz(i,k)=dsin(api*z1)
         z2=grnd()
         sx(i,k)=dcos(api*z1)*dcos(api*z2)
         sy(i,k)=dcos(api*z1)*dsin(api*z2)
      end do; end do
c
c
c     initial statistics
c
c      aje1=0.d0; ajet=0.d0;
c      ac11=0.d0; acrr=0.d0;
      do k=1,nsite/2; do l=0,maxtime;
         ajeje(k,l)=0.d0; ajejet(k,l)=0.d0;
      end do; end do
c
c      
c     Monte-Carlo
c
      do 8002 iti=1,ntrans
         ia=1-ia; ib=1-ib;
c         
      do 8001 i=1,nsite
c
c     probabilities
c         
       ahx_eff=0.d0; ahy_eff=0.d0; ahz_eff=0.d0;
       do lr=1,nsite/2
        ahx_eff=ahy_eff+wgt(lr)/zr*ajx*(sx(ip(i,lr),ib)+sx(im(i,lr),ib))   
        ahy_eff=ahy_eff+wgt(lr)/zr*ajy*(sy(ip(i,lr),ib)+sy(im(i,lr),ib)) 
        ahz_eff=ahz_eff+wgt(lr)/zr*ajz*(sz(ip(i,lr),ib)+sz(im(i,lr),ib))
       end do
c
       al=dsqrt(ahx_eff**2+ahy_eff**2+ahz_eff**2)
       alxy=dsqrt(ahx_eff**2+ahy_eff**2)
       asint=alxy/al; acost=ahz_eff/al
       acosp=ahx_eff/alxy; asinp=ahy_eff/alxy
c       
c     sampling initial state
c       
c     z1=grnd();
       call random(nno,z1)
       aq=dacos(-dlog(2.d0*dsinh(beta*al)*z1+dexp(-beta*al))/(beta*al))
       z2=grnd();
       sx1=dsin(aq)*dcos(api*z2)
       sy1=dsin(aq)*dsin(api*z2)
       sz1=dcos(aq)
c
       sx2=acost*sx1+asint*sz1
       sz(i,ia)=-asint*sx1+acost*sz1
c
       sx(i,ia)=acosp*sx2+asinp*sy1
       sy(i,ia)=-asinp*sx2+acosp*sy1
c
c       
 8001 continue
c
 8002 continue
c
c     time-evolution -> data collection
c
      do 2001 mc=1,nmc
c
c     shift of initial state
c         
      do 9002 iti=1,nth
         ia=1-ia; ib=1-ib;
c         
      do 9001 i=1,nsite
c
c     probabilities
c         
       ahx_eff=0.d0; ahy_eff=0.d0; ahz_eff=0.d0;
       do lr=1,nsite/2
        ahx_eff=ahy_eff+wgt(lr)/zr*ajx*(sx(ip(i,lr),ib)+sx(im(i,lr),ib))   
        ahy_eff=ahy_eff+wgt(lr)/zr*ajy*(sy(ip(i,lr),ib)+sy(im(i,lr),ib)) 
        ahz_eff=ahz_eff+wgt(lr)/zr*ajz*(sz(ip(i,lr),ib)+sz(im(i,lr),ib))
       end do
c
       al=dsqrt(ahx_eff**2+ahy_eff**2+ahz_eff**2)
       alxy=dsqrt(ahx_eff**2+ahy_eff**2)
       asint=alxy/al; acost=ahz_eff/al
       acosp=ahx_eff/alxy; asinp=ahy_eff/alxy
c       
c     sampling initial state
c       
c     z1=grnd();
       call random(nno,z1)
       aq=dacos(-dlog(2.d0*dsinh(beta*al)*z1+dexp(-beta*al))/(beta*al))
       z2=grnd();
       sx1=dsin(aq)*dcos(api*z2)
       sy1=dsin(aq)*dsin(api*z2)
       sz1=dcos(aq)
c
       sx2=acost*sx1+asint*sz1
       sz(i,ia)=-asint*sx1+acost*sz1
c
       sx(i,ia)=acosp*sx2+asinp*sy1
       sy(i,ia)=-asinp*sx2+acosp*sy1
c
c       
 9001 continue
c
 9002 continue
c
c     time-evolution
c
      do 2003 itm=1,maxtime
c         
      do 2002 iti=1,nti
c p1
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,ajx,ajy,ajz,ia)
c p2
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,ajx,ajy,ajz,ia)
c p3      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap3*at,alpha,zr,ajx,ajy,ajz,ia)
c p4      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,ajx,ajy,ajz,ia)
c p5      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,ajx,ajy,ajz,ia)
c
 2002 continue
c      
      do i=1,nsite
       aje(i,itm)=0.d0;
       do kk=1,nsite/2
        ik=i-kk; if(ik.lt.1) ik=ik+nsite
        do lp=kk,nsite/2   
         do imm=1,nsite
          if(imm.ne.ik.and.imm.ne.ip(ik,lp)) then;
           acurr=-ajy*ajz/4.d0*
     &     (wgtd(ik,imm)*wgtd(ip(ik,lp),imm)*sx(imm,ia)*
     &      (sy(ik,ia)*sz(ip(ik,lp),ia)-sy(ip(ik,lp),ia)*sz(ik,ia))
     &     -wgt(lp)*wgtd(imm,ik)*sx(ik,ia)*
     &      (sy(ip(ik,lp),ia)*sz(imm,ia)-sy(imm,ia)*sz(ip(ik,lp),ia))
     &     +wgtd(imm,ip(ik,lp))*wgt(lp)*sx(ip(ik,lp),ia)*
     &      (sy(imm,ia)*sz(ik,ia)-sy(ik,ia)*sz(imm,ia)) )      
     &     -ajz*ajx/4.d0*
     &     (wgtd(ik,imm)*wgtd(ip(ik,lp),imm)*sy(imm,ia)*
     &      (sz(ik,ia)*sx(ip(ik,lp),ia)-sz(ip(ik,lp),ia)*sx(ik,ia))
     &     -wgt(lp)*wgtd(imm,ik)*sy(ik,ia)*
     &      (sz(ip(ik,lp),ia)*sx(imm,ia)-sz(imm,ia)*sx(ip(ik,lp),ia))
     &     +wgtd(imm,ip(ik,lp))*wgt(lp)*sy(ip(ik,lp),ia)*
     &      (sz(imm,ia)*sx(ik,ia)-sz(ik,ia)*sx(imm,ia)) )       
     &     -ajx*ajy/4.d0*
     &     (wgtd(ik,imm)*wgtd(ip(ik,lp),imm)*sz(imm,ia)*
     &      (sx(ik,ia)*sy(ip(ik,lp),ia)-sx(ip(ik,lp),ia)*sy(ik,ia))
     &     -wgt(lp)*wgtd(imm,ik)*sz(ik,ia)*
     &      (sx(ip(ik,lp),ia)*sy(imm,ia)-sx(imm,ia)*sy(ip(ik,lp),ia))
     &     +wgtd(imm,ip(ik,lp))*wgt(lp)*sz(ip(ik,lp),ia)*
     &      (sx(imm,ia)*sy(ik,ia)-sx(ik,ia)*sy(imm,ia)) ) 
           aje(i,itm)=aje(i,itm)+acurr
          end if   
         end do   
        end do 
       end do
      end do
c
 2003 continue
c      
      do i=1,nsite; do j=0,nsite/2
         ij=i+j; if(ij.gt.nsite) ij=ij-nsite;
      do k=1,maxtime; do l=k,maxtime
         anrm=dble(maxtime-(l-k))   
         ajeje(j,l-k)=ajeje(j,l-k)+aje(i,k)*aje(ij,l)/(dble(nsite)*anrm)
      end do; end do
      end do; end do      
c
 2001 continue
c
      do j=0,nsite/2
         ajejet(j,0)=at*dble(nti)*ajeje(j,0);
      do itm=0,maxtime-1
         ajejet(j,itm+1)=ajejet(j,itm)+at*dble(nti)*ajeje(j,itm);
      end do
      end do
c
      do itm=0,maxtime
         write(51,111) at*dble(nti*itm),
     &        (ajeje(i,itm)/dble(nmc),i=0,16)
         write(52,111) at*dble(nti*itm),
     &        (ajejet(i,itm)/dble(nmc),i=0,16)
      end do
c      
      do j=0,nsite/2
         write(95,111) dble(j), ajeje(j,0)/dble(nmc)
         write(96,111) dble(j), ajejet(j,200)/dble(nmc)
         write(97,111) dble(j), ajejet(j,400)/dble(nmc)
      end do
c      
c      
 111  format(100f20.10)
c
      stop
      end
c
c
c
************************************************************************
      subroutine symp(nsite,sx,sy,sz,im,ip,wgt,at,
     &   alpha,zr,ajx,ajy,ajz,ia)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
      real*8, intent(inout), dimension(nsite,0:1) :: sx,sy,sz
      integer*4, intent(in), dimension(nsite,nsite/2) :: im,ip
      real*8, intent(in), dimension(nsite/2) :: wgt
c
      dimension sy1(nsite), sz1(nsite), sx1(nsite), sy2(nsite)
      dimension sx2(nsite), sz2(nsite), sy3(nsite)
      dimension thex(nsite), thez(nsite), they(nsite)
c
c     theta_xx(t)
c
      do i=1,nsite
         thex(i)=0.d0   
         do lr=1,nsite/2
            thexii=wgt(lr)/zr*ajx*(sx(ip(i,lr),ia)+sx(im(i,lr),ia))*at/2
            thex(i)=thex(i)+thexii
         end do         
      end do
c      
      do i=1,nsite
         sy1(i)=dcos(thex(i))*sy(i,ia)-dsin(thex(i))*sz(i,ia)
         sz1(i)=dsin(thex(i))*sy(i,ia)+dcos(thex(i))*sz(i,ia)
      end do
c
c     theta_zz(t)
c      
      do i=1,nsite
         thez(i)=0.d0   
         do lr=1,nsite/2
            thezii=wgt(lr)/zr*ajz*(sz1(ip(i,lr))+sz1(im(i,lr)))*at/2
            thez(i)=thez(i)+thezii
         end do         
      end do
c
      do i=1,nsite
         sx1(i)=dcos(thez(i))*sx(i,ia)-dsin(thez(i))*sy1(i)
         sy2(i)=dsin(thez(i))*sx(i,ia)+dcos(thez(i))*sy1(i)
      end do
c
c     theta_yy(t+dt)
c
      do i=1,nsite
         they(i)=0.d0   
         do lr=1,nsite/2
            theyii=wgt(lr)/zr*ajy*(sy2(ip(i,lr))+sy2(im(i,lr)))*at
            they(i)=they(i)+theyii
         end do         
      end do
c
      do i=1,nsite
         sx2(i)=dcos(they(i))*sx1(i)+dsin(they(i))*sz1(i)
         sz2(i)=-dsin(they(i))*sx1(i)+dcos(they(i))*sz1(i)
      end do
c
c     theta_zz(t+dt)
c
      do i=1,nsite
         thez(i)=0.d0   
         do lr=1,nsite/2
            thezii=wgt(lr)/zr*ajz*(sz2(ip(i,lr))+sz2(im(i,lr)))*at/2
            thez(i)=thez(i)+thezii
         end do         
      end do
c
      do i=1,nsite
         sx(i,ia)=dcos(thez(i))*sx2(i)-dsin(thez(i))*sy2(i)
         sy3(i)=dsin(thez(i))*sx2(i)+dcos(thez(i))*sy2(i)
      end do
c      
c     theta_xx(t+dt)
c
      do i=1,nsite
         thex(i)=0.d0   
         do lr=1,nsite/2
            thexii=wgt(lr)/zr*ajx*(sx(ip(i,lr),ia)+sx(im(i,lr),ia))*at/2
            thex(i)=thex(i)+thexii
         end do         
      end do
c      
      do i=1,nsite
         sy(i,ia)=dcos(thex(i))*sy3(i)-dsin(thex(i))*sz2(i)
         sz(i,ia)=dsin(thex(i))*sy3(i)+dcos(thex(i))*sz2(i)
      end do
c
      return
      end
************************************************************************
      subroutine random(nno,zz)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
      do k=1,nno
         zz= grnd()
         if(zz.gt.1.d-7.and.zz.lt.1.d0-1.d-7) goto 1200
      end do
 1200 continue
      return
      end      
************************************************************************

      subroutine sgrnd(seed)
*

      implicit integer(a-z)
*

* Period parameters
      parameter(N     =  624)
*

      dimension mt(0:N-1)
*                     the array for the state vector

      common /block/mti,mt
      save   /block/
*

*      setting initial seeds to mt[N] using

*      the generator Line 25 of Table 1 in

*      [KNUTH 1981, The Art of Computer Programming

*         Vol. 2 (2nd Ed.), pp102]

*

      mt(0)= iand(seed,-1)
      do 1000 mti=1,N-1
        mt(mti) = iand(69069 * mt(mti-1),-1)
 1000 continue
*

      return
      end
************************************************************************

      double precision function grnd()
*

      implicit integer(a-z)
*

* Period parameters
      parameter(N     =  624)
      parameter(N1    =  N+1)
      parameter(M     =  397)
      parameter(MATA  = -1727483681)
*                                    constant vector a

      parameter(UMASK = -2147483648)
*                                    most significant w-r bits

      parameter(LMASK =  2147483647)
*                                    least significant r bits

* Tempering parameters

      parameter(TMASKB= -1658038656)
      parameter(TMASKC= -272236544)
*

      dimension mt(0:N-1)
*                     the array for the state vector

      common /block/mti,mt
      save   /block/
      data   mti/N1/
*                     mti==N+1 means mt[N] is not initialized

*

      dimension mag01(0:1)
      data mag01/0, MATA/
      save mag01
*                        mag01(x) = x * MATA for x=0,1

*

      TSHFTU(y)=ishft(y,-11)
      TSHFTS(y)=ishft(y,7)
      TSHFTT(y)=ishft(y,15)
      TSHFTL(y)=ishft(y,-18)
*

      if(mti.ge.N) then
*                       generate N words at one time

        if(mti.eq.N+1) then
*                            if sgrnd() has not been called,

          call sgrnd(4357)
*                              a default initial seed is used

        endif
*

        do 1000 kk=0,N-M-1
            y=ior(iand(mt(kk),UMASK),iand(mt(kk+1),LMASK))
            mt(kk)=ieor(ieor(mt(kk+M),ishft(y,-1)),mag01(iand(y,1)))
 1000   continue
        do 1100 kk=N-M,N-2
            y=ior(iand(mt(kk),UMASK),iand(mt(kk+1),LMASK))
            mt(kk)=ieor(ieor(mt(kk+(M-N)),ishft(y,-1)),mag01(iand(y,1)))
 1100   continue
        y=ior(iand(mt(N-1),UMASK),iand(mt(0),LMASK))
        mt(N-1)=ieor(ieor(mt(M-1),ishft(y,-1)),mag01(iand(y,1)))
        mti = 0
      endif
*

      y=mt(mti)
      mti=mti+1
      y=ieor(y,TSHFTU(y))
      y=ieor(y,iand(TSHFTS(y),TMASKB))
      y=ieor(y,iand(TSHFTT(y),TMASKC))
      y=ieor(y,TSHFTL(y))
*

      if(y.lt.0) then
        grnd=(dble(y)+2.0d0**32)/(2.0d0**32-1.0d0)
      else
        grnd=dble(y)/(2.0d0**32-1.0d0)
      endif
*

      return
      end


      
      
