c
      parameter(nsite=2**9,ntrans=10**3,mmax=7,nti=mmax*4*10**3,
     & nth=10**1,nmc=4000,nno=10**3)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension sx(nsite,0:1), sy(nsite,0:1), sz(nsite,0:1)
      dimension thez(nsite)
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
       aj=-1.d0; ah=-1.d0;
       alpha=1.1d0;
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
c     initial statistics      
c      
      do k=0,mmax; do i=-nsite/2,nsite/2;
         ee(k,i)=0.d0;
      end do; end do
c     
c     initial thermalization -> Monte-Carlo    
c
      do 8002 iti=1,ntrans
         ia=1-ia; ib=1-ib;
c         
      do 8001 i=1,nsite
c
       ah_eff=0.d0;
       do lr=1,nsite/2
          ah_eff=ah_eff+wgt(lr)/zr*aj*(sz(ip(i,lr),ib)+sz(im(i,lr),ib))
       end do
c
       al=dsqrt(ah_eff**2+ah**2)
       asint=ah/al; acost=ah_eff/al
c       
c     sampling initial state
c       
       z1=grnd();
       aq=dacos(-dlog(2.d0*dsinh(beta*al)*z1+dexp(-beta*al))/(beta*al))
       z2=grnd();
       sx1=dsin(aq)*dcos(api*z2)
       sy(i,ia)=dsin(aq)*dsin(api*z2)
       sz1=dcos(aq)
c
       sx(i,ia)=acost*sx1+asint*sz1
       sz(i,ia)=-asint*sx1+acost*sz1
c
c       
 8001 continue
c
 8002 continue
c      
      do i=1,nsite
         eo(i)=0.d0
         do lr=1,nsite/2
            epii= wgt(lr)/zr*aj*sz(i,ia)
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
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah,ia)
c p2
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah,ia)
c p3      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap3*at,alpha,zr,aj,ah,ia)
c p4      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah,ia)
c p5      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah,ia)
c
 5000 continue
c      
      do i=1,nsite
         eo(i)=0.d0
         do lr=1,nsite/2
            epii= wgt(lr)/zr*aj*sz(i,ia)
     &            *(sz(ip(i,lr),ia)+sz(im(i,lr),ia))/2.d0
            eo(i)=eo(i)+epii
         end do
         e(i)= eo(i) + ah*sx(i,ia)
      end do
c 
c      ae=0.d0; do i=1,nsite; ae=ae+e(i); end do;
c      write(13,111) dble(mc), dble(istp), ae
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
      subroutine symp(nsite,sx,sy,sz,im,ip,wgt,at,alpha,zr,aj,ah,ia)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
      real*8, intent(inout), dimension(nsite,0:1) :: sx,sy,sz
      integer*4, intent(in), dimension(nsite,nsite/2) :: im,ip
      real*8, intent(in), dimension(nsite/2) :: wgt
c
      dimension syp(nsite), szp(nsite), syq(nsite)
      dimension thez(nsite)
c
      thex=ah*at/2.d0;
c
c     theta_x(t)
c
      do i=1,nsite
         syp(i)=dcos(thex)*sy(i,ia)-dsin(thex)*sz(i,ia)
         szp(i)=dsin(thex)*sy(i,ia)+dcos(thex)*sz(i,ia)
      end do
c
c     theta_zz
c      
      do i=1,nsite
         thez(i)=0.d0   
         do lr=1,nsite/2
            thezii=wgt(lr)/zr*aj*(szp(ip(i,lr))+szp(im(i,lr)))*at
            thez(i)=thez(i)+thezii
         end do         
      end do
c
      do i=1,nsite
         syq(i)=dsin(thez(i))*sx(i,ia)+dcos(thez(i))*syp(i)
         sx(i,ia)=dcos(thez(i))*sx(i,ia)-dsin(thez(i))*syp(i)
      end do
c
c     theta_x(t+dt)
c
      do i=1,nsite
         sy(i,ia)=dcos(thex)*syq(i)-dsin(thex)*szp(i)
         sz(i,ia)=dsin(thex)*syq(i)+dcos(thex)*szp(i)
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


      
      
