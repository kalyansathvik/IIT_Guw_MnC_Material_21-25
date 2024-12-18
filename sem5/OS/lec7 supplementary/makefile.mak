# run as $make Simple
# run as $make Static
# run as $make Dynamic


Simple:
	gcc -c foo.c
	gcc -c bar.c
	gcc foo.o bar.o
	./a.out

Static:
	gcc -c foo.c
	ar rcs libfoo.a foo.o #it create libfoo.a
	gcc bar.c -L. -lfoo
	 ./a.out

Dynamic:
	gcc -c -fPIC foo.c
	gcc -shared -Wl,-soname,libfoo.so.1 -o libfoo.so.1 foo.o
	gcc bar.c -L. -lfoo
	export LD_LIBRARY_PATH=.
	./a.out