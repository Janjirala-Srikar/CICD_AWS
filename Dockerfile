# Base image (Amazon public ECR — no rate limits)
FROM public.ecr.aws/docker/library/python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port the Flask application will be listening on
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"]
