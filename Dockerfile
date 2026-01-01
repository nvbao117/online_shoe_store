# ==================================
# Stage 1: Build the application
# ==================================
FROM maven:3.8.8-eclipse-temurin-21 AS build

WORKDIR /app

# Copy everything needed for build
COPY pom.xml .
COPY src ./src

# Build the application (dependencies will be downloaded here)
RUN mvn clean package -DskipTests -B

# ==================================
# Stage 2: Create runtime image
# ==================================
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Create non-root user for security
RUN addgroup -g 1001 appgroup && \
    adduser -u 1001 -G appgroup -D appuser

# Copy the built WAR from build stage (project uses war packaging)
COPY --from=build /app/target/*.war app.war

# Create directories for logs and data
RUN mkdir -p /app/logs /app/data && \
    chown -R appuser:appgroup /app

USER appuser

# Expose the application port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# JVM optimization for containers
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -Djava.security.egd=file:/dev/./urandom"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.war"]
