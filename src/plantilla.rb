# encoding: utf-8
############################################################################
#    Copyright (C) 2013 by Guillermo Valdes Lozano                         #
#    guivaloz@movimientolibre.com                                          #
#                                                                          #
#    This program is free software; you can redistribute it and#or modify  #
#    it under the terms of the GNU General Public License as published by  #
#    the Free Software Foundation; either version 2 of the License, or     #
#    (at your option) any later version.                                   #
#                                                                          #
#    This program is distributed in the hope that it will be useful,       #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of        #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         #
#    GNU General Public License for more details.                          #
#                                                                          #
#    You should have received a copy of the GNU General Public License     #
#    along with this program; if not, write to the                         #
#    Free Software Foundation, Inc.,                                       #
#    59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             #
############################################################################

#
# Clase Plantilla
#
class Plantilla

    #
    # Propiedades modificables
    #
    attr_writer :titulo_sitio, :frase_sitio, :grafico_encabezado, :menu_principal, :menu_secundario, :contenido_secundario, :pie_html, :archivo_rss

    #
    # Valores por defecto de las propiedades
    #
    def initialize
        # Propiedades modificables
        @titulo_sitio = 'Título del sitio'
        @frase_sitio  = 'Descripción del sitio'
    end

    #
    # Entrega el HTML de la página web
    #
    # titulo    es cadena de texto que se agrega al title
    # contenido es el contenido de la página en HTML
    # en_raiz   es boleano, verdadero si el archivo va a la raiz del sitio
    #
    public
    def to_html(titulo, contenido, en_raiz=false)
        a = Array.new
        a << '<!DOCTYPE html>'
        a << '<html lang="es">'
        a << '<head>'
        a << '  <meta charset="utf-8">'
        a << '  <meta http-equiv="X-UA-Compatible" content="IE=edge">'
        a << '  <meta name="viewport" content="width=device-width, initial-scale=1.0">'
        a << <<SEO
<meta name="description" content="Sitio Oficial de Dirección de Seguridad Publica Municipal. Numeros de atención ciudadana 066 y 7290099"> 


<!--SEO META-DATA-->

<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@policiatorreon">
<meta name="twitter:title" content="Twitter de la Policia de Torreon">
<meta name="twitter:description" content="Numeros de emergencia 066 y 7290099">
<meta name="twitter:creator" content="@policiatorreon">
<meta name="twitter:image:src" content="">
<meta name="twitter:domain" content="http://policia.torreon.gob.mx">
<meta name="twitter:app:name:iphone" content="">
<meta name="twitter:app:name:ipad" content="">
<meta name="twitter:app:name:googleplay" content="">
<meta name="twitter:app:url:iphone" content="">
<meta name="twitter:app:url:ipad" content="">
<meta name="twitter:app:url:googleplay" content="">
<meta name="twitter:app:id:iphone" content="">
<meta name="twitter:app:id:ipad" content="">
<meta name="twitter:app:id:googleplay" content="">



SEO
        a << '  <meta name="author" content="Policia de Torreon">'
        if en_raiz
            a << '  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">'
            a << "  <link rel=\"alternate\" type=\"application/rss+xml\" title=\"#@titulo_sitio\" href=\"#@archivo_rss\" />" if @archivo_rss != nil
        else
            a << '  <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">'
            a << "  <link rel=\"alternate\" type=\"application/rss+xml\" title=\"#@titulo_sitio\" href=\"../#@archivo_rss\" />" if @archivo_rss != nil
        end
        a << "  <title>#@titulo_sitio | #{titulo}</title>"
        a << '  <!-- TWITTER BOOTSTRAP INICIA -->'
        if en_raiz
          a << '<link href="css/bootstrap.css" rel="stylesheet">'
          a << '<link href="css/navbar.css" rel="stylesheet">'
          a << '<link href="css/style.css" rel="stylesheet">'
          a << ' <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
                 <!--[if lt IE 9]>
                   <script src="js/html5shiv.js"></script>
                   <script src="js/respond.min.js"></script>
                 <![endif]-->'
        else
          a << '<link href="../css/bootstrap.css" rel="stylesheet">'
          a << '<link href="../css/navbar.css" rel="stylesheet">'
          a << '<link href="../css/style.css" rel="stylesheet">'
          a << ' <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
                 <!--[if lt IE 9]>
                   <script src="../js/html5shiv.js"></script>
                   <script src="../js/respond.min.js"></script>
                 <![endif]-->'
        end
	      a << '
    
  </head>
  <body class="Fondo ">
    <div class="container ">
           <!-- Static navbar -->
          <a href="/index.html"><img src="/imagenes/policia-torreon.png" class="NavLogo img-responsive"                       alt="Policia de Torreon"></a>

      <div class="navbar navbar-default NavBar Contenedor">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav NavMenu">
           <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Inicio<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="index.html">Página Inicial</a></li>
          <li><a href="direccion/mensaje.html">Mensaje de la Dirección</a></li>
          <li><a href="direccion/academia.html">Academia</a></li>
          <li><a href="comunicados/index.html">Comunicados</a></li>
        </ul>
      </li>
            <li><a href="/atencionciudadana/atencion.html">Atencion Ciudadana </a></li>
      <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Prevención del Delito <b class="caret"></b></a>
      <ul class="dropdown-menu">
          <li><a href="prevenciondeldelito/prevencion.html">Nuestra Misión</a></li>
          <li><a href="prevenciondeldelito/shogar.html">Seguridad en el hogar</a></li>
          <li><a href="prevenciondeldelito/svehiculo.html">Seguridad en el vehiculo</a></li>
          <li><a href="prevenciondeldelito/evitesersecuestrado.html">Evite ser secuestrado</a></li>
          <li><a href="prevenciondeldelito/eviteserasaltado.html">Evite ser asaltado</a></li>
      </ul>
      </li>
      <li><a href="/unidadespecializada/uespecial.html">Unidad Especializada</a></li> 
