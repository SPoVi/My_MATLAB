/*
 *    This file was auto-generated using the ACADO Toolkit.
 *    
 *    While ACADO Toolkit is free software released under the terms of
 *    the GNU Lesser General Public License (LGPL), the generated code
 *    as such remains the property of the user who used ACADO Toolkit
 *    to generate this code. In particular, user dependent data of the code
 *    do not inherit the GNU LGPL license. On the other hand, parts of the
 *    generated code that are a direct copy of source code from the
 *    ACADO Toolkit or the software tools it is based on, remain, as derived
 *    work, automatically covered by the LGPL license.
 *    
 *    ACADO Toolkit is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *    
 */


#include "acado_common.h"




/******************************************************************************/
/*                                                                            */
/* ACADO code generation                                                      */
/*                                                                            */
/******************************************************************************/


int acado_modelSimulation(  )
{
int ret;

int lRun1;
ret = 0;
for (lRun1 = 0; lRun1 < 10; ++lRun1)
{
acadoWorkspace.state[0] = acadoVariables.x[lRun1 * 10];
acadoWorkspace.state[1] = acadoVariables.x[lRun1 * 10 + 1];
acadoWorkspace.state[2] = acadoVariables.x[lRun1 * 10 + 2];
acadoWorkspace.state[3] = acadoVariables.x[lRun1 * 10 + 3];
acadoWorkspace.state[4] = acadoVariables.x[lRun1 * 10 + 4];
acadoWorkspace.state[5] = acadoVariables.x[lRun1 * 10 + 5];
acadoWorkspace.state[6] = acadoVariables.x[lRun1 * 10 + 6];
acadoWorkspace.state[7] = acadoVariables.x[lRun1 * 10 + 7];
acadoWorkspace.state[8] = acadoVariables.x[lRun1 * 10 + 8];
acadoWorkspace.state[9] = acadoVariables.x[lRun1 * 10 + 9];

acadoWorkspace.state[130] = acadoVariables.u[lRun1 * 2];
acadoWorkspace.state[131] = acadoVariables.u[lRun1 * 2 + 1];

ret = acado_integrate(acadoWorkspace.state, 1);

acadoWorkspace.d[lRun1 * 10] = acadoWorkspace.state[0] - acadoVariables.x[lRun1 * 10 + 10];
acadoWorkspace.d[lRun1 * 10 + 1] = acadoWorkspace.state[1] - acadoVariables.x[lRun1 * 10 + 11];
acadoWorkspace.d[lRun1 * 10 + 2] = acadoWorkspace.state[2] - acadoVariables.x[lRun1 * 10 + 12];
acadoWorkspace.d[lRun1 * 10 + 3] = acadoWorkspace.state[3] - acadoVariables.x[lRun1 * 10 + 13];
acadoWorkspace.d[lRun1 * 10 + 4] = acadoWorkspace.state[4] - acadoVariables.x[lRun1 * 10 + 14];
acadoWorkspace.d[lRun1 * 10 + 5] = acadoWorkspace.state[5] - acadoVariables.x[lRun1 * 10 + 15];
acadoWorkspace.d[lRun1 * 10 + 6] = acadoWorkspace.state[6] - acadoVariables.x[lRun1 * 10 + 16];
acadoWorkspace.d[lRun1 * 10 + 7] = acadoWorkspace.state[7] - acadoVariables.x[lRun1 * 10 + 17];
acadoWorkspace.d[lRun1 * 10 + 8] = acadoWorkspace.state[8] - acadoVariables.x[lRun1 * 10 + 18];
acadoWorkspace.d[lRun1 * 10 + 9] = acadoWorkspace.state[9] - acadoVariables.x[lRun1 * 10 + 19];

acadoWorkspace.evGx[lRun1 * 100] = acadoWorkspace.state[10];
acadoWorkspace.evGx[lRun1 * 100 + 1] = acadoWorkspace.state[11];
acadoWorkspace.evGx[lRun1 * 100 + 2] = acadoWorkspace.state[12];
acadoWorkspace.evGx[lRun1 * 100 + 3] = acadoWorkspace.state[13];
acadoWorkspace.evGx[lRun1 * 100 + 4] = acadoWorkspace.state[14];
acadoWorkspace.evGx[lRun1 * 100 + 5] = acadoWorkspace.state[15];
acadoWorkspace.evGx[lRun1 * 100 + 6] = acadoWorkspace.state[16];
acadoWorkspace.evGx[lRun1 * 100 + 7] = acadoWorkspace.state[17];
acadoWorkspace.evGx[lRun1 * 100 + 8] = acadoWorkspace.state[18];
acadoWorkspace.evGx[lRun1 * 100 + 9] = acadoWorkspace.state[19];
acadoWorkspace.evGx[lRun1 * 100 + 10] = acadoWorkspace.state[20];
acadoWorkspace.evGx[lRun1 * 100 + 11] = acadoWorkspace.state[21];
acadoWorkspace.evGx[lRun1 * 100 + 12] = acadoWorkspace.state[22];
acadoWorkspace.evGx[lRun1 * 100 + 13] = acadoWorkspace.state[23];
acadoWorkspace.evGx[lRun1 * 100 + 14] = acadoWorkspace.state[24];
acadoWorkspace.evGx[lRun1 * 100 + 15] = acadoWorkspace.state[25];
acadoWorkspace.evGx[lRun1 * 100 + 16] = acadoWorkspace.state[26];
acadoWorkspace.evGx[lRun1 * 100 + 17] = acadoWorkspace.state[27];
acadoWorkspace.evGx[lRun1 * 100 + 18] = acadoWorkspace.state[28];
acadoWorkspace.evGx[lRun1 * 100 + 19] = acadoWorkspace.state[29];
acadoWorkspace.evGx[lRun1 * 100 + 20] = acadoWorkspace.state[30];
acadoWorkspace.evGx[lRun1 * 100 + 21] = acadoWorkspace.state[31];
acadoWorkspace.evGx[lRun1 * 100 + 22] = acadoWorkspace.state[32];
acadoWorkspace.evGx[lRun1 * 100 + 23] = acadoWorkspace.state[33];
acadoWorkspace.evGx[lRun1 * 100 + 24] = acadoWorkspace.state[34];
acadoWorkspace.evGx[lRun1 * 100 + 25] = acadoWorkspace.state[35];
acadoWorkspace.evGx[lRun1 * 100 + 26] = acadoWorkspace.state[36];
acadoWorkspace.evGx[lRun1 * 100 + 27] = acadoWorkspace.state[37];
acadoWorkspace.evGx[lRun1 * 100 + 28] = acadoWorkspace.state[38];
acadoWorkspace.evGx[lRun1 * 100 + 29] = acadoWorkspace.state[39];
acadoWorkspace.evGx[lRun1 * 100 + 30] = acadoWorkspace.state[40];
acadoWorkspace.evGx[lRun1 * 100 + 31] = acadoWorkspace.state[41];
acadoWorkspace.evGx[lRun1 * 100 + 32] = acadoWorkspace.state[42];
acadoWorkspace.evGx[lRun1 * 100 + 33] = acadoWorkspace.state[43];
acadoWorkspace.evGx[lRun1 * 100 + 34] = acadoWorkspace.state[44];
acadoWorkspace.evGx[lRun1 * 100 + 35] = acadoWorkspace.state[45];
acadoWorkspace.evGx[lRun1 * 100 + 36] = acadoWorkspace.state[46];
acadoWorkspace.evGx[lRun1 * 100 + 37] = acadoWorkspace.state[47];
acadoWorkspace.evGx[lRun1 * 100 + 38] = acadoWorkspace.state[48];
acadoWorkspace.evGx[lRun1 * 100 + 39] = acadoWorkspace.state[49];
acadoWorkspace.evGx[lRun1 * 100 + 40] = acadoWorkspace.state[50];
acadoWorkspace.evGx[lRun1 * 100 + 41] = acadoWorkspace.state[51];
acadoWorkspace.evGx[lRun1 * 100 + 42] = acadoWorkspace.state[52];
acadoWorkspace.evGx[lRun1 * 100 + 43] = acadoWorkspace.state[53];
acadoWorkspace.evGx[lRun1 * 100 + 44] = acadoWorkspace.state[54];
acadoWorkspace.evGx[lRun1 * 100 + 45] = acadoWorkspace.state[55];
acadoWorkspace.evGx[lRun1 * 100 + 46] = acadoWorkspace.state[56];
acadoWorkspace.evGx[lRun1 * 100 + 47] = acadoWorkspace.state[57];
acadoWorkspace.evGx[lRun1 * 100 + 48] = acadoWorkspace.state[58];
acadoWorkspace.evGx[lRun1 * 100 + 49] = acadoWorkspace.state[59];
acadoWorkspace.evGx[lRun1 * 100 + 50] = acadoWorkspace.state[60];
acadoWorkspace.evGx[lRun1 * 100 + 51] = acadoWorkspace.state[61];
acadoWorkspace.evGx[lRun1 * 100 + 52] = acadoWorkspace.state[62];
acadoWorkspace.evGx[lRun1 * 100 + 53] = acadoWorkspace.state[63];
acadoWorkspace.evGx[lRun1 * 100 + 54] = acadoWorkspace.state[64];
acadoWorkspace.evGx[lRun1 * 100 + 55] = acadoWorkspace.state[65];
acadoWorkspace.evGx[lRun1 * 100 + 56] = acadoWorkspace.state[66];
acadoWorkspace.evGx[lRun1 * 100 + 57] = acadoWorkspace.state[67];
acadoWorkspace.evGx[lRun1 * 100 + 58] = acadoWorkspace.state[68];
acadoWorkspace.evGx[lRun1 * 100 + 59] = acadoWorkspace.state[69];
acadoWorkspace.evGx[lRun1 * 100 + 60] = acadoWorkspace.state[70];
acadoWorkspace.evGx[lRun1 * 100 + 61] = acadoWorkspace.state[71];
acadoWorkspace.evGx[lRun1 * 100 + 62] = acadoWorkspace.state[72];
acadoWorkspace.evGx[lRun1 * 100 + 63] = acadoWorkspace.state[73];
acadoWorkspace.evGx[lRun1 * 100 + 64] = acadoWorkspace.state[74];
acadoWorkspace.evGx[lRun1 * 100 + 65] = acadoWorkspace.state[75];
acadoWorkspace.evGx[lRun1 * 100 + 66] = acadoWorkspace.state[76];
acadoWorkspace.evGx[lRun1 * 100 + 67] = acadoWorkspace.state[77];
acadoWorkspace.evGx[lRun1 * 100 + 68] = acadoWorkspace.state[78];
acadoWorkspace.evGx[lRun1 * 100 + 69] = acadoWorkspace.state[79];
acadoWorkspace.evGx[lRun1 * 100 + 70] = acadoWorkspace.state[80];
acadoWorkspace.evGx[lRun1 * 100 + 71] = acadoWorkspace.state[81];
acadoWorkspace.evGx[lRun1 * 100 + 72] = acadoWorkspace.state[82];
acadoWorkspace.evGx[lRun1 * 100 + 73] = acadoWorkspace.state[83];
acadoWorkspace.evGx[lRun1 * 100 + 74] = acadoWorkspace.state[84];
acadoWorkspace.evGx[lRun1 * 100 + 75] = acadoWorkspace.state[85];
acadoWorkspace.evGx[lRun1 * 100 + 76] = acadoWorkspace.state[86];
acadoWorkspace.evGx[lRun1 * 100 + 77] = acadoWorkspace.state[87];
acadoWorkspace.evGx[lRun1 * 100 + 78] = acadoWorkspace.state[88];
acadoWorkspace.evGx[lRun1 * 100 + 79] = acadoWorkspace.state[89];
acadoWorkspace.evGx[lRun1 * 100 + 80] = acadoWorkspace.state[90];
acadoWorkspace.evGx[lRun1 * 100 + 81] = acadoWorkspace.state[91];
acadoWorkspace.evGx[lRun1 * 100 + 82] = acadoWorkspace.state[92];
acadoWorkspace.evGx[lRun1 * 100 + 83] = acadoWorkspace.state[93];
acadoWorkspace.evGx[lRun1 * 100 + 84] = acadoWorkspace.state[94];
acadoWorkspace.evGx[lRun1 * 100 + 85] = acadoWorkspace.state[95];
acadoWorkspace.evGx[lRun1 * 100 + 86] = acadoWorkspace.state[96];
acadoWorkspace.evGx[lRun1 * 100 + 87] = acadoWorkspace.state[97];
acadoWorkspace.evGx[lRun1 * 100 + 88] = acadoWorkspace.state[98];
acadoWorkspace.evGx[lRun1 * 100 + 89] = acadoWorkspace.state[99];
acadoWorkspace.evGx[lRun1 * 100 + 90] = acadoWorkspace.state[100];
acadoWorkspace.evGx[lRun1 * 100 + 91] = acadoWorkspace.state[101];
acadoWorkspace.evGx[lRun1 * 100 + 92] = acadoWorkspace.state[102];
acadoWorkspace.evGx[lRun1 * 100 + 93] = acadoWorkspace.state[103];
acadoWorkspace.evGx[lRun1 * 100 + 94] = acadoWorkspace.state[104];
acadoWorkspace.evGx[lRun1 * 100 + 95] = acadoWorkspace.state[105];
acadoWorkspace.evGx[lRun1 * 100 + 96] = acadoWorkspace.state[106];
acadoWorkspace.evGx[lRun1 * 100 + 97] = acadoWorkspace.state[107];
acadoWorkspace.evGx[lRun1 * 100 + 98] = acadoWorkspace.state[108];
acadoWorkspace.evGx[lRun1 * 100 + 99] = acadoWorkspace.state[109];

acadoWorkspace.evGu[lRun1 * 20] = acadoWorkspace.state[110];
acadoWorkspace.evGu[lRun1 * 20 + 1] = acadoWorkspace.state[111];
acadoWorkspace.evGu[lRun1 * 20 + 2] = acadoWorkspace.state[112];
acadoWorkspace.evGu[lRun1 * 20 + 3] = acadoWorkspace.state[113];
acadoWorkspace.evGu[lRun1 * 20 + 4] = acadoWorkspace.state[114];
acadoWorkspace.evGu[lRun1 * 20 + 5] = acadoWorkspace.state[115];
acadoWorkspace.evGu[lRun1 * 20 + 6] = acadoWorkspace.state[116];
acadoWorkspace.evGu[lRun1 * 20 + 7] = acadoWorkspace.state[117];
acadoWorkspace.evGu[lRun1 * 20 + 8] = acadoWorkspace.state[118];
acadoWorkspace.evGu[lRun1 * 20 + 9] = acadoWorkspace.state[119];
acadoWorkspace.evGu[lRun1 * 20 + 10] = acadoWorkspace.state[120];
acadoWorkspace.evGu[lRun1 * 20 + 11] = acadoWorkspace.state[121];
acadoWorkspace.evGu[lRun1 * 20 + 12] = acadoWorkspace.state[122];
acadoWorkspace.evGu[lRun1 * 20 + 13] = acadoWorkspace.state[123];
acadoWorkspace.evGu[lRun1 * 20 + 14] = acadoWorkspace.state[124];
acadoWorkspace.evGu[lRun1 * 20 + 15] = acadoWorkspace.state[125];
acadoWorkspace.evGu[lRun1 * 20 + 16] = acadoWorkspace.state[126];
acadoWorkspace.evGu[lRun1 * 20 + 17] = acadoWorkspace.state[127];
acadoWorkspace.evGu[lRun1 * 20 + 18] = acadoWorkspace.state[128];
acadoWorkspace.evGu[lRun1 * 20 + 19] = acadoWorkspace.state[129];
}
return ret;
}

void acado_evaluateLSQ(const real_t* in, real_t* out)
{
const real_t* xd = in;
const real_t* u = in + 10;

/* Compute outputs: */
out[0] = xd[0];
out[1] = xd[1];
out[2] = xd[2];
out[3] = xd[3];
out[4] = xd[4];
out[5] = xd[5];
out[6] = xd[6];
out[7] = xd[7];
out[8] = xd[8];
out[9] = xd[9];
out[10] = u[0];
out[11] = u[1];
}

void acado_evaluateLSQEndTerm(const real_t* in, real_t* out)
{
const real_t* xd = in;

/* Compute outputs: */
out[0] = xd[0];
out[1] = xd[1];
out[2] = xd[2];
out[3] = xd[3];
out[4] = xd[4];
out[5] = xd[5];
out[6] = xd[6];
out[7] = xd[7];
out[8] = xd[8];
out[9] = xd[9];
}

void acado_setObjQ1Q2( real_t* const tmpObjS, real_t* const tmpQ1, real_t* const tmpQ2 )
{
tmpQ2[0] = +tmpObjS[0];
tmpQ2[1] = +tmpObjS[1];
tmpQ2[2] = +tmpObjS[2];
tmpQ2[3] = +tmpObjS[3];
tmpQ2[4] = +tmpObjS[4];
tmpQ2[5] = +tmpObjS[5];
tmpQ2[6] = +tmpObjS[6];
tmpQ2[7] = +tmpObjS[7];
tmpQ2[8] = +tmpObjS[8];
tmpQ2[9] = +tmpObjS[9];
tmpQ2[10] = +tmpObjS[10];
tmpQ2[11] = +tmpObjS[11];
tmpQ2[12] = +tmpObjS[12];
tmpQ2[13] = +tmpObjS[13];
tmpQ2[14] = +tmpObjS[14];
tmpQ2[15] = +tmpObjS[15];
tmpQ2[16] = +tmpObjS[16];
tmpQ2[17] = +tmpObjS[17];
tmpQ2[18] = +tmpObjS[18];
tmpQ2[19] = +tmpObjS[19];
tmpQ2[20] = +tmpObjS[20];
tmpQ2[21] = +tmpObjS[21];
tmpQ2[22] = +tmpObjS[22];
tmpQ2[23] = +tmpObjS[23];
tmpQ2[24] = +tmpObjS[24];
tmpQ2[25] = +tmpObjS[25];
tmpQ2[26] = +tmpObjS[26];
tmpQ2[27] = +tmpObjS[27];
tmpQ2[28] = +tmpObjS[28];
tmpQ2[29] = +tmpObjS[29];
tmpQ2[30] = +tmpObjS[30];
tmpQ2[31] = +tmpObjS[31];
tmpQ2[32] = +tmpObjS[32];
tmpQ2[33] = +tmpObjS[33];
tmpQ2[34] = +tmpObjS[34];
tmpQ2[35] = +tmpObjS[35];
tmpQ2[36] = +tmpObjS[36];
tmpQ2[37] = +tmpObjS[37];
tmpQ2[38] = +tmpObjS[38];
tmpQ2[39] = +tmpObjS[39];
tmpQ2[40] = +tmpObjS[40];
tmpQ2[41] = +tmpObjS[41];
tmpQ2[42] = +tmpObjS[42];
tmpQ2[43] = +tmpObjS[43];
tmpQ2[44] = +tmpObjS[44];
tmpQ2[45] = +tmpObjS[45];
tmpQ2[46] = +tmpObjS[46];
tmpQ2[47] = +tmpObjS[47];
tmpQ2[48] = +tmpObjS[48];
tmpQ2[49] = +tmpObjS[49];
tmpQ2[50] = +tmpObjS[50];
tmpQ2[51] = +tmpObjS[51];
tmpQ2[52] = +tmpObjS[52];
tmpQ2[53] = +tmpObjS[53];
tmpQ2[54] = +tmpObjS[54];
tmpQ2[55] = +tmpObjS[55];
tmpQ2[56] = +tmpObjS[56];
tmpQ2[57] = +tmpObjS[57];
tmpQ2[58] = +tmpObjS[58];
tmpQ2[59] = +tmpObjS[59];
tmpQ2[60] = +tmpObjS[60];
tmpQ2[61] = +tmpObjS[61];
tmpQ2[62] = +tmpObjS[62];
tmpQ2[63] = +tmpObjS[63];
tmpQ2[64] = +tmpObjS[64];
tmpQ2[65] = +tmpObjS[65];
tmpQ2[66] = +tmpObjS[66];
tmpQ2[67] = +tmpObjS[67];
tmpQ2[68] = +tmpObjS[68];
tmpQ2[69] = +tmpObjS[69];
tmpQ2[70] = +tmpObjS[70];
tmpQ2[71] = +tmpObjS[71];
tmpQ2[72] = +tmpObjS[72];
tmpQ2[73] = +tmpObjS[73];
tmpQ2[74] = +tmpObjS[74];
tmpQ2[75] = +tmpObjS[75];
tmpQ2[76] = +tmpObjS[76];
tmpQ2[77] = +tmpObjS[77];
tmpQ2[78] = +tmpObjS[78];
tmpQ2[79] = +tmpObjS[79];
tmpQ2[80] = +tmpObjS[80];
tmpQ2[81] = +tmpObjS[81];
tmpQ2[82] = +tmpObjS[82];
tmpQ2[83] = +tmpObjS[83];
tmpQ2[84] = +tmpObjS[84];
tmpQ2[85] = +tmpObjS[85];
tmpQ2[86] = +tmpObjS[86];
tmpQ2[87] = +tmpObjS[87];
tmpQ2[88] = +tmpObjS[88];
tmpQ2[89] = +tmpObjS[89];
tmpQ2[90] = +tmpObjS[90];
tmpQ2[91] = +tmpObjS[91];
tmpQ2[92] = +tmpObjS[92];
tmpQ2[93] = +tmpObjS[93];
tmpQ2[94] = +tmpObjS[94];
tmpQ2[95] = +tmpObjS[95];
tmpQ2[96] = +tmpObjS[96];
tmpQ2[97] = +tmpObjS[97];
tmpQ2[98] = +tmpObjS[98];
tmpQ2[99] = +tmpObjS[99];
tmpQ2[100] = +tmpObjS[100];
tmpQ2[101] = +tmpObjS[101];
tmpQ2[102] = +tmpObjS[102];
tmpQ2[103] = +tmpObjS[103];
tmpQ2[104] = +tmpObjS[104];
tmpQ2[105] = +tmpObjS[105];
tmpQ2[106] = +tmpObjS[106];
tmpQ2[107] = +tmpObjS[107];
tmpQ2[108] = +tmpObjS[108];
tmpQ2[109] = +tmpObjS[109];
tmpQ2[110] = +tmpObjS[110];
tmpQ2[111] = +tmpObjS[111];
tmpQ2[112] = +tmpObjS[112];
tmpQ2[113] = +tmpObjS[113];
tmpQ2[114] = +tmpObjS[114];
tmpQ2[115] = +tmpObjS[115];
tmpQ2[116] = +tmpObjS[116];
tmpQ2[117] = +tmpObjS[117];
tmpQ2[118] = +tmpObjS[118];
tmpQ2[119] = +tmpObjS[119];
tmpQ1[0] = + tmpQ2[0];
tmpQ1[1] = + tmpQ2[1];
tmpQ1[2] = + tmpQ2[2];
tmpQ1[3] = + tmpQ2[3];
tmpQ1[4] = + tmpQ2[4];
tmpQ1[5] = + tmpQ2[5];
tmpQ1[6] = + tmpQ2[6];
tmpQ1[7] = + tmpQ2[7];
tmpQ1[8] = + tmpQ2[8];
tmpQ1[9] = + tmpQ2[9];
tmpQ1[10] = + tmpQ2[12];
tmpQ1[11] = + tmpQ2[13];
tmpQ1[12] = + tmpQ2[14];
tmpQ1[13] = + tmpQ2[15];
tmpQ1[14] = + tmpQ2[16];
tmpQ1[15] = + tmpQ2[17];
tmpQ1[16] = + tmpQ2[18];
tmpQ1[17] = + tmpQ2[19];
tmpQ1[18] = + tmpQ2[20];
tmpQ1[19] = + tmpQ2[21];
tmpQ1[20] = + tmpQ2[24];
tmpQ1[21] = + tmpQ2[25];
tmpQ1[22] = + tmpQ2[26];
tmpQ1[23] = + tmpQ2[27];
tmpQ1[24] = + tmpQ2[28];
tmpQ1[25] = + tmpQ2[29];
tmpQ1[26] = + tmpQ2[30];
tmpQ1[27] = + tmpQ2[31];
tmpQ1[28] = + tmpQ2[32];
tmpQ1[29] = + tmpQ2[33];
tmpQ1[30] = + tmpQ2[36];
tmpQ1[31] = + tmpQ2[37];
tmpQ1[32] = + tmpQ2[38];
tmpQ1[33] = + tmpQ2[39];
tmpQ1[34] = + tmpQ2[40];
tmpQ1[35] = + tmpQ2[41];
tmpQ1[36] = + tmpQ2[42];
tmpQ1[37] = + tmpQ2[43];
tmpQ1[38] = + tmpQ2[44];
tmpQ1[39] = + tmpQ2[45];
tmpQ1[40] = + tmpQ2[48];
tmpQ1[41] = + tmpQ2[49];
tmpQ1[42] = + tmpQ2[50];
tmpQ1[43] = + tmpQ2[51];
tmpQ1[44] = + tmpQ2[52];
tmpQ1[45] = + tmpQ2[53];
tmpQ1[46] = + tmpQ2[54];
tmpQ1[47] = + tmpQ2[55];
tmpQ1[48] = + tmpQ2[56];
tmpQ1[49] = + tmpQ2[57];
tmpQ1[50] = + tmpQ2[60];
tmpQ1[51] = + tmpQ2[61];
tmpQ1[52] = + tmpQ2[62];
tmpQ1[53] = + tmpQ2[63];
tmpQ1[54] = + tmpQ2[64];
tmpQ1[55] = + tmpQ2[65];
tmpQ1[56] = + tmpQ2[66];
tmpQ1[57] = + tmpQ2[67];
tmpQ1[58] = + tmpQ2[68];
tmpQ1[59] = + tmpQ2[69];
tmpQ1[60] = + tmpQ2[72];
tmpQ1[61] = + tmpQ2[73];
tmpQ1[62] = + tmpQ2[74];
tmpQ1[63] = + tmpQ2[75];
tmpQ1[64] = + tmpQ2[76];
tmpQ1[65] = + tmpQ2[77];
tmpQ1[66] = + tmpQ2[78];
tmpQ1[67] = + tmpQ2[79];
tmpQ1[68] = + tmpQ2[80];
tmpQ1[69] = + tmpQ2[81];
tmpQ1[70] = + tmpQ2[84];
tmpQ1[71] = + tmpQ2[85];
tmpQ1[72] = + tmpQ2[86];
tmpQ1[73] = + tmpQ2[87];
tmpQ1[74] = + tmpQ2[88];
tmpQ1[75] = + tmpQ2[89];
tmpQ1[76] = + tmpQ2[90];
tmpQ1[77] = + tmpQ2[91];
tmpQ1[78] = + tmpQ2[92];
tmpQ1[79] = + tmpQ2[93];
tmpQ1[80] = + tmpQ2[96];
tmpQ1[81] = + tmpQ2[97];
tmpQ1[82] = + tmpQ2[98];
tmpQ1[83] = + tmpQ2[99];
tmpQ1[84] = + tmpQ2[100];
tmpQ1[85] = + tmpQ2[101];
tmpQ1[86] = + tmpQ2[102];
tmpQ1[87] = + tmpQ2[103];
tmpQ1[88] = + tmpQ2[104];
tmpQ1[89] = + tmpQ2[105];
tmpQ1[90] = + tmpQ2[108];
tmpQ1[91] = + tmpQ2[109];
tmpQ1[92] = + tmpQ2[110];
tmpQ1[93] = + tmpQ2[111];
tmpQ1[94] = + tmpQ2[112];
tmpQ1[95] = + tmpQ2[113];
tmpQ1[96] = + tmpQ2[114];
tmpQ1[97] = + tmpQ2[115];
tmpQ1[98] = + tmpQ2[116];
tmpQ1[99] = + tmpQ2[117];
}

