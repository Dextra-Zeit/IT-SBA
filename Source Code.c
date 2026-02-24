#include <stdlib.h>
#include <stdio.h>
#include <string.h>
int main() {
char Lh[]="0", Hh[]="0", Fh[]="0";
int LPH; LPH = 150500;
int HHD; HHD = 440000;
int FHD; FHD = 700500;
int r = 0;
int sesV = 1;
int N_S;
char H_C[100];
float q;
char H_A[4];
float hH;
float hF;
float hL;
char c_[2];
char A_N[100];
char c_1[2];

// MAIN
do {

// APPLICANT INIT
do {
sesV = 1;
strcpy(Lh, "0");
strcpy(Hh, "0");
strcpy(Fh, "0");
r=0;

printf("Housung Community Acronym (3 Letters MAX):	"); scanf("%3s", H_A);
printf("Applicant name:					"); scanf(" %[^\n]s", A_N);
printf("Gross Salary:					"); int G_S; scanf("%d", &G_S);
printf("Total Salary Deductions:			"); int S_D; scanf("%d", &S_D);


N_S = (G_S - S_D); //printf("Net Salary: %d\n", N_S);
q = (N_S * 0.75); //printf("Q_STAT: %f\n", q);

if (strcmp(H_A, "HHD")==0 && (sesV == 1)) { // printf("HHD was selected, ");
hH = (HHD * 0.75); if (N_S >= hH) { printf("Applicant Qualify\n");strcpy(Hh,"1"); } else { printf("Applicant Not Qualify.\n");sesV=0; };
strcpy(Hh,"1");}

if (strcmp(H_A, "FHD")==0 && (sesV == 1)) { //printf("FHD was selected, ");
hF = (FHD * 0.75); if (N_S >= hF) { printf("Applicant Qualify\n");strcpy(Fh,"1"); } else { printf("Applicant Not Qualify.\n");sesV=0; };
strcpy(Fh,"1");}

if (strcmp(H_A, "LPH")==0 && (sesV == 1)) { //printf("LPH was selected, ");
hL = (LPH * 0.75); if (N_S >= hL) { printf("Applicant Qualify\n");strcpy(Lh,"1"); } else { printf("Applicant Not Qualify.\n");sesV=0; };
strcpy(Lh,"1");}

if (sesV==0) { printf("Input Data for another applicant? [ N | y ]: ");scanf("%1s", c_);
if (strcmp(c_, "y")==0 || strcmp(c_, "Y")==0) { r=1; } else { r=0; } }

if (strcmp(Lh, "1")==0) { strcpy(H_C, "La Parfaite Harmonie"); }
if (strcmp(Hh, "1")==0) { strcpy(H_C, "Hauraruni Housing Development"); }
if (strcmp(Fh, "1")==0) { strcpy(H_C, "Fitzhope Housing Development"); }
//printf("%s %s %s %s\n",H_C,Lh,Hh,Fh);
} while (r==1);
// APPLICANT INIT FINISH
//printf("%s\n",H_C);
int eX, U_I, L_E, eX_A=0, S;

printf("Applicant Total Utility Expenses: 		");scanf("%d", &U_I);
printf("Applicant Total Living Expenses: 		");scanf("%d", &L_E);

eX=(U_I+L_E);

S=(N_S-eX);

if (S>=(eX*0.5)) { eX_A=1; }

printf("-------------------------------\n");

printf("Applicant Name:		%s\n", A_N);
printf("Housing Community:	%s\n", H_C);
if (strcmp(H_A, "LPH")==0) {
printf("Cost:			$%d\n", LPH);
}
if (strcmp(H_A, "FHD")==0) {
printf("Cost:                   $%d\n", FHD);
}
if (strcmp(H_A, "HHD")==0) {
printf("Cost:                   $%d\n", HHD);
}
if (eX_A==1) { printf("Approval Status:	Approved.\n"); } else { printf("Approval Status:        Not Approved.\n"); }


printf("Input Data for another applicant? [ N | y ]: ");scanf("%1s", c_1);

} while (strcmp(c_1, "y")==0 || strcmp(c_1, "Y")==0);
// MAIN FINISH

return 0;
}
