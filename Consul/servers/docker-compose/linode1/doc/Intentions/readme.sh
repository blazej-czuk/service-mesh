xh -b http://10.5.0.2:8500/v1/connect/intentions
[
    {
        "SourceNS": "default",
        "SourceName": "pgadmin",
        "DestinationNS": "default",
        "DestinationName": "postgres",
        "SourceType": "consul",
        "Action": "allow",
        "Precedence": 9,
        "CreateIndex": 1089,
        "ModifyIndex": 1089
    },
    {
        "SourceNS": "default",
        "SourceName": "*",
        "DestinationNS": "default",
        "DestinationName": "*",
        "SourceType": "consul",
        "Action": "deny",
        "Precedence": 5,
        "CreateIndex": 1087,
        "ModifyIndex": 1087
    }
]


