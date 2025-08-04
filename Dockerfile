FROM alpine:3.19

RUN apk add --no-cache curl jq bash

COPY update-timezones.sh /update-timezones.sh
RUN chmod +x /update-timezones.sh

CMD ["/update-timezones.sh"]
