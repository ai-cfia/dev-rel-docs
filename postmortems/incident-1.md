# Nachet backend classification not working (incident #1)

### Date

19/01/2024

### Authors

Jonathan Lopez (@SonOfLope) and Thomas Cardin (@ThomasCardin)

### Status

Solved

### Summary

https://nachet.ninebasetwo.xyz/ -> Capture (the button next to Video Feed) ->
Load (Load an image from the sample) -> Classify

Returned a 500 internal server error with the following stack trace
```bash
Traceback (most recent call last):
  File "/usr/local/lib/python3.12/urllib/request.py", line 1344, in do_open
    h.request(req.get_method(), req.selector, req.data, headers,
  File "/usr/local/lib/python3.12/http/client.py", line 1327, in request
    self._send_request(method, url, body, headers, encode_chunked)
  File "/usr/local/lib/python3.12/http/client.py", line 1373, in _send_request
    self.endheaders(body, encode_chunked=encode_chunked)
  File "/usr/local/lib/python3.12/http/client.py", line 1322, in endheaders
    self._send_output(message_body, encode_chunked=encode_chunked)
  File "/usr/local/lib/python3.12/http/client.py", line 1120, in _send_output
    self.send(chunk)
  File "/usr/local/lib/python3.12/http/client.py", line 1045, in send
    self.sock.sendall(data)
  File "/usr/local/lib/python3.12/ssl.py", line 1212, in sendall
    v = self.send(byte_view[count:])
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/ssl.py", line 1181, in send
    return self._sslobj.write(data)
           ^^^^^^^^^^^^^^^^^^^^^^^^
ssl.SSLEOFError: EOF occurred in violation of protocol (_ssl.c:2406)

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.12/site-packages/quart/app.py", line 1376,
  in handle_request
    return await self.full_dispatch_request(request_context)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/site-packages/quart/app.py", line 1414,
  in full_dispatch_request
    result = await self.handle_user_exception(error)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/site-packages/quart/app.py", line 1007,
  in handle_user_exception
    raise error
  File "/usr/local/lib/python3.12/site-packages/quart/app.py", line 1412,
  in full_dispatch_request
    result = await self.dispatch_request(request_context)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/site-packages/quart/app.py", line 1506,
  in dispatch_request
    return await self.ensure_async(handler)(**request_.view_args)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/app.py", line 188, in inference_request
    response = urllib.request.urlopen(req)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/urllib/request.py", line 215, in urlopen
    return opener.open(url, data, timeout)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/urllib/request.py", line 515, in open
    response = self._open(req, data)
               ^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/urllib/request.py", line 532, in _open
    result = self._call_chain(self.handle_open, protocol, protocol +
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/urllib/request.py", line 492, in _call_chain
    result = func(*args)
             ^^^^^^^^^^^
  File "/usr/local/lib/python3.12/urllib/request.py", line 1392, in https_open
    return self.do_open(http.client.HTTPSConnection, req,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/urllib/request.py", line 1347, in do_open
    raise URLError(err)
urllib.error.URLError: <urlopen error EOF occurred in violation of protocol
(_ssl.c:2406)>
```

### Impact

We couldn't classify any images using the Azure AI Model.

### Root Causes

The API Key of the Azure AI Model was regenerated. So, the current one used
in production wasn't valid. Therefore, any request made to the model was
returning a 401 Unauthorized.

### Trigger

Regenerating the API Key of the Azure AI Model used inside nachet.

### Resolution

Changed the API Key inside our Vault with the new value.

### Detection

The detection was found by nachet team (including frontend and backend) and our
team lead.

## Action Items

### Nachet backend team (NBT):
|Action items|Type|Priority|Owner|Tracking bug|
|--------|-------|-------|-------|-------|
|Instrument the application|mitigate|P0|NBT|[issue 50](#ref-50)|

### Nachet frontend team (NFT):
|Action items|Type|Priority|Owner|Tracking bug|
|--------|-------|-------|-------|-------|
|Instrument the application|mitigate|P0|NFT|[issue 88](#ref-88)|

### DevSecOps Team (DT):
|Action items|Type|Priority|Owner|Tracking bug|
|--------|-------|-------|-------|-------|
|Monitor API Key regeneration|detect|P1|DT|[issue 22](#ref-22)|
|Add 500 internal server error alerts|detect|P1|DT|[issue 23](#ref-23)|
|Disallow API Key changes without approval|mitigate|P1|DT|[issue 21](#ref-21)|
|Support instrumented applications|mitigate|P1|DT|[issue 13](#ref-13)|

## Lessons Learned

Avant de regarder pour la solution parfaites a l'erreur. Y aller etapes
par etapes.

### What went well

Once the error was identified, resolving the problem
did not take much time.

### What went wrong

The stack trace returned by the error was misleading. Identifying the error was
not straightforward, so a significant amount of time was spent finding an
issue related to the TLS/SSL layer.

### Where we got lucky

Reproducing the error locally made the identification of the error quick.

## Timeline

**2023-01-17 (15:00):** One of our clients claims that the classification
is not working.

**2023-01-17 (15:10):** A DevSecOps confirms a 500 Internal Server Error for
Capture -> Load (with sample image) -> Classify.

**2023-01-17 (15:15):** An issue is opened with the DevSecOps Team
regarding the problem.

**2023-01-17 (15:30):** The DevSecOps team is now working on the problem.

**2023-01-17 (16:00):** The team tries to find a solution to the problem,
but the solutions provided do not resolve the root cause.

**2023-01-18 (8:00):** The upload limit is increased on the backend Ingress.

**2023-01-18 (8:30):** Increasing the upload limit solves part of the problem,
but not the 500 Internal Server Error.

**2023-01-18 (9:15):** Replication of the problem locally.

**2023-01-18 (10:00):** Discussions are exchanged with the backend team to
better understand the software structure.

**2023-01-18 (10:45):** A hypothesis is put forward by the backend team and
the team lead that the AI model may have undergone changes.

**2023-01-18 (11:30):** Tests are performed locally, and an error still occurs,
but this time it's a 401.

**2023-01-18 (11:40):** A comparison between the API Key of the model and the one
in production is done.

**2023-01-18 (11:45):** There is confirmation of a divergence between the API
of the model and the one in production.

**2023-01-18 (12:00):** The API Key of the model in production is modified.

**2023-01-18 (13:05):** Problem resolved.

## Supporting information

<a id="ref-50"></a> <https://github.com/ai-cfia/nachet-backend/issues/50>

<a id="ref-88"></a> <https://github.com/ai-cfia/nachet-frontend/issues/88>

<a id="ref-13"></a> <https://github.com/ai-cfia/infra/issues/13>

<a id="ref-21"></a> <https://github.com/ai-cfia/infra/issues/21>

<a id="ref-22"></a><https://github.com/ai-cfia/infra/issues/22>

<a id="ref-23"></a><https://github.com/ai-cfia/infra/issues/23>
