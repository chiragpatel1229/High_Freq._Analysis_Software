classdef trial_analysr  % Agilent Analyser EXA-N9010A
    properties
        interface = 0;

    end
    methods
        function obj = trial_analysr()
            obj.interface = instrfind('Type', 'visa-tcpip', 'RsrcName', 'TCPIP0::192.168.6.6::inst0::INSTR', 'Tag', '');
            if isempty(obj.interface)
                 obj.interface = visa('KEYSIGHT', 'TCPIP0::192.168.6.6::inst0::INSTR');
            else
                fclose(obj.interface);
                obj.interface = obj.interface(1);
            end
            fopen(obj.interface);
        end
        
%%=======================================================================%%%       
     %! set Marker on the Peak         
        function smp(obj, id)
            command0 = sprintf(':Calculate:Marker%d:CPSearch 1', id);
            fprintf(obj.interface, command0);
        end
        
     %! turn Off only selected marker          
        function moff(obj, id)     % select the marker number (1,2,3.....)
            command0 = sprintf(':Calculate:Marker%d:STATe 0', id);
            fprintf(obj.interface, command0);
        end     
        
        % disconnect the device
        function close_a(obj)
            fclose(obj.interface);
        end
    end
end        
        