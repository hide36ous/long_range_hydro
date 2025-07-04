      parameter(lmax=1,maxf=128,nsite=2**9, mmax=7)
      implicit real*8 (a-b,e-h,o-z)
      implicit complex*16 (c-d)
      dimension avg(lmax,0:mmax,-nsite/2+1:nsite/2-1)
      dimension aa(-nsite/2:nsite/2)
      dimension bvg(lmax,0:mmax,-nsite/2+1:nsite/2-1)
      character*12 f(lmax*maxf)
      character*7  fortn(lmax)
      character*5  foldr(maxf)
      logical valid_file, is_nan_data

      do i=1,128
         write(foldr(i), '(A,I3.3,A)') 'e', mod(i, 128), '/'
      end do
      fortn(1)='fort.53';
c      fortn(2)='fort.52'; fortn(3)='fort.53'; 

      do imf=1, maxf
         do lc=1,lmax
            in=(imf-1)*lmax + lc
            f(in)=foldr(imf)//fortn(lc)
         end do
      end do

      do lc=1,lmax
         do i1=0,7; do i=-nsite/2+1,nsite/2-1;
            bvg(lc,i1,i)=0.d0;
         end do; end do;
      end do

      num_valid_files = 0
      do 1234 ifl=1,maxf
         jfl=lmax*(ifl-1)
         valid_file = .true.

         do lc=1,lmax
            iu=50+lc
            open(iu, file=f(jfl+lc), status='old', iostat=ios)
            if (ios /= 0) then
               print *, 'Error: Data not found in directory ',
     &               trim(foldr(ifl)), ' for file ', trim(f(jfl+lc))
               valid_file = .false.
               goto 1234
            end if
         end do

         if (valid_file) then
            do lc=1,lmax
               iu=50+lc
               is_nan_data = .true.

               do i=-nsite/2+1, nsite/2-1
                read(iu, 100, iostat=ios) aa(i), (avg(lc,j,i), j=0,mmax)
                  if (ios /= 0) then
              print *, 'Error reading data from file: ', trim(f(jfl+lc))
                     valid_file = .false.
                     exit
                  end if

                  do j=0,mmax
                     if (.not. isnan(avg(lc,j,i))) then
                        is_nan_data = .false.
                        exit
                     end if
                  end do
                  if (.not. is_nan_data) exit
               end do

               close(iu)

               if (is_nan_data) then
                  print *, 'Warning: All data is NaN in directory ',
     &                  trim(foldr(ifl)), ' for file ', trim(f(jfl+lc))
                  valid_file = .false.
                  exit
               end if
            end do
         end if

         if (valid_file) then
            num_valid_files = num_valid_files + 1
            do lc=1,lmax
               do i1=0,7; do i=-nsite/2+1,nsite/2-1;
                  bvg(lc,i1,i) = bvg(lc,i1,i) + avg(lc,i1,i)
               end do; end do;
            end do
         end if

1234     continue
      end do

      if (num_valid_files > 0) then
         do lc=1,lmax
            do i1=0,7; do i=-nsite/2+1,nsite/2-1;
               bvg(lc,i1,i) = bvg(lc,i1,i) / dble(num_valid_files)
            end do; end do;
         end do
      else
         print *, 'Error: No valid files available for averaging.'
      end if

      do lc=1,lmax
         iu=50+lc+2
         do i=-nsite/2+1, nsite/2-1
            write(iu,100) aa(i), (bvg(lc,j,i),j=0,mmax)
         end do
      end do

 100  format(20f20.10)
      stop
      end
