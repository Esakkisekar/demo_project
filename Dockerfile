# Use an official Maven image as the build environment
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the project files
COPY ./ /app/

# Build the application
RUN mvn clean install

# Use a minimal JRE image for the final container
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=build /app/target/*.jar /app/app.jar

# Start the application
CMD ["java", "-jar", "app.jar"]
