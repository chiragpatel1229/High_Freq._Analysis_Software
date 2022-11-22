% A Class is works good with 2 mehtods 
% trial is Successful 



classdef Trial_For_both_devices  % Agilent Analyser EXA-N9010A
    properties
        interface = 0;
    end
    
    methods
        function obj = Trial_For_both_devices()
            obj.interface = instrfind('Type', 'visa-tcpip', 'RsrcName', 'TCPIP0::192.168.6.6::inst0::INSTR', 'Tag', '');
            if isempty(obj.interface)
                 obj.interface = visa('KEYSIGHT', 'TCPIP0::192.168.6.6::inst0::INSTR');
            else
                fclose(obj.interface);
                obj.interface = obj.interface(1);
            end
            fopen(obj.interface);
        end
             
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
    
%%=======================================================================%%%   
                         % GENERATOR %
%%=======================================================================%%%

    methods
        function obj1 = trial_gen()                          %#ok<NOIN>
            obj1.interface = instrfind('Type', 'visa-tcpip', 'RsrcName', 'TCPIP0::192.168.6.4::inst0::INSTR', 'Tag', '');
            if isempty(obj1.interface)
                obj1.interface = visa('KEYSIGHT', 'TCPIP0::192.168.6.4::inst0::INSTR');
            else
                fclose(obj1.interface);
                obj1.interface = obj1.interface(1);
            end
            fopen(obj1.interface);
        end
        
        % ! open output
        function on(obj)
            fprintf(obj.interface, 'OUTPUT1 1');
        end
        % ! close output
        function off(obj)
            fprintf(obj.interface, 'OUTPUT1 0');
        end
        % ! Disconnect
        function close_g(obj)
            fclose(obj.interface);
        end
    end    
end        
        