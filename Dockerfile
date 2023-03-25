FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

# added this line to fix the error during lint
ENV PIP_NO_CACHE_DIR=1

## Step 2:
# Copy source code to working directory
COPY app.py /app/
COPY Makefile /app/
COPY requirements.txt /app/
COPY model_data /app/model_data

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip setuptools wheel --use-pep517 pip &&\
	pip install -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]