import json

def handler(event, context):
    path = event.get("rawPath", "")
    method = event.get("requestContext", {}).get("http", {}).get("method", "")

    if path == "/health" and method == "GET":
        return response(
            200,
            {
                "status": "ok",
                "service": "lambda-echo"
            }
        )

    if path == "/echo" and method == "GET":
        return response(
            200,
            {
                "message": "Echo Lambda is alive 🚀"
            }
        )

    return response(
        404,
        {
            "error": "Route not found",
            "path": path,
            "method": method
        }
    )


def response(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(body)
    }
