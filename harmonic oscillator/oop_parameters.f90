module parameters

  implicit none
  integer, parameter :: nat = 8, dim = 18
  real(8), dimension(dim) :: mu, sigma2
  real(8), dimension(24,dim) :: eigenvectors

contains

  subroutine read_parameters()
    implicit none
    integer :: i,j, ios

    open(unit=16, file="inital.out", iostat=ios)
    if ( ios /= 0 ) stop "Error opening file unit 16"

    do i=1,dim
      read(16,*) mu(i)
    end do

    close(unit=16, iostat=ios, status="keep")
    if ( ios /= 0 ) stop "Error closing file unit 16"

    open(unit=16, file="eigenvalues.out", iostat=ios)
    if ( ios /= 0 ) stop "Error opening file unit 16"

    do i=1,dim
      read(16,*) sigma2(i)
    end do

    close(unit=16, iostat=ios, status="keep")
    if ( ios /= 0 ) stop "Error closing file unit 16"

    open(unit=16, file="eigenvectors.out", iostat=ios)
    if ( ios /= 0 ) stop "Error opening file unit 16"

    do i=1,24
      read(16,*) ( eigenvectors(i, j), j = 1, dim )
    end do

    close(unit=16, iostat=ios, status="keep")
    if ( ios /= 0 ) stop "Error closing file unit 16"


  end subroutine read_parameters



end module parameters