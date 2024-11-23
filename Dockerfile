# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set the working directory inside the container
WORKDIR /app

# Install Python and other required dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev libjpeg-dev zlib1g-dev libssl-dev libffi-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file to the container
COPY requirement.txt /app/requirement.txt

# Install Python dependencies from the requirements file
RUN pip3 install -r requirement.txt

# Copy the entire project directory to the container
COPY . /app

# Expose the Flask app's default port
EXPOSE 5000

# Set the entrypoint to Python
ENTRYPOINT ["python3"]

# Default command to run the Flask application
CMD ["app.py"]
