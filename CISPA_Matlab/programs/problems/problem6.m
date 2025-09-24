% --- TODO: Problem 6 ---
        % 1. Input the optical pivot data and the `d_i` points from the calbody file.
        %
        % 2. Implement the logic for optical pivot calibration. This is more complex
        %    and will require you to:
        %      a. For each frame in the optical pivot data, use your `point_cloud_registration`
        %         function to find the transformation from the optical tracker markers to the sensor.
        %      b. Use these calculated transformations in your `pivot_calibration` logic.
        %
        % 3. Display the final optical pivot coordinates.
        % --------------------------