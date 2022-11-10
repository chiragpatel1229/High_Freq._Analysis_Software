classdef trial_g  %Agilent Generator MXG-N5182A
    properties
        interface = 0;        
    end
    methods
        function obj1 = trial_g()                        
            obj1.interface = instrfind('Type', 'visa-tcpip', 'RsrcName', 'TCPIP0::192.168.6.4::inst0::INSTR', 'Tag', '');
            if isempty(obj1.interface)
                obj1.interface = visa('KEYSIGHT', 'TCPIP0::192.168.6.4::inst0::INSTR');
            else
                fclose(obj1.interface);
                obj1.interface = obj1.interface(1);
            end
            fopen(obj1.interface);
        end
        
%====================================================================%
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