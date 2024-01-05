# API Dockerfile
FROM python:3.9

# Copy requirements file
COPY requirements.txt .

# Copy module files
COPY src/gateio_new_coins_announcements_bot ./src/gateio_new_coins_announcements_bot
COPY pyproject.toml .
COPY README.md .
COPY setup.cfg .
COPY setup.py .
COPY main.py .

# Copy relevant files to run bot
COPY config.yml .
COPY old_coins.json .
COPY auth/auth.yml ./auth/

#root directory contains main.py to start the bot as well as all config/auth.yml files
WORKDIR .

#Upgrade setuptools and pip
# RUN pip install --upgrade setuptools && \
#     pip install --upgrade pip

# install necessary requirements
RUN pip3 install --no-cache-dir -r requirements.txt

CMD [ "python", "main.py"]
