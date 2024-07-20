function                                                                     ...
[                                                                            ...
  scalarFirstQuaternionProduct                                               ...
] =                                                                          ...
scalarFirstQuaternionMultiplication                                          ...
      (                                                                      ...
        scalarFirstQuaternion1,                                              ...
        scalarFirstQuaternion2                                               ...
      )
%===============================================================================
%|
%|  FUNCTION:
%|
%|    scalarFirstQuaternionMultiplication
%|
%|  PURPOSE:
%|
%|    To multiply two scalar first unit quaternions.
%|
%|  INPUT(s):
%|
%|    scalarFirstQuaternion1
%|      The first  scalar first quaternion.
%|
%|    scalarFirstQuaternion2
%|      The second scalar first quaternion.
%|
%|  OUTPUT(s):
%|
%|    scalarFirstQuaternionProduct
%|      The scalar first quaternion product of two
%|      scalar first quaternions.
%|
%|------------------------------------------------------------------------------
%|
%|  USAGE:
%|
%|    [                                                ...
%|      scalarFirstQuaternionProduct                   ...
%|    ] = scalarFirstQuaternionMultiplication          ...
%|              (                                      ...
%|                scalarFirstQuaternion1,              ...
%|                scalarFirstQuaternion2               ...
%|              );
%|
%===============================================================================

%===============================================================================
%        1         2         3         4         5         6         7         8
%2345678901234567890123456789012345678901234567890123456789012345678901234567890
%===============================================================================

