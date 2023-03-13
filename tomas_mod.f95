module tomas_mod
    implicit none
    contains

    subroutine tomas(d,e,c,f,n)
        integer i, n, j
        real eps
        real :: d(1:n),e(1:n-1), c(2:n), f(1:n), a(2:n), b(2:n)
        real, allocatable :: x(:)  

        eps = 1e-6

        !The direct course of the Thomas method
        a(2) = -e(1)/d(1)
        b(2) = f(1)/d(1)

        do i = 2, n-1
            a(i+1) = -e(i)/(c(i)*a(i)+d(i))
            b(i+1) = (f(i)-c(i)*b(i))/(c(i)*a(i)+d(i))

            if (abs(c(i)*a(i)+d(i)) < eps) then
                write(2, *) 'Alert! Zero division'
            endif
        enddo

        allocate(x(1:n)) ! Memory allocation for array

        !The reverse of the Thomas method
        x(n) = (f(n)-c(n)*b(n))/(c(n)*a(n)+d(n))

        do i = n-1,1,-1
            x(i) = a(i+1)*x(i+1)+b(i+1)
        enddo
        
        if (abs(c(n)*a(n)+d(n)) < eps) then
                write(2, *) 'Alert! Zero division'
        
        else 
            do i = 1, n 
                write(2, "(F8.3)") x(i)
            enddo
        endif

        deallocate(x)

    end subroutine tomas
end module tomas_mod