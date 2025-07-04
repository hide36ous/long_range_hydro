program data_processing
implicit none

integer, parameter :: lmax = 1, maxf = 128, nsite = 2**9, mmax = 7
integer, parameter :: nsize = nsite/2
real(8), dimension(lmax, 0:mmax, -nsize+1:nsize-1) :: avg
real(8), dimension(-nsize:nsize) :: aa
real(8), dimension(lmax, 0:mmax, -nsize+1:nsize-1) :: bvg
character(12) :: f(lmax*maxf)
character(7) :: fortn(lmax)
character(5) :: foldr(maxf)
integer :: imf, lc, in, ifl, jfl, iu, i1, i, ios
integer :: j
character(80) :: msg

call init_foldr(foldr, maxf)
fortn(1) = 'fort.53'

call construct_file_paths(foldr, fortn, f, lmax, maxf)

! Debugging: print the constructed file paths
do in = 1, lmax * maxf
  print *, 'File path: ', trim(f(in))
end do

! Initialize bvg to zero
bvg = 0.0d0

! Loop over all maxf files
do ifl = 1, maxf
  jfl = lmax * (ifl - 1)

  ! Open and read files
  do lc = 1, lmax
    iu = 50 + lc
    open(iu, file = trim(f(jfl + lc)), status = 'old', iostat = ios)
    if (ios /= 0) then
      write(msg, '(A,I2,A)') 'Error opening file: ', ios, ' '
      print *, msg // trim(f(jfl + lc))
      stop 'File open error'
    end if

    ! Read data into avg array
    avg(lc, :, :) = 0.0d0
    do i = -nsize+1, nsize-1
      read(iu, *) aa(i), (avg(lc, j, i), j = 0, mmax)
    end do
    close(iu)
  end do

  ! Accumulate averages
  do lc = 1, lmax
    do i1 = 0, mmax
      do i = -nsize+1, nsize-1
        bvg(lc, i1, i) = bvg(lc, i1, i) + avg(lc, i1, i) / dble(maxf)
      end do
    end do
  end do
end do

! Write results to files
do lc = 1, lmax
  iu = 50 + lc + 2
  open(iu, file = 'output_' // trim(fortn(lc)), status = 'unknown')
  do i = -nsize+1, nsize-1
    write(iu, '(20f20.10)') aa(i), (bvg(lc, j, i), j = 0, mmax)
  end do
  close(iu)
end do

contains

subroutine init_foldr(foldr, maxf)
  character(5), intent(out) :: foldr(maxf)
  integer, intent(in) :: maxf
  integer :: i

  do i = 1, maxf
    write(foldr(i), '("e", i3.3, "/")') i
  end do
end subroutine init_foldr

subroutine construct_file_paths(foldr, fortn, f, lmax, maxf)
  character(5), intent(in) :: foldr(maxf)
  character(7), intent(in) :: fortn(lmax)
  character(12), intent(out) :: f(lmax*maxf)
  integer, intent(in) :: lmax, maxf
  integer :: imf, lc, in

  do imf = 1, maxf
    do lc = 1, lmax
      in = (imf - 1) * lmax + lc
      f(in) = trim(foldr(imf)) // trim(fortn(lc))
    end do
  end do
end subroutine construct_file_paths

end program data_processing
