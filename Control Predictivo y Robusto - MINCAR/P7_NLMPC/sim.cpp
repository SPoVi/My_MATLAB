/*
*    This file is part of ACADO Toolkit.
*
*    ACADO Toolkit -- A Toolkit for Automatic Control and Dynamic Optimization.
*    Copyright (C) 2008-2009 by Boris Houska and Hans Joachim Ferreau, K.U.Leuven.
*    Developed within the Optimization in Engineering Center (OPTEC) under
*    supervision of Moritz Diehl. All rights reserved.
*
*    ACADO Toolkit is free software; you can redistribute it and/or
*    modify it under the terms of the GNU Lesser General Public
*    License as published by the Free Software Foundation; either
*    version 3 of the License, or (at your option) any later version.
*
*    ACADO Toolkit is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
*    Lesser General Public License for more details.
*
*    You should have received a copy of the GNU Lesser General Public
*    License along with ACADO Toolkit; if not, write to the Free Software
*    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*
*/


/**
*    Author David Ariens, Rien Quirynen
*    Date 2009-2013
*    http://www.acadotoolkit.org/matlab 
*/

#include <acado_optimal_control.hpp>
#include <acado_toolkit.hpp>
#include <acado/utils/matlab_acado_utils.hpp>

USING_NAMESPACE_ACADO

#include <mex.h>


void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] ) 
 { 
 
    MatlabConsoleStreamBuf mybuf;
    RedirectStream redirect(std::cout, mybuf);
    clearAllStaticCounters( ); 
 
    mexPrintf("\nACADO Toolkit for Matlab - Developed by David Ariens and Rien Quirynen, 2009-2013 \n"); 
    mexPrintf("Support available at http://www.acadotoolkit.org/matlab \n \n"); 

    if (nrhs != 0){ 
      mexErrMsgTxt("This problem expects 0 right hand side argument(s) since you have defined 0 MexInput(s)");
    } 
 
    DifferentialState xm;
    DifferentialState ym;
    DifferentialState dtheta;
    DifferentialState x;
    DifferentialState l;
    DifferentialState theta;
    DifferentialState dx;
    DifferentialState dl;
    DifferentialState fx;
    DifferentialState fl;
    Control dfx;
    Control dfl;
    BMatrix acadodata_M1;
    acadodata_M1.read( "sim_data_acadodata_M1.txt" );
    BMatrix acadodata_M2;
    acadodata_M2.read( "sim_data_acadodata_M2.txt" );
    Function acadodata_f2;
    acadodata_f2 << xm;
    acadodata_f2 << ym;
    acadodata_f2 << dtheta;
    acadodata_f2 << x;
    acadodata_f2 << l;
    acadodata_f2 << theta;
    acadodata_f2 << dx;
    acadodata_f2 << dl;
    acadodata_f2 << fx;
    acadodata_f2 << fl;
    acadodata_f2 << dfx;
    acadodata_f2 << dfl;
    Function acadodata_f3;
    acadodata_f3 << xm;
    acadodata_f3 << ym;
    acadodata_f3 << dtheta;
    acadodata_f3 << x;
    acadodata_f3 << l;
    acadodata_f3 << theta;
    acadodata_f3 << dx;
    acadodata_f3 << dl;
    acadodata_f3 << fx;
    acadodata_f3 << fl;
    SIMexport ExportModule2( 1, 0.1 );
    ExportModule2.set( GENERATE_MATLAB_INTERFACE, 1 );
    uint options_flag;
    options_flag = ExportModule2.set( INTEGRATOR_TYPE, INT_IRK_GL2 );
    if(options_flag != 0) mexErrMsgTxt("ACADO export failed when setting the following option: INTEGRATOR_TYPE");
    options_flag = ExportModule2.set( NUM_INTEGRATOR_STEPS, 20 );
    if(options_flag != 0) mexErrMsgTxt("ACADO export failed when setting the following option: NUM_INTEGRATOR_STEPS");
    DifferentialEquation acadodata_f4;
    acadodata_f4 << 0.00000000000000000000e+00 == (-l*sin(theta)-x+xm);
    acadodata_f4 << 0.00000000000000000000e+00 == (-cos(theta)*l+ym);
    acadodata_f4 << 0.00000000000000000000e+00 == (1.00000000000000005551e-01*cos(theta)*dot(dx)*l+1.00000000000000005551e-01*dot(dtheta)*pow(l,2.00000000000000000000e+00)+2.00000000000000011102e-01*dl*dtheta*l+9.81000000000000094147e-01*l*sin(theta));
    acadodata_f4 << 0.00000000000000000000e+00 == (-dot(x)+dx);
    acadodata_f4 << 0.00000000000000000000e+00 == (dl-dot(l));
    acadodata_f4 << 0.00000000000000000000e+00 == (-dot(theta)+dtheta);
    acadodata_f4 << 0.00000000000000000000e+00 == (1.00000000000000005551e-01*cos(theta)*dot(dtheta)*l+1.00000000000000005551e-01*dot(dl)*l*sin(theta)-1.00000000000000005551e-01*l*pow(dtheta,2.00000000000000000000e+00)*sin(theta)+1.10000000000000008882e+00*dot(dx)+2.00000000000000011102e-01*cos(theta)*dl*dtheta+5.00000000000000000000e-01*dx-fx);
    acadodata_f4 << 0.00000000000000000000e+00 == (1.00000000000000005551e-01*dot(dx)*sin(theta)-1.00000000000000005551e-01*l*pow(dtheta,2.00000000000000000000e+00)+1.10000000000000008882e+00*dot(dl)+5.00000000000000027756e-02*dl-9.81000000000000094147e-01*cos(theta)-fl);
    acadodata_f4 << 0.00000000000000000000e+00 == (-dfx+dot(fx));
    acadodata_f4 << 0.00000000000000000000e+00 == (-dfl+dot(fl));

    ExportModule2.setModel( acadodata_f4 );

    uint export_flag = 0;
    ExportModule2.setTimingSteps( 0 );
    export_flag = ExportModule2.exportCode( "export_SIM" );
    if(export_flag != 0) mexErrMsgTxt("ACADO export failed because of the above error(s)!");


    clearAllStaticCounters( ); 
 
} 

