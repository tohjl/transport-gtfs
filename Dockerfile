# Step 1: Set up the base image
FROM python:3.11-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Install system dependencies (optional, for specific packages like PostgreSQL or others)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Step 4: Install Python dependencies from requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the Django project files into the container
COPY .. /app/

# Step 6: Expose port 8000 (the default port for Django's development server)
EXPOSE 8000

# Step 7: Set the default command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
