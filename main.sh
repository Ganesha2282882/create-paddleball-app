#!/bin/bash

echo "Adding files..."
mkdir $1
cd $1
npm i buble 1> /dev/null 2> /dev/null
wget https://raw.githubusercontent.com/Ganesha2282882/paddleballjs/main/index.js -O paddleball.js 1> /dev/null 2> /dev/null
cat > index.html <<EOF
<!DOCTYPE html>
<html>
<body>
    <script src="paddleball.js"></script>
    <script src="index.jsx.js"></script>
</body>
</html>
EOF
cat > index.jsx <<EOF
<div>
    <h1>Welcome to paddleball!</h1>
    <p>Edit <code>index.jsx</code> to change this page.</p>
</div>
EOF
cat > build.sh <<EOF
for i in *.jsx
do 
    node_modules/.bin/buble \$i -o \$i.js
done
EOF
cat > package.json <<EOF
{
    "scripts": {
        "start": "killall python; bash build.sh && bash -c 'python -m http.server 12345 1> /dev/null 2> /dev/null' & sleep 1; xdg-open http://localhost:12345"
    }
}
EOF
cat > package.json <<EOF
node_modules/
package-lock.json
*.jsx.js
EOF
echo 'App created!'
echo "Now, run 'npm start' in your app's directory!"