void acado_setObjR1R2( real_t* const tmpObjS, real_t* const tmpR1, real_t* const tmpR2 )
{
tmpR2[0] = +tmpObjS[120];
tmpR2[1] = +tmpObjS[121];
tmpR2[2] = +tmpObjS[122];
tmpR2[3] = +tmpObjS[123];
tmpR2[4] = +tmpObjS[124];
tmpR2[5] = +tmpObjS[125];
tmpR2[6] = +tmpObjS[126];
tmpR2[7] = +tmpObjS[127];
tmpR2[8] = +tmpObjS[128];
tmpR2[9] = +tmpObjS[129];
tmpR2[10] = +tmpObjS[130];
tmpR2[11] = +tmpObjS[131];
tmpR2[12] = +tmpObjS[132];
tmpR2[13] = +tmpObjS[133];
tmpR2[14] = +tmpObjS[134];
tmpR2[15] = +tmpObjS[135];
tmpR2[16] = +tmpObjS[136];
tmpR2[17] = +tmpObjS[137];
tmpR2[18] = +tmpObjS[138];
tmpR2[19] = +tmpObjS[139];
tmpR2[20] = +tmpObjS[140];
tmpR2[21] = +tmpObjS[141];
tmpR2[22] = +tmpObjS[142];
tmpR2[23] = +tmpObjS[143];
tmpR1[0] = + tmpR2[10];
tmpR1[1] = + tmpR2[11];
tmpR1[2] = + tmpR2[22];
tmpR1[3] = + tmpR2[23];
}

void acado_setObjQN1QN2( real_t* const tmpObjSEndTerm, real_t* const tmpQN1, real_t* const tmpQN2 )
{
tmpQN2[0] = +tmpObjSEndTerm[0];
tmpQN2[1] = +tmpObjSEndTerm[1];
tmpQN2[2] = +tmpObjSEndTerm[2];
tmpQN2[3] = +tmpObjSEndTerm[3];
tmpQN2[4] = +tmpObjSEndTerm[4];
tmpQN2[5] = +tmpObjSEndTerm[5];
tmpQN2[6] = +tmpObjSEndTerm[6];
tmpQN2[7] = +tmpObjSEndTerm[7];
tmpQN2[8] = +tmpObjSEndTerm[8];
tmpQN2[9] = +tmpObjSEndTerm[9];
tmpQN2[10] = +tmpObjSEndTerm[10];
tmpQN2[11] = +tmpObjSEndTerm[11];
tmpQN2[12] = +tmpObjSEndTerm[12];
tmpQN2[13] = +tmpObjSEndTerm[13];
tmpQN2[14] = +tmpObjSEndTerm[14];
tmpQN2[15] = +tmpObjSEndTerm[15];
tmpQN2[16] = +tmpObjSEndTerm[16];
tmpQN2[17] = +tmpObjSEndTerm[17];
tmpQN2[18] = +tmpObjSEndTerm[18];
tmpQN2[19] = +tmpObjSEndTerm[19];
tmpQN2[20] = +tmpObjSEndTerm[20];
tmpQN2[21] = +tmpObjSEndTerm[21];
tmpQN2[22] = +tmpObjSEndTerm[22];
tmpQN2[23] = +tmpObjSEndTerm[23];
tmpQN2[24] = +tmpObjSEndTerm[24];
tmpQN2[25] = +tmpObjSEndTerm[25];
tmpQN2[26] = +tmpObjSEndTerm[26];
tmpQN2[27] = +tmpObjSEndTerm[27];
tmpQN2[28] = +tmpObjSEndTerm[28];
tmpQN2[29] = +tmpObjSEndTerm[29];
tmpQN2[30] = +tmpObjSEndTerm[30];
tmpQN2[31] = +tmpObjSEndTerm[31];
tmpQN2[32] = +tmpObjSEndTerm[32];
tmpQN2[33] = +tmpObjSEndTerm[33];
tmpQN2[34] = +tmpObjSEndTerm[34];
tmpQN2[35] = +tmpObjSEndTerm[35];
tmpQN2[36] = +tmpObjSEndTerm[36];
tmpQN2[37] = +tmpObjSEndTerm[37];
tmpQN2[38] = +tmpObjSEndTerm[38];
tmpQN2[39] = +tmpObjSEndTerm[39];
tmpQN2[40] = +tmpObjSEndTerm[40];
tmpQN2[41] = +tmpObjSEndTerm[41];
tmpQN2[42] = +tmpObjSEndTerm[42];
tmpQN2[43] = +tmpObjSEndTerm[43];
tmpQN2[44] = +tmpObjSEndTerm[44];
tmpQN2[45] = +tmpObjSEndTerm[45];
tmpQN2[46] = +tmpObjSEndTerm[46];
tmpQN2[47] = +tmpObjSEndTerm[47];
tmpQN2[48] = +tmpObjSEndTerm[48];
tmpQN2[49] = +tmpObjSEndTerm[49];
tmpQN2[50] = +tmpObjSEndTerm[50];
tmpQN2[51] = +tmpObjSEndTerm[51];
tmpQN2[52] = +tmpObjSEndTerm[52];
tmpQN2[53] = +tmpObjSEndTerm[53];
tmpQN2[54] = +tmpObjSEndTerm[54];
tmpQN2[55] = +tmpObjSEndTerm[55];
tmpQN2[56] = +tmpObjSEndTerm[56];
tmpQN2[57] = +tmpObjSEndTerm[57];
tmpQN2[58] = +tmpObjSEndTerm[58];
tmpQN2[59] = +tmpObjSEndTerm[59];
tmpQN2[60] = +tmpObjSEndTerm[60];
tmpQN2[61] = +tmpObjSEndTerm[61];
tmpQN2[62] = +tmpObjSEndTerm[62];
tmpQN2[63] = +tmpObjSEndTerm[63];
tmpQN2[64] = +tmpObjSEndTerm[64];
tmpQN2[65] = +tmpObjSEndTerm[65];
tmpQN2[66] = +tmpObjSEndTerm[66];
tmpQN2[67] = +tmpObjSEndTerm[67];
tmpQN2[68] = +tmpObjSEndTerm[68];
tmpQN2[69] = +tmpObjSEndTerm[69];
tmpQN2[70] = +tmpObjSEndTerm[70];
tmpQN2[71] = +tmpObjSEndTerm[71];
tmpQN2[72] = +tmpObjSEndTerm[72];
tmpQN2[73] = +tmpObjSEndTerm[73];
tmpQN2[74] = +tmpObjSEndTerm[74];
tmpQN2[75] = +tmpObjSEndTerm[75];
tmpQN2[76] = +tmpObjSEndTerm[76];
tmpQN2[77] = +tmpObjSEndTerm[77];
tmpQN2[78] = +tmpObjSEndTerm[78];
tmpQN2[79] = +tmpObjSEndTerm[79];
tmpQN2[80] = +tmpObjSEndTerm[80];
tmpQN2[81] = +tmpObjSEndTerm[81];
tmpQN2[82] = +tmpObjSEndTerm[82];
tmpQN2[83] = +tmpObjSEndTerm[83];
tmpQN2[84] = +tmpObjSEndTerm[84];
tmpQN2[85] = +tmpObjSEndTerm[85];
tmpQN2[86] = +tmpObjSEndTerm[86];
tmpQN2[87] = +tmpObjSEndTerm[87];
tmpQN2[88] = +tmpObjSEndTerm[88];
tmpQN2[89] = +tmpObjSEndTerm[89];
tmpQN2[90] = +tmpObjSEndTerm[90];
tmpQN2[91] = +tmpObjSEndTerm[91];
tmpQN2[92] = +tmpObjSEndTerm[92];
tmpQN2[93] = +tmpObjSEndTerm[93];
tmpQN2[94] = +tmpObjSEndTerm[94];
tmpQN2[95] = +tmpObjSEndTerm[95];
tmpQN2[96] = +tmpObjSEndTerm[96];
tmpQN2[97] = +tmpObjSEndTerm[97];
tmpQN2[98] = +tmpObjSEndTerm[98];
tmpQN2[99] = +tmpObjSEndTerm[99];
tmpQN1[0] = + tmpQN2[0];
tmpQN1[1] = + tmpQN2[1];
tmpQN1[2] = + tmpQN2[2];
tmpQN1[3] = + tmpQN2[3];
tmpQN1[4] = + tmpQN2[4];
tmpQN1[5] = + tmpQN2[5];
tmpQN1[6] = + tmpQN2[6];
tmpQN1[7] = + tmpQN2[7];
tmpQN1[8] = + tmpQN2[8];
tmpQN1[9] = + tmpQN2[9];
tmpQN1[10] = + tmpQN2[10];
tmpQN1[11] = + tmpQN2[11];
tmpQN1[12] = + tmpQN2[12];
tmpQN1[13] = + tmpQN2[13];
tmpQN1[14] = + tmpQN2[14];
tmpQN1[15] = + tmpQN2[15];
tmpQN1[16] = + tmpQN2[16];
tmpQN1[17] = + tmpQN2[17];
tmpQN1[18] = + tmpQN2[18];
tmpQN1[19] = + tmpQN2[19];
tmpQN1[20] = + tmpQN2[20];
tmpQN1[21] = + tmpQN2[21];
tmpQN1[22] = + tmpQN2[22];
tmpQN1[23] = + tmpQN2[23];
tmpQN1[24] = + tmpQN2[24];
tmpQN1[25] = + tmpQN2[25];
tmpQN1[26] = + tmpQN2[26];
tmpQN1[27] = + tmpQN2[27];
tmpQN1[28] = + tmpQN2[28];
tmpQN1[29] = + tmpQN2[29];
tmpQN1[30] = + tmpQN2[30];
tmpQN1[31] = + tmpQN2[31];
tmpQN1[32] = + tmpQN2[32];
tmpQN1[33] = + tmpQN2[33];
tmpQN1[34] = + tmpQN2[34];
tmpQN1[35] = + tmpQN2[35];
tmpQN1[36] = + tmpQN2[36];
tmpQN1[37] = + tmpQN2[37];
tmpQN1[38] = + tmpQN2[38];
tmpQN1[39] = + tmpQN2[39];
tmpQN1[40] = + tmpQN2[40];
tmpQN1[41] = + tmpQN2[41];
tmpQN1[42] = + tmpQN2[42];
tmpQN1[43] = + tmpQN2[43];
tmpQN1[44] = + tmpQN2[44];
tmpQN1[45] = + tmpQN2[45];
tmpQN1[46] = + tmpQN2[46];
tmpQN1[47] = + tmpQN2[47];
tmpQN1[48] = + tmpQN2[48];
tmpQN1[49] = + tmpQN2[49];
tmpQN1[50] = + tmpQN2[50];
tmpQN1[51] = + tmpQN2[51];
tmpQN1[52] = + tmpQN2[52];
tmpQN1[53] = + tmpQN2[53];
tmpQN1[54] = + tmpQN2[54];
tmpQN1[55] = + tmpQN2[55];
tmpQN1[56] = + tmpQN2[56];
tmpQN1[57] = + tmpQN2[57];
tmpQN1[58] = + tmpQN2[58];
tmpQN1[59] = + tmpQN2[59];
tmpQN1[60] = + tmpQN2[60];
tmpQN1[61] = + tmpQN2[61];
tmpQN1[62] = + tmpQN2[62];
tmpQN1[63] = + tmpQN2[63];
tmpQN1[64] = + tmpQN2[64];
tmpQN1[65] = + tmpQN2[65];
tmpQN1[66] = + tmpQN2[66];
tmpQN1[67] = + tmpQN2[67];
tmpQN1[68] = + tmpQN2[68];
tmpQN1[69] = + tmpQN2[69];
tmpQN1[70] = + tmpQN2[70];
tmpQN1[71] = + tmpQN2[71];
tmpQN1[72] = + tmpQN2[72];
tmpQN1[73] = + tmpQN2[73];
tmpQN1[74] = + tmpQN2[74];
tmpQN1[75] = + tmpQN2[75];
tmpQN1[76] = + tmpQN2[76];
tmpQN1[77] = + tmpQN2[77];
tmpQN1[78] = + tmpQN2[78];
tmpQN1[79] = + tmpQN2[79];
tmpQN1[80] = + tmpQN2[80];
tmpQN1[81] = + tmpQN2[81];
tmpQN1[82] = + tmpQN2[82];
tmpQN1[83] = + tmpQN2[83];
tmpQN1[84] = + tmpQN2[84];
tmpQN1[85] = + tmpQN2[85];
tmpQN1[86] = + tmpQN2[86];
tmpQN1[87] = + tmpQN2[87];
tmpQN1[88] = + tmpQN2[88];
tmpQN1[89] = + tmpQN2[89];
tmpQN1[90] = + tmpQN2[90];
tmpQN1[91] = + tmpQN2[91];
tmpQN1[92] = + tmpQN2[92];
tmpQN1[93] = + tmpQN2[93];
tmpQN1[94] = + tmpQN2[94];
tmpQN1[95] = + tmpQN2[95];
tmpQN1[96] = + tmpQN2[96];
tmpQN1[97] = + tmpQN2[97];
tmpQN1[98] = + tmpQN2[98];
tmpQN1[99] = + tmpQN2[99];
}

void acado_evaluateObjective(  )
{
int runObj;
for (runObj = 0; runObj < 10; ++runObj)
{
acadoWorkspace.objValueIn[0] = acadoVariables.x[runObj * 10];
acadoWorkspace.objValueIn[1] = acadoVariables.x[runObj * 10 + 1];
acadoWorkspace.objValueIn[2] = acadoVariables.x[runObj * 10 + 2];
acadoWorkspace.objValueIn[3] = acadoVariables.x[runObj * 10 + 3];
acadoWorkspace.objValueIn[4] = acadoVariables.x[runObj * 10 + 4];
acadoWorkspace.objValueIn[5] = acadoVariables.x[runObj * 10 + 5];
acadoWorkspace.objValueIn[6] = acadoVariables.x[runObj * 10 + 6];
acadoWorkspace.objValueIn[7] = acadoVariables.x[runObj * 10 + 7];
acadoWorkspace.objValueIn[8] = acadoVariables.x[runObj * 10 + 8];
acadoWorkspace.objValueIn[9] = acadoVariables.x[runObj * 10 + 9];
acadoWorkspace.objValueIn[10] = acadoVariables.u[runObj * 2];
acadoWorkspace.objValueIn[11] = acadoVariables.u[runObj * 2 + 1];

acado_evaluateLSQ( acadoWorkspace.objValueIn, acadoWorkspace.objValueOut );
acadoWorkspace.Dy[runObj * 12] = acadoWorkspace.objValueOut[0];
acadoWorkspace.Dy[runObj * 12 + 1] = acadoWorkspace.objValueOut[1];
acadoWorkspace.Dy[runObj * 12 + 2] = acadoWorkspace.objValueOut[2];
acadoWorkspace.Dy[runObj * 12 + 3] = acadoWorkspace.objValueOut[3];
acadoWorkspace.Dy[runObj * 12 + 4] = acadoWorkspace.objValueOut[4];
acadoWorkspace.Dy[runObj * 12 + 5] = acadoWorkspace.objValueOut[5];
acadoWorkspace.Dy[runObj * 12 + 6] = acadoWorkspace.objValueOut[6];
acadoWorkspace.Dy[runObj * 12 + 7] = acadoWorkspace.objValueOut[7];
acadoWorkspace.Dy[runObj * 12 + 8] = acadoWorkspace.objValueOut[8];
acadoWorkspace.Dy[runObj * 12 + 9] = acadoWorkspace.objValueOut[9];
acadoWorkspace.Dy[runObj * 12 + 10] = acadoWorkspace.objValueOut[10];
acadoWorkspace.Dy[runObj * 12 + 11] = acadoWorkspace.objValueOut[11];

acado_setObjQ1Q2( acadoVariables.W, &(acadoWorkspace.Q1[ runObj * 100 ]), &(acadoWorkspace.Q2[ runObj * 120 ]) );

acado_setObjR1R2( acadoVariables.W, &(acadoWorkspace.R1[ runObj * 4 ]), &(acadoWorkspace.R2[ runObj * 24 ]) );

}
acadoWorkspace.objValueIn[0] = acadoVariables.x[100];
acadoWorkspace.objValueIn[1] = acadoVariables.x[101];
acadoWorkspace.objValueIn[2] = acadoVariables.x[102];
acadoWorkspace.objValueIn[3] = acadoVariables.x[103];
acadoWorkspace.objValueIn[4] = acadoVariables.x[104];
acadoWorkspace.objValueIn[5] = acadoVariables.x[105];
acadoWorkspace.objValueIn[6] = acadoVariables.x[106];
acadoWorkspace.objValueIn[7] = acadoVariables.x[107];
acadoWorkspace.objValueIn[8] = acadoVariables.x[108];
acadoWorkspace.objValueIn[9] = acadoVariables.x[109];
acado_evaluateLSQEndTerm( acadoWorkspace.objValueIn, acadoWorkspace.objValueOut );

acadoWorkspace.DyN[0] = acadoWorkspace.objValueOut[0];
acadoWorkspace.DyN[1] = acadoWorkspace.objValueOut[1];
acadoWorkspace.DyN[2] = acadoWorkspace.objValueOut[2];
acadoWorkspace.DyN[3] = acadoWorkspace.objValueOut[3];
acadoWorkspace.DyN[4] = acadoWorkspace.objValueOut[4];
acadoWorkspace.DyN[5] = acadoWorkspace.objValueOut[5];
acadoWorkspace.DyN[6] = acadoWorkspace.objValueOut[6];
acadoWorkspace.DyN[7] = acadoWorkspace.objValueOut[7];
acadoWorkspace.DyN[8] = acadoWorkspace.objValueOut[8];
acadoWorkspace.DyN[9] = acadoWorkspace.objValueOut[9];

acado_setObjQN1QN2( acadoVariables.WN, acadoWorkspace.QN1, acadoWorkspace.QN2 );

}

