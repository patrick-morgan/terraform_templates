#!/bin/bash
terraform output encrypted_password | base64 --decode | gpg --decrypt >> password.txt