<SCRIPT>
    var _array_eventos;
    var libro = new Array();

    $('.document').ready(function(){

        var action = 'index.php?r=config/obtenerIncidencia';

        $.getJSON(action, function(listaJson){

            var datos = new Array();

            for(var j=0; j<=listaJson.length-1; j++){
                datos[j] = new Object();
                datos[j].title = listaJson[j].title;
                datos[j].start = listaJson[j].start;
                datos[j].end = listaJson[j].end;
                datos[j].id = listaJson[j].id;
                datos[j].indicador = listaJson[j].indicador;
            }

            for(var i=1; i<=listaJson.length; i++){
                libro[i-1] = new Object();
                libro[i-1].title = datos[i-1].title;
                libro[i-1].start = datos[i-1].start;
                libro[i-1].end = datos[i-1].end;
                libro[i-1].id = datos[i-1].id;
                libro[i-1].indicador = datos[i-1].indicador;
                libro[i-1].url = 'index.php?r=' + libro[i-1].indicador +'/view' + libro[i-1].indicador + '&id=' + libro[i-1].id + '';
            }

            _array_eventos = libro;

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next',
                    center: '  '+'title',
                    right: ''
                    //month,agendaWeek,agendaDay
                },
                defaultDate: new Date(),
                events: _array_eventos
            });

            $('.fc-button').click(function(){ 
                caracterizar();
            });

            caracterizar();
        });

            function caracterizar(){
                $(".fc-event-inner").each(function(){
                    var texto = $(this).text();
                    var posicion = texto.indexOf(":");
                    var valor = texto.substr(posicion + 1, texto.length);

                    if(valor < 35)
                        $(this).css("background","#FA5833");

                    if(valor > 36 && valor < 50)
                        $(this).css("background","#F4A506");

                    if(valor > 51 && valor < 90)
                        $(this).css("background","#2FABE9");

                    if(valor > 90)
                        $(this).css("background","#78CD51");

                    //#78CD51 verde
                    //#FA5833 rojo
                    //#2FABE9 azul
                    //#F4A506 amarillo
                });
            };
    });



</SCRIPT>
<?php 
Yii::app()->user->returnUrl = Yii::app()->request->requestUri;

$this->breadcrumbs=array(
    'Calendario'=>array('index'),
);
?>

<?php 
$this->headers = ' Calendario de procesos ( '.Establecimientos::get_establecimiento_descripcion(Cruge_Fieldvalue::get_default_establecimiento()).')';
?>

<div class="row">
    <div class="box col-md-12">
        <div class="box-content">
            <div id="calendar"></div>
        </div>
    </div>
</div>