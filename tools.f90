module tools

implicit none

integer, parameter :: num_ids = 20
integer, parameter :: num_pairs = num_ids/2
integer, parameter :: num_rounds = num_pairs

type pairs_list
   integer, dimension(num_pairs) :: left = 0
   integer, dimension(num_pairs) :: right = 0
end type pairs_list

PUBLIC :: range_, pop_, append_, insert_, print_


interface range
  module procedure range_
end interface

interface pop
  module procedure pop_
end interface

interface append
  module procedure append_
end interface

interface insert
  module procedure insert_
end interface

interface print
  module procedure print_
end interface


contains


function range_(id_nb_subsessions)

  implicit none

  integer, intent(in) :: id_nb_subsessions
  integer, dimension(id_nb_subsessions) :: range_  
  integer :: i

  range_ = (/(i, i=0,id_nb_subsessions-1,1)/)

end function range_


subroutine pop_(id_range_values, id, value)

  implicit none

  integer, intent(inout), dimension(10) :: id_range_values
  integer, intent(in) :: id
  integer, intent(out) :: value
 
  value = id_range_values(id)
  id_range_values(id) = -1

end subroutine pop_


subroutine append_(id_range_values, value)

  implicit none
  
  integer, intent(inout), dimension(10) :: id_range_values
  integer, intent(in) :: value
 
  integer :: i

  i = count(id_range_values > 0)

  if (i > 9) then
    return
  end if

  id_range_values(1:i) = pack(id_range_values, id_range_values/=-1)
  id_range_values(i+1) = value
  
end subroutine append_



subroutine insert_(id_range_values, id, value)

  implicit none
  
  integer, intent(inout), dimension(10) :: id_range_values
  integer, intent(in) :: id
  integer, intent(out) :: value

  integer, dimension(10) :: loc_id_range_values
  integer :: i

  i = count(id_range_values > 0)

  if (id > 9 .or. i == 10) then
    return
  end if
  
  loc_id_range_values(:) = pack(id_range_values, id_range_values/=-1)

  id_range_values(1:(id-1)) = loc_id_range_values(1:(id-1))
  id_range_values(id) = value
  id_range_values((id+1):10) = loc_id_range_values(id:10-1)

end subroutine insert_


subroutine print_(ids_pairs, i)

  implicit none

  type(pairs_list), intent(in), dimension(num_rounds) :: ids_pairs
  integer, intent(in) :: i
  integer :: j

  print '(A5 i3 A7)', "Round", i, " pairs:"
  do j = 1, 10
    print '(A1 i2 A1 i2 A1)',"[", ids_pairs(i)%left(j),",", ids_pairs(i)%right(j),"]"
  end do

  print *, ""

end subroutine print_


end module tools
