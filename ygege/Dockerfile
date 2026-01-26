FROM uwucode/ygege:latest

# Install jq to parse the options.json file
RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*

# Copy data for add-on
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
