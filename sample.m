% Button pushed function: getfrequencyButton
        function getfrequencyButtonPushed(app, event)
            app.obj.Get_Marker_Power(1);
            app.peakPowerTextArea.Value = num2str(disp(Power));
        end

        % Value changed function: peakPowerTextArea
        function peakPowerTextAreaValueChanged(app, event)
            
        end