echo "Welcome to This svelte install script
It will install Vite + Svelte + TailwindCSS + Daisyui
"
echo "Installing svelte"
read -p "Enter your Svelte Project Name: " PROJECTNAME
yarn create vite $PROJECTNAME --template svelte
cd $PROJECTNAME
yarn
# yarn dev //start development server
echo "Svelte Install Complete"

echo "Installing TailwindCSS"
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
npx tailwindcss init -p
touch src/index.css
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > src/index.css

# Editing main.js
TEXT="import './index.css'\n"
tmpfile="mktemp"
head -n1 src/main.js > $tmpfile
echo $TEXT >> $tmpfile
tail -n5 src/main.js >> $tmpfile
mv $tmpfile src/main.js

# Renaming postcss.config.js & tailwind.config.js
mv postcss.config.js postcss.config.cjs
mv tailwind.config.js tailwind.config.cjs

# Installing Daisy-UI
yarn add daisyui

# Editing tailwind.config.cjs
TEXT=" plugins: [
      require('daisyui'),
    ],"
tmpfile="mktemp"
head -n9 tailwind.config.cjs > $tmpfile
echo $TEXT >> $tmpfile
tail -n1 tailwind.config.cjs >> $tmpfile
mv $tmpfile tailwind.config.cjs


echo "
                
                Created By https://github.com/NobinKhan

"
echo "Now run 'npm run dev' or 'yarn dev' to start the Development server"
code .