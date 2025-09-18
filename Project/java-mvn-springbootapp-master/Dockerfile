# Runtime only (lightweight JRE)
FROM eclipse-temurin:17-jre

# Set working directory inside container
WORKDIR /app

# Copy the already built artifact from Jenkins (target folder)
COPY target/*.jar app.jar

# Expose port (example: 8080 for Spring Boot)
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
