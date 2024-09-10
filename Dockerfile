# Use Python 3.9-slim as the base image
FROM python:3.9.20-slim

# Set the working directory
WORKDIR /usr/local/app/src

# Install system dependencies and create a virtual environment
RUN apt-get update && apt-get install -y \
    python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m venv myenv

# Activate the virtual environment and install Django
RUN myenv/bin/python -m pip install --upgrade pip && \
    myenv/bin/python -m pip install django

# Copy the project files to the container
COPY ./myProject/ .

# Expose port 8000 for Django development server
EXPOSE 8000

# Use ENTRYPOINT to ensure the virtual environment is activated and Django is run
ENTRYPOINT ["/bin/bash", "-c", ". /usr/local/app/src/myenv/bin/activate && exec python manage.py runserver"]

# Default command to specify the IP and port for Django
CMD ["0.0.0.0:8000"]

