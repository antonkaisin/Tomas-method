program main
    use tomas_mod
    implicit none
    integer i, n
    real, allocatable :: d(:), e(:), c(:), f(:), det(:)
    
    open(1, file = "input1") !Entering a file input*
    read(1, *) n

    ! Memory allocation for arrays
    allocate(d(1:n),e(1:n-1), c(2:n), f(1:n)) 
    
    do i = 1, n 
        read(1, *) d(i)
    end do

    do i = 1, n - 1
        read(1, *) e(i)
    end do

    do i = 2, n 
        read(1, *) c(i)
    end do

    do i = 1, n
        read(1, *) f(i)
    end do

    open(2, file = "result1") !Output of results*
    
    write(2, *) "Number of equations n"
    write(2, *) n
    write(2, *) "vector d:"
    do i = 1, n 
        write(2, "(F8.3)") d(i)
    end do

    write(2, *) "vector e:"
    do i = 1, n - 1
        write(2, "(F8.3)") e(i)
    end do

    write(2, *) "vector c:"
    do i = 2, n 
        write(2, "(F8.3)") c(i)
    end do

    write(2, *) "vector f:"
    do i = 1, n
    write(2, "(F8.3)") f(i)
    end do

    
    write(2, *) "vector X:" 
    call tomas(d,e,c,f,n) ! Сalling a procedure from a module tomas_mod

    deallocate(d,e, c, f)
   
    close(1)
    close(2)

end program main