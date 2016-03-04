projName="jido"
files=('index')

###-----------------------------------------------

formats=('style' 'phone' 'desktop' 'tablet' 'hdscreen')
PROJECT_ROOT='projects'
LAB_CORE_ROOT="core"


tmp='.tmp_sass'
rm -rf $tmp
mkdir $tmp

cp -rf $LAB_CORE_ROOT/sass/* $tmp
cp -rf $PROJECT_ROOT/$projName/sass/* $tmp
cp -rf $PROJECT_ROOT/$projName/fonts/* $tmp

for i in ${formats[@]}; do
  sass $tmp/$i.sass public/css/$i.css
done


for i in ${files[@]}; do
  cat $LAB_CORE_ROOT/templates/header.mustache > temp.mustache
  cat $PROJECT_ROOT/$projName/templates/$i.mustache >> temp.mustache
  cat $LAB_CORE_ROOT/templates/footer.mustache >> temp.mustache
  mustache $PROJECT_ROOT/$projName/content/$i.yml temp.mustache > public/$i.html
  rm  -rf temp.mustache
done