%{------------------------------------------------------------------------------
   expectedNumberInputArgs  = 2;
   expectedNumberOutputArgs = 1;
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   actualNumberInputArgs    = nargin;
   actualNumberOutputArgs   = nargout;
%-------------------------------------------------------------------------------
%  Check number of input arguments.
%-------------------------------------------------------------------------------
   if( actualNumberInputArgs == expectedNumberInputArgs )
    %{--------------------------------------------------------------------------
    %  Encountered expected number of input arguments.
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %  Check number of output arguments.
    %---------------------------------------------------------------------------
       if( actualNumberOutputArgs == expectedNumberOutputArgs )
        %{----------------------------------------------------------------------
        %  Encountered expected number of input arguments.
        %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        %  Obtain quaternion scalar parts.
        %-----------------------------------------------------------------------
           scalarPart1 = scalarFirstQuaternion1( 1 );
           scalarPart2 = scalarFirstQuaternion2( 1 );
        %-----------------------------------------------------------------------
        %  Obtain quaternion vector parts.
        %-----------------------------------------------------------------------
           vectorPart1 = [                                                   ...
                           scalarFirstQuaternion1( 2 );                      ...
                           scalarFirstQuaternion1( 3 );                      ...
                           scalarFirstQuaternion1( 4 )                       ...
                         ];
           vectorPart2 = [                                                   ...
                           scalarFirstQuaternion2( 2 );                      ...
                           scalarFirstQuaternion2( 3 );                      ...
                           scalarFirstQuaternion2( 4 )                       ...
                         ];
        %-----------------------------------------------------------------------
           v12DotProduct    = dot( vectorPart1, vectorPart2 );
        %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
           v12VectorProduct = [];
           [                                                                 ...
             v12VectorProduct                                                ...
           ] = vectorProduct                                                 ...
                     (                                                       ...
                       vectorPart1,                                          ...
                       vectorPart2                                           ...
                     );
        %-----------------------------------------------------------------------
           quaternionProduct_Scalar = ( scalarPart1 * scalarPart2 ) +        ...
                                      ( -v12DotProduct );
        %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
           quaternionProduct_Vector = ( scalarPart1 * vectorPart2( : ) ) +   ...
                                      ( scalarPart2 * vectorPart1( : ) ) +   ...
                                      v12VectorProduct( : );
        %-----------------------------------------------------------------------
           scalarFirstQuaternionProduct =                                    ...
                     [                                                       ...
                       quaternionProduct_Scalar;                             ...
                       quaternionProduct_Vector( : )                         ...
                     ];
        %}----------------------------------------------------------------------
       else
        %{----------------------------------------------------------------------
        %  Encountered unexpected number of output arguments.
        %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        %  This is an error.
        %-----------------------------------------------------------------------
           STDOUT = 1;
        %-----------------------------------------------------------------------
        %  Generate a  purpose message.
        %-----------------------------------------------------------------------
           [                                                                 ...
             purposeMessageString                                            ...
           ] = generatePurposeMessage(  );
        %-----------------------------------------------------------------------
        %  Generate an usage   message.
        %-----------------------------------------------------------------------
           [                                                                 ...
             usageMessageString                                              ...
           ] = generateUsageMessage(  );
        %-----------------------------------------------------------------------
        %  Output a  purpose message.
        %-----------------------------------------------------------------------
           fprintf                                                           ...
             (                                                               ...
               STDOUT,                                                       ...
               '%s',                                                         ...
               purposeMessageString                                          ...
             );
        %-----------------------------------------------------------------------
        %  Output an usage   message.
        %-----------------------------------------------------------------------
           fprintf                                                           ...
             (                                                               ...
               STDOUT,                                                       ...
               '%s',                                                         ...
               usageMessageString                                            ...
             );
        %-----------------------------------------------------------------------
        %  Generate an error message.
        %-----------------------------------------------------------------------
           errorMessageFormattingString =                                    ...
                [                                                            ...
                  '\n\n\n'                                                   ...
                  '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                         ...
                  '%s%d\n'                                                   ...
                  '%s%d\n'                                                   ...
                  '%s\n%s\n%s\n%s\n%s\n'                                     ...
                  '\n\n\n'                                                   ...
                ];
        %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
           fprintf                                                           ...
           (                                                                 ...
             STDOUT,                                                         ...
             errorMessageFormattingString,                                   ...
             '------------------------------------------------------------', ...
             '|',                                                            ...
             '| ERROR:',                                                     ...
             '|',                                                            ...
             '|   FUNCTION: "scalarFirstQuaternionMultiplication"',          ...
             '|',                                                            ...
             '|   Encountered unexpected number of output arguments.',       ...
             '|',                                                            ...
             '|   Expected number output arguments:-->',                     ...
             expectedNumberOutputArgs,                                       ...
             '|   Actual   number output arguments:-->',                     ...
             actualNumberOutputArgs,                                         ...
             '|',                                                            ...
             '|  This is an error.',                                         ...
             '|  The program will terminate.',                               ...
             '|',                                                            ...
             '------------------------------------------------------------'  ...
            );
        %-----------------------------------------------------------------------
           scalarFirstQuaternionProduct = [ ];
        %-----------------------------------------------------------------------
        %  Terminate the program.
        %-----------------------------------------------------------------------
           error( 'Encountered unexpected number of output arguments.' );
        %}----------------------------------------------------------------------
       end;
    %}--------------------------------------------------------------------------
   else
    %{--------------------------------------------------------------------------
    %  Encountered unexpected number of input arguments.
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    %  This is an error.
    %---------------------------------------------------------------------------
       STDOUT = 1;
    %---------------------------------------------------------------------------
    %  This is an error.
    %  Generate a  purpose message.
    %---------------------------------------------------------------------------
       [                                                                     ...
         purposeMessageString                                                ...
       ] = generatePurposeMessage(  );
    %---------------------------------------------------------------------------
    %  Generate an usage   message.
    %---------------------------------------------------------------------------
       [                                                                     ...
         usageMessageString                                                  ...
       ] = generateUsageMessage(  );
    %---------------------------------------------------------------------------
    %  Output a  purpose message.
    %---------------------------------------------------------------------------
       fprintf                                                               ...
         (                                                                   ...
           STDOUT,                                                           ...
           '%s',                                                             ...
           purposeMessageString                                              ...
         );
    %---------------------------------------------------------------------------
    %  Output an usage   message.
    %---------------------------------------------------------------------------
       fprintf                                                               ...
         (                                                                   ...
           STDOUT,                                                           ...
           '%s',                                                             ...
           usageMessageString                                                ...
         );
    %---------------------------------------------------------------------------
    %  Generate an error message.
    %---------------------------------------------------------------------------
       errorMessageFormattingString =                                        ...
            [                                                                ...
              '\n\n\n'                                                       ...
              '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                             ...
              '%s%d\n'                                                       ...
              '%s%d\n'                                                       ...
              '%s\n%s\n%s\n%s\n%s\n'                                         ...
              '\n\n\n'                                                       ...
            ];
    %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
       fprintf                                                               ...
       (                                                                     ...
         STDOUT,                                                             ...
         errorMessageFormattingString,                                       ...
         '----------------------------------------------------------------', ...
         '|',                                                                ...
         '| ERROR:',                                                         ...
         '|',                                                                ...
         '|   FUNCTION: "scalarFirstQuaternionMultiplication"',              ...
         '|',                                                                ...
         '|   Encountered unexpected number of input arguments.',            ...
         '|',                                                                ...
         '|   Expected number input  arguments:-->',                         ...
         expectedNumberInputArgs,                                            ...
         '|   Actual   number input  arguments:-->',                         ...
         actualNumberInputArgs,                                              ...
         '|',                                                                ...
         '|  This is an error.',                                             ...
         '|  The program will terminate.',                                   ...
         '|',                                                                ...
         '----------------------------------------------------------------'  ...
        );
    %---------------------------------------------------------------------------
       scalarFirstQuaternionProduct = [ ];
    %---------------------------------------------------------------------------
    %  Terminate the program.
    %---------------------------------------------------------------------------
       error( 'Encountered unexpected number of input arguments.' );
    %}--------------------------------------------------------------------------
   end;
%-------------------------------------------------------------------------------
   return;
%}------------------------------------------------------------------------------


