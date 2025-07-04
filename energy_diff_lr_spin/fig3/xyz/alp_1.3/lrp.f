c
      parameter(nsite=2**9,ntrans=10**4,mmax=7,nti=mmax*24*10**3,
     & nth=10**1,nmc=150,nno=10**3)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension sx(nsite,0:1), sy(nsite,0:1), sz(nsite,0:1)
      dimension thez(nsite),they(nsite)
      dimension e(nsite),eo(nsite)
      dimension im(nsite,nsite/2),ip(nsite,nsite/2)
      dimension wgt(nsite/2)
c
c
      dimension ee(0:mmax,-nsite/2:nsite/2),ei(nsite)
c
c     parameters
c
       pi=4.0*datan(1.d0); api=8.0*datan(1.d0); kseed=11;
       ia=1; ib=0;
c
       at=1.d-2;
       temp=1.d1; beta=1.d0/temp; 
       ajx=-1.d0; ajy=-0.8d0; ajz=-0.5d0; ah=0.d0;
       alpha=1.3d0;
c
       do lr=1,nsite/2
          wgt(lr)=1.d0/(dble(lr)**alpha)
       end do
c       
       zr=1.d0;
c     
       ap1=0.4144907717d0
       ap3=1.d0-4.d0*ap1
c
c       
       do i=1,nsite; do lr=1,nsite/2
          im(i,lr)=i-lr; if(im(i,lr).lt.1)     im(i,lr)=im(i,lr)+nsite;
          ip(i,lr)=i+lr; if(ip(i,lr).gt.nsite) ip(i,lr)=ip(i,lr)-nsite;
       end do; end do   
c
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
c     initial state
c
      do i=1,nsite; do k=0,1
         z1=grnd()
         sz(i,k)=dsin(api*z1)
         z2=grnd()
         sx(i,k)=dcos(api*z1)*dcos(api*z2)
         sy(i,k)=dcos(api*z1)*dsin(api*z2)
      end do; end do
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
        ahx_eff=ahx_eff+wgt(lr)/zr*ajx*(sx(ip(i,lr),ib)+sx(im(i,lr),ib))  
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
       z1=grnd();
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
 8001 continue
c
 8002 continue
c      
c     initial statistics      
c      
      do k=0,mmax; do i=-nsite/2,nsite/2;
         ee(k,i)=0.d0;
      end do; end do
c     
      do i=1,nsite
         eo(i)=0.d0
         do lr=1,nsite/2
            epii= wgt(lr)/zr*ajx*sx(i,ia)
     &           *(sx(ip(i,lr),ia)+sx(im(i,lr),ia))/2.d0
     &           +wgt(lr)/zr*ajy*sy(i,ia)
     &           *(sy(ip(i,lr),ia)+sy(im(i,lr),ia))/2.d0
     &           +wgt(lr)/zr*ajz*sz(i,ia)
     &           *(sz(ip(i,lr),ia)+sz(im(i,lr),ia))/2.d0        
            eo(i)=eo(i)+epii
         end do
         e(i) = eo(i) + ah*sx(i,ia)
      end do
c
      ac=0.d0;
      do i=1,nsite
         ac=ac+e(i)/dble(nsite)
      end do
      ac=ac**2;
c
c     check
c      ae=0.d0; do i=1,nsite; ae=ae+e(i); end do;
c      write(13,111) dble(0), dble(0), ae
c      
c     time-evolution -> data collection
c
      do 5001 mc=1,nmc
         do i=1,nsite; ei(i)=e(i); end do
c
      do 5002 istp=0,mmax
         do i=1,nsite
            do j=-nsite/2+1,nsite/2
               k=i+j; if(k.lt.1) k=k+nsite; if(k.gt.nsite) k=k-nsite;
               ee(istp,j)=ee(istp,j)+ei(i)*e(k)/dble(nsite*nmc)
            end do
         end do
c
         if(istp.eq.mmax) goto 5002
c      
      do 5000 iti=1,nti/mmax-1
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
 5000 continue
c      
      do i=1,nsite
         eo(i)=0.d0
         do lr=1,nsite/2
            epii= wgt(lr)/zr*ajx*sx(i,ia)
     &           *(sx(ip(i,lr),ia)+sx(im(i,lr),ia))/2.d0
     &           +wgt(lr)/zr*ajy*sy(i,ia)
     &           *(sy(ip(i,lr),ia)+sy(im(i,lr),ia))/2.d0             
     &           +wgt(lr)/zr*ajz*sz(i,ia)
     &           *(sz(ip(i,lr),ia)+sz(im(i,lr),ia))/2.d0
            eo(i)=eo(i)+epii
         end do
         e(i)= eo(i) + ah*sx(i,ia)
      end do
c 
c      ae=0.d0; do i=1,nsite; ae=ae+e(i); end do;
c      write(13,111) dble(mc), dble(istp), ae
c
c 5000 continue
c      
 5002 continue
c
 5001 continue
c
      do i=-nsite/2+1,nsite/2
         write(53,111) dble(i), ee(0,i)-ac, ee(1,i)-ac, ee(2,i)-ac,
     &  ee(3,i)-ac, ee(4,i)-ac, ee(5,i)-ac, ee(6,i)-ac, ee(7,i)-ac;
      end do
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
         if(zz.gt.1.d-7) goto 1200
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


      
      