void acado_multGxGu( real_t* const Gx1, real_t* const Gu1, real_t* const Gu2 )
{
Gu2[0] = + Gx1[0]*Gu1[0] + Gx1[1]*Gu1[2] + Gx1[2]*Gu1[4] + Gx1[3]*Gu1[6] + Gx1[4]*Gu1[8] + Gx1[5]*Gu1[10] + Gx1[6]*Gu1[12] + Gx1[7]*Gu1[14] + Gx1[8]*Gu1[16] + Gx1[9]*Gu1[18];
Gu2[1] = + Gx1[0]*Gu1[1] + Gx1[1]*Gu1[3] + Gx1[2]*Gu1[5] + Gx1[3]*Gu1[7] + Gx1[4]*Gu1[9] + Gx1[5]*Gu1[11] + Gx1[6]*Gu1[13] + Gx1[7]*Gu1[15] + Gx1[8]*Gu1[17] + Gx1[9]*Gu1[19];
Gu2[2] = + Gx1[10]*Gu1[0] + Gx1[11]*Gu1[2] + Gx1[12]*Gu1[4] + Gx1[13]*Gu1[6] + Gx1[14]*Gu1[8] + Gx1[15]*Gu1[10] + Gx1[16]*Gu1[12] + Gx1[17]*Gu1[14] + Gx1[18]*Gu1[16] + Gx1[19]*Gu1[18];
Gu2[3] = + Gx1[10]*Gu1[1] + Gx1[11]*Gu1[3] + Gx1[12]*Gu1[5] + Gx1[13]*Gu1[7] + Gx1[14]*Gu1[9] + Gx1[15]*Gu1[11] + Gx1[16]*Gu1[13] + Gx1[17]*Gu1[15] + Gx1[18]*Gu1[17] + Gx1[19]*Gu1[19];
Gu2[4] = + Gx1[20]*Gu1[0] + Gx1[21]*Gu1[2] + Gx1[22]*Gu1[4] + Gx1[23]*Gu1[6] + Gx1[24]*Gu1[8] + Gx1[25]*Gu1[10] + Gx1[26]*Gu1[12] + Gx1[27]*Gu1[14] + Gx1[28]*Gu1[16] + Gx1[29]*Gu1[18];
Gu2[5] = + Gx1[20]*Gu1[1] + Gx1[21]*Gu1[3] + Gx1[22]*Gu1[5] + Gx1[23]*Gu1[7] + Gx1[24]*Gu1[9] + Gx1[25]*Gu1[11] + Gx1[26]*Gu1[13] + Gx1[27]*Gu1[15] + Gx1[28]*Gu1[17] + Gx1[29]*Gu1[19];
Gu2[6] = + Gx1[30]*Gu1[0] + Gx1[31]*Gu1[2] + Gx1[32]*Gu1[4] + Gx1[33]*Gu1[6] + Gx1[34]*Gu1[8] + Gx1[35]*Gu1[10] + Gx1[36]*Gu1[12] + Gx1[37]*Gu1[14] + Gx1[38]*Gu1[16] + Gx1[39]*Gu1[18];
Gu2[7] = + Gx1[30]*Gu1[1] + Gx1[31]*Gu1[3] + Gx1[32]*Gu1[5] + Gx1[33]*Gu1[7] + Gx1[34]*Gu1[9] + Gx1[35]*Gu1[11] + Gx1[36]*Gu1[13] + Gx1[37]*Gu1[15] + Gx1[38]*Gu1[17] + Gx1[39]*Gu1[19];
Gu2[8] = + Gx1[40]*Gu1[0] + Gx1[41]*Gu1[2] + Gx1[42]*Gu1[4] + Gx1[43]*Gu1[6] + Gx1[44]*Gu1[8] + Gx1[45]*Gu1[10] + Gx1[46]*Gu1[12] + Gx1[47]*Gu1[14] + Gx1[48]*Gu1[16] + Gx1[49]*Gu1[18];
Gu2[9] = + Gx1[40]*Gu1[1] + Gx1[41]*Gu1[3] + Gx1[42]*Gu1[5] + Gx1[43]*Gu1[7] + Gx1[44]*Gu1[9] + Gx1[45]*Gu1[11] + Gx1[46]*Gu1[13] + Gx1[47]*Gu1[15] + Gx1[48]*Gu1[17] + Gx1[49]*Gu1[19];
Gu2[10] = + Gx1[50]*Gu1[0] + Gx1[51]*Gu1[2] + Gx1[52]*Gu1[4] + Gx1[53]*Gu1[6] + Gx1[54]*Gu1[8] + Gx1[55]*Gu1[10] + Gx1[56]*Gu1[12] + Gx1[57]*Gu1[14] + Gx1[58]*Gu1[16] + Gx1[59]*Gu1[18];
Gu2[11] = + Gx1[50]*Gu1[1] + Gx1[51]*Gu1[3] + Gx1[52]*Gu1[5] + Gx1[53]*Gu1[7] + Gx1[54]*Gu1[9] + Gx1[55]*Gu1[11] + Gx1[56]*Gu1[13] + Gx1[57]*Gu1[15] + Gx1[58]*Gu1[17] + Gx1[59]*Gu1[19];
Gu2[12] = + Gx1[60]*Gu1[0] + Gx1[61]*Gu1[2] + Gx1[62]*Gu1[4] + Gx1[63]*Gu1[6] + Gx1[64]*Gu1[8] + Gx1[65]*Gu1[10] + Gx1[66]*Gu1[12] + Gx1[67]*Gu1[14] + Gx1[68]*Gu1[16] + Gx1[69]*Gu1[18];
Gu2[13] = + Gx1[60]*Gu1[1] + Gx1[61]*Gu1[3] + Gx1[62]*Gu1[5] + Gx1[63]*Gu1[7] + Gx1[64]*Gu1[9] + Gx1[65]*Gu1[11] + Gx1[66]*Gu1[13] + Gx1[67]*Gu1[15] + Gx1[68]*Gu1[17] + Gx1[69]*Gu1[19];
Gu2[14] = + Gx1[70]*Gu1[0] + Gx1[71]*Gu1[2] + Gx1[72]*Gu1[4] + Gx1[73]*Gu1[6] + Gx1[74]*Gu1[8] + Gx1[75]*Gu1[10] + Gx1[76]*Gu1[12] + Gx1[77]*Gu1[14] + Gx1[78]*Gu1[16] + Gx1[79]*Gu1[18];
Gu2[15] = + Gx1[70]*Gu1[1] + Gx1[71]*Gu1[3] + Gx1[72]*Gu1[5] + Gx1[73]*Gu1[7] + Gx1[74]*Gu1[9] + Gx1[75]*Gu1[11] + Gx1[76]*Gu1[13] + Gx1[77]*Gu1[15] + Gx1[78]*Gu1[17] + Gx1[79]*Gu1[19];
Gu2[16] = + Gx1[80]*Gu1[0] + Gx1[81]*Gu1[2] + Gx1[82]*Gu1[4] + Gx1[83]*Gu1[6] + Gx1[84]*Gu1[8] + Gx1[85]*Gu1[10] + Gx1[86]*Gu1[12] + Gx1[87]*Gu1[14] + Gx1[88]*Gu1[16] + Gx1[89]*Gu1[18];
Gu2[17] = + Gx1[80]*Gu1[1] + Gx1[81]*Gu1[3] + Gx1[82]*Gu1[5] + Gx1[83]*Gu1[7] + Gx1[84]*Gu1[9] + Gx1[85]*Gu1[11] + Gx1[86]*Gu1[13] + Gx1[87]*Gu1[15] + Gx1[88]*Gu1[17] + Gx1[89]*Gu1[19];
Gu2[18] = + Gx1[90]*Gu1[0] + Gx1[91]*Gu1[2] + Gx1[92]*Gu1[4] + Gx1[93]*Gu1[6] + Gx1[94]*Gu1[8] + Gx1[95]*Gu1[10] + Gx1[96]*Gu1[12] + Gx1[97]*Gu1[14] + Gx1[98]*Gu1[16] + Gx1[99]*Gu1[18];
Gu2[19] = + Gx1[90]*Gu1[1] + Gx1[91]*Gu1[3] + Gx1[92]*Gu1[5] + Gx1[93]*Gu1[7] + Gx1[94]*Gu1[9] + Gx1[95]*Gu1[11] + Gx1[96]*Gu1[13] + Gx1[97]*Gu1[15] + Gx1[98]*Gu1[17] + Gx1[99]*Gu1[19];
}

void acado_moveGuE( real_t* const Gu1, real_t* const Gu2 )
{
Gu2[0] = Gu1[0];
Gu2[1] = Gu1[1];
Gu2[2] = Gu1[2];
Gu2[3] = Gu1[3];
Gu2[4] = Gu1[4];
Gu2[5] = Gu1[5];
Gu2[6] = Gu1[6];
Gu2[7] = Gu1[7];
Gu2[8] = Gu1[8];
Gu2[9] = Gu1[9];
Gu2[10] = Gu1[10];
Gu2[11] = Gu1[11];
Gu2[12] = Gu1[12];
Gu2[13] = Gu1[13];
Gu2[14] = Gu1[14];
Gu2[15] = Gu1[15];
Gu2[16] = Gu1[16];
Gu2[17] = Gu1[17];
Gu2[18] = Gu1[18];
Gu2[19] = Gu1[19];
}

void acado_multBTW1( real_t* const Gu1, real_t* const Gu2, int iRow, int iCol )
{
acadoWorkspace.H[(iRow * 40) + (iCol * 2)] = + Gu1[0]*Gu2[0] + Gu1[2]*Gu2[2] + Gu1[4]*Gu2[4] + Gu1[6]*Gu2[6] + Gu1[8]*Gu2[8] + Gu1[10]*Gu2[10] + Gu1[12]*Gu2[12] + Gu1[14]*Gu2[14] + Gu1[16]*Gu2[16] + Gu1[18]*Gu2[18];
acadoWorkspace.H[(iRow * 40) + (iCol * 2 + 1)] = + Gu1[0]*Gu2[1] + Gu1[2]*Gu2[3] + Gu1[4]*Gu2[5] + Gu1[6]*Gu2[7] + Gu1[8]*Gu2[9] + Gu1[10]*Gu2[11] + Gu1[12]*Gu2[13] + Gu1[14]*Gu2[15] + Gu1[16]*Gu2[17] + Gu1[18]*Gu2[19];
acadoWorkspace.H[(iRow * 40 + 20) + (iCol * 2)] = + Gu1[1]*Gu2[0] + Gu1[3]*Gu2[2] + Gu1[5]*Gu2[4] + Gu1[7]*Gu2[6] + Gu1[9]*Gu2[8] + Gu1[11]*Gu2[10] + Gu1[13]*Gu2[12] + Gu1[15]*Gu2[14] + Gu1[17]*Gu2[16] + Gu1[19]*Gu2[18];
acadoWorkspace.H[(iRow * 40 + 20) + (iCol * 2 + 1)] = + Gu1[1]*Gu2[1] + Gu1[3]*Gu2[3] + Gu1[5]*Gu2[5] + Gu1[7]*Gu2[7] + Gu1[9]*Gu2[9] + Gu1[11]*Gu2[11] + Gu1[13]*Gu2[13] + Gu1[15]*Gu2[15] + Gu1[17]*Gu2[17] + Gu1[19]*Gu2[19];
}

void acado_multBTW1_R1( real_t* const R11, real_t* const Gu1, real_t* const Gu2, int iRow )
{
acadoWorkspace.H[iRow * 42] = + Gu1[0]*Gu2[0] + Gu1[2]*Gu2[2] + Gu1[4]*Gu2[4] + Gu1[6]*Gu2[6] + Gu1[8]*Gu2[8] + Gu1[10]*Gu2[10] + Gu1[12]*Gu2[12] + Gu1[14]*Gu2[14] + Gu1[16]*Gu2[16] + Gu1[18]*Gu2[18] + R11[0];
acadoWorkspace.H[iRow * 42 + 1] = + Gu1[0]*Gu2[1] + Gu1[2]*Gu2[3] + Gu1[4]*Gu2[5] + Gu1[6]*Gu2[7] + Gu1[8]*Gu2[9] + Gu1[10]*Gu2[11] + Gu1[12]*Gu2[13] + Gu1[14]*Gu2[15] + Gu1[16]*Gu2[17] + Gu1[18]*Gu2[19] + R11[1];
acadoWorkspace.H[iRow * 42 + 20] = + Gu1[1]*Gu2[0] + Gu1[3]*Gu2[2] + Gu1[5]*Gu2[4] + Gu1[7]*Gu2[6] + Gu1[9]*Gu2[8] + Gu1[11]*Gu2[10] + Gu1[13]*Gu2[12] + Gu1[15]*Gu2[14] + Gu1[17]*Gu2[16] + Gu1[19]*Gu2[18] + R11[2];
acadoWorkspace.H[iRow * 42 + 21] = + Gu1[1]*Gu2[1] + Gu1[3]*Gu2[3] + Gu1[5]*Gu2[5] + Gu1[7]*Gu2[7] + Gu1[9]*Gu2[9] + Gu1[11]*Gu2[11] + Gu1[13]*Gu2[13] + Gu1[15]*Gu2[15] + Gu1[17]*Gu2[17] + Gu1[19]*Gu2[19] + R11[3];
}

void acado_multGxTGu( real_t* const Gx1, real_t* const Gu1, real_t* const Gu2 )
{
Gu2[0] = + Gx1[0]*Gu1[0] + Gx1[10]*Gu1[2] + Gx1[20]*Gu1[4] + Gx1[30]*Gu1[6] + Gx1[40]*Gu1[8] + Gx1[50]*Gu1[10] + Gx1[60]*Gu1[12] + Gx1[70]*Gu1[14] + Gx1[80]*Gu1[16] + Gx1[90]*Gu1[18];
Gu2[1] = + Gx1[0]*Gu1[1] + Gx1[10]*Gu1[3] + Gx1[20]*Gu1[5] + Gx1[30]*Gu1[7] + Gx1[40]*Gu1[9] + Gx1[50]*Gu1[11] + Gx1[60]*Gu1[13] + Gx1[70]*Gu1[15] + Gx1[80]*Gu1[17] + Gx1[90]*Gu1[19];
Gu2[2] = + Gx1[1]*Gu1[0] + Gx1[11]*Gu1[2] + Gx1[21]*Gu1[4] + Gx1[31]*Gu1[6] + Gx1[41]*Gu1[8] + Gx1[51]*Gu1[10] + Gx1[61]*Gu1[12] + Gx1[71]*Gu1[14] + Gx1[81]*Gu1[16] + Gx1[91]*Gu1[18];
Gu2[3] = + Gx1[1]*Gu1[1] + Gx1[11]*Gu1[3] + Gx1[21]*Gu1[5] + Gx1[31]*Gu1[7] + Gx1[41]*Gu1[9] + Gx1[51]*Gu1[11] + Gx1[61]*Gu1[13] + Gx1[71]*Gu1[15] + Gx1[81]*Gu1[17] + Gx1[91]*Gu1[19];
Gu2[4] = + Gx1[2]*Gu1[0] + Gx1[12]*Gu1[2] + Gx1[22]*Gu1[4] + Gx1[32]*Gu1[6] + Gx1[42]*Gu1[8] + Gx1[52]*Gu1[10] + Gx1[62]*Gu1[12] + Gx1[72]*Gu1[14] + Gx1[82]*Gu1[16] + Gx1[92]*Gu1[18];
Gu2[5] = + Gx1[2]*Gu1[1] + Gx1[12]*Gu1[3] + Gx1[22]*Gu1[5] + Gx1[32]*Gu1[7] + Gx1[42]*Gu1[9] + Gx1[52]*Gu1[11] + Gx1[62]*Gu1[13] + Gx1[72]*Gu1[15] + Gx1[82]*Gu1[17] + Gx1[92]*Gu1[19];
Gu2[6] = + Gx1[3]*Gu1[0] + Gx1[13]*Gu1[2] + Gx1[23]*Gu1[4] + Gx1[33]*Gu1[6] + Gx1[43]*Gu1[8] + Gx1[53]*Gu1[10] + Gx1[63]*Gu1[12] + Gx1[73]*Gu1[14] + Gx1[83]*Gu1[16] + Gx1[93]*Gu1[18];
Gu2[7] = + Gx1[3]*Gu1[1] + Gx1[13]*Gu1[3] + Gx1[23]*Gu1[5] + Gx1[33]*Gu1[7] + Gx1[43]*Gu1[9] + Gx1[53]*Gu1[11] + Gx1[63]*Gu1[13] + Gx1[73]*Gu1[15] + Gx1[83]*Gu1[17] + Gx1[93]*Gu1[19];
Gu2[8] = + Gx1[4]*Gu1[0] + Gx1[14]*Gu1[2] + Gx1[24]*Gu1[4] + Gx1[34]*Gu1[6] + Gx1[44]*Gu1[8] + Gx1[54]*Gu1[10] + Gx1[64]*Gu1[12] + Gx1[74]*Gu1[14] + Gx1[84]*Gu1[16] + Gx1[94]*Gu1[18];
Gu2[9] = + Gx1[4]*Gu1[1] + Gx1[14]*Gu1[3] + Gx1[24]*Gu1[5] + Gx1[34]*Gu1[7] + Gx1[44]*Gu1[9] + Gx1[54]*Gu1[11] + Gx1[64]*Gu1[13] + Gx1[74]*Gu1[15] + Gx1[84]*Gu1[17] + Gx1[94]*Gu1[19];
Gu2[10] = + Gx1[5]*Gu1[0] + Gx1[15]*Gu1[2] + Gx1[25]*Gu1[4] + Gx1[35]*Gu1[6] + Gx1[45]*Gu1[8] + Gx1[55]*Gu1[10] + Gx1[65]*Gu1[12] + Gx1[75]*Gu1[14] + Gx1[85]*Gu1[16] + Gx1[95]*Gu1[18];
Gu2[11] = + Gx1[5]*Gu1[1] + Gx1[15]*Gu1[3] + Gx1[25]*Gu1[5] + Gx1[35]*Gu1[7] + Gx1[45]*Gu1[9] + Gx1[55]*Gu1[11] + Gx1[65]*Gu1[13] + Gx1[75]*Gu1[15] + Gx1[85]*Gu1[17] + Gx1[95]*Gu1[19];
Gu2[12] = + Gx1[6]*Gu1[0] + Gx1[16]*Gu1[2] + Gx1[26]*Gu1[4] + Gx1[36]*Gu1[6] + Gx1[46]*Gu1[8] + Gx1[56]*Gu1[10] + Gx1[66]*Gu1[12] + Gx1[76]*Gu1[14] + Gx1[86]*Gu1[16] + Gx1[96]*Gu1[18];
Gu2[13] = + Gx1[6]*Gu1[1] + Gx1[16]*Gu1[3] + Gx1[26]*Gu1[5] + Gx1[36]*Gu1[7] + Gx1[46]*Gu1[9] + Gx1[56]*Gu1[11] + Gx1[66]*Gu1[13] + Gx1[76]*Gu1[15] + Gx1[86]*Gu1[17] + Gx1[96]*Gu1[19];
Gu2[14] = + Gx1[7]*Gu1[0] + Gx1[17]*Gu1[2] + Gx1[27]*Gu1[4] + Gx1[37]*Gu1[6] + Gx1[47]*Gu1[8] + Gx1[57]*Gu1[10] + Gx1[67]*Gu1[12] + Gx1[77]*Gu1[14] + Gx1[87]*Gu1[16] + Gx1[97]*Gu1[18];
Gu2[15] = + Gx1[7]*Gu1[1] + Gx1[17]*Gu1[3] + Gx1[27]*Gu1[5] + Gx1[37]*Gu1[7] + Gx1[47]*Gu1[9] + Gx1[57]*Gu1[11] + Gx1[67]*Gu1[13] + Gx1[77]*Gu1[15] + Gx1[87]*Gu1[17] + Gx1[97]*Gu1[19];
Gu2[16] = + Gx1[8]*Gu1[0] + Gx1[18]*Gu1[2] + Gx1[28]*Gu1[4] + Gx1[38]*Gu1[6] + Gx1[48]*Gu1[8] + Gx1[58]*Gu1[10] + Gx1[68]*Gu1[12] + Gx1[78]*Gu1[14] + Gx1[88]*Gu1[16] + Gx1[98]*Gu1[18];
Gu2[17] = + Gx1[8]*Gu1[1] + Gx1[18]*Gu1[3] + Gx1[28]*Gu1[5] + Gx1[38]*Gu1[7] + Gx1[48]*Gu1[9] + Gx1[58]*Gu1[11] + Gx1[68]*Gu1[13] + Gx1[78]*Gu1[15] + Gx1[88]*Gu1[17] + Gx1[98]*Gu1[19];
Gu2[18] = + Gx1[9]*Gu1[0] + Gx1[19]*Gu1[2] + Gx1[29]*Gu1[4] + Gx1[39]*Gu1[6] + Gx1[49]*Gu1[8] + Gx1[59]*Gu1[10] + Gx1[69]*Gu1[12] + Gx1[79]*Gu1[14] + Gx1[89]*Gu1[16] + Gx1[99]*Gu1[18];
Gu2[19] = + Gx1[9]*Gu1[1] + Gx1[19]*Gu1[3] + Gx1[29]*Gu1[5] + Gx1[39]*Gu1[7] + Gx1[49]*Gu1[9] + Gx1[59]*Gu1[11] + Gx1[69]*Gu1[13] + Gx1[79]*Gu1[15] + Gx1[89]*Gu1[17] + Gx1[99]*Gu1[19];
}

