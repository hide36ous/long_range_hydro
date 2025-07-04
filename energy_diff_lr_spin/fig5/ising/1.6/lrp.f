c
      parameter(nsite=2**9,maxtime=10**4,nti=10,
     & nmc=10**2,num=10**5,nno=10**3)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension sx(nsite), sy(nsite), sz(nsite)
      dimension thez(nsite)
c      dimension e(nsite),eo(nsite)
      dimension im(nsite,nsite/2),ip(nsite,nsite/2)
      dimension wgt(nsite/2)
c
      dimension ace(0:maxtime), adata(maxtime)
      dimension acet(0:maxtime)
c
c
c     parameters
c
       pi=4.0*datan(1.d0); api=8.0*datan(1.d0); kseed=11;
c
       at=1.d-2;
       temp=1.d0; beta=1.d0/temp; 
       aj=-1.d0; ah=0.5d0;
       alpha=1.6d0;
c
c       
       do lr=1,nsite/2
          wgt(lr)=1.d0/(dble(lr)**alpha)
       end do
c       
c      zr=0.d0; do lr=1,nsite/2; zr=zr+wgt(lr); end do       
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
c     probabilities
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
c      do i=1,nsite 
c         z1=grnd()
c         sz(i)=dsin(api*z1)
c         z2=grnd()
c         sx(i)=dcos(api*z1)*dcos(api*z2)
c         sy(i)=dcos(api*z1)*dsin(api*z2)
c      end do
c
c     initial statistics
c
      do i=0,maxtime; ace(i)=0.d0; acet(i)=0.d0; end do
c     
c     time-evolution -> data collection
c
      do 2003 mc=1,nmc
c
c     initial state -> Monte Carlo
c
      do i=1,nsite 
         z1=grnd();
         theta=dacos( - dlog( 2.d0*dsinh(beta*aj*ah)*z1
     &                 + dexp(-beta*aj*ah) ) /(beta*aj*ah) )
         z2=grnd();
         sx(i)=dcos(theta)
         sy(i)=dsin(theta)*dcos(api*z2)
         sz(i)=dsin(theta)*dsin(api*z2)
      end do
c      
      do 2001 itm=1,maxtime   
c      
      do 2000 iti=1,nti
c p1
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah)
c p2
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah)
c p3      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap3*at,alpha,zr,aj,ah)
c p4      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah)
c p5      
      call symp(nsite,sx,sy,sz,im,ip,wgt,ap1*at,alpha,zr,aj,ah)
c
 2000 continue
c
c     current at time iti*iper
c      
      adata(itm)=0.d0;
      do i=1,nsite;
       do kk=1,nsite/2
          ij=i-kk; if(ij.lt.1) ij=ij+nsite;
        do lr=kk,nsite/2  
           aje= -aj*ah*wgt(lr)
     &          *( sy(ip(ij,lr))*sz(ij) - sy(ij)*sz(ip(ij,lr)) )/2.d0
           adata(itm) = adata(itm) + aje
        end do;
       end do;
      end do;      
c      
c
 2001 continue
c
      do i=1,maxtime; do j=i,maxtime;
         anrm=dble(maxtime-(j-i))
         ace(j-i)=ace(j-i)+adata(j)*adata(i)/anrm
      end do; end do
c
 2003 continue
c
      acet(0)=at*dble(nti)*ace(0);
      do itm=0,maxtime-2
         acet(itm+1) = acet(itm)+at*dble(nti)*ace(itm)
      end do
c      
      do itm=0,maxtime-1
         write(51,111) at*dble(nti*itm),ace(itm)/dble(nmc*nsite)
         write(52,111) at*dble(nti*itm),acet(itm)/dble(nmc*nsite)
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
      subroutine symp(nsite,sx,sy,sz,im,ip,wgt,at,alpha,zr,aj,ah)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
      real*8, intent(inout), dimension(nsite) :: sx,sy,sz
      integer*4, intent(in), dimension(nsite,nsite/2) :: im,ip
      real*8, intent(in), dimension(nsite/2) :: wgt
c
      dimension syp(nsite), szp(nsite), syq(nsite)
      dimension thez(nsite)
c
      thex=aj*ah*at/2.d0;
c
c     theta_x(t)
c
      do i=1,nsite
         syp(i)=dcos(thex)*sy(i)-dsin(thex)*sz(i)
         szp(i)=dsin(thex)*sy(i)+dcos(thex)*sz(i)
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
         syq(i)=dsin(thez(i))*sx(i)+dcos(thez(i))*syp(i)
         sx(i)=dcos(thez(i))*sx(i)-dsin(thez(i))*syp(i)
      end do
c
c     theta_x(t+dt)
c
      do i=1,nsite
         sy(i)=dcos(thex)*syq(i)-dsin(thex)*szp(i)
         sz(i)=dsin(thex)*syq(i)+dcos(thex)*szp(i)
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


      
      
