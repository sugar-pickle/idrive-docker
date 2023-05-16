#!/bin/bash
docker build -t idrive .
docker tag idrive sugarpickle/idrive
docker push sugarpickle/idrive