void acado_multQEW2( real_t* const Q11, real_t* const Gu1, real_t* const Gu2, real_t* const Gu3 )
{
Gu3[0] = + Q11[0]*Gu1[0] + Q11[1]*Gu1[2] + Q11[2]*Gu1[4] + Q11[3]*Gu1[6] + Q11[4]*Gu1[8] + Q11[5]*Gu1[10] + Q11[6]*Gu1[12] + Q11[7]*Gu1[14] + Q11[8]*Gu1[16] + Q11[9]*Gu1[18] + Gu2[0];
Gu3[1] = + Q11[0]*Gu1[1] + Q11[1]*Gu1[3] + Q11[2]*Gu1[5] + Q11[3]*Gu1[7] + Q11[4]*Gu1[9] + Q11[5]*Gu1[11] + Q11[6]*Gu1[13] + Q11[7]*Gu1[15] + Q11[8]*Gu1[17] + Q11[9]*Gu1[19] + Gu2[1];
Gu3[2] = + Q11[10]*Gu1[0] + Q11[11]*Gu1[2] + Q11[12]*Gu1[4] + Q11[13]*Gu1[6] + Q11[14]*Gu1[8] + Q11[15]*Gu1[10] + Q11[16]*Gu1[12] + Q11[17]*Gu1[14] + Q11[18]*Gu1[16] + Q11[19]*Gu1[18] + Gu2[2];
Gu3[3] = + Q11[10]*Gu1[1] + Q11[11]*Gu1[3] + Q11[12]*Gu1[5] + Q11[13]*Gu1[7] + Q11[14]*Gu1[9] + Q11[15]*Gu1[11] + Q11[16]*Gu1[13] + Q11[17]*Gu1[15] + Q11[18]*Gu1[17] + Q11[19]*Gu1[19] + Gu2[3];
Gu3[4] = + Q11[20]*Gu1[0] + Q11[21]*Gu1[2] + Q11[22]*Gu1[4] + Q11[23]*Gu1[6] + Q11[24]*Gu1[8] + Q11[25]*Gu1[10] + Q11[26]*Gu1[12] + Q11[27]*Gu1[14] + Q11[28]*Gu1[16] + Q11[29]*Gu1[18] + Gu2[4];
Gu3[5] = + Q11[20]*Gu1[1] + Q11[21]*Gu1[3] + Q11[22]*Gu1[5] + Q11[23]*Gu1[7] + Q11[24]*Gu1[9] + Q11[25]*Gu1[11] + Q11[26]*Gu1[13] + Q11[27]*Gu1[15] + Q11[28]*Gu1[17] + Q11[29]*Gu1[19] + Gu2[5];
Gu3[6] = + Q11[30]*Gu1[0] + Q11[31]*Gu1[2] + Q11[32]*Gu1[4] + Q11[33]*Gu1[6] + Q11[34]*Gu1[8] + Q11[35]*Gu1[10] + Q11[36]*Gu1[12] + Q11[37]*Gu1[14] + Q11[38]*Gu1[16] + Q11[39]*Gu1[18] + Gu2[6];
Gu3[7] = + Q11[30]*Gu1[1] + Q11[31]*Gu1[3] + Q11[32]*Gu1[5] + Q11[33]*Gu1[7] + Q11[34]*Gu1[9] + Q11[35]*Gu1[11] + Q11[36]*Gu1[13] + Q11[37]*Gu1[15] + Q11[38]*Gu1[17] + Q11[39]*Gu1[19] + Gu2[7];
Gu3[8] = + Q11[40]*Gu1[0] + Q11[41]*Gu1[2] + Q11[42]*Gu1[4] + Q11[43]*Gu1[6] + Q11[44]*Gu1[8] + Q11[45]*Gu1[10] + Q11[46]*Gu1[12] + Q11[47]*Gu1[14] + Q11[48]*Gu1[16] + Q11[49]*Gu1[18] + Gu2[8];
Gu3[9] = + Q11[40]*Gu1[1] + Q11[41]*Gu1[3] + Q11[42]*Gu1[5] + Q11[43]*Gu1[7] + Q11[44]*Gu1[9] + Q11[45]*Gu1[11] + Q11[46]*Gu1[13] + Q11[47]*Gu1[15] + Q11[48]*Gu1[17] + Q11[49]*Gu1[19] + Gu2[9];
Gu3[10] = + Q11[50]*Gu1[0] + Q11[51]*Gu1[2] + Q11[52]*Gu1[4] + Q11[53]*Gu1[6] + Q11[54]*Gu1[8] + Q11[55]*Gu1[10] + Q11[56]*Gu1[12] + Q11[57]*Gu1[14] + Q11[58]*Gu1[16] + Q11[59]*Gu1[18] + Gu2[10];
Gu3[11] = + Q11[50]*Gu1[1] + Q11[51]*Gu1[3] + Q11[52]*Gu1[5] + Q11[53]*Gu1[7] + Q11[54]*Gu1[9] + Q11[55]*Gu1[11] + Q11[56]*Gu1[13] + Q11[57]*Gu1[15] + Q11[58]*Gu1[17] + Q11[59]*Gu1[19] + Gu2[11];
Gu3[12] = + Q11[60]*Gu1[0] + Q11[61]*Gu1[2] + Q11[62]*Gu1[4] + Q11[63]*Gu1[6] + Q11[64]*Gu1[8] + Q11[65]*Gu1[10] + Q11[66]*Gu1[12] + Q11[67]*Gu1[14] + Q11[68]*Gu1[16] + Q11[69]*Gu1[18] + Gu2[12];
Gu3[13] = + Q11[60]*Gu1[1] + Q11[61]*Gu1[3] + Q11[62]*Gu1[5] + Q11[63]*Gu1[7] + Q11[64]*Gu1[9] + Q11[65]*Gu1[11] + Q11[66]*Gu1[13] + Q11[67]*Gu1[15] + Q11[68]*Gu1[17] + Q11[69]*Gu1[19] + Gu2[13];
Gu3[14] = + Q11[70]*Gu1[0] + Q11[71]*Gu1[2] + Q11[72]*Gu1[4] + Q11[73]*Gu1[6] + Q11[74]*Gu1[8] + Q11[75]*Gu1[10] + Q11[76]*Gu1[12] + Q11[77]*Gu1[14] + Q11[78]*Gu1[16] + Q11[79]*Gu1[18] + Gu2[14];
Gu3[15] = + Q11[70]*Gu1[1] + Q11[71]*Gu1[3] + Q11[72]*Gu1[5] + Q11[73]*Gu1[7] + Q11[74]*Gu1[9] + Q11[75]*Gu1[11] + Q11[76]*Gu1[13] + Q11[77]*Gu1[15] + Q11[78]*Gu1[17] + Q11[79]*Gu1[19] + Gu2[15];
Gu3[16] = + Q11[80]*Gu1[0] + Q11[81]*Gu1[2] + Q11[82]*Gu1[4] + Q11[83]*Gu1[6] + Q11[84]*Gu1[8] + Q11[85]*Gu1[10] + Q11[86]*Gu1[12] + Q11[87]*Gu1[14] + Q11[88]*Gu1[16] + Q11[89]*Gu1[18] + Gu2[16];
Gu3[17] = + Q11[80]*Gu1[1] + Q11[81]*Gu1[3] + Q11[82]*Gu1[5] + Q11[83]*Gu1[7] + Q11[84]*Gu1[9] + Q11[85]*Gu1[11] + Q11[86]*Gu1[13] + Q11[87]*Gu1[15] + Q11[88]*Gu1[17] + Q11[89]*Gu1[19] + Gu2[17];
Gu3[18] = + Q11[90]*Gu1[0] + Q11[91]*Gu1[2] + Q11[92]*Gu1[4] + Q11[93]*Gu1[6] + Q11[94]*Gu1[8] + Q11[95]*Gu1[10] + Q11[96]*Gu1[12] + Q11[97]*Gu1[14] + Q11[98]*Gu1[16] + Q11[99]*Gu1[18] + Gu2[18];
Gu3[19] = + Q11[90]*Gu1[1] + Q11[91]*Gu1[3] + Q11[92]*Gu1[5] + Q11[93]*Gu1[7] + Q11[94]*Gu1[9] + Q11[95]*Gu1[11] + Q11[96]*Gu1[13] + Q11[97]*Gu1[15] + Q11[98]*Gu1[17] + Q11[99]*Gu1[19] + Gu2[19];
}

void acado_macATw1QDy( real_t* const Gx1, real_t* const w11, real_t* const w12, real_t* const w13 )
{
w13[0] = + Gx1[0]*w11[0] + Gx1[10]*w11[1] + Gx1[20]*w11[2] + Gx1[30]*w11[3] + Gx1[40]*w11[4] + Gx1[50]*w11[5] + Gx1[60]*w11[6] + Gx1[70]*w11[7] + Gx1[80]*w11[8] + Gx1[90]*w11[9] + w12[0];
w13[1] = + Gx1[1]*w11[0] + Gx1[11]*w11[1] + Gx1[21]*w11[2] + Gx1[31]*w11[3] + Gx1[41]*w11[4] + Gx1[51]*w11[5] + Gx1[61]*w11[6] + Gx1[71]*w11[7] + Gx1[81]*w11[8] + Gx1[91]*w11[9] + w12[1];
w13[2] = + Gx1[2]*w11[0] + Gx1[12]*w11[1] + Gx1[22]*w11[2] + Gx1[32]*w11[3] + Gx1[42]*w11[4] + Gx1[52]*w11[5] + Gx1[62]*w11[6] + Gx1[72]*w11[7] + Gx1[82]*w11[8] + Gx1[92]*w11[9] + w12[2];
w13[3] = + Gx1[3]*w11[0] + Gx1[13]*w11[1] + Gx1[23]*w11[2] + Gx1[33]*w11[3] + Gx1[43]*w11[4] + Gx1[53]*w11[5] + Gx1[63]*w11[6] + Gx1[73]*w11[7] + Gx1[83]*w11[8] + Gx1[93]*w11[9] + w12[3];
w13[4] = + Gx1[4]*w11[0] + Gx1[14]*w11[1] + Gx1[24]*w11[2] + Gx1[34]*w11[3] + Gx1[44]*w11[4] + Gx1[54]*w11[5] + Gx1[64]*w11[6] + Gx1[74]*w11[7] + Gx1[84]*w11[8] + Gx1[94]*w11[9] + w12[4];
w13[5] = + Gx1[5]*w11[0] + Gx1[15]*w11[1] + Gx1[25]*w11[2] + Gx1[35]*w11[3] + Gx1[45]*w11[4] + Gx1[55]*w11[5] + Gx1[65]*w11[6] + Gx1[75]*w11[7] + Gx1[85]*w11[8] + Gx1[95]*w11[9] + w12[5];
w13[6] = + Gx1[6]*w11[0] + Gx1[16]*w11[1] + Gx1[26]*w11[2] + Gx1[36]*w11[3] + Gx1[46]*w11[4] + Gx1[56]*w11[5] + Gx1[66]*w11[6] + Gx1[76]*w11[7] + Gx1[86]*w11[8] + Gx1[96]*w11[9] + w12[6];
w13[7] = + Gx1[7]*w11[0] + Gx1[17]*w11[1] + Gx1[27]*w11[2] + Gx1[37]*w11[3] + Gx1[47]*w11[4] + Gx1[57]*w11[5] + Gx1[67]*w11[6] + Gx1[77]*w11[7] + Gx1[87]*w11[8] + Gx1[97]*w11[9] + w12[7];
w13[8] = + Gx1[8]*w11[0] + Gx1[18]*w11[1] + Gx1[28]*w11[2] + Gx1[38]*w11[3] + Gx1[48]*w11[4] + Gx1[58]*w11[5] + Gx1[68]*w11[6] + Gx1[78]*w11[7] + Gx1[88]*w11[8] + Gx1[98]*w11[9] + w12[8];
w13[9] = + Gx1[9]*w11[0] + Gx1[19]*w11[1] + Gx1[29]*w11[2] + Gx1[39]*w11[3] + Gx1[49]*w11[4] + Gx1[59]*w11[5] + Gx1[69]*w11[6] + Gx1[79]*w11[7] + Gx1[89]*w11[8] + Gx1[99]*w11[9] + w12[9];
}

void acado_macBTw1( real_t* const Gu1, real_t* const w11, real_t* const U1 )
{
U1[0] += + Gu1[0]*w11[0] + Gu1[2]*w11[1] + Gu1[4]*w11[2] + Gu1[6]*w11[3] + Gu1[8]*w11[4] + Gu1[10]*w11[5] + Gu1[12]*w11[6] + Gu1[14]*w11[7] + Gu1[16]*w11[8] + Gu1[18]*w11[9];
U1[1] += + Gu1[1]*w11[0] + Gu1[3]*w11[1] + Gu1[5]*w11[2] + Gu1[7]*w11[3] + Gu1[9]*w11[4] + Gu1[11]*w11[5] + Gu1[13]*w11[6] + Gu1[15]*w11[7] + Gu1[17]*w11[8] + Gu1[19]*w11[9];
}

void acado_macQSbarW2( real_t* const Q11, real_t* const w11, real_t* const w12, real_t* const w13 )
{
w13[0] = + Q11[0]*w11[0] + Q11[1]*w11[1] + Q11[2]*w11[2] + Q11[3]*w11[3] + Q11[4]*w11[4] + Q11[5]*w11[5] + Q11[6]*w11[6] + Q11[7]*w11[7] + Q11[8]*w11[8] + Q11[9]*w11[9] + w12[0];
w13[1] = + Q11[10]*w11[0] + Q11[11]*w11[1] + Q11[12]*w11[2] + Q11[13]*w11[3] + Q11[14]*w11[4] + Q11[15]*w11[5] + Q11[16]*w11[6] + Q11[17]*w11[7] + Q11[18]*w11[8] + Q11[19]*w11[9] + w12[1];
w13[2] = + Q11[20]*w11[0] + Q11[21]*w11[1] + Q11[22]*w11[2] + Q11[23]*w11[3] + Q11[24]*w11[4] + Q11[25]*w11[5] + Q11[26]*w11[6] + Q11[27]*w11[7] + Q11[28]*w11[8] + Q11[29]*w11[9] + w12[2];
w13[3] = + Q11[30]*w11[0] + Q11[31]*w11[1] + Q11[32]*w11[2] + Q11[33]*w11[3] + Q11[34]*w11[4] + Q11[35]*w11[5] + Q11[36]*w11[6] + Q11[37]*w11[7] + Q11[38]*w11[8] + Q11[39]*w11[9] + w12[3];
w13[4] = + Q11[40]*w11[0] + Q11[41]*w11[1] + Q11[42]*w11[2] + Q11[43]*w11[3] + Q11[44]*w11[4] + Q11[45]*w11[5] + Q11[46]*w11[6] + Q11[47]*w11[7] + Q11[48]*w11[8] + Q11[49]*w11[9] + w12[4];
w13[5] = + Q11[50]*w11[0] + Q11[51]*w11[1] + Q11[52]*w11[2] + Q11[53]*w11[3] + Q11[54]*w11[4] + Q11[55]*w11[5] + Q11[56]*w11[6] + Q11[57]*w11[7] + Q11[58]*w11[8] + Q11[59]*w11[9] + w12[5];
w13[6] = + Q11[60]*w11[0] + Q11[61]*w11[1] + Q11[62]*w11[2] + Q11[63]*w11[3] + Q11[64]*w11[4] + Q11[65]*w11[5] + Q11[66]*w11[6] + Q11[67]*w11[7] + Q11[68]*w11[8] + Q11[69]*w11[9] + w12[6];
w13[7] = + Q11[70]*w11[0] + Q11[71]*w11[1] + Q11[72]*w11[2] + Q11[73]*w11[3] + Q11[74]*w11[4] + Q11[75]*w11[5] + Q11[76]*w11[6] + Q11[77]*w11[7] + Q11[78]*w11[8] + Q11[79]*w11[9] + w12[7];
w13[8] = + Q11[80]*w11[0] + Q11[81]*w11[1] + Q11[82]*w11[2] + Q11[83]*w11[3] + Q11[84]*w11[4] + Q11[85]*w11[5] + Q11[86]*w11[6] + Q11[87]*w11[7] + Q11[88]*w11[8] + Q11[89]*w11[9] + w12[8];
w13[9] = + Q11[90]*w11[0] + Q11[91]*w11[1] + Q11[92]*w11[2] + Q11[93]*w11[3] + Q11[94]*w11[4] + Q11[95]*w11[5] + Q11[96]*w11[6] + Q11[97]*w11[7] + Q11[98]*w11[8] + Q11[99]*w11[9] + w12[9];
}

void acado_macASbar( real_t* const Gx1, real_t* const w11, real_t* const w12 )
{
w12[0] += + Gx1[0]*w11[0] + Gx1[1]*w11[1] + Gx1[2]*w11[2] + Gx1[3]*w11[3] + Gx1[4]*w11[4] + Gx1[5]*w11[5] + Gx1[6]*w11[6] + Gx1[7]*w11[7] + Gx1[8]*w11[8] + Gx1[9]*w11[9];
w12[1] += + Gx1[10]*w11[0] + Gx1[11]*w11[1] + Gx1[12]*w11[2] + Gx1[13]*w11[3] + Gx1[14]*w11[4] + Gx1[15]*w11[5] + Gx1[16]*w11[6] + Gx1[17]*w11[7] + Gx1[18]*w11[8] + Gx1[19]*w11[9];
w12[2] += + Gx1[20]*w11[0] + Gx1[21]*w11[1] + Gx1[22]*w11[2] + Gx1[23]*w11[3] + Gx1[24]*w11[4] + Gx1[25]*w11[5] + Gx1[26]*w11[6] + Gx1[27]*w11[7] + Gx1[28]*w11[8] + Gx1[29]*w11[9];
w12[3] += + Gx1[30]*w11[0] + Gx1[31]*w11[1] + Gx1[32]*w11[2] + Gx1[33]*w11[3] + Gx1[34]*w11[4] + Gx1[35]*w11[5] + Gx1[36]*w11[6] + Gx1[37]*w11[7] + Gx1[38]*w11[8] + Gx1[39]*w11[9];
w12[4] += + Gx1[40]*w11[0] + Gx1[41]*w11[1] + Gx1[42]*w11[2] + Gx1[43]*w11[3] + Gx1[44]*w11[4] + Gx1[45]*w11[5] + Gx1[46]*w11[6] + Gx1[47]*w11[7] + Gx1[48]*w11[8] + Gx1[49]*w11[9];
w12[5] += + Gx1[50]*w11[0] + Gx1[51]*w11[1] + Gx1[52]*w11[2] + Gx1[53]*w11[3] + Gx1[54]*w11[4] + Gx1[55]*w11[5] + Gx1[56]*w11[6] + Gx1[57]*w11[7] + Gx1[58]*w11[8] + Gx1[59]*w11[9];
w12[6] += + Gx1[60]*w11[0] + Gx1[61]*w11[1] + Gx1[62]*w11[2] + Gx1[63]*w11[3] + Gx1[64]*w11[4] + Gx1[65]*w11[5] + Gx1[66]*w11[6] + Gx1[67]*w11[7] + Gx1[68]*w11[8] + Gx1[69]*w11[9];
w12[7] += + Gx1[70]*w11[0] + Gx1[71]*w11[1] + Gx1[72]*w11[2] + Gx1[73]*w11[3] + Gx1[74]*w11[4] + Gx1[75]*w11[5] + Gx1[76]*w11[6] + Gx1[77]*w11[7] + Gx1[78]*w11[8] + Gx1[79]*w11[9];
w12[8] += + Gx1[80]*w11[0] + Gx1[81]*w11[1] + Gx1[82]*w11[2] + Gx1[83]*w11[3] + Gx1[84]*w11[4] + Gx1[85]*w11[5] + Gx1[86]*w11[6] + Gx1[87]*w11[7] + Gx1[88]*w11[8] + Gx1[89]*w11[9];
w12[9] += + Gx1[90]*w11[0] + Gx1[91]*w11[1] + Gx1[92]*w11[2] + Gx1[93]*w11[3] + Gx1[94]*w11[4] + Gx1[95]*w11[5] + Gx1[96]*w11[6] + Gx1[97]*w11[7] + Gx1[98]*w11[8] + Gx1[99]*w11[9];
}

void acado_expansionStep( real_t* const Gx1, real_t* const Gu1, real_t* const U1, real_t* const w11, real_t* const w12 )
{
w12[0] += + Gx1[0]*w11[0] + Gx1[1]*w11[1] + Gx1[2]*w11[2] + Gx1[3]*w11[3] + Gx1[4]*w11[4] + Gx1[5]*w11[5] + Gx1[6]*w11[6] + Gx1[7]*w11[7] + Gx1[8]*w11[8] + Gx1[9]*w11[9];
w12[1] += + Gx1[10]*w11[0] + Gx1[11]*w11[1] + Gx1[12]*w11[2] + Gx1[13]*w11[3] + Gx1[14]*w11[4] + Gx1[15]*w11[5] + Gx1[16]*w11[6] + Gx1[17]*w11[7] + Gx1[18]*w11[8] + Gx1[19]*w11[9];
w12[2] += + Gx1[20]*w11[0] + Gx1[21]*w11[1] + Gx1[22]*w11[2] + Gx1[23]*w11[3] + Gx1[24]*w11[4] + Gx1[25]*w11[5] + Gx1[26]*w11[6] + Gx1[27]*w11[7] + Gx1[28]*w11[8] + Gx1[29]*w11[9];
w12[3] += + Gx1[30]*w11[0] + Gx1[31]*w11[1] + Gx1[32]*w11[2] + Gx1[33]*w11[3] + Gx1[34]*w11[4] + Gx1[35]*w11[5] + Gx1[36]*w11[6] + Gx1[37]*w11[7] + Gx1[38]*w11[8] + Gx1[39]*w11[9];
w12[4] += + Gx1[40]*w11[0] + Gx1[41]*w11[1] + Gx1[42]*w11[2] + Gx1[43]*w11[3] + Gx1[44]*w11[4] + Gx1[45]*w11[5] + Gx1[46]*w11[6] + Gx1[47]*w11[7] + Gx1[48]*w11[8] + Gx1[49]*w11[9];
w12[5] += + Gx1[50]*w11[0] + Gx1[51]*w11[1] + Gx1[52]*w11[2] + Gx1[53]*w11[3] + Gx1[54]*w11[4] + Gx1[55]*w11[5] + Gx1[56]*w11[6] + Gx1[57]*w11[7] + Gx1[58]*w11[8] + Gx1[59]*w11[9];
w12[6] += + Gx1[60]*w11[0] + Gx1[61]*w11[1] + Gx1[62]*w11[2] + Gx1[63]*w11[3] + Gx1[64]*w11[4] + Gx1[65]*w11[5] + Gx1[66]*w11[6] + Gx1[67]*w11[7] + Gx1[68]*w11[8] + Gx1[69]*w11[9];
w12[7] += + Gx1[70]*w11[0] + Gx1[71]*w11[1] + Gx1[72]*w11[2] + Gx1[73]*w11[3] + Gx1[74]*w11[4] + Gx1[75]*w11[5] + Gx1[76]*w11[6] + Gx1[77]*w11[7] + Gx1[78]*w11[8] + Gx1[79]*w11[9];
w12[8] += + Gx1[80]*w11[0] + Gx1[81]*w11[1] + Gx1[82]*w11[2] + Gx1[83]*w11[3] + Gx1[84]*w11[4] + Gx1[85]*w11[5] + Gx1[86]*w11[6] + Gx1[87]*w11[7] + Gx1[88]*w11[8] + Gx1[89]*w11[9];
w12[9] += + Gx1[90]*w11[0] + Gx1[91]*w11[1] + Gx1[92]*w11[2] + Gx1[93]*w11[3] + Gx1[94]*w11[4] + Gx1[95]*w11[5] + Gx1[96]*w11[6] + Gx1[97]*w11[7] + Gx1[98]*w11[8] + Gx1[99]*w11[9];
w12[0] += + Gu1[0]*U1[0] + Gu1[1]*U1[1];
w12[1] += + Gu1[2]*U1[0] + Gu1[3]*U1[1];
w12[2] += + Gu1[4]*U1[0] + Gu1[5]*U1[1];
w12[3] += + Gu1[6]*U1[0] + Gu1[7]*U1[1];
w12[4] += + Gu1[8]*U1[0] + Gu1[9]*U1[1];
w12[5] += + Gu1[10]*U1[0] + Gu1[11]*U1[1];
w12[6] += + Gu1[12]*U1[0] + Gu1[13]*U1[1];
w12[7] += + Gu1[14]*U1[0] + Gu1[15]*U1[1];
w12[8] += + Gu1[16]*U1[0] + Gu1[17]*U1[1];
w12[9] += + Gu1[18]*U1[0] + Gu1[19]*U1[1];
}

void acado_copyHTH( int iRow, int iCol )
{
acadoWorkspace.H[(iRow * 40) + (iCol * 2)] = acadoWorkspace.H[(iCol * 40) + (iRow * 2)];
acadoWorkspace.H[(iRow * 40) + (iCol * 2 + 1)] = acadoWorkspace.H[(iCol * 40 + 20) + (iRow * 2)];
acadoWorkspace.H[(iRow * 40 + 20) + (iCol * 2)] = acadoWorkspace.H[(iCol * 40) + (iRow * 2 + 1)];
acadoWorkspace.H[(iRow * 40 + 20) + (iCol * 2 + 1)] = acadoWorkspace.H[(iCol * 40 + 20) + (iRow * 2 + 1)];
}

