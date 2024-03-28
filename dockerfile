# Use Python base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
RUN pip install flask requests

# Expose the Flask port
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=web_browser.py

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
