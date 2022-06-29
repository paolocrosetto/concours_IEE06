program main

USE tools 

  implicit none

  type(pairs_list), dimension(num_rounds) :: pairs
  
  
  call get_pairs(range(20), pairs)
  

contains

subroutine get_pairs(id_in_subsessions, ids_pairs)

  ! routine to get the pairs for the round robin tournament.
  implicit none

  integer, intent(in), dimension(:) :: id_in_subsessions

  type(pairs_list), intent(inout), dimension(num_rounds) :: ids_pairs
  integer :: pop1, pop2
  integer :: ids_number, round
  integer, dimension(size(id_in_subsessions)/2):: left, right

  ids_number = size(id_in_subsessions)

  if (modulo(ids_number, 2) > 0) then
    write(*,*) 'Error: The number of participants must be even.'
    return
  end if
  
  ids_pairs(1)%left = id_in_subsessions(1:ids_number/2)
  ids_pairs(1)%right = id_in_subsessions(ids_number/2+1:ids_number)
  
  do round = 2, num_rounds

    left = ids_pairs(round - 1)%left
    right = ids_pairs(round - 1)%right
    
    call pop(left, 10, pop1)
    
    call pop(right, 1, pop2)
    
    call append(right, pop1)
    
    call insert(left, 2, pop2)

    ids_pairs(round)%left = left
    ids_pairs(round)%right = right
    
  end do 
  
end subroutine get_pairs

end program main


