% Instructions for use is applicable to Keysight's "MXG N5182A 100kHz-6GHz"


% obj = Generator_MXG_N5182A('192.168.6.4')    connect device
% obj1 = Generator_MXG_N5182A()
% obj1.setFre(10e8)                Set frequency
% obj1.setLevel(10)                Set Power Level (dB)
% obj1.on()                        Turn on output
% obj1.off()                       Turn off output
% obj1.getFre()                    Get the current frequency
% obj1.getLevel()                  Get the current level
% obj1.close()                     Disconnect
% obj1.setPhaseShift(phaseShift)   Set phase shift  

classdef Generator_MXG_N5182A
    properties
        interface = 0;        
    end
    methods
        function obj1 = Generator_MXG_N5182A()                        
            obj1.interface = instrfind('Type', 'visa-tcpip', 'RsrcName', 'TCPIP0::192.168.6.4::inst0::INSTR', 'Tag', '');
            if isempty(obj1.interface)
                obj1.interface = visa('KEYSIGHT', 'TCPIP0::192.168.6.4::inst0::INSTR');
            else
                fclose(obj1.interface);
                obj1.interface = obj1.interface(1);
            end
            fopen(obj1.interface);
        end
%-----------------------------------------------------------------------------------------------%   
        
        % ! set frequency
        function setFre(obj, fre)
            fprintf(obj.interface, ['SOURce:FREQuency:CW ', num2str(fre)]);
        end
        % ! get frequency
        function fre = getFre(obj)
            fre = query(obj.interface, 'SOURce:FREQuency:CW?');
            fre = str2double(fre);
        end
        % ! set amplitude
        function setLevel(obj, level)
            fprintf(obj.interface, ['SOURce:POWer:LEVel:IMMediate:AMPLitude ', num2str(level)]);
        end
        % ! Get the magnitude
        function level = getLevel(obj)
            level = query(obj.interface, 'SOURce:POWer:LEVel:IMMediate:AMPLitude?');
            level = str2double(level);
        end
        % ! open output
        function on(obj)
            fprintf(obj.interface, 'OUTPUT1 1');
        end
        % ! close output
        function off(obj)
            fprintf(obj.interface, 'OUTPUT1 0');
        end
        % ! set phase shift
        function setPhaseShift(obj, phaseShift)
            % unit is rad range -3.14 --- 3.14
            if (abs(phaseShift)>3.14)
                phaseShift = sign(phaseShift)*3.14;
            end
            fprintf(obj.interface, [':SOURce:PHASe:ADJust ', num2str(phaseShift)]);
        end
        % ! Disconnect
        function close(obj)
            fclose(obj.interface);
        end
    end
end