<div class="visible-lg">
<a href="http://facebook.com/policiatorreon"><img src="/imagenes/facebook.png" alt="Facebook" width="50px" class="fb"></a>
<a href="http://twitter.com/policiatorreon"><img src="/imagenes/twitter.png" alt="Twitter" width="50px" class="tw"></a>  
      </div></ul>
<div class="fin-nav visible-lg"></div>
        </div><!--/.nav-collapse -->

</div>
 <br>
<div class="row">
<div class="col-sm-8">

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="/imagenes/1.jpg" alt="Carrousel" class="img-responsive">
      <div class="carousel-caption">
      </div>
    </div>
 <div class="item ">
      <img src="/imagenes/2.jpg" alt="Carrousel" class="img-responsive">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
</div>
<div class="row">'
        a << '<!-- CONTENIDO -->'
        a << "<h1>#{titulo}</h1>"
        a << contenido
        if @contenido_secundario != nil
            a << '    <!-- CONTENIDO SECUNDARIO -->'
            a << '    <div class="panel panel-default">'
            a << '      <div class="panel-body cuerpo">'
            a << @contenido_secundario
            a << '</div>'
            a << '</div>'
        end 
        a << '  </div>
<div class="row metro">
<div class="col-sm-8">
<a href="/prevenciondeldelito/pjuvenil.html">
<div class="col-sm-12 naranja"><div class=""></div><div class="col-sm-12">Policia Juvenil Deportiva</div></div>
</a>
<a href="/convocatoria.png">
<div class="col-sm-12 amarillo"><div class="col-sm-12"><center>Convocatoria</center></div></div></a>
</div>
<center><div class="col-sm-3 rosa"><img src="/imagenes/carros-asegurados.png" alt="carros asegurados" class="img-responsive" width="175px"> Vehiculos <br> Recuperados</div></center>
</div>

<div class="row metro">
<a href="/prevenciondeldelito/escuadronk9.html"><div class="col-sm-6 verde"><center class="cuadrotexto">Escuadron K-9</center></div></a>
<a href="/prevenciondeldelito/pjuvenil.html"><div class="col-sm-6 azulm"><center class="cuadrotexto">D.A.R.E</center></div></a>
</div>
<br><br>

</div>' # container contenido
	
	a << "
	<!--inicia lateral-->
	<div class='col-sm-3 Lateral'>  
	<center><img src='imagenes/logo-solido.jpg' class='img-responsive' alt ='Presidencia' width='150px' ></center>
	<br>
	<center>
	  <a class='twitter-timeline' data-dnt='true' href='https://twitter.com/PolicíaTorreon'  data-widget-id='385487528079261696'>Tweets por @PolicíaTorreon</a>
	<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','twitter-wjs');</script>
	</center><br><br>
	<center><img src='imagenes/066.jpg' class='img-responsive' alt ='Emergencias'></center>

	</div>
	</div><br><br>

<center><img src='imagenes/ciudad-que-vence.png'  alt='Ayuntamiento de torreon 2014-2017'></center>
	      <!--Termina el contenido e inicia el pie de pagina-->
	    <footer class='PieFondo'><div class='row'>
	<div class='col-sm-6 PieTexto' >Emergencias: <strong>066</strong></div>
	 
	<div class='col-sm-6 PieTexto'>Atención Ciudadana: 7290099</div>
</div><br><br><br><br>
	    </footer>
	    </div> <!-- /container -->
	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->"
if en_raiz
	   a << ' <script src="js/jquery.js"></script>'
     a << ' <script src="js/bootstrap.min.js"></script>
            <script type="text/javascript">
$(".carousel").carousel({
  interval: 3000
})
    </script>
'
      else
     a << '  <script src="../js/jquery.js"></script>'
     a << ' <script src="../js/bootstrap.min.js"></script>
          <script type="text/javascript">
$(".carousel").carousel({
  interval: 3000
})
    </script>
'

end
a<< <<CHAT
<!-- begin olark code -->
<script data-cfasync="false" type='text/javascript'>/*<![CDATA[*/window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){
f[z]=function(){
(a.s=a.s||[]).push(arguments)};var a=f[z]._={
},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){
f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={
0:+new Date};a.P=function(u){
a.p[u]=new Date-a.p[0]};function s(){
a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){
hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){
return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){
b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{
b.contentWindow[g].open()}catch(w){
c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{
var t=b.contentWindow[g];t.write(p());t.close()}catch(x){
b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({
loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
/* custom configuration goes here (www.olark.com/documentation) */
olark.identify('7138-607-10-7498');/*]]>*/</script><noscript><a href="https://www.olark.com/site/7138-607-10-7498/contact" title="Contact us" target="_blank">Questions? Feedback?</a> powered by <a href="http://www.olark.com?welcome" title="Olark live chat software">Olark live chat software</a></noscript>
<!-- end olark code -->
CHAT
	a << '</body>
	</html>'
        a.join("\n")
    end

end
