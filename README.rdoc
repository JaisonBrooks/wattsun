== WATTSUN

WattSun is an external API key that enables a user to easily convert watts to watt-hours, joules to watts, and amps to watts.

Example

```
curl http://wattsun-k92aes2xkf.elasticbeanstalk.com/power?watts=123456
```

Response

```json
{"watts":123456,"kilowatts":123.456,"megawgiatts":0.123456,"code":200}
```
