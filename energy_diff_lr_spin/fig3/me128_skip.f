c
      parameter(lmax=1,maxf=126,nsite=2**9, mmax=7)
c     
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
c
      dimension avg(lmax,0:mmax,-nsite/2+1:nsite/2-1)
      dimension aa(-nsite/2:nsite/2)
c
      dimension bvg(lmax,0:mmax,-nsite/2+1:nsite/2-1)
c     
c
      character*12 f(lmax*maxf)
      character*7  fortn(lmax)
      character*5  foldr(maxf)
c
      integer :: i, j, skip_count
      skip_count = 0

      do i=0,127
         ! 'e050/'と'e120/'はスキップ
         if (i==50 .or. i==120) then
c         if(i==33) then
         skip_count = skip_count + 1
         else
            write(foldr(i - skip_count +1), '(A,I3.3,A)') 'e', i, '/'
         end if
      end do
c
      fortn(1)='fort.53';
c      fortn(2)='fort.52'; fortn(3)='fort.53'; 
c
      do imf =1, maxf
       do lc=1,lmax
          in=(imf-1)*lmax + lc
          f(in)=foldr(imf)//fortn(lc)
       end do
      end do
c     
c
c     
       do lc=1,lmax
       do i1=0,7; do i=-nsite/2+1,nsite/2-1;
        bvg(lc,i1,i)=0.d0;
        end do;  end do; 
       end do
c
      do 1234 ifl=1,maxf
      jfl=lmax*(ifl-1)
c
      do lc=1,lmax
       iu=50+lc
       open(iu, file=f(jfl+lc), status='old', iostat=ios)
       if (ios /= 0) then
        print *, 'Warning: Data not found in directory ',
     &     trim(foldr(ifl))
        goto 1234  ! ファイルがない場合、次のループに進む
       end if
      end do
c
       do lc=1,lmax
       do i1=0,7; do i=-nsite/2+1,nsite/2-1;
        avg(lc,i1,i)=0.d0;
       end do;  end do;
       end do
c
c
c
      do lc=1,lmax
       iu=50+lc
       do i=-nsite/2+1, nsite/2-1
          read(iu,100) aa(i),(avg(lc,j,i),j=0,mmax)
      end do
       close(iu)
      end do
c
c
c
       do lc=1,lmax
       do i1=0,7; do i=-nsite/2+1,nsite/2-1;
        bvg(lc,i1,i)=bvg(lc,i1,i)+avg(lc,i1,i)/dble(maxf);
      end do;  end do;
       end do
c
c
c
 1234 continue 
c
c
      do lc=1,lmax
       iu=50+lc+2
      do i=-nsite/2+1, nsite/2-1
         write(iu,100) aa(i),(bvg(lc,j,i),j=0,mmax)
      end do
      end do
 100  format(20f20.10)
      stop
      end
