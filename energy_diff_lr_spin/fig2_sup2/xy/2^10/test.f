c
      parameter(nsite=2**10,mc=120,nper=10**3,ntrans=10**3,nno=10**3)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension sx(nsite,0:1), sy(nsite,0:1), sz(nsite,0:1)
      dimension sxp(nsite), syp(nsite), syq(nsite)
      dimension thez(nsite)
      dimension e(nsite), eo(nsite)
      dimension im(nsite), ip(nsite)
c      dimension wgt(nsite), wgtd(nsite,nsite)
c
      dimension aje(nsite), ajeje(0:nsite/2)
c
c     parameters
c
       pi=4.0*datan(1.d0); api=8.0*datan(1.d0); kseed=2;
c
       ia=1; ib=0; 
       at=1.d-2;
       temp=1.d1; beta=1.d0/temp; 
       ajy=-1.d0; ajz=0.8d0;
       ahx=0.d0; ahy=0.d0; ahz=0.d0;
       alpha=1.3d0;
c
c       thex=ah*at;       
c
c       do lr=1,nsite; wgt(lr)=0.d0; end do
c       do lr=1,nsite/2
c          wgt(lr)=1.d0/(dble(lr)**alpha)
c       end do
c       
c       do i=1,nsite; do j=1,nsite;
c          if(i.ne.j) then;
c             ij=min(abs(i-j),nsite-abs(i-j))
c             wgtd(i,j)=1.d0/(dble(ij)**alpha)
c          else
c             wgtd(i,j)=0.d0
c          end if
c       end do; end do   
c       
c       zr=0.d0; do lr=1,nsite/2; zr=zr+wgt(lr); end do
       zr=1.d0
c
       ap1=0.4144907717d0
       ap3=1.d0-4.d0*ap1
c
c       
       do i=1,nsite
          im(i)=i-1; if(im(i).lt.1)     im(i)=im(i)+nsite;
          ip(i)=i+1; if(ip(i).gt.nsite) ip(i)=ip(i)-nsite;
       end do; 
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
      do k=0,nsite/2; ajeje(k)=0.d0; end do;
c
c      
c     Monte-Carlo
c
      do 8002 iti=1,ntrans+mc
         ia=1-ia; ib=1-ib;
c         
      do 8001 i=1,nsite
c
c     probabilities
c         
       ahy_eff=0.d0; ahz_eff=0.d0;
c       do lr=1,nsite/2
        ahy_eff=ahy_eff+ajy*(sy(ip(i,1),ib)+sy(im(i,1),ib)) 
        ahz_eff=ahz_eff+ajz*(sz(ip(i,1),ib)+sz(im(i,1),ib))
c     end do
        ahy_eff = ahy_eff + ahy;
        ahz_eff = ahz_eff + ahz;
c
       al=dsqrt(ahy_eff**2+ahz_eff**2+ahx**2)
       alxy=dsqrt(ahy_eff**2+ahz_eff**2)
       asint=alxy/al; acost=ahz_eff/al
       acosp=ahx/alxy; asinp=ahy_eff/alxy
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
 8001 continue
c
      if(iti.gt.ntrans) then;
c         
      do i=1,nsite
       aje(i)=0.d0;
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
           aje(i)=aje(i)+acurr
          end if   
         end do   
        end do 
       end do
      end do
c
      do i=1,nsite
         do k=0,nsite/2
            l=i+k; if(l.gt.nsite) l=l-nsite;
            ajeje(k)=ajeje(k)+aje(i)*aje(l)/dble(nsite*mc)
         end do
      end do
c
      end if
c      
 8002 continue
c
      do k=0,nsite/2
         write(95,111) dble(k), ajeje(k)
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


      
      
