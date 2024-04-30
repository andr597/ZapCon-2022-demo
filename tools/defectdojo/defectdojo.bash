#!/bin/bash

TOOLS="/app/tools"
REPORTS="/opt/reports/imports"
DOJO_IP=$(cat /app/tools/ip.conf | tail -n 1)

# Copy the reports directory over to the defectdojo area
cp -r $REPORTS $TOOLS/defectdojo/
# Move the defectdojo tooling
cd $TOOLS/defectdojo
# Install requests
pip3 install requests
# Run the importer
python3 dojo_import.py \
--url "http://$DOJO_IP" \
--token "f6be9375e64ef6fa23ee18825106e9158bd180e0" \
--project_name "Juice Shop"

cp -r $TOOLS/defectdojo/imports /opt/reports
rm -rf $TOOLS/defectdojo/imports
