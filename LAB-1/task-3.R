radius <- readline(prompt = "Enter Radius of Circle:")
radius_val <- as.numeric(radius)
area_circle <- 3.14 * radius_val^2
print(area_circle)

#if want to run in one go must put as.numeric in prompt because input is set as text
radius_val <- as.numeric(readline(prompt = "Enter Radius of Circle: "))
area_circle <- 3.14 * radius_val^2
print(area_circle)