%===============================================================================
function                                                                     ...
[                                                                            ...
  purposeMessageString                                                       ...
] =                                                                          ...
generatePurposeMessage(  )
%{------------------------------------------------------------------------------
   purposeMessageFormattingString =                                          ...
          [                                                                  ...
            '\n\n\n',                                                        ...
            '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                       ...
            '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                       ...
            '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                       ...
            '%s\n%s\n%s\n'                                                   ...
            '\n\n\n'                                                         ...
          ];
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   [                                                                         ...
     purposeMessageString                                                    ...
   ] =                                                                       ...
    sprintf                                                                  ...
     (                                                                       ...
       purposeMessageFormattingString,                                       ...
       '===================================================================',...
       '|',                                                                  ...
       '| UNCLASSIFIED',                                                     ...
       '|',                                                                  ...
       '|==================================================================',...
       '|',                                                                  ...
       '| FUNCTION:',                                                        ...
       '|',                                                                  ...
       '|    scalarFirstQuaternionMultiplication',                           ...
       '|',                                                                  ...
       '|  PURPOSE:',                                                        ...
       '|',                                                                  ...
       '|    To multiply two scalar first unit quaternions.',                ...
       '|',                                                                  ...
       '|  INPUT(s):',                                                       ...
       '|',                                                                  ...
       '|    scalarFirstQuaternion1',                                        ...
       '|      The first  scalar first quaternion.',                         ...
       '|',                                                                  ...
       '|    scalarFirstQuaternion2',                                        ...
       '|      The second scalar first quaternion.',                         ...
       '|',                                                                  ...
       '|  OUTPUT(s):',                                                      ...
       '|',                                                                  ...
       '|    scalarFirstQuaternionProduct',                                  ...
       '|      The scalar first quaternion product of two',                  ...
       '|      scalar first quaternions.',                                   ...
       '|',                                                                  ...
       '|==================================================================',...
       '|',                                                                  ...
       '| UNCLASSIFIED',                                                     ...
       '|',                                                                  ...
       '===================================================================' ...
     );
%-------------------------------------------------------------------------------
   return;
%}------------------------------------------------------------------------------


%===============================================================================
function                                                                     ...
[                                                                            ...
  usageMessageString                                                         ...
] =                                                                          ...
generateUsageMessage(  )
%{------------------------------------------------------------------------------
   usageMessageFormattingString =                                            ...
        [                                                                    ...
          '\n\n\n'                                                           ...
          '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                         ...
          '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n'                         ...
          '%s\n'                                                             ...
          '\n\n\n'                                                           ...
        ];
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   [                                                                         ...
     usageMessageString                                                      ...
   ] =                                                                       ...
    sprintf                                                                  ...
     (                                                                       ...
       usageMessageFormattingString,                                         ...
       '===================================================================',...
       '|',                                                                  ...
       '| UNCLASSIFIED',                                                     ...
       '|',                                                                  ...
       '|==================================================================',...
       '|',                                                                  ...
       '| USAGE:',                                                           ...
       '|',                                                                  ...
       '|    [                                                ...',          ...
       '|      scalarFirstQuaternionProduct                   ...',          ...
       '|    ] = scalarFirstQuaternionMultiplication          ...',          ...
       '|              (                                      ...',          ...
       '|                scalarFirstQuaternion1,              ...',          ...
       '|                scalarFirstQuaternion2               ...',          ...
       '|              );',                                                  ...
       '|',                                                                  ...
       '|==================================================================',...
       '|',                                                                  ...
       '| UNCLASSIFIED',                                                     ...
       '|',                                                                  ...
       '===================================================================' ...
     );
%-------------------------------------------------------------------------------
   return;
%}------------------------------------------------------------------------------


%===============================================================================