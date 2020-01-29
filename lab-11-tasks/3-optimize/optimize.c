#include<stdio.h>
#include<sys/time.h>

#define N 1000000
int a;

void doSomething(int i)
{
    a += i;
}

void doSomethingElse(int i)
{
    a += i + 2;
}

void doYetSomethingElse(int i)
{
    a += i*3 + 2;
}

void main()
{
    int i;
    int var;
int ok;
    printf("Insert an integer:\n");
    scanf("%d", &var);

    struct timeval t0, t1;
    gettimeofday(&t0, NULL);
    for (i = 0; i < N; i++)
    {
        if (var % 2 == 0)
            doSomething(i);
        else if (var % 3 == 0)
            doSomethingElse(i);
        else
            doYetSomethingElse(i);
    }
    gettimeofday(&t1, NULL);
    long elapsed = (t1.tv_sec - t0.tv_sec)*1000000 + t1.tv_usec - t0.tv_usec;
    printf("[Non-optimized] Computed: %d in: %ld seconds\n", a, elapsed);

    a = 0;
    struct timeval t0op, t1op;
    gettimeofday(&t0op, NULL);

    if (N % 2) {
	ok = 1;
    }
    for (i = 0; i < N - 1; i += 2)
    {
        if (var % 2 == 0)
            a += i;
        else if (var % 3 == 0)
            a += i + 2;
        else
            a += i + 1 * 3 + 2;
	if (var % 2 == 0)
            a += i + 1;
        else if (var % 3 == 0)
            a += i + 3;
        else
            a += i * 3 + 3;
    }
    if (ok) {
	if (var % 2 == 0)
            a += i;
        else if (var % 3 == 0)
            a += i + 2;
        else
            a += i + 1 * 3 + 2;
    }

    gettimeofday(&t1op, NULL);
    long elapsed2 = (t1op.tv_sec - t0op.tv_sec)*1000000 + t1op.tv_usec - t0op.tv_usec;
    printf("[Optimized] Computed: %d in: %ld seconds\n", a, elapsed2);
}
