

my_var=(one two three)
echo ${my_var[0]}
echo ${my_var[1]}
echo ${my_var[*]}

my_var[2]=four

unset my_var
