def handler(event, context):
    dynamic_string = "Hello, the time is: " + __import__('datetime').datetime.utcnow().isoformat()
    html = f"""
    <html>
      <body>
        <h1>{dynamic_string}</h1>
      </body>
    </html>
    """
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "text/html"},
        "body": html
    }