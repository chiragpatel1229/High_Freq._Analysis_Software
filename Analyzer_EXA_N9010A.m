%  Instructions for use, for the Agilent N9010A spectrum analyzer control


%  obj = Analyzer_EXA_N9010A()
%  obj.Auto_Tune()         Auto tune the frequency window in case of errors
%  obj.Set_BnadWidth(3e6)             set BW to 3MHz
%  obj.Set_Center_Frequency(3.5e9)           set the center frequency to 1GHz
%  obj.Set_Span(10e9)          Set Span size to 10Mz
%  obj.set_Center_Marker()        set the position of marker and try to set the fre = 3.505E9 or any 
%  obj.Set_Marker_onPeak(1)              set marker on a peak
%  obj.Set_Marker(1)              put the marker on the screen
%  obj.Turn_off_Marker(1)             remove the marker from the screen
%  obj.Turn_off_All_Marker               remove all the markers from the screen 
%  obj.mnp(1)              Move marker to the next position
%  obj.gmp(1)              Get the power value of marker1
%  obj.gmf(1)              Get the frequency value of Marker1
%  obj.saveData()          Save the data
%  obj.close()             Disconnect

 
classdef Analyzer_EXA_N9010A
    properties
        interface = 0;
    end
    methods
        function obj = Analyzer_EXA_N9010A()
            obj.interface = instrfind('Type', 'visa-tcpip', 'RsrcName', 'TCPIP0::192.168.6.6::inst0::INSTR', 'Tag', '');
            if isempty(obj.interface)
                 obj.interface = visa('KEYSIGHT', 'TCPIP0::192.168.6.6::inst0::INSTR');
            else
                fclose(obj.interface);
                obj.interface = obj.interface(1);
            end
            fopen(obj.interface);
        end
        
                % Established the connection        
%---------------------------------------------------------------------------------------------%   
                % scpi commands
                
        
     %! Auto Tune the Frequency window          
        function Auto_Tune(obj)
            command0 = sprintf(':FREQuency:TUNE:IMMediate');
            fprintf(obj.interface, command0);
        end
                
     %! set BW
        function Set_BnadWidth(obj, fre)
            command0 = sprintf(':bandwidth:RES %eHz', fre);
            fprintf(obj.interface, command0);
        end
        
     %! set center Frequecy        
        function Set_Center_Frequency(obj, fre)
            command0 = sprintf(':FREQuency:CENTer %eHz', fre);
            fprintf(obj.interface, command0);
        end
        
     %! set the Span         
        function Set_Span(obj, fre)
            command0 = sprintf(':FREQuency:SPAN %eHz', fre);
            fprintf(obj.interface, command0);
        end
        
     %! set Marker on X axis         
        function set_Center_Marker(obj)
            command0 = sprintf(':CALCulate:MAMarker:PCENter 1');
            fprintf(obj.interface, command0);
        end
        
     %! set Marker on the Peak (number of markers are possible just change the number in the bracket)        
        function Set_Marker_onPeak(obj, id)
            command0 = sprintf(':Calculate:Marker%d:CPSearch 1', id);
            fprintf(obj.interface, command0);
        end
                
     %! turn On the marker (number of markers are possible just change the number in the bracket)         
        function Set_Marker(obj, id)      % select the marker number (1,2,3.....)
            command0 = sprintf(':Calculate:Marker%d:STATe 1', id);
            fprintf(obj.interface, command0);
        end
        
     %! Mask or select On the marker  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\        
        function mask(obj, id)      % select the marker number (1,2,3.....)
            command0 = sprintf(':CALCulate:MARKer%d:MAXimum', id);
            fprintf(obj.interface, command0);
        end  
        
     %! turn Off only selected marker          
        function Turn_off_Marker(obj, id)     % select the marker number (1,2,3.....)
            command0 = sprintf(':Calculate:Marker%d:STATe 0', id);
            fprintf(obj.interface, command0);
        end        
        
     %! All markers OFF          
        function Turn_off_All_Marker(obj)
            command0 = sprintf(':Calculate:Marker:AOFF');
            fprintf(obj.interface, command0);
        end        
        
      %! move the marker Next Right Position
           function Next_Peake_Right(obj, id)
                command0 = sprintf(':CALCulate:Marker%d:MAXimum:RIGHT', id);
                fprintf(obj.interface, command0);
           end
      %! move the marker Next Right Position
           function Next_Peake_Left(obj, id)
                command0 = sprintf(':CALCulate:Marker%d:MAXimum:LEFT', id);
                fprintf(obj.interface, command0);
           end
           
        
     %! Get the Power of the Marker        
        function Power = gmp(obj, id)
            command0 = sprintf(':CALCulate:MARKer%d:Y?', id);
            Power = query(obj.interface, command0);
        end
                
     %! Get the Frequency of the Marker       
        function fre = gmf(obj, id)
            command0 = sprintf(':CALCulate:MARKer%d:X?', id);
            fre = query(obj.interface, command0);
        end

        
     %! save the data        
%         function data = saveData(obj)
%             options = weboptions('Timeout',Inf);
%             fileName = 'tmp.csv';
%             urlstr = sprintf('http://%s/Agilent.SA.WebInstrument/Trace1.csv', obj.ipAddress);
%             outfilename = websave(fileName, urlstr, options);
%             data = csvread('tmp.csv', 44,0);
%         end

        % disconnect the device
        function close(obj)
            fclose(obj.interface);
        end
    end
end
