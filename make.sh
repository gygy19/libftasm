~/.brew/Cellar/nasm/2.12.02/bin/nasm -f macho64 ft_bzero.s
#ld -o ft_bzero ft_bzero.o
gcc -c main.c -o main.o
gcc main.o ft_bzero.o -o test

./test
echo "Exit code : $?\n";
