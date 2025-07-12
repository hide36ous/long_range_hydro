c     nonlocal_diff
c      
      parameter(nsite=2**9,ntrans=10**3,mmax=7,nti=mmax*2*10**4,
     & nth=10**1,nmc=600,nno=10**3)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension ac(-nsite/2:nsite/2,0:1)
      dimension ad(-nsite/2:nsite/2,-nsite/2:nsite/2)
      dimension a(0:nsite/2), adiff(0:nsite/2)
      dimension b(-nsite/2:nsite/2), ee0(-nsite/2:nsite/2)
      dimension ee1(-nsite/2:nsite/2), ee2(-nsite/2:nsite/2)
      dimension	ee3(-nsite/2:nsite/2), ee4(-nsite/2:nsite/2)
      dimension	ee5(-nsite/2:nsite/2), ee6(-nsite/2:nsite/2)
      dimension	ee7(-nsite/2:nsite/2)
c
      dimension wgt(-nsite/2:nsite/2,-nsite/2:nsite/2)
      dimension ee(0:mmax,-nsite/2:nsite/2)
c
      ia=0; ib=1
      at=1.d-2; ax=1.d0;
      alp=1.3d0
c
      do i=-nsite/2,nsite/2; do j=-nsite/2,nsite/2
         wgt(i,j)=1.d0/(dble( min(abs(i-j),nsite-abs(i-j))+1 )**alp)
      end do; end do;
c            
c     read the data of nonlocal diffusion constants
c      
      open(20, file='fort.96', status='old')
      do i=0,nsite/2
         read(20,111) a(i), adiff(i)
      end do
      close(20)
c
      do i=-nsite/2,nsite/2; do j=-nsite/2,nsite/2;
         k=min(abs(i-j),nsite-abs(i-j))      
         ad(i,j)= adiff(k)/0.4185059273 
      end do; end do;
c
c      do i=-nsite/2,nsite/2; do j=-nsite/2,nsite/2;
c         ad(i,j)=0.17d0*wgt(i,j)
c      end do; end do;      
c      
c     initial data -> read the data of energy diffusion
c      
      open(21, file='fort.53', status='old')
      do i=-nsite/2+1,nsite/2-1
         read(21,111) b(i), ee0(i), ee1(i), ee2(i), ee3(i),
     &                      ee4(i), ee5(i), ee6(i), ee7(i)
      end do
      close(21)
c
      do i=-nsite/2+1,nsite/2-1; do k=0,1
         ac(i,k)= ee0(i)
      end do; end do;
c      
      do k=0,1;
         ac(-nsite/2,k)=ac(-nsite/2+1,k);
         ac(nsite/2,k)=ac(nsite/2-1,k)
      end do;
c
c      do i=-nsite/2,nsite/2; do k=0,1
c         ac(i,k)=0.4d0*wgt(i,0)
c      end do; end do;
c      
c      
c     time-evolution
c
      do 3001 istp=0,mmax
         do i=-nsite/2,nsite/2
            ee(istp,i)=ac(i,ia)
         end do
      if(istp.eq.mmax) goto 3001   
c     
      do 3000 iti=1,nti/mmax-1
         ia=1-ia; ib=1-ib;
c
       do i=-nsite/2,nsite/2;
        acurr=0.d0;  
        do j=-nsite/2,nsite/2  
        jp=j+1; if(jp.gt.nsite/2) jp=jp-nsite
        jm=j-1; if(jm.lt.-nsite/2) jm=jm+nsite
        acurr=acurr
     &       + at*ad(i,j)*(ac(jp,ib)-2.d0*ac(j,ib)+ac(jm,ib))/(ax**2)
        end do;
        ac(i,ia)=ac(i,ib)+acurr
       end do;
c
 3000 continue
c
 3001 continue
c
      do i=-nsite/2+1,nsite/2
         write(55,111) dble(i), ee(0,i),ee(1,i),ee(2,i),ee(3,i),ee(4,i),
     &    ee(5,i),ee(6,i),ee(7,i)
      end do
c
 111  format(100f20.10)
c
      stop
      end
c
c
c      
      
      
