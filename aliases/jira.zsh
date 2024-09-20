#!/bin/bash
jira ()
{
    TICKET_NAME=$1
    if [[ -z $1 ]]; then
        open 'https://jira.ti-apps.aws.grail.com/secure/RapidBoard.jspa?rapidView=707'
    else
        # Check if the input contains a dash, assuming format "PROJECT-123"
        if [[ $TICKET_NAME != *-* ]]; then
            TICKET_NAME="FACTORY-$TICKET_NAME"
        fi
        open "https://jira.ti-apps.aws.grail.com/browse/${TICKET_NAME}"
    fi
}
