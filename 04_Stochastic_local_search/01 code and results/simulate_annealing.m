function [best_distance,best_route] = simulate_annealing(inputcities, stop_temperature)
% Overview:
% initial temperature and create a random solution
% begin to loop until it's cool or solution is 7013
    % select a neighbour by using 2-opt 
    % and decide if we move to that neighbour
    % decrease the temperature

num_cities = length(inputcities);
terminate = false
% initial temp and ra=te, linear cool
temperature = 1000;
cooling_rate = 0.995;
% intial route

old_route = randperm(num_cities);
cities = inputcities(:, old_route);
old_distance = geographical_distance(cities);

best_route = old_route;
best_distance = old_distance;
results(1) = old_distance;
iteration_count = 1;

while temperature > stop_temperature && best_distance > 7013 & ~terminate
    new_route = two_opt(old_route);
    cities = inputcities(:, new_route);
    new_distance = geographical_distance(cities);
    accept_rate = acceptance_function(old_distance, new_distance, temperature);
    if accept_rate > rand()
        % accept the result
        old_route = new_route;
        old_distance = new_distance;
    end
    
    % if it's a best result?
    if new_distance < best_distance
       best_route = new_route;
       best_distance = new_distance;
    end
    
    %cool down
    temperature = temperature*cooling_rate;
    
    iteration_count = iteration_count + 1;
    results(iteration_count) = old_distance;
    % plot solution
    plot(results(1:iteration_count),'r--');xlabel('iteration'); ylabel('f(x)');
    text(0.5,0.95,['Best = ', num2str(best_distance)],'Units','normalized');
    drawnow;
end


end
