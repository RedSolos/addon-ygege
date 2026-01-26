FROM uwucode/ygege:latest

# Install jq to parse the options.json file
RUN apk add --no-cache jq

# Copy data for add-on
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
