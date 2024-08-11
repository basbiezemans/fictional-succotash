FROM ghcr.io/gleam-lang/gleam:v1.3.2-erlang-alpine

# Create a group and user to run as
RUN addgroup -S echogroup && adduser -S echouser -G echogroup
USER echouser

# Add project code
WORKDIR /app/
COPY . ./

# Compile the Gleam application
RUN gleam build

# Run the application
CMD ["gleam", "run"]

