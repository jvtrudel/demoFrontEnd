formats=('portable' 'desktop' 'tablet' 'hdscreen')

for i in $formats; do
  sass sass/$i.sass public/css/$i.css
done

mustache content/_accueil.yml template/accueil.mustache > public/index.html