void acado_multRDy( real_t* const R2, real_t* const Dy1, real_t* const RDy1 )
{
RDy1[0] = + R2[0]*Dy1[0] + R2[1]*Dy1[1] + R2[2]*Dy1[2] + R2[3]*Dy1[3] + R2[4]*Dy1[4] + R2[5]*Dy1[5] + R2[6]*Dy1[6] + R2[7]*Dy1[7] + R2[8]*Dy1[8] + R2[9]*Dy1[9] + R2[10]*Dy1[10] + R2[11]*Dy1[11];
RDy1[1] = + R2[12]*Dy1[0] + R2[13]*Dy1[1] + R2[14]*Dy1[2] + R2[15]*Dy1[3] + R2[16]*Dy1[4] + R2[17]*Dy1[5] + R2[18]*Dy1[6] + R2[19]*Dy1[7] + R2[20]*Dy1[8] + R2[21]*Dy1[9] + R2[22]*Dy1[10] + R2[23]*Dy1[11];
}

void acado_multQDy( real_t* const Q2, real_t* const Dy1, real_t* const QDy1 )
{
QDy1[0] = + Q2[0]*Dy1[0] + Q2[1]*Dy1[1] + Q2[2]*Dy1[2] + Q2[3]*Dy1[3] + Q2[4]*Dy1[4] + Q2[5]*Dy1[5] + Q2[6]*Dy1[6] + Q2[7]*Dy1[7] + Q2[8]*Dy1[8] + Q2[9]*Dy1[9] + Q2[10]*Dy1[10] + Q2[11]*Dy1[11];
QDy1[1] = + Q2[12]*Dy1[0] + Q2[13]*Dy1[1] + Q2[14]*Dy1[2] + Q2[15]*Dy1[3] + Q2[16]*Dy1[4] + Q2[17]*Dy1[5] + Q2[18]*Dy1[6] + Q2[19]*Dy1[7] + Q2[20]*Dy1[8] + Q2[21]*Dy1[9] + Q2[22]*Dy1[10] + Q2[23]*Dy1[11];
QDy1[2] = + Q2[24]*Dy1[0] + Q2[25]*Dy1[1] + Q2[26]*Dy1[2] + Q2[27]*Dy1[3] + Q2[28]*Dy1[4] + Q2[29]*Dy1[5] + Q2[30]*Dy1[6] + Q2[31]*Dy1[7] + Q2[32]*Dy1[8] + Q2[33]*Dy1[9] + Q2[34]*Dy1[10] + Q2[35]*Dy1[11];
QDy1[3] = + Q2[36]*Dy1[0] + Q2[37]*Dy1[1] + Q2[38]*Dy1[2] + Q2[39]*Dy1[3] + Q2[40]*Dy1[4] + Q2[41]*Dy1[5] + Q2[42]*Dy1[6] + Q2[43]*Dy1[7] + Q2[44]*Dy1[8] + Q2[45]*Dy1[9] + Q2[46]*Dy1[10] + Q2[47]*Dy1[11];
QDy1[4] = + Q2[48]*Dy1[0] + Q2[49]*Dy1[1] + Q2[50]*Dy1[2] + Q2[51]*Dy1[3] + Q2[52]*Dy1[4] + Q2[53]*Dy1[5] + Q2[54]*Dy1[6] + Q2[55]*Dy1[7] + Q2[56]*Dy1[8] + Q2[57]*Dy1[9] + Q2[58]*Dy1[10] + Q2[59]*Dy1[11];
QDy1[5] = + Q2[60]*Dy1[0] + Q2[61]*Dy1[1] + Q2[62]*Dy1[2] + Q2[63]*Dy1[3] + Q2[64]*Dy1[4] + Q2[65]*Dy1[5] + Q2[66]*Dy1[6] + Q2[67]*Dy1[7] + Q2[68]*Dy1[8] + Q2[69]*Dy1[9] + Q2[70]*Dy1[10] + Q2[71]*Dy1[11];
QDy1[6] = + Q2[72]*Dy1[0] + Q2[73]*Dy1[1] + Q2[74]*Dy1[2] + Q2[75]*Dy1[3] + Q2[76]*Dy1[4] + Q2[77]*Dy1[5] + Q2[78]*Dy1[6] + Q2[79]*Dy1[7] + Q2[80]*Dy1[8] + Q2[81]*Dy1[9] + Q2[82]*Dy1[10] + Q2[83]*Dy1[11];
QDy1[7] = + Q2[84]*Dy1[0] + Q2[85]*Dy1[1] + Q2[86]*Dy1[2] + Q2[87]*Dy1[3] + Q2[88]*Dy1[4] + Q2[89]*Dy1[5] + Q2[90]*Dy1[6] + Q2[91]*Dy1[7] + Q2[92]*Dy1[8] + Q2[93]*Dy1[9] + Q2[94]*Dy1[10] + Q2[95]*Dy1[11];
QDy1[8] = + Q2[96]*Dy1[0] + Q2[97]*Dy1[1] + Q2[98]*Dy1[2] + Q2[99]*Dy1[3] + Q2[100]*Dy1[4] + Q2[101]*Dy1[5] + Q2[102]*Dy1[6] + Q2[103]*Dy1[7] + Q2[104]*Dy1[8] + Q2[105]*Dy1[9] + Q2[106]*Dy1[10] + Q2[107]*Dy1[11];
QDy1[9] = + Q2[108]*Dy1[0] + Q2[109]*Dy1[1] + Q2[110]*Dy1[2] + Q2[111]*Dy1[3] + Q2[112]*Dy1[4] + Q2[113]*Dy1[5] + Q2[114]*Dy1[6] + Q2[115]*Dy1[7] + Q2[116]*Dy1[8] + Q2[117]*Dy1[9] + Q2[118]*Dy1[10] + Q2[119]*Dy1[11];
}

void acado_condensePrep(  )
{
int lRun1;
int lRun2;
int lRun3;
int lRun4;
int lRun5;
/** Row vector of size: 70 */
static const int xBoundIndices[ 70 ] = 
{ 10, 11, 13, 14, 15, 18, 19, 20, 21, 23, 24, 25, 28, 29, 30, 31, 33, 34, 35, 38, 39, 40, 41, 43, 44, 45, 48, 49, 50, 51, 53, 54, 55, 58, 59, 60, 61, 63, 64, 65, 68, 69, 70, 71, 73, 74, 75, 78, 79, 80, 81, 83, 84, 85, 88, 89, 90, 91, 93, 94, 95, 98, 99, 100, 101, 103, 104, 105, 108, 109 };
/* Column: 0 */
acado_moveGuE( acadoWorkspace.evGu, acadoWorkspace.E );
acado_multGxGu( &(acadoWorkspace.evGx[ 100 ]), acadoWorkspace.E, &(acadoWorkspace.E[ 20 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 200 ]), &(acadoWorkspace.E[ 20 ]), &(acadoWorkspace.E[ 40 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 300 ]), &(acadoWorkspace.E[ 40 ]), &(acadoWorkspace.E[ 60 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 400 ]), &(acadoWorkspace.E[ 60 ]), &(acadoWorkspace.E[ 80 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.E[ 80 ]), &(acadoWorkspace.E[ 100 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.E[ 100 ]), &(acadoWorkspace.E[ 120 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 120 ]), &(acadoWorkspace.E[ 140 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 140 ]), &(acadoWorkspace.E[ 160 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 160 ]), &(acadoWorkspace.E[ 180 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 180 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 160 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 140 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 120 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.E[ 100 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.W1, 5, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 500 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 500 ]), &(acadoWorkspace.E[ 80 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 80 ]), acadoWorkspace.W1, 4, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 400 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 400 ]), &(acadoWorkspace.E[ 60 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 60 ]), acadoWorkspace.W1, 3, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 300 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 300 ]), &(acadoWorkspace.E[ 40 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 40 ]), acadoWorkspace.W1, 2, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 200 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 200 ]), &(acadoWorkspace.E[ 20 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 20 ]), acadoWorkspace.W1, 1, 0 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 100 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 100 ]), acadoWorkspace.E, acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( acadoWorkspace.R1, acadoWorkspace.evGu, acadoWorkspace.W1, 0 );

/* Column: 1 */
acado_moveGuE( &(acadoWorkspace.evGu[ 20 ]), &(acadoWorkspace.E[ 200 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 200 ]), &(acadoWorkspace.E[ 200 ]), &(acadoWorkspace.E[ 220 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 300 ]), &(acadoWorkspace.E[ 220 ]), &(acadoWorkspace.E[ 240 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 400 ]), &(acadoWorkspace.E[ 240 ]), &(acadoWorkspace.E[ 260 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.E[ 260 ]), &(acadoWorkspace.E[ 280 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.E[ 280 ]), &(acadoWorkspace.E[ 300 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 300 ]), &(acadoWorkspace.E[ 320 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 320 ]), &(acadoWorkspace.E[ 340 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 340 ]), &(acadoWorkspace.E[ 360 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 360 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 340 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 320 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 300 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.E[ 280 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.W1, 5, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 500 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 500 ]), &(acadoWorkspace.E[ 260 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 80 ]), acadoWorkspace.W1, 4, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 400 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 400 ]), &(acadoWorkspace.E[ 240 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 60 ]), acadoWorkspace.W1, 3, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 300 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 300 ]), &(acadoWorkspace.E[ 220 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 40 ]), acadoWorkspace.W1, 2, 1 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 200 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 200 ]), &(acadoWorkspace.E[ 200 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 4 ]), &(acadoWorkspace.evGu[ 20 ]), acadoWorkspace.W1, 1 );

/* Column: 2 */
acado_moveGuE( &(acadoWorkspace.evGu[ 40 ]), &(acadoWorkspace.E[ 380 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 300 ]), &(acadoWorkspace.E[ 380 ]), &(acadoWorkspace.E[ 400 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 400 ]), &(acadoWorkspace.E[ 400 ]), &(acadoWorkspace.E[ 420 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.E[ 420 ]), &(acadoWorkspace.E[ 440 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.E[ 440 ]), &(acadoWorkspace.E[ 460 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 460 ]), &(acadoWorkspace.E[ 480 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 480 ]), &(acadoWorkspace.E[ 500 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 500 ]), &(acadoWorkspace.E[ 520 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 520 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 500 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 480 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 460 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.E[ 440 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.W1, 5, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 500 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 500 ]), &(acadoWorkspace.E[ 420 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 80 ]), acadoWorkspace.W1, 4, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 400 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 400 ]), &(acadoWorkspace.E[ 400 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 60 ]), acadoWorkspace.W1, 3, 2 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 300 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 300 ]), &(acadoWorkspace.E[ 380 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 8 ]), &(acadoWorkspace.evGu[ 40 ]), acadoWorkspace.W1, 2 );

/* Column: 3 */
acado_moveGuE( &(acadoWorkspace.evGu[ 60 ]), &(acadoWorkspace.E[ 540 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 400 ]), &(acadoWorkspace.E[ 540 ]), &(acadoWorkspace.E[ 560 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.E[ 560 ]), &(acadoWorkspace.E[ 580 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.E[ 580 ]), &(acadoWorkspace.E[ 600 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 600 ]), &(acadoWorkspace.E[ 620 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 620 ]), &(acadoWorkspace.E[ 640 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 640 ]), &(acadoWorkspace.E[ 660 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 660 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 3 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 640 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 3 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 620 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 3 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 600 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6, 3 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.E[ 580 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.W1, 5, 3 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 500 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 500 ]), &(acadoWorkspace.E[ 560 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 80 ]), acadoWorkspace.W1, 4, 3 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 400 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 400 ]), &(acadoWorkspace.E[ 540 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 12 ]), &(acadoWorkspace.evGu[ 60 ]), acadoWorkspace.W1, 3 );

/* Column: 4 */
acado_moveGuE( &(acadoWorkspace.evGu[ 80 ]), &(acadoWorkspace.E[ 680 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.E[ 680 ]), &(acadoWorkspace.E[ 700 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.E[ 700 ]), &(acadoWorkspace.E[ 720 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 720 ]), &(acadoWorkspace.E[ 740 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 740 ]), &(acadoWorkspace.E[ 760 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 760 ]), &(acadoWorkspace.E[ 780 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 780 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 4 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 760 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 4 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 740 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 4 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 720 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6, 4 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.E[ 700 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.W1, 5, 4 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 500 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 500 ]), &(acadoWorkspace.E[ 680 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 16 ]), &(acadoWorkspace.evGu[ 80 ]), acadoWorkspace.W1, 4 );

/* Column: 5 */
acado_moveGuE( &(acadoWorkspace.evGu[ 100 ]), &(acadoWorkspace.E[ 800 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.E[ 800 ]), &(acadoWorkspace.E[ 820 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 820 ]), &(acadoWorkspace.E[ 840 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 840 ]), &(acadoWorkspace.E[ 860 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 860 ]), &(acadoWorkspace.E[ 880 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 880 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 5 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 860 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 5 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 840 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 5 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 820 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6, 5 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.E[ 800 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 20 ]), &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.W1, 5 );

/* Column: 6 */
acado_moveGuE( &(acadoWorkspace.evGu[ 120 ]), &(acadoWorkspace.E[ 900 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.E[ 900 ]), &(acadoWorkspace.E[ 920 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 920 ]), &(acadoWorkspace.E[ 940 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 940 ]), &(acadoWorkspace.E[ 960 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 960 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 6 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 940 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 6 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 920 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7, 6 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.E[ 900 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 24 ]), &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.W1, 6 );

/* Column: 7 */
acado_moveGuE( &(acadoWorkspace.evGu[ 140 ]), &(acadoWorkspace.E[ 980 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.E[ 980 ]), &(acadoWorkspace.E[ 1000 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 1000 ]), &(acadoWorkspace.E[ 1020 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 1020 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 7 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 1000 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8, 7 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.E[ 980 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 28 ]), &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.W1, 7 );

/* Column: 8 */
acado_moveGuE( &(acadoWorkspace.evGu[ 160 ]), &(acadoWorkspace.E[ 1040 ]) );
acado_multGxGu( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.E[ 1040 ]), &(acadoWorkspace.E[ 1060 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 1060 ]), acadoWorkspace.W1 );
acado_multBTW1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9, 8 );
acado_multGxTGu( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.W1, acadoWorkspace.W2 );
acado_multQEW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.E[ 1040 ]), acadoWorkspace.W2, acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 32 ]), &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.W1, 8 );

/* Column: 9 */
acado_moveGuE( &(acadoWorkspace.evGu[ 180 ]), &(acadoWorkspace.E[ 1080 ]) );

acado_multGxGu( acadoWorkspace.QN1, &(acadoWorkspace.E[ 1080 ]), acadoWorkspace.W1 );
acado_multBTW1_R1( &(acadoWorkspace.R1[ 36 ]), &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.W1, 9 );

acado_copyHTH( 0, 1 );
acado_copyHTH( 0, 2 );
acado_copyHTH( 1, 2 );
acado_copyHTH( 0, 3 );
acado_copyHTH( 1, 3 );
acado_copyHTH( 2, 3 );
acado_copyHTH( 0, 4 );
acado_copyHTH( 1, 4 );
acado_copyHTH( 2, 4 );
acado_copyHTH( 3, 4 );
acado_copyHTH( 0, 5 );
acado_copyHTH( 1, 5 );
acado_copyHTH( 2, 5 );
acado_copyHTH( 3, 5 );
acado_copyHTH( 4, 5 );
acado_copyHTH( 0, 6 );
acado_copyHTH( 1, 6 );
acado_copyHTH( 2, 6 );
acado_copyHTH( 3, 6 );
acado_copyHTH( 4, 6 );
acado_copyHTH( 5, 6 );
acado_copyHTH( 0, 7 );
acado_copyHTH( 1, 7 );
acado_copyHTH( 2, 7 );
acado_copyHTH( 3, 7 );
acado_copyHTH( 4, 7 );
acado_copyHTH( 5, 7 );
acado_copyHTH( 6, 7 );
acado_copyHTH( 0, 8 );
acado_copyHTH( 1, 8 );
acado_copyHTH( 2, 8 );
acado_copyHTH( 3, 8 );
acado_copyHTH( 4, 8 );
acado_copyHTH( 5, 8 );
acado_copyHTH( 6, 8 );
acado_copyHTH( 7, 8 );
acado_copyHTH( 0, 9 );
acado_copyHTH( 1, 9 );
acado_copyHTH( 2, 9 );
acado_copyHTH( 3, 9 );
acado_copyHTH( 4, 9 );
acado_copyHTH( 5, 9 );
acado_copyHTH( 6, 9 );
acado_copyHTH( 7, 9 );
acado_copyHTH( 8, 9 );

acadoWorkspace.sbar[10] = acadoWorkspace.d[0];
acadoWorkspace.sbar[11] = acadoWorkspace.d[1];
acadoWorkspace.sbar[12] = acadoWorkspace.d[2];
acadoWorkspace.sbar[13] = acadoWorkspace.d[3];
acadoWorkspace.sbar[14] = acadoWorkspace.d[4];
acadoWorkspace.sbar[15] = acadoWorkspace.d[5];
acadoWorkspace.sbar[16] = acadoWorkspace.d[6];
acadoWorkspace.sbar[17] = acadoWorkspace.d[7];
acadoWorkspace.sbar[18] = acadoWorkspace.d[8];
acadoWorkspace.sbar[19] = acadoWorkspace.d[9];
acadoWorkspace.sbar[20] = acadoWorkspace.d[10];
acadoWorkspace.sbar[21] = acadoWorkspace.d[11];
acadoWorkspace.sbar[22] = acadoWorkspace.d[12];
acadoWorkspace.sbar[23] = acadoWorkspace.d[13];
acadoWorkspace.sbar[24] = acadoWorkspace.d[14];
acadoWorkspace.sbar[25] = acadoWorkspace.d[15];
acadoWorkspace.sbar[26] = acadoWorkspace.d[16];
acadoWorkspace.sbar[27] = acadoWorkspace.d[17];
acadoWorkspace.sbar[28] = acadoWorkspace.d[18];
acadoWorkspace.sbar[29] = acadoWorkspace.d[19];
acadoWorkspace.sbar[30] = acadoWorkspace.d[20];
acadoWorkspace.sbar[31] = acadoWorkspace.d[21];
acadoWorkspace.sbar[32] = acadoWorkspace.d[22];
acadoWorkspace.sbar[33] = acadoWorkspace.d[23];
acadoWorkspace.sbar[34] = acadoWorkspace.d[24];
acadoWorkspace.sbar[35] = acadoWorkspace.d[25];
acadoWorkspace.sbar[36] = acadoWorkspace.d[26];
acadoWorkspace.sbar[37] = acadoWorkspace.d[27];
acadoWorkspace.sbar[38] = acadoWorkspace.d[28];
acadoWorkspace.sbar[39] = acadoWorkspace.d[29];
acadoWorkspace.sbar[40] = acadoWorkspace.d[30];
acadoWorkspace.sbar[41] = acadoWorkspace.d[31];
acadoWorkspace.sbar[42] = acadoWorkspace.d[32];
acadoWorkspace.sbar[43] = acadoWorkspace.d[33];
acadoWorkspace.sbar[44] = acadoWorkspace.d[34];
acadoWorkspace.sbar[45] = acadoWorkspace.d[35];
acadoWorkspace.sbar[46] = acadoWorkspace.d[36];
acadoWorkspace.sbar[47] = acadoWorkspace.d[37];
acadoWorkspace.sbar[48] = acadoWorkspace.d[38];
acadoWorkspace.sbar[49] = acadoWorkspace.d[39];
acadoWorkspace.sbar[50] = acadoWorkspace.d[40];
acadoWorkspace.sbar[51] = acadoWorkspace.d[41];
acadoWorkspace.sbar[52] = acadoWorkspace.d[42];
acadoWorkspace.sbar[53] = acadoWorkspace.d[43];
acadoWorkspace.sbar[54] = acadoWorkspace.d[44];
acadoWorkspace.sbar[55] = acadoWorkspace.d[45];
acadoWorkspace.sbar[56] = acadoWorkspace.d[46];
acadoWorkspace.sbar[57] = acadoWorkspace.d[47];
acadoWorkspace.sbar[58] = acadoWorkspace.d[48];
acadoWorkspace.sbar[59] = acadoWorkspace.d[49];
acadoWorkspace.sbar[60] = acadoWorkspace.d[50];
acadoWorkspace.sbar[61] = acadoWorkspace.d[51];
acadoWorkspace.sbar[62] = acadoWorkspace.d[52];
acadoWorkspace.sbar[63] = acadoWorkspace.d[53];
acadoWorkspace.sbar[64] = acadoWorkspace.d[54];
acadoWorkspace.sbar[65] = acadoWorkspace.d[55];
acadoWorkspace.sbar[66] = acadoWorkspace.d[56];
acadoWorkspace.sbar[67] = acadoWorkspace.d[57];
acadoWorkspace.sbar[68] = acadoWorkspace.d[58];
acadoWorkspace.sbar[69] = acadoWorkspace.d[59];
acadoWorkspace.sbar[70] = acadoWorkspace.d[60];
acadoWorkspace.sbar[71] = acadoWorkspace.d[61];
acadoWorkspace.sbar[72] = acadoWorkspace.d[62];
acadoWorkspace.sbar[73] = acadoWorkspace.d[63];
acadoWorkspace.sbar[74] = acadoWorkspace.d[64];
acadoWorkspace.sbar[75] = acadoWorkspace.d[65];
acadoWorkspace.sbar[76] = acadoWorkspace.d[66];
acadoWorkspace.sbar[77] = acadoWorkspace.d[67];
acadoWorkspace.sbar[78] = acadoWorkspace.d[68];
acadoWorkspace.sbar[79] = acadoWorkspace.d[69];
acadoWorkspace.sbar[80] = acadoWorkspace.d[70];
acadoWorkspace.sbar[81] = acadoWorkspace.d[71];
acadoWorkspace.sbar[82] = acadoWorkspace.d[72];
acadoWorkspace.sbar[83] = acadoWorkspace.d[73];
acadoWorkspace.sbar[84] = acadoWorkspace.d[74];
acadoWorkspace.sbar[85] = acadoWorkspace.d[75];
acadoWorkspace.sbar[86] = acadoWorkspace.d[76];
acadoWorkspace.sbar[87] = acadoWorkspace.d[77];
acadoWorkspace.sbar[88] = acadoWorkspace.d[78];
acadoWorkspace.sbar[89] = acadoWorkspace.d[79];
acadoWorkspace.sbar[90] = acadoWorkspace.d[80];
acadoWorkspace.sbar[91] = acadoWorkspace.d[81];
acadoWorkspace.sbar[92] = acadoWorkspace.d[82];
acadoWorkspace.sbar[93] = acadoWorkspace.d[83];
acadoWorkspace.sbar[94] = acadoWorkspace.d[84];
acadoWorkspace.sbar[95] = acadoWorkspace.d[85];
acadoWorkspace.sbar[96] = acadoWorkspace.d[86];
acadoWorkspace.sbar[97] = acadoWorkspace.d[87];
acadoWorkspace.sbar[98] = acadoWorkspace.d[88];
acadoWorkspace.sbar[99] = acadoWorkspace.d[89];
acadoWorkspace.sbar[100] = acadoWorkspace.d[90];
acadoWorkspace.sbar[101] = acadoWorkspace.d[91];
acadoWorkspace.sbar[102] = acadoWorkspace.d[92];
acadoWorkspace.sbar[103] = acadoWorkspace.d[93];
acadoWorkspace.sbar[104] = acadoWorkspace.d[94];
acadoWorkspace.sbar[105] = acadoWorkspace.d[95];
acadoWorkspace.sbar[106] = acadoWorkspace.d[96];
acadoWorkspace.sbar[107] = acadoWorkspace.d[97];
acadoWorkspace.sbar[108] = acadoWorkspace.d[98];
acadoWorkspace.sbar[109] = acadoWorkspace.d[99];
acadoWorkspace.lb[0] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[0];
acadoWorkspace.lb[1] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[1];
acadoWorkspace.lb[2] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[2];
acadoWorkspace.lb[3] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[3];
acadoWorkspace.lb[4] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[4];
acadoWorkspace.lb[5] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[5];
acadoWorkspace.lb[6] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[6];
acadoWorkspace.lb[7] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[7];
acadoWorkspace.lb[8] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[8];
acadoWorkspace.lb[9] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[9];
acadoWorkspace.lb[10] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[10];
acadoWorkspace.lb[11] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[11];
acadoWorkspace.lb[12] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[12];
acadoWorkspace.lb[13] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[13];
acadoWorkspace.lb[14] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[14];
acadoWorkspace.lb[15] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[15];
acadoWorkspace.lb[16] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[16];
acadoWorkspace.lb[17] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[17];
acadoWorkspace.lb[18] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[18];
acadoWorkspace.lb[19] = (real_t)-1.0000000000000000e+01 - acadoVariables.u[19];
acadoWorkspace.ub[0] = (real_t)1.0000000000000000e+01 - acadoVariables.u[0];
acadoWorkspace.ub[1] = (real_t)1.0000000000000000e+01 - acadoVariables.u[1];
acadoWorkspace.ub[2] = (real_t)1.0000000000000000e+01 - acadoVariables.u[2];
acadoWorkspace.ub[3] = (real_t)1.0000000000000000e+01 - acadoVariables.u[3];
acadoWorkspace.ub[4] = (real_t)1.0000000000000000e+01 - acadoVariables.u[4];
acadoWorkspace.ub[5] = (real_t)1.0000000000000000e+01 - acadoVariables.u[5];
acadoWorkspace.ub[6] = (real_t)1.0000000000000000e+01 - acadoVariables.u[6];
acadoWorkspace.ub[7] = (real_t)1.0000000000000000e+01 - acadoVariables.u[7];
acadoWorkspace.ub[8] = (real_t)1.0000000000000000e+01 - acadoVariables.u[8];
acadoWorkspace.ub[9] = (real_t)1.0000000000000000e+01 - acadoVariables.u[9];
acadoWorkspace.ub[10] = (real_t)1.0000000000000000e+01 - acadoVariables.u[10];
acadoWorkspace.ub[11] = (real_t)1.0000000000000000e+01 - acadoVariables.u[11];
acadoWorkspace.ub[12] = (real_t)1.0000000000000000e+01 - acadoVariables.u[12];
acadoWorkspace.ub[13] = (real_t)1.0000000000000000e+01 - acadoVariables.u[13];
acadoWorkspace.ub[14] = (real_t)1.0000000000000000e+01 - acadoVariables.u[14];
acadoWorkspace.ub[15] = (real_t)1.0000000000000000e+01 - acadoVariables.u[15];
acadoWorkspace.ub[16] = (real_t)1.0000000000000000e+01 - acadoVariables.u[16];
acadoWorkspace.ub[17] = (real_t)1.0000000000000000e+01 - acadoVariables.u[17];
acadoWorkspace.ub[18] = (real_t)1.0000000000000000e+01 - acadoVariables.u[18];
acadoWorkspace.ub[19] = (real_t)1.0000000000000000e+01 - acadoVariables.u[19];

for (lRun1 = 0; lRun1 < 70; ++lRun1)
{
lRun3 = xBoundIndices[ lRun1 ] - 10;
lRun4 = ((lRun3) / (10)) + (1);
for (lRun2 = 0; lRun2 < lRun4; ++lRun2)
{
lRun5 = ((((((lRun2) * (lRun2 * -1 + 19)) / (2)) + (lRun4)) - (1)) * (10)) + ((lRun3) % (10));
acadoWorkspace.A[(lRun1 * 20) + (lRun2 * 2)] = acadoWorkspace.E[lRun5 * 2];
acadoWorkspace.A[(lRun1 * 20) + (lRun2 * 2 + 1)] = acadoWorkspace.E[lRun5 * 2 + 1];
}
}

}

void acado_condenseFdb(  )
{
real_t tmp;

acadoWorkspace.Dx0[0] = acadoVariables.x0[0] - acadoVariables.x[0];
acadoWorkspace.Dx0[1] = acadoVariables.x0[1] - acadoVariables.x[1];
acadoWorkspace.Dx0[2] = acadoVariables.x0[2] - acadoVariables.x[2];
acadoWorkspace.Dx0[3] = acadoVariables.x0[3] - acadoVariables.x[3];
acadoWorkspace.Dx0[4] = acadoVariables.x0[4] - acadoVariables.x[4];
acadoWorkspace.Dx0[5] = acadoVariables.x0[5] - acadoVariables.x[5];
acadoWorkspace.Dx0[6] = acadoVariables.x0[6] - acadoVariables.x[6];
acadoWorkspace.Dx0[7] = acadoVariables.x0[7] - acadoVariables.x[7];
acadoWorkspace.Dx0[8] = acadoVariables.x0[8] - acadoVariables.x[8];
acadoWorkspace.Dx0[9] = acadoVariables.x0[9] - acadoVariables.x[9];
acadoWorkspace.Dy[0] -= acadoVariables.y[0];
acadoWorkspace.Dy[1] -= acadoVariables.y[1];
acadoWorkspace.Dy[2] -= acadoVariables.y[2];
acadoWorkspace.Dy[3] -= acadoVariables.y[3];
acadoWorkspace.Dy[4] -= acadoVariables.y[4];
acadoWorkspace.Dy[5] -= acadoVariables.y[5];
acadoWorkspace.Dy[6] -= acadoVariables.y[6];
acadoWorkspace.Dy[7] -= acadoVariables.y[7];
acadoWorkspace.Dy[8] -= acadoVariables.y[8];
acadoWorkspace.Dy[9] -= acadoVariables.y[9];
acadoWorkspace.Dy[10] -= acadoVariables.y[10];
acadoWorkspace.Dy[11] -= acadoVariables.y[11];
acadoWorkspace.Dy[12] -= acadoVariables.y[12];
acadoWorkspace.Dy[13] -= acadoVariables.y[13];
acadoWorkspace.Dy[14] -= acadoVariables.y[14];
acadoWorkspace.Dy[15] -= acadoVariables.y[15];
acadoWorkspace.Dy[16] -= acadoVariables.y[16];
acadoWorkspace.Dy[17] -= acadoVariables.y[17];
acadoWorkspace.Dy[18] -= acadoVariables.y[18];
acadoWorkspace.Dy[19] -= acadoVariables.y[19];
acadoWorkspace.Dy[20] -= acadoVariables.y[20];
acadoWorkspace.Dy[21] -= acadoVariables.y[21];
acadoWorkspace.Dy[22] -= acadoVariables.y[22];
acadoWorkspace.Dy[23] -= acadoVariables.y[23];
acadoWorkspace.Dy[24] -= acadoVariables.y[24];
acadoWorkspace.Dy[25] -= acadoVariables.y[25];
acadoWorkspace.Dy[26] -= acadoVariables.y[26];
acadoWorkspace.Dy[27] -= acadoVariables.y[27];
acadoWorkspace.Dy[28] -= acadoVariables.y[28];
acadoWorkspace.Dy[29] -= acadoVariables.y[29];
acadoWorkspace.Dy[30] -= acadoVariables.y[30];
acadoWorkspace.Dy[31] -= acadoVariables.y[31];
acadoWorkspace.Dy[32] -= acadoVariables.y[32];
acadoWorkspace.Dy[33] -= acadoVariables.y[33];
acadoWorkspace.Dy[34] -= acadoVariables.y[34];
acadoWorkspace.Dy[35] -= acadoVariables.y[35];
acadoWorkspace.Dy[36] -= acadoVariables.y[36];
acadoWorkspace.Dy[37] -= acadoVariables.y[37];
acadoWorkspace.Dy[38] -= acadoVariables.y[38];
acadoWorkspace.Dy[39] -= acadoVariables.y[39];
acadoWorkspace.Dy[40] -= acadoVariables.y[40];
acadoWorkspace.Dy[41] -= acadoVariables.y[41];
acadoWorkspace.Dy[42] -= acadoVariables.y[42];
acadoWorkspace.Dy[43] -= acadoVariables.y[43];
acadoWorkspace.Dy[44] -= acadoVariables.y[44];
acadoWorkspace.Dy[45] -= acadoVariables.y[45];
acadoWorkspace.Dy[46] -= acadoVariables.y[46];
acadoWorkspace.Dy[47] -= acadoVariables.y[47];
acadoWorkspace.Dy[48] -= acadoVariables.y[48];
acadoWorkspace.Dy[49] -= acadoVariables.y[49];
acadoWorkspace.Dy[50] -= acadoVariables.y[50];
acadoWorkspace.Dy[51] -= acadoVariables.y[51];
acadoWorkspace.Dy[52] -= acadoVariables.y[52];
acadoWorkspace.Dy[53] -= acadoVariables.y[53];
acadoWorkspace.Dy[54] -= acadoVariables.y[54];
acadoWorkspace.Dy[55] -= acadoVariables.y[55];
acadoWorkspace.Dy[56] -= acadoVariables.y[56];
acadoWorkspace.Dy[57] -= acadoVariables.y[57];
acadoWorkspace.Dy[58] -= acadoVariables.y[58];
acadoWorkspace.Dy[59] -= acadoVariables.y[59];
acadoWorkspace.Dy[60] -= acadoVariables.y[60];
acadoWorkspace.Dy[61] -= acadoVariables.y[61];
acadoWorkspace.Dy[62] -= acadoVariables.y[62];
acadoWorkspace.Dy[63] -= acadoVariables.y[63];
acadoWorkspace.Dy[64] -= acadoVariables.y[64];
acadoWorkspace.Dy[65] -= acadoVariables.y[65];
acadoWorkspace.Dy[66] -= acadoVariables.y[66];
acadoWorkspace.Dy[67] -= acadoVariables.y[67];
acadoWorkspace.Dy[68] -= acadoVariables.y[68];
acadoWorkspace.Dy[69] -= acadoVariables.y[69];
acadoWorkspace.Dy[70] -= acadoVariables.y[70];
acadoWorkspace.Dy[71] -= acadoVariables.y[71];
acadoWorkspace.Dy[72] -= acadoVariables.y[72];
acadoWorkspace.Dy[73] -= acadoVariables.y[73];
acadoWorkspace.Dy[74] -= acadoVariables.y[74];
acadoWorkspace.Dy[75] -= acadoVariables.y[75];
acadoWorkspace.Dy[76] -= acadoVariables.y[76];
acadoWorkspace.Dy[77] -= acadoVariables.y[77];
acadoWorkspace.Dy[78] -= acadoVariables.y[78];
acadoWorkspace.Dy[79] -= acadoVariables.y[79];
acadoWorkspace.Dy[80] -= acadoVariables.y[80];
acadoWorkspace.Dy[81] -= acadoVariables.y[81];
acadoWorkspace.Dy[82] -= acadoVariables.y[82];
acadoWorkspace.Dy[83] -= acadoVariables.y[83];
acadoWorkspace.Dy[84] -= acadoVariables.y[84];
acadoWorkspace.Dy[85] -= acadoVariables.y[85];
acadoWorkspace.Dy[86] -= acadoVariables.y[86];
acadoWorkspace.Dy[87] -= acadoVariables.y[87];
acadoWorkspace.Dy[88] -= acadoVariables.y[88];
acadoWorkspace.Dy[89] -= acadoVariables.y[89];
acadoWorkspace.Dy[90] -= acadoVariables.y[90];
acadoWorkspace.Dy[91] -= acadoVariables.y[91];
acadoWorkspace.Dy[92] -= acadoVariables.y[92];
acadoWorkspace.Dy[93] -= acadoVariables.y[93];
acadoWorkspace.Dy[94] -= acadoVariables.y[94];
acadoWorkspace.Dy[95] -= acadoVariables.y[95];
acadoWorkspace.Dy[96] -= acadoVariables.y[96];
acadoWorkspace.Dy[97] -= acadoVariables.y[97];
acadoWorkspace.Dy[98] -= acadoVariables.y[98];
acadoWorkspace.Dy[99] -= acadoVariables.y[99];
acadoWorkspace.Dy[100] -= acadoVariables.y[100];
acadoWorkspace.Dy[101] -= acadoVariables.y[101];
acadoWorkspace.Dy[102] -= acadoVariables.y[102];
acadoWorkspace.Dy[103] -= acadoVariables.y[103];
acadoWorkspace.Dy[104] -= acadoVariables.y[104];
acadoWorkspace.Dy[105] -= acadoVariables.y[105];
acadoWorkspace.Dy[106] -= acadoVariables.y[106];
acadoWorkspace.Dy[107] -= acadoVariables.y[107];
acadoWorkspace.Dy[108] -= acadoVariables.y[108];
acadoWorkspace.Dy[109] -= acadoVariables.y[109];
acadoWorkspace.Dy[110] -= acadoVariables.y[110];
acadoWorkspace.Dy[111] -= acadoVariables.y[111];
acadoWorkspace.Dy[112] -= acadoVariables.y[112];
acadoWorkspace.Dy[113] -= acadoVariables.y[113];
acadoWorkspace.Dy[114] -= acadoVariables.y[114];
acadoWorkspace.Dy[115] -= acadoVariables.y[115];
acadoWorkspace.Dy[116] -= acadoVariables.y[116];
acadoWorkspace.Dy[117] -= acadoVariables.y[117];
acadoWorkspace.Dy[118] -= acadoVariables.y[118];
acadoWorkspace.Dy[119] -= acadoVariables.y[119];
acadoWorkspace.DyN[0] -= acadoVariables.yN[0];
acadoWorkspace.DyN[1] -= acadoVariables.yN[1];
acadoWorkspace.DyN[2] -= acadoVariables.yN[2];
acadoWorkspace.DyN[3] -= acadoVariables.yN[3];
acadoWorkspace.DyN[4] -= acadoVariables.yN[4];
acadoWorkspace.DyN[5] -= acadoVariables.yN[5];
acadoWorkspace.DyN[6] -= acadoVariables.yN[6];
acadoWorkspace.DyN[7] -= acadoVariables.yN[7];
acadoWorkspace.DyN[8] -= acadoVariables.yN[8];
acadoWorkspace.DyN[9] -= acadoVariables.yN[9];

acado_multRDy( acadoWorkspace.R2, acadoWorkspace.Dy, acadoWorkspace.g );
acado_multRDy( &(acadoWorkspace.R2[ 24 ]), &(acadoWorkspace.Dy[ 12 ]), &(acadoWorkspace.g[ 2 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 48 ]), &(acadoWorkspace.Dy[ 24 ]), &(acadoWorkspace.g[ 4 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 72 ]), &(acadoWorkspace.Dy[ 36 ]), &(acadoWorkspace.g[ 6 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 96 ]), &(acadoWorkspace.Dy[ 48 ]), &(acadoWorkspace.g[ 8 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 120 ]), &(acadoWorkspace.Dy[ 60 ]), &(acadoWorkspace.g[ 10 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 144 ]), &(acadoWorkspace.Dy[ 72 ]), &(acadoWorkspace.g[ 12 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 168 ]), &(acadoWorkspace.Dy[ 84 ]), &(acadoWorkspace.g[ 14 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 192 ]), &(acadoWorkspace.Dy[ 96 ]), &(acadoWorkspace.g[ 16 ]) );
acado_multRDy( &(acadoWorkspace.R2[ 216 ]), &(acadoWorkspace.Dy[ 108 ]), &(acadoWorkspace.g[ 18 ]) );

acado_multQDy( acadoWorkspace.Q2, acadoWorkspace.Dy, acadoWorkspace.QDy );
acado_multQDy( &(acadoWorkspace.Q2[ 120 ]), &(acadoWorkspace.Dy[ 12 ]), &(acadoWorkspace.QDy[ 10 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 240 ]), &(acadoWorkspace.Dy[ 24 ]), &(acadoWorkspace.QDy[ 20 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 360 ]), &(acadoWorkspace.Dy[ 36 ]), &(acadoWorkspace.QDy[ 30 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 480 ]), &(acadoWorkspace.Dy[ 48 ]), &(acadoWorkspace.QDy[ 40 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 600 ]), &(acadoWorkspace.Dy[ 60 ]), &(acadoWorkspace.QDy[ 50 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 720 ]), &(acadoWorkspace.Dy[ 72 ]), &(acadoWorkspace.QDy[ 60 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 840 ]), &(acadoWorkspace.Dy[ 84 ]), &(acadoWorkspace.QDy[ 70 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 960 ]), &(acadoWorkspace.Dy[ 96 ]), &(acadoWorkspace.QDy[ 80 ]) );
acado_multQDy( &(acadoWorkspace.Q2[ 1080 ]), &(acadoWorkspace.Dy[ 108 ]), &(acadoWorkspace.QDy[ 90 ]) );

acadoWorkspace.QDy[100] = + acadoWorkspace.QN2[0]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[1]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[2]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[3]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[4]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[5]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[6]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[7]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[8]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[9]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[101] = + acadoWorkspace.QN2[10]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[11]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[12]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[13]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[14]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[15]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[16]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[17]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[18]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[19]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[102] = + acadoWorkspace.QN2[20]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[21]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[22]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[23]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[24]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[25]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[26]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[27]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[28]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[29]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[103] = + acadoWorkspace.QN2[30]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[31]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[32]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[33]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[34]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[35]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[36]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[37]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[38]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[39]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[104] = + acadoWorkspace.QN2[40]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[41]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[42]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[43]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[44]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[45]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[46]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[47]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[48]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[49]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[105] = + acadoWorkspace.QN2[50]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[51]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[52]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[53]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[54]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[55]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[56]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[57]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[58]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[59]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[106] = + acadoWorkspace.QN2[60]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[61]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[62]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[63]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[64]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[65]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[66]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[67]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[68]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[69]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[107] = + acadoWorkspace.QN2[70]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[71]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[72]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[73]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[74]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[75]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[76]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[77]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[78]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[79]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[108] = + acadoWorkspace.QN2[80]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[81]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[82]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[83]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[84]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[85]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[86]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[87]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[88]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[89]*acadoWorkspace.DyN[9];
acadoWorkspace.QDy[109] = + acadoWorkspace.QN2[90]*acadoWorkspace.DyN[0] + acadoWorkspace.QN2[91]*acadoWorkspace.DyN[1] + acadoWorkspace.QN2[92]*acadoWorkspace.DyN[2] + acadoWorkspace.QN2[93]*acadoWorkspace.DyN[3] + acadoWorkspace.QN2[94]*acadoWorkspace.DyN[4] + acadoWorkspace.QN2[95]*acadoWorkspace.DyN[5] + acadoWorkspace.QN2[96]*acadoWorkspace.DyN[6] + acadoWorkspace.QN2[97]*acadoWorkspace.DyN[7] + acadoWorkspace.QN2[98]*acadoWorkspace.DyN[8] + acadoWorkspace.QN2[99]*acadoWorkspace.DyN[9];

acadoWorkspace.sbar[0] = acadoWorkspace.Dx0[0];
acadoWorkspace.sbar[1] = acadoWorkspace.Dx0[1];
acadoWorkspace.sbar[2] = acadoWorkspace.Dx0[2];
acadoWorkspace.sbar[3] = acadoWorkspace.Dx0[3];
acadoWorkspace.sbar[4] = acadoWorkspace.Dx0[4];
acadoWorkspace.sbar[5] = acadoWorkspace.Dx0[5];
acadoWorkspace.sbar[6] = acadoWorkspace.Dx0[6];
acadoWorkspace.sbar[7] = acadoWorkspace.Dx0[7];
acadoWorkspace.sbar[8] = acadoWorkspace.Dx0[8];
acadoWorkspace.sbar[9] = acadoWorkspace.Dx0[9];
acado_macASbar( acadoWorkspace.evGx, acadoWorkspace.sbar, &(acadoWorkspace.sbar[ 10 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 100 ]), &(acadoWorkspace.sbar[ 10 ]), &(acadoWorkspace.sbar[ 20 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 200 ]), &(acadoWorkspace.sbar[ 20 ]), &(acadoWorkspace.sbar[ 30 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 300 ]), &(acadoWorkspace.sbar[ 30 ]), &(acadoWorkspace.sbar[ 40 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 400 ]), &(acadoWorkspace.sbar[ 40 ]), &(acadoWorkspace.sbar[ 50 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.sbar[ 50 ]), &(acadoWorkspace.sbar[ 60 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.sbar[ 60 ]), &(acadoWorkspace.sbar[ 70 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.sbar[ 70 ]), &(acadoWorkspace.sbar[ 80 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.sbar[ 80 ]), &(acadoWorkspace.sbar[ 90 ]) );
acado_macASbar( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.sbar[ 90 ]), &(acadoWorkspace.sbar[ 100 ]) );

acadoWorkspace.w1[0] = + acadoWorkspace.QN1[0]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[1]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[2]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[3]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[4]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[5]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[6]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[7]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[8]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[9]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[100];
acadoWorkspace.w1[1] = + acadoWorkspace.QN1[10]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[11]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[12]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[13]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[14]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[15]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[16]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[17]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[18]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[19]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[101];
acadoWorkspace.w1[2] = + acadoWorkspace.QN1[20]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[21]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[22]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[23]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[24]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[25]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[26]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[27]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[28]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[29]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[102];
acadoWorkspace.w1[3] = + acadoWorkspace.QN1[30]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[31]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[32]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[33]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[34]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[35]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[36]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[37]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[38]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[39]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[103];
acadoWorkspace.w1[4] = + acadoWorkspace.QN1[40]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[41]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[42]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[43]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[44]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[45]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[46]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[47]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[48]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[49]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[104];
acadoWorkspace.w1[5] = + acadoWorkspace.QN1[50]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[51]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[52]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[53]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[54]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[55]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[56]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[57]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[58]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[59]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[105];
acadoWorkspace.w1[6] = + acadoWorkspace.QN1[60]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[61]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[62]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[63]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[64]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[65]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[66]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[67]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[68]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[69]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[106];
acadoWorkspace.w1[7] = + acadoWorkspace.QN1[70]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[71]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[72]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[73]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[74]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[75]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[76]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[77]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[78]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[79]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[107];
acadoWorkspace.w1[8] = + acadoWorkspace.QN1[80]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[81]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[82]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[83]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[84]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[85]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[86]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[87]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[88]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[89]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[108];
acadoWorkspace.w1[9] = + acadoWorkspace.QN1[90]*acadoWorkspace.sbar[100] + acadoWorkspace.QN1[91]*acadoWorkspace.sbar[101] + acadoWorkspace.QN1[92]*acadoWorkspace.sbar[102] + acadoWorkspace.QN1[93]*acadoWorkspace.sbar[103] + acadoWorkspace.QN1[94]*acadoWorkspace.sbar[104] + acadoWorkspace.QN1[95]*acadoWorkspace.sbar[105] + acadoWorkspace.QN1[96]*acadoWorkspace.sbar[106] + acadoWorkspace.QN1[97]*acadoWorkspace.sbar[107] + acadoWorkspace.QN1[98]*acadoWorkspace.sbar[108] + acadoWorkspace.QN1[99]*acadoWorkspace.sbar[109] + acadoWorkspace.QDy[109];
acado_macBTw1( &(acadoWorkspace.evGu[ 180 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 18 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 900 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 90 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 900 ]), &(acadoWorkspace.sbar[ 90 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 160 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 16 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 800 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 80 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 800 ]), &(acadoWorkspace.sbar[ 80 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 140 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 14 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 700 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 70 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 700 ]), &(acadoWorkspace.sbar[ 70 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 120 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 12 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 600 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 60 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 600 ]), &(acadoWorkspace.sbar[ 60 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 100 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 10 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 500 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 50 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 500 ]), &(acadoWorkspace.sbar[ 50 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 80 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 8 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 400 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 40 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 400 ]), &(acadoWorkspace.sbar[ 40 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 60 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 6 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 300 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 30 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 300 ]), &(acadoWorkspace.sbar[ 30 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 40 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 4 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 200 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 20 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 200 ]), &(acadoWorkspace.sbar[ 20 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( &(acadoWorkspace.evGu[ 20 ]), acadoWorkspace.w1, &(acadoWorkspace.g[ 2 ]) );
acado_macATw1QDy( &(acadoWorkspace.evGx[ 100 ]), acadoWorkspace.w1, &(acadoWorkspace.QDy[ 10 ]), acadoWorkspace.w2 );
acado_macQSbarW2( &(acadoWorkspace.Q1[ 100 ]), &(acadoWorkspace.sbar[ 10 ]), acadoWorkspace.w2, acadoWorkspace.w1 );
acado_macBTw1( acadoWorkspace.evGu, acadoWorkspace.w1, acadoWorkspace.g );


tmp = acadoWorkspace.sbar[10] + acadoVariables.x[10];
acadoWorkspace.lbA[0] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[0] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[11] + acadoVariables.x[11];
acadoWorkspace.lbA[1] = - tmp;
acadoWorkspace.ubA[1] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[13] + acadoVariables.x[13];
acadoWorkspace.lbA[2] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[2] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[14] + acadoVariables.x[14];
acadoWorkspace.lbA[3] = - tmp;
acadoWorkspace.ubA[3] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[15] + acadoVariables.x[15];
acadoWorkspace.lbA[4] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[4] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[18] + acadoVariables.x[18];
acadoWorkspace.lbA[5] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[5] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[19] + acadoVariables.x[19];
acadoWorkspace.lbA[6] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[6] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[20] + acadoVariables.x[20];
acadoWorkspace.lbA[7] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[7] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[21] + acadoVariables.x[21];
acadoWorkspace.lbA[8] = - tmp;
acadoWorkspace.ubA[8] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[23] + acadoVariables.x[23];
acadoWorkspace.lbA[9] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[9] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[24] + acadoVariables.x[24];
acadoWorkspace.lbA[10] = - tmp;
acadoWorkspace.ubA[10] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[25] + acadoVariables.x[25];
acadoWorkspace.lbA[11] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[11] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[28] + acadoVariables.x[28];
acadoWorkspace.lbA[12] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[12] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[29] + acadoVariables.x[29];
acadoWorkspace.lbA[13] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[13] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[30] + acadoVariables.x[30];
acadoWorkspace.lbA[14] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[14] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[31] + acadoVariables.x[31];
acadoWorkspace.lbA[15] = - tmp;
acadoWorkspace.ubA[15] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[33] + acadoVariables.x[33];
acadoWorkspace.lbA[16] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[16] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[34] + acadoVariables.x[34];
acadoWorkspace.lbA[17] = - tmp;
acadoWorkspace.ubA[17] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[35] + acadoVariables.x[35];
acadoWorkspace.lbA[18] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[18] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[38] + acadoVariables.x[38];
acadoWorkspace.lbA[19] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[19] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[39] + acadoVariables.x[39];
acadoWorkspace.lbA[20] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[20] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[40] + acadoVariables.x[40];
acadoWorkspace.lbA[21] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[21] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[41] + acadoVariables.x[41];
acadoWorkspace.lbA[22] = - tmp;
acadoWorkspace.ubA[22] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[43] + acadoVariables.x[43];
acadoWorkspace.lbA[23] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[23] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[44] + acadoVariables.x[44];
acadoWorkspace.lbA[24] = - tmp;
acadoWorkspace.ubA[24] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[45] + acadoVariables.x[45];
acadoWorkspace.lbA[25] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[25] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[48] + acadoVariables.x[48];
acadoWorkspace.lbA[26] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[26] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[49] + acadoVariables.x[49];
acadoWorkspace.lbA[27] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[27] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[50] + acadoVariables.x[50];
acadoWorkspace.lbA[28] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[28] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[51] + acadoVariables.x[51];
acadoWorkspace.lbA[29] = - tmp;
acadoWorkspace.ubA[29] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[53] + acadoVariables.x[53];
acadoWorkspace.lbA[30] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[30] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[54] + acadoVariables.x[54];
acadoWorkspace.lbA[31] = - tmp;
acadoWorkspace.ubA[31] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[55] + acadoVariables.x[55];
acadoWorkspace.lbA[32] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[32] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[58] + acadoVariables.x[58];
acadoWorkspace.lbA[33] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[33] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[59] + acadoVariables.x[59];
acadoWorkspace.lbA[34] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[34] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[60] + acadoVariables.x[60];
acadoWorkspace.lbA[35] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[35] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[61] + acadoVariables.x[61];
acadoWorkspace.lbA[36] = - tmp;
acadoWorkspace.ubA[36] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[63] + acadoVariables.x[63];
acadoWorkspace.lbA[37] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[37] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[64] + acadoVariables.x[64];
acadoWorkspace.lbA[38] = - tmp;
acadoWorkspace.ubA[38] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[65] + acadoVariables.x[65];
acadoWorkspace.lbA[39] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[39] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[68] + acadoVariables.x[68];
acadoWorkspace.lbA[40] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[40] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[69] + acadoVariables.x[69];
acadoWorkspace.lbA[41] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[41] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[70] + acadoVariables.x[70];
acadoWorkspace.lbA[42] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[42] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[71] + acadoVariables.x[71];
acadoWorkspace.lbA[43] = - tmp;
acadoWorkspace.ubA[43] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[73] + acadoVariables.x[73];
acadoWorkspace.lbA[44] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[44] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[74] + acadoVariables.x[74];
acadoWorkspace.lbA[45] = - tmp;
acadoWorkspace.ubA[45] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[75] + acadoVariables.x[75];
acadoWorkspace.lbA[46] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[46] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[78] + acadoVariables.x[78];
acadoWorkspace.lbA[47] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[47] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[79] + acadoVariables.x[79];
acadoWorkspace.lbA[48] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[48] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[80] + acadoVariables.x[80];
acadoWorkspace.lbA[49] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[49] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[81] + acadoVariables.x[81];
acadoWorkspace.lbA[50] = - tmp;
acadoWorkspace.ubA[50] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[83] + acadoVariables.x[83];
acadoWorkspace.lbA[51] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[51] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[84] + acadoVariables.x[84];
acadoWorkspace.lbA[52] = - tmp;
acadoWorkspace.ubA[52] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[85] + acadoVariables.x[85];
acadoWorkspace.lbA[53] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[53] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[88] + acadoVariables.x[88];
acadoWorkspace.lbA[54] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[54] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[89] + acadoVariables.x[89];
acadoWorkspace.lbA[55] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[55] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[90] + acadoVariables.x[90];
acadoWorkspace.lbA[56] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[56] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[91] + acadoVariables.x[91];
acadoWorkspace.lbA[57] = - tmp;
acadoWorkspace.ubA[57] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[93] + acadoVariables.x[93];
acadoWorkspace.lbA[58] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[58] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[94] + acadoVariables.x[94];
acadoWorkspace.lbA[59] = - tmp;
acadoWorkspace.ubA[59] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[95] + acadoVariables.x[95];
acadoWorkspace.lbA[60] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[60] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[98] + acadoVariables.x[98];
acadoWorkspace.lbA[61] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[61] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[99] + acadoVariables.x[99];
acadoWorkspace.lbA[62] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[62] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[100] + acadoVariables.x[100];
acadoWorkspace.lbA[63] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[63] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[101] + acadoVariables.x[101];
acadoWorkspace.lbA[64] = - tmp;
acadoWorkspace.ubA[64] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[103] + acadoVariables.x[103];
acadoWorkspace.lbA[65] = (real_t)-4.0000000000000000e+00 - tmp;
acadoWorkspace.ubA[65] = (real_t)4.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[104] + acadoVariables.x[104];
acadoWorkspace.lbA[66] = - tmp;
acadoWorkspace.ubA[66] = (real_t)2.0000000000000000e+00 - tmp;
tmp = acadoWorkspace.sbar[105] + acadoVariables.x[105];
acadoWorkspace.lbA[67] = (real_t)-1.5707963267948966e-01 - tmp;
acadoWorkspace.ubA[67] = (real_t)1.5707963267948966e-01 - tmp;
tmp = acadoWorkspace.sbar[108] + acadoVariables.x[108];
acadoWorkspace.lbA[68] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[68] = (real_t)5.0000000000000000e+01 - tmp;
tmp = acadoWorkspace.sbar[109] + acadoVariables.x[109];
acadoWorkspace.lbA[69] = (real_t)-5.0000000000000000e+01 - tmp;
acadoWorkspace.ubA[69] = (real_t)5.0000000000000000e+01 - tmp;

}

void acado_expand(  )
{
acadoVariables.u[0] += acadoWorkspace.x[0];
acadoVariables.u[1] += acadoWorkspace.x[1];
acadoVariables.u[2] += acadoWorkspace.x[2];
acadoVariables.u[3] += acadoWorkspace.x[3];
acadoVariables.u[4] += acadoWorkspace.x[4];
acadoVariables.u[5] += acadoWorkspace.x[5];
acadoVariables.u[6] += acadoWorkspace.x[6];
acadoVariables.u[7] += acadoWorkspace.x[7];
acadoVariables.u[8] += acadoWorkspace.x[8];
acadoVariables.u[9] += acadoWorkspace.x[9];
acadoVariables.u[10] += acadoWorkspace.x[10];
acadoVariables.u[11] += acadoWorkspace.x[11];
acadoVariables.u[12] += acadoWorkspace.x[12];
acadoVariables.u[13] += acadoWorkspace.x[13];
acadoVariables.u[14] += acadoWorkspace.x[14];
acadoVariables.u[15] += acadoWorkspace.x[15];
acadoVariables.u[16] += acadoWorkspace.x[16];
acadoVariables.u[17] += acadoWorkspace.x[17];
acadoVariables.u[18] += acadoWorkspace.x[18];
acadoVariables.u[19] += acadoWorkspace.x[19];
acadoWorkspace.sbar[0] = acadoWorkspace.Dx0[0];
acadoWorkspace.sbar[1] = acadoWorkspace.Dx0[1];
acadoWorkspace.sbar[2] = acadoWorkspace.Dx0[2];
acadoWorkspace.sbar[3] = acadoWorkspace.Dx0[3];
acadoWorkspace.sbar[4] = acadoWorkspace.Dx0[4];
acadoWorkspace.sbar[5] = acadoWorkspace.Dx0[5];
acadoWorkspace.sbar[6] = acadoWorkspace.Dx0[6];
acadoWorkspace.sbar[7] = acadoWorkspace.Dx0[7];
acadoWorkspace.sbar[8] = acadoWorkspace.Dx0[8];
acadoWorkspace.sbar[9] = acadoWorkspace.Dx0[9];
acadoWorkspace.sbar[10] = acadoWorkspace.d[0];
acadoWorkspace.sbar[11] = acadoWorkspace.d[1];
acadoWorkspace.sbar[12] = acadoWorkspace.d[2];
acadoWorkspace.sbar[13] = acadoWorkspace.d[3];
acadoWorkspace.sbar[14] = acadoWorkspace.d[4];
acadoWorkspace.sbar[15] = acadoWorkspace.d[5];
acadoWorkspace.sbar[16] = acadoWorkspace.d[6];
acadoWorkspace.sbar[17] = acadoWorkspace.d[7];
acadoWorkspace.sbar[18] = acadoWorkspace.d[8];
acadoWorkspace.sbar[19] = acadoWorkspace.d[9];
acadoWorkspace.sbar[20] = acadoWorkspace.d[10];
acadoWorkspace.sbar[21] = acadoWorkspace.d[11];
acadoWorkspace.sbar[22] = acadoWorkspace.d[12];
acadoWorkspace.sbar[23] = acadoWorkspace.d[13];
acadoWorkspace.sbar[24] = acadoWorkspace.d[14];
acadoWorkspace.sbar[25] = acadoWorkspace.d[15];
acadoWorkspace.sbar[26] = acadoWorkspace.d[16];
acadoWorkspace.sbar[27] = acadoWorkspace.d[17];
acadoWorkspace.sbar[28] = acadoWorkspace.d[18];
acadoWorkspace.sbar[29] = acadoWorkspace.d[19];
acadoWorkspace.sbar[30] = acadoWorkspace.d[20];
acadoWorkspace.sbar[31] = acadoWorkspace.d[21];
acadoWorkspace.sbar[32] = acadoWorkspace.d[22];
acadoWorkspace.sbar[33] = acadoWorkspace.d[23];
acadoWorkspace.sbar[34] = acadoWorkspace.d[24];
acadoWorkspace.sbar[35] = acadoWorkspace.d[25];
acadoWorkspace.sbar[36] = acadoWorkspace.d[26];
acadoWorkspace.sbar[37] = acadoWorkspace.d[27];
acadoWorkspace.sbar[38] = acadoWorkspace.d[28];
acadoWorkspace.sbar[39] = acadoWorkspace.d[29];
acadoWorkspace.sbar[40] = acadoWorkspace.d[30];
acadoWorkspace.sbar[41] = acadoWorkspace.d[31];
acadoWorkspace.sbar[42] = acadoWorkspace.d[32];
acadoWorkspace.sbar[43] = acadoWorkspace.d[33];
acadoWorkspace.sbar[44] = acadoWorkspace.d[34];
acadoWorkspace.sbar[45] = acadoWorkspace.d[35];
acadoWorkspace.sbar[46] = acadoWorkspace.d[36];
acadoWorkspace.sbar[47] = acadoWorkspace.d[37];
acadoWorkspace.sbar[48] = acadoWorkspace.d[38];
acadoWorkspace.sbar[49] = acadoWorkspace.d[39];
acadoWorkspace.sbar[50] = acadoWorkspace.d[40];
acadoWorkspace.sbar[51] = acadoWorkspace.d[41];
acadoWorkspace.sbar[52] = acadoWorkspace.d[42];
acadoWorkspace.sbar[53] = acadoWorkspace.d[43];
acadoWorkspace.sbar[54] = acadoWorkspace.d[44];
acadoWorkspace.sbar[55] = acadoWorkspace.d[45];
acadoWorkspace.sbar[56] = acadoWorkspace.d[46];
acadoWorkspace.sbar[57] = acadoWorkspace.d[47];
acadoWorkspace.sbar[58] = acadoWorkspace.d[48];
acadoWorkspace.sbar[59] = acadoWorkspace.d[49];
acadoWorkspace.sbar[60] = acadoWorkspace.d[50];
acadoWorkspace.sbar[61] = acadoWorkspace.d[51];
acadoWorkspace.sbar[62] = acadoWorkspace.d[52];
acadoWorkspace.sbar[63] = acadoWorkspace.d[53];
acadoWorkspace.sbar[64] = acadoWorkspace.d[54];
acadoWorkspace.sbar[65] = acadoWorkspace.d[55];
acadoWorkspace.sbar[66] = acadoWorkspace.d[56];
acadoWorkspace.sbar[67] = acadoWorkspace.d[57];
acadoWorkspace.sbar[68] = acadoWorkspace.d[58];
acadoWorkspace.sbar[69] = acadoWorkspace.d[59];
acadoWorkspace.sbar[70] = acadoWorkspace.d[60];
acadoWorkspace.sbar[71] = acadoWorkspace.d[61];
acadoWorkspace.sbar[72] = acadoWorkspace.d[62];
acadoWorkspace.sbar[73] = acadoWorkspace.d[63];
acadoWorkspace.sbar[74] = acadoWorkspace.d[64];
acadoWorkspace.sbar[75] = acadoWorkspace.d[65];
acadoWorkspace.sbar[76] = acadoWorkspace.d[66];
acadoWorkspace.sbar[77] = acadoWorkspace.d[67];
acadoWorkspace.sbar[78] = acadoWorkspace.d[68];
acadoWorkspace.sbar[79] = acadoWorkspace.d[69];
acadoWorkspace.sbar[80] = acadoWorkspace.d[70];
acadoWorkspace.sbar[81] = acadoWorkspace.d[71];
acadoWorkspace.sbar[82] = acadoWorkspace.d[72];
acadoWorkspace.sbar[83] = acadoWorkspace.d[73];
acadoWorkspace.sbar[84] = acadoWorkspace.d[74];
acadoWorkspace.sbar[85] = acadoWorkspace.d[75];
acadoWorkspace.sbar[86] = acadoWorkspace.d[76];
acadoWorkspace.sbar[87] = acadoWorkspace.d[77];
acadoWorkspace.sbar[88] = acadoWorkspace.d[78];
acadoWorkspace.sbar[89] = acadoWorkspace.d[79];
acadoWorkspace.sbar[90] = acadoWorkspace.d[80];
acadoWorkspace.sbar[91] = acadoWorkspace.d[81];
acadoWorkspace.sbar[92] = acadoWorkspace.d[82];
acadoWorkspace.sbar[93] = acadoWorkspace.d[83];
acadoWorkspace.sbar[94] = acadoWorkspace.d[84];
acadoWorkspace.sbar[95] = acadoWorkspace.d[85];
acadoWorkspace.sbar[96] = acadoWorkspace.d[86];
acadoWorkspace.sbar[97] = acadoWorkspace.d[87];
acadoWorkspace.sbar[98] = acadoWorkspace.d[88];
acadoWorkspace.sbar[99] = acadoWorkspace.d[89];
acadoWorkspace.sbar[100] = acadoWorkspace.d[90];
acadoWorkspace.sbar[101] = acadoWorkspace.d[91];
acadoWorkspace.sbar[102] = acadoWorkspace.d[92];
acadoWorkspace.sbar[103] = acadoWorkspace.d[93];
acadoWorkspace.sbar[104] = acadoWorkspace.d[94];
acadoWorkspace.sbar[105] = acadoWorkspace.d[95];
acadoWorkspace.sbar[106] = acadoWorkspace.d[96];
acadoWorkspace.sbar[107] = acadoWorkspace.d[97];
acadoWorkspace.sbar[108] = acadoWorkspace.d[98];
acadoWorkspace.sbar[109] = acadoWorkspace.d[99];
acado_expansionStep( acadoWorkspace.evGx, acadoWorkspace.evGu, acadoWorkspace.x, acadoWorkspace.sbar, &(acadoWorkspace.sbar[ 10 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 100 ]), &(acadoWorkspace.evGu[ 20 ]), &(acadoWorkspace.x[ 2 ]), &(acadoWorkspace.sbar[ 10 ]), &(acadoWorkspace.sbar[ 20 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 200 ]), &(acadoWorkspace.evGu[ 40 ]), &(acadoWorkspace.x[ 4 ]), &(acadoWorkspace.sbar[ 20 ]), &(acadoWorkspace.sbar[ 30 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 300 ]), &(acadoWorkspace.evGu[ 60 ]), &(acadoWorkspace.x[ 6 ]), &(acadoWorkspace.sbar[ 30 ]), &(acadoWorkspace.sbar[ 40 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 400 ]), &(acadoWorkspace.evGu[ 80 ]), &(acadoWorkspace.x[ 8 ]), &(acadoWorkspace.sbar[ 40 ]), &(acadoWorkspace.sbar[ 50 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 500 ]), &(acadoWorkspace.evGu[ 100 ]), &(acadoWorkspace.x[ 10 ]), &(acadoWorkspace.sbar[ 50 ]), &(acadoWorkspace.sbar[ 60 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 600 ]), &(acadoWorkspace.evGu[ 120 ]), &(acadoWorkspace.x[ 12 ]), &(acadoWorkspace.sbar[ 60 ]), &(acadoWorkspace.sbar[ 70 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 700 ]), &(acadoWorkspace.evGu[ 140 ]), &(acadoWorkspace.x[ 14 ]), &(acadoWorkspace.sbar[ 70 ]), &(acadoWorkspace.sbar[ 80 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 800 ]), &(acadoWorkspace.evGu[ 160 ]), &(acadoWorkspace.x[ 16 ]), &(acadoWorkspace.sbar[ 80 ]), &(acadoWorkspace.sbar[ 90 ]) );
acado_expansionStep( &(acadoWorkspace.evGx[ 900 ]), &(acadoWorkspace.evGu[ 180 ]), &(acadoWorkspace.x[ 18 ]), &(acadoWorkspace.sbar[ 90 ]), &(acadoWorkspace.sbar[ 100 ]) );
acadoVariables.x[0] += acadoWorkspace.sbar[0];
acadoVariables.x[1] += acadoWorkspace.sbar[1];
acadoVariables.x[2] += acadoWorkspace.sbar[2];
acadoVariables.x[3] += acadoWorkspace.sbar[3];
acadoVariables.x[4] += acadoWorkspace.sbar[4];
acadoVariables.x[5] += acadoWorkspace.sbar[5];
acadoVariables.x[6] += acadoWorkspace.sbar[6];
acadoVariables.x[7] += acadoWorkspace.sbar[7];
acadoVariables.x[8] += acadoWorkspace.sbar[8];
acadoVariables.x[9] += acadoWorkspace.sbar[9];
acadoVariables.x[10] += acadoWorkspace.sbar[10];
acadoVariables.x[11] += acadoWorkspace.sbar[11];
acadoVariables.x[12] += acadoWorkspace.sbar[12];
acadoVariables.x[13] += acadoWorkspace.sbar[13];
acadoVariables.x[14] += acadoWorkspace.sbar[14];
acadoVariables.x[15] += acadoWorkspace.sbar[15];
acadoVariables.x[16] += acadoWorkspace.sbar[16];
acadoVariables.x[17] += acadoWorkspace.sbar[17];
acadoVariables.x[18] += acadoWorkspace.sbar[18];
acadoVariables.x[19] += acadoWorkspace.sbar[19];
acadoVariables.x[20] += acadoWorkspace.sbar[20];
acadoVariables.x[21] += acadoWorkspace.sbar[21];
acadoVariables.x[22] += acadoWorkspace.sbar[22];
acadoVariables.x[23] += acadoWorkspace.sbar[23];
acadoVariables.x[24] += acadoWorkspace.sbar[24];
acadoVariables.x[25] += acadoWorkspace.sbar[25];
acadoVariables.x[26] += acadoWorkspace.sbar[26];
acadoVariables.x[27] += acadoWorkspace.sbar[27];
acadoVariables.x[28] += acadoWorkspace.sbar[28];
acadoVariables.x[29] += acadoWorkspace.sbar[29];
acadoVariables.x[30] += acadoWorkspace.sbar[30];
acadoVariables.x[31] += acadoWorkspace.sbar[31];
acadoVariables.x[32] += acadoWorkspace.sbar[32];
acadoVariables.x[33] += acadoWorkspace.sbar[33];
acadoVariables.x[34] += acadoWorkspace.sbar[34];
acadoVariables.x[35] += acadoWorkspace.sbar[35];
acadoVariables.x[36] += acadoWorkspace.sbar[36];
acadoVariables.x[37] += acadoWorkspace.sbar[37];
acadoVariables.x[38] += acadoWorkspace.sbar[38];
acadoVariables.x[39] += acadoWorkspace.sbar[39];
acadoVariables.x[40] += acadoWorkspace.sbar[40];
acadoVariables.x[41] += acadoWorkspace.sbar[41];
acadoVariables.x[42] += acadoWorkspace.sbar[42];
acadoVariables.x[43] += acadoWorkspace.sbar[43];
acadoVariables.x[44] += acadoWorkspace.sbar[44];
acadoVariables.x[45] += acadoWorkspace.sbar[45];
acadoVariables.x[46] += acadoWorkspace.sbar[46];
acadoVariables.x[47] += acadoWorkspace.sbar[47];
acadoVariables.x[48] += acadoWorkspace.sbar[48];
acadoVariables.x[49] += acadoWorkspace.sbar[49];
acadoVariables.x[50] += acadoWorkspace.sbar[50];
acadoVariables.x[51] += acadoWorkspace.sbar[51];
acadoVariables.x[52] += acadoWorkspace.sbar[52];
acadoVariables.x[53] += acadoWorkspace.sbar[53];
acadoVariables.x[54] += acadoWorkspace.sbar[54];
acadoVariables.x[55] += acadoWorkspace.sbar[55];
acadoVariables.x[56] += acadoWorkspace.sbar[56];
acadoVariables.x[57] += acadoWorkspace.sbar[57];
acadoVariables.x[58] += acadoWorkspace.sbar[58];
acadoVariables.x[59] += acadoWorkspace.sbar[59];
acadoVariables.x[60] += acadoWorkspace.sbar[60];
acadoVariables.x[61] += acadoWorkspace.sbar[61];
acadoVariables.x[62] += acadoWorkspace.sbar[62];
acadoVariables.x[63] += acadoWorkspace.sbar[63];
acadoVariables.x[64] += acadoWorkspace.sbar[64];
acadoVariables.x[65] += acadoWorkspace.sbar[65];
acadoVariables.x[66] += acadoWorkspace.sbar[66];
acadoVariables.x[67] += acadoWorkspace.sbar[67];
acadoVariables.x[68] += acadoWorkspace.sbar[68];
acadoVariables.x[69] += acadoWorkspace.sbar[69];
acadoVariables.x[70] += acadoWorkspace.sbar[70];
acadoVariables.x[71] += acadoWorkspace.sbar[71];
acadoVariables.x[72] += acadoWorkspace.sbar[72];
acadoVariables.x[73] += acadoWorkspace.sbar[73];
acadoVariables.x[74] += acadoWorkspace.sbar[74];
acadoVariables.x[75] += acadoWorkspace.sbar[75];
acadoVariables.x[76] += acadoWorkspace.sbar[76];
acadoVariables.x[77] += acadoWorkspace.sbar[77];
acadoVariables.x[78] += acadoWorkspace.sbar[78];
acadoVariables.x[79] += acadoWorkspace.sbar[79];
acadoVariables.x[80] += acadoWorkspace.sbar[80];
acadoVariables.x[81] += acadoWorkspace.sbar[81];
acadoVariables.x[82] += acadoWorkspace.sbar[82];
acadoVariables.x[83] += acadoWorkspace.sbar[83];
acadoVariables.x[84] += acadoWorkspace.sbar[84];
acadoVariables.x[85] += acadoWorkspace.sbar[85];
acadoVariables.x[86] += acadoWorkspace.sbar[86];
acadoVariables.x[87] += acadoWorkspace.sbar[87];
acadoVariables.x[88] += acadoWorkspace.sbar[88];
acadoVariables.x[89] += acadoWorkspace.sbar[89];
acadoVariables.x[90] += acadoWorkspace.sbar[90];
acadoVariables.x[91] += acadoWorkspace.sbar[91];
acadoVariables.x[92] += acadoWorkspace.sbar[92];
acadoVariables.x[93] += acadoWorkspace.sbar[93];
acadoVariables.x[94] += acadoWorkspace.sbar[94];
acadoVariables.x[95] += acadoWorkspace.sbar[95];
acadoVariables.x[96] += acadoWorkspace.sbar[96];
acadoVariables.x[97] += acadoWorkspace.sbar[97];
acadoVariables.x[98] += acadoWorkspace.sbar[98];
acadoVariables.x[99] += acadoWorkspace.sbar[99];
acadoVariables.x[100] += acadoWorkspace.sbar[100];
acadoVariables.x[101] += acadoWorkspace.sbar[101];
acadoVariables.x[102] += acadoWorkspace.sbar[102];
acadoVariables.x[103] += acadoWorkspace.sbar[103];
acadoVariables.x[104] += acadoWorkspace.sbar[104];
acadoVariables.x[105] += acadoWorkspace.sbar[105];
acadoVariables.x[106] += acadoWorkspace.sbar[106];
acadoVariables.x[107] += acadoWorkspace.sbar[107];
acadoVariables.x[108] += acadoWorkspace.sbar[108];
acadoVariables.x[109] += acadoWorkspace.sbar[109];
}

int acado_preparationStep(  )
{
int ret;

ret = acado_modelSimulation();
acado_evaluateObjective(  );
acado_condensePrep(  );
return ret;
}

int acado_feedbackStep(  )
{
int tmp;

acado_condenseFdb(  );

tmp = acado_solve( );

acado_expand(  );
return tmp;
}

int acado_initializeSolver(  )
{
int ret;

/* This is a function which must be called once before any other function call! */


ret = 0;

memset(&acadoWorkspace, 0, sizeof( acadoWorkspace ));
return ret;
}

void acado_initializeNodesByForwardSimulation(  )
{
int index;
for (index = 0; index < 10; ++index)
{
acadoWorkspace.state[0] = acadoVariables.x[index * 10];
acadoWorkspace.state[1] = acadoVariables.x[index * 10 + 1];
acadoWorkspace.state[2] = acadoVariables.x[index * 10 + 2];
acadoWorkspace.state[3] = acadoVariables.x[index * 10 + 3];
acadoWorkspace.state[4] = acadoVariables.x[index * 10 + 4];
acadoWorkspace.state[5] = acadoVariables.x[index * 10 + 5];
acadoWorkspace.state[6] = acadoVariables.x[index * 10 + 6];
acadoWorkspace.state[7] = acadoVariables.x[index * 10 + 7];
acadoWorkspace.state[8] = acadoVariables.x[index * 10 + 8];
acadoWorkspace.state[9] = acadoVariables.x[index * 10 + 9];
acadoWorkspace.state[130] = acadoVariables.u[index * 2];
acadoWorkspace.state[131] = acadoVariables.u[index * 2 + 1];

acado_integrate(acadoWorkspace.state, index == 0);

acadoVariables.x[index * 10 + 10] = acadoWorkspace.state[0];
acadoVariables.x[index * 10 + 11] = acadoWorkspace.state[1];
acadoVariables.x[index * 10 + 12] = acadoWorkspace.state[2];
acadoVariables.x[index * 10 + 13] = acadoWorkspace.state[3];
acadoVariables.x[index * 10 + 14] = acadoWorkspace.state[4];
acadoVariables.x[index * 10 + 15] = acadoWorkspace.state[5];
acadoVariables.x[index * 10 + 16] = acadoWorkspace.state[6];
acadoVariables.x[index * 10 + 17] = acadoWorkspace.state[7];
acadoVariables.x[index * 10 + 18] = acadoWorkspace.state[8];
acadoVariables.x[index * 10 + 19] = acadoWorkspace.state[9];
}
}

void acado_shiftStates( int strategy, real_t* const xEnd, real_t* const uEnd )
{
int index;
for (index = 0; index < 10; ++index)
{
acadoVariables.x[index * 10] = acadoVariables.x[index * 10 + 10];
acadoVariables.x[index * 10 + 1] = acadoVariables.x[index * 10 + 11];
acadoVariables.x[index * 10 + 2] = acadoVariables.x[index * 10 + 12];
acadoVariables.x[index * 10 + 3] = acadoVariables.x[index * 10 + 13];
acadoVariables.x[index * 10 + 4] = acadoVariables.x[index * 10 + 14];
acadoVariables.x[index * 10 + 5] = acadoVariables.x[index * 10 + 15];
acadoVariables.x[index * 10 + 6] = acadoVariables.x[index * 10 + 16];
acadoVariables.x[index * 10 + 7] = acadoVariables.x[index * 10 + 17];
acadoVariables.x[index * 10 + 8] = acadoVariables.x[index * 10 + 18];
acadoVariables.x[index * 10 + 9] = acadoVariables.x[index * 10 + 19];
}

if (strategy == 1 && xEnd != 0)
{
acadoVariables.x[100] = xEnd[0];
acadoVariables.x[101] = xEnd[1];
acadoVariables.x[102] = xEnd[2];
acadoVariables.x[103] = xEnd[3];
acadoVariables.x[104] = xEnd[4];
acadoVariables.x[105] = xEnd[5];
acadoVariables.x[106] = xEnd[6];
acadoVariables.x[107] = xEnd[7];
acadoVariables.x[108] = xEnd[8];
acadoVariables.x[109] = xEnd[9];
}
else if (strategy == 2) 
{
acadoWorkspace.state[0] = acadoVariables.x[100];
acadoWorkspace.state[1] = acadoVariables.x[101];
acadoWorkspace.state[2] = acadoVariables.x[102];
acadoWorkspace.state[3] = acadoVariables.x[103];
acadoWorkspace.state[4] = acadoVariables.x[104];
acadoWorkspace.state[5] = acadoVariables.x[105];
acadoWorkspace.state[6] = acadoVariables.x[106];
acadoWorkspace.state[7] = acadoVariables.x[107];
acadoWorkspace.state[8] = acadoVariables.x[108];
acadoWorkspace.state[9] = acadoVariables.x[109];
if (uEnd != 0)
{
acadoWorkspace.state[130] = uEnd[0];
acadoWorkspace.state[131] = uEnd[1];
}
else
{
acadoWorkspace.state[130] = acadoVariables.u[18];
acadoWorkspace.state[131] = acadoVariables.u[19];
}

acado_integrate(acadoWorkspace.state, 1);

acadoVariables.x[100] = acadoWorkspace.state[0];
acadoVariables.x[101] = acadoWorkspace.state[1];
acadoVariables.x[102] = acadoWorkspace.state[2];
acadoVariables.x[103] = acadoWorkspace.state[3];
acadoVariables.x[104] = acadoWorkspace.state[4];
acadoVariables.x[105] = acadoWorkspace.state[5];
acadoVariables.x[106] = acadoWorkspace.state[6];
acadoVariables.x[107] = acadoWorkspace.state[7];
acadoVariables.x[108] = acadoWorkspace.state[8];
acadoVariables.x[109] = acadoWorkspace.state[9];
}
}

void acado_shiftControls( real_t* const uEnd )
{
int index;
for (index = 0; index < 9; ++index)
{
acadoVariables.u[index * 2] = acadoVariables.u[index * 2 + 2];
acadoVariables.u[index * 2 + 1] = acadoVariables.u[index * 2 + 3];
}

if (uEnd != 0)
{
acadoVariables.u[18] = uEnd[0];
acadoVariables.u[19] = uEnd[1];
}
}

real_t acado_getKKT(  )
{
real_t kkt;

int index;
real_t prd;

kkt = + acadoWorkspace.g[0]*acadoWorkspace.x[0] + acadoWorkspace.g[1]*acadoWorkspace.x[1] + acadoWorkspace.g[2]*acadoWorkspace.x[2] + acadoWorkspace.g[3]*acadoWorkspace.x[3] + acadoWorkspace.g[4]*acadoWorkspace.x[4] + acadoWorkspace.g[5]*acadoWorkspace.x[5] + acadoWorkspace.g[6]*acadoWorkspace.x[6] + acadoWorkspace.g[7]*acadoWorkspace.x[7] + acadoWorkspace.g[8]*acadoWorkspace.x[8] + acadoWorkspace.g[9]*acadoWorkspace.x[9] + acadoWorkspace.g[10]*acadoWorkspace.x[10] + acadoWorkspace.g[11]*acadoWorkspace.x[11] + acadoWorkspace.g[12]*acadoWorkspace.x[12] + acadoWorkspace.g[13]*acadoWorkspace.x[13] + acadoWorkspace.g[14]*acadoWorkspace.x[14] + acadoWorkspace.g[15]*acadoWorkspace.x[15] + acadoWorkspace.g[16]*acadoWorkspace.x[16] + acadoWorkspace.g[17]*acadoWorkspace.x[17] + acadoWorkspace.g[18]*acadoWorkspace.x[18] + acadoWorkspace.g[19]*acadoWorkspace.x[19];
kkt = fabs( kkt );
for (index = 0; index < 20; ++index)
{
prd = acadoWorkspace.y[index];
if (prd > 1e-12)
kkt += fabs(acadoWorkspace.lb[index] * prd);
else if (prd < -1e-12)
kkt += fabs(acadoWorkspace.ub[index] * prd);
}
for (index = 0; index < 70; ++index)
{
prd = acadoWorkspace.y[index + 20];
if (prd > 1e-12)
kkt += fabs(acadoWorkspace.lbA[index] * prd);
else if (prd < -1e-12)
kkt += fabs(acadoWorkspace.ubA[index] * prd);
}
return kkt;
}

real_t acado_getObjective(  )
{
real_t objVal;

int lRun1;
/** Row vector of size: 12 */
real_t tmpDy[ 12 ];

/** Row vector of size: 10 */
real_t tmpDyN[ 10 ];

for (lRun1 = 0; lRun1 < 10; ++lRun1)
{
acadoWorkspace.objValueIn[0] = acadoVariables.x[lRun1 * 10];
acadoWorkspace.objValueIn[1] = acadoVariables.x[lRun1 * 10 + 1];
acadoWorkspace.objValueIn[2] = acadoVariables.x[lRun1 * 10 + 2];
acadoWorkspace.objValueIn[3] = acadoVariables.x[lRun1 * 10 + 3];
acadoWorkspace.objValueIn[4] = acadoVariables.x[lRun1 * 10 + 4];
acadoWorkspace.objValueIn[5] = acadoVariables.x[lRun1 * 10 + 5];
acadoWorkspace.objValueIn[6] = acadoVariables.x[lRun1 * 10 + 6];
acadoWorkspace.objValueIn[7] = acadoVariables.x[lRun1 * 10 + 7];
acadoWorkspace.objValueIn[8] = acadoVariables.x[lRun1 * 10 + 8];
acadoWorkspace.objValueIn[9] = acadoVariables.x[lRun1 * 10 + 9];
acadoWorkspace.objValueIn[10] = acadoVariables.u[lRun1 * 2];
acadoWorkspace.objValueIn[11] = acadoVariables.u[lRun1 * 2 + 1];

acado_evaluateLSQ( acadoWorkspace.objValueIn, acadoWorkspace.objValueOut );
acadoWorkspace.Dy[lRun1 * 12] = acadoWorkspace.objValueOut[0] - acadoVariables.y[lRun1 * 12];
acadoWorkspace.Dy[lRun1 * 12 + 1] = acadoWorkspace.objValueOut[1] - acadoVariables.y[lRun1 * 12 + 1];
acadoWorkspace.Dy[lRun1 * 12 + 2] = acadoWorkspace.objValueOut[2] - acadoVariables.y[lRun1 * 12 + 2];
acadoWorkspace.Dy[lRun1 * 12 + 3] = acadoWorkspace.objValueOut[3] - acadoVariables.y[lRun1 * 12 + 3];
acadoWorkspace.Dy[lRun1 * 12 + 4] = acadoWorkspace.objValueOut[4] - acadoVariables.y[lRun1 * 12 + 4];
acadoWorkspace.Dy[lRun1 * 12 + 5] = acadoWorkspace.objValueOut[5] - acadoVariables.y[lRun1 * 12 + 5];
acadoWorkspace.Dy[lRun1 * 12 + 6] = acadoWorkspace.objValueOut[6] - acadoVariables.y[lRun1 * 12 + 6];
acadoWorkspace.Dy[lRun1 * 12 + 7] = acadoWorkspace.objValueOut[7] - acadoVariables.y[lRun1 * 12 + 7];
acadoWorkspace.Dy[lRun1 * 12 + 8] = acadoWorkspace.objValueOut[8] - acadoVariables.y[lRun1 * 12 + 8];
acadoWorkspace.Dy[lRun1 * 12 + 9] = acadoWorkspace.objValueOut[9] - acadoVariables.y[lRun1 * 12 + 9];
acadoWorkspace.Dy[lRun1 * 12 + 10] = acadoWorkspace.objValueOut[10] - acadoVariables.y[lRun1 * 12 + 10];
acadoWorkspace.Dy[lRun1 * 12 + 11] = acadoWorkspace.objValueOut[11] - acadoVariables.y[lRun1 * 12 + 11];
}
acadoWorkspace.objValueIn[0] = acadoVariables.x[100];
acadoWorkspace.objValueIn[1] = acadoVariables.x[101];
acadoWorkspace.objValueIn[2] = acadoVariables.x[102];
acadoWorkspace.objValueIn[3] = acadoVariables.x[103];
acadoWorkspace.objValueIn[4] = acadoVariables.x[104];
acadoWorkspace.objValueIn[5] = acadoVariables.x[105];
acadoWorkspace.objValueIn[6] = acadoVariables.x[106];
acadoWorkspace.objValueIn[7] = acadoVariables.x[107];
acadoWorkspace.objValueIn[8] = acadoVariables.x[108];
acadoWorkspace.objValueIn[9] = acadoVariables.x[109];
acado_evaluateLSQEndTerm( acadoWorkspace.objValueIn, acadoWorkspace.objValueOut );
acadoWorkspace.DyN[0] = acadoWorkspace.objValueOut[0] - acadoVariables.yN[0];
acadoWorkspace.DyN[1] = acadoWorkspace.objValueOut[1] - acadoVariables.yN[1];
acadoWorkspace.DyN[2] = acadoWorkspace.objValueOut[2] - acadoVariables.yN[2];
acadoWorkspace.DyN[3] = acadoWorkspace.objValueOut[3] - acadoVariables.yN[3];
acadoWorkspace.DyN[4] = acadoWorkspace.objValueOut[4] - acadoVariables.yN[4];
acadoWorkspace.DyN[5] = acadoWorkspace.objValueOut[5] - acadoVariables.yN[5];
acadoWorkspace.DyN[6] = acadoWorkspace.objValueOut[6] - acadoVariables.yN[6];
acadoWorkspace.DyN[7] = acadoWorkspace.objValueOut[7] - acadoVariables.yN[7];
acadoWorkspace.DyN[8] = acadoWorkspace.objValueOut[8] - acadoVariables.yN[8];
acadoWorkspace.DyN[9] = acadoWorkspace.objValueOut[9] - acadoVariables.yN[9];
objVal = 0.0000000000000000e+00;
for (lRun1 = 0; lRun1 < 10; ++lRun1)
{
tmpDy[0] = + acadoWorkspace.Dy[lRun1 * 12]*acadoVariables.W[0];
tmpDy[1] = + acadoWorkspace.Dy[lRun1 * 12 + 1]*acadoVariables.W[13];
tmpDy[2] = + acadoWorkspace.Dy[lRun1 * 12 + 2]*acadoVariables.W[26];
tmpDy[3] = + acadoWorkspace.Dy[lRun1 * 12 + 3]*acadoVariables.W[39];
tmpDy[4] = + acadoWorkspace.Dy[lRun1 * 12 + 4]*acadoVariables.W[52];
tmpDy[5] = + acadoWorkspace.Dy[lRun1 * 12 + 5]*acadoVariables.W[65];
tmpDy[6] = + acadoWorkspace.Dy[lRun1 * 12 + 6]*acadoVariables.W[78];
tmpDy[7] = + acadoWorkspace.Dy[lRun1 * 12 + 7]*acadoVariables.W[91];
tmpDy[8] = + acadoWorkspace.Dy[lRun1 * 12 + 8]*acadoVariables.W[104];
tmpDy[9] = + acadoWorkspace.Dy[lRun1 * 12 + 9]*acadoVariables.W[117];
tmpDy[10] = + acadoWorkspace.Dy[lRun1 * 12 + 10]*acadoVariables.W[130];
tmpDy[11] = + acadoWorkspace.Dy[lRun1 * 12 + 11]*acadoVariables.W[143];
objVal += + acadoWorkspace.Dy[lRun1 * 12]*tmpDy[0] + acadoWorkspace.Dy[lRun1 * 12 + 1]*tmpDy[1] + acadoWorkspace.Dy[lRun1 * 12 + 2]*tmpDy[2] + acadoWorkspace.Dy[lRun1 * 12 + 3]*tmpDy[3] + acadoWorkspace.Dy[lRun1 * 12 + 4]*tmpDy[4] + acadoWorkspace.Dy[lRun1 * 12 + 5]*tmpDy[5] + acadoWorkspace.Dy[lRun1 * 12 + 6]*tmpDy[6] + acadoWorkspace.Dy[lRun1 * 12 + 7]*tmpDy[7] + acadoWorkspace.Dy[lRun1 * 12 + 8]*tmpDy[8] + acadoWorkspace.Dy[lRun1 * 12 + 9]*tmpDy[9] + acadoWorkspace.Dy[lRun1 * 12 + 10]*tmpDy[10] + acadoWorkspace.Dy[lRun1 * 12 + 11]*tmpDy[11];
}

tmpDyN[0] = + acadoWorkspace.DyN[0]*acadoVariables.WN[0];
tmpDyN[1] = + acadoWorkspace.DyN[1]*acadoVariables.WN[11];
tmpDyN[2] = + acadoWorkspace.DyN[2]*acadoVariables.WN[22];
tmpDyN[3] = + acadoWorkspace.DyN[3]*acadoVariables.WN[33];
tmpDyN[4] = + acadoWorkspace.DyN[4]*acadoVariables.WN[44];
tmpDyN[5] = + acadoWorkspace.DyN[5]*acadoVariables.WN[55];
tmpDyN[6] = + acadoWorkspace.DyN[6]*acadoVariables.WN[66];
tmpDyN[7] = + acadoWorkspace.DyN[7]*acadoVariables.WN[77];
tmpDyN[8] = + acadoWorkspace.DyN[8]*acadoVariables.WN[88];
tmpDyN[9] = + acadoWorkspace.DyN[9]*acadoVariables.WN[99];
objVal += + acadoWorkspace.DyN[0]*tmpDyN[0] + acadoWorkspace.DyN[1]*tmpDyN[1] + acadoWorkspace.DyN[2]*tmpDyN[2] + acadoWorkspace.DyN[3]*tmpDyN[3] + acadoWorkspace.DyN[4]*tmpDyN[4] + acadoWorkspace.DyN[5]*tmpDyN[5] + acadoWorkspace.DyN[6]*tmpDyN[6] + acadoWorkspace.DyN[7]*tmpDyN[7] + acadoWorkspace.DyN[8]*tmpDyN[8] + acadoWorkspace.DyN[9]*tmpDyN[9];

objVal *= 0.5;
return objVal;
}

