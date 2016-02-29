
projName="cvJvtrudel"
files=('index')

###-----------------------------------------------

formats=('style' 'phone' 'desktop' 'tablet' 'hdscreen')
PROJECT_ROOT= "./projects"
LAB_CORE_ROOT="./core"

tmp='.tmp_sass'

cp -rf $LAB_CORE_ROOT/sass/* $tmp
cp -rf $PROJECT_ROOT/sass/* $tmp

for i in ${formats[@]}; do
  sass $tmp/$i.sass public/css/$i.css
done


#for i in ${files[@]}; do
#  cat $LAB_CORE_ROOT/templates/header.mustache > temp.mustache
#  cat $LAB_CORE_ROOT/templates/$i.mustache >> temp.mustache
#  cat template/footer.mustache >> temp.mustache
#  mustache content/$i.yml temp.mustache > public/$i.html
#  rm  -rf temp.mustache
#done
