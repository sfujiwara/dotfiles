#!/bin/bash

if [ ! -d "$HOME/google-cloud-sdk" ]; then
    curl https://sdk.cloud.google.com | bash
fi
