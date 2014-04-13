classdef GrapherUnitTest< matlab.unittest.TestCase
   
    methods(Test)
       
        function testModifyEqn(testCase) 
            
            eqn = 'x+4';
            returned_eqn = modify_eqn_fun(eqn);
            expected_eqn = '(x)+4';
            testCase.verifyEqual(returned_eqn,expected_eqn);
            
            eqn = 'sinx+4';
            returned_eqn = modify_eqn_fun(eqn);
            expected_eqn = 'sin(x)+4';
            testCase.verifyEqual(returned_eqn,expected_eqn);
            
            eqn = '2x^2-9';
            returned_eqn = modify_eqn_fun(eqn);
            expected_eqn = '2*(x)^2-9';
            testCase.verifyEqual(returned_eqn,expected_eqn);
            
            eqn = 'sin3x';
            returned_eqn = modify_eqn_fun(eqn);
            expected_eqn = 'sin(3*(x))';
            testCase.verifyEqual(returned_eqn,expected_eqn);
        
        end
        
    end
    
end