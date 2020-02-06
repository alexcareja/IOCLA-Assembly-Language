#include <stdio.h>

void direct(const char *s, unsigned int perturb);
size_t obvious(unsigned int a, unsigned int b);
void crypto(const unsigned char *in, unsigned char *out, size_t len, const unsigned char *key, size_t klen);

int main(void)
{
	unsigned char in[128] = "no country for old men";
	unsigned char out[128];
	unsigned char k[16] = "sibling1";

	int i = 0;
	while(i < 24) {
		in[i] = in[i] ^ k[i%16];
		i++;
	}

	direct("bad", 679);
	printf("%d", obvious(179, 1));
	crypto(in, out, 128, k, 16);
	printf("\n%s\n", out);

	return 0;
}
