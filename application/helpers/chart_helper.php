<?php 
require APPPATH . '/libraries/ChartJS.php';
function generate_chart($chartType, $lbl_array, $dt_array, $color_index, $yaxeslabel='', $showYaxes=true, $chartTitle='', $displayLegend='true', $legendPos='bottom', $titlePos='top', $legend_label){
    
    $data = $dt_array ;
    $labels = $lbl_array;
    $colors = array(
              array('backgroundColor' => 'rgba(48, 197, 95, 0.09)', 'borderColor' => '#0bc490'),
              array('backgroundColor' => '#5eb6d1', 'borderColor' => '#5eb6d1'),
              array('backgroundColor' => '#a89a70', 'borderColor' => '#a89a70'),
                array('backgroundColor' => array('#FF6384', '#4BC0C0', 'FFCE56', '36A2EB'))
              );

   $options = array(
        'responsive' => true,
        'scales' => array(
            'yAxes' => array(
                array(
                    'scaleLabel' => array(
                        'display' => $showYaxes,
                        'labelString' =>$yaxeslabel,
                        'fontSize' =>10,
                        'fontStyle'=>'bold',
                        'borderWidth'=>1,
                    ),
                    'ticks'=>array(
                    'beginAtZero'=> true,
                  )
                   
                )
            ),
            'xAxes'=> array(
                array(
                  'gridLines'=>array(/*
                    'zeroLineColor'=> "black",
                    'zeroLineWidth'=> 2*/
                    'display'=> true
                  ),
                  'ticks'=>array(
                    'autoSkip'=>false,
                    'maxRotation'=> 30,
                    'minRotation'=> 30,                    
                  ),
                  'scaleLabel'=>array(
                  'display'=> false,
                  'fontSize'=>16,
                  'labelString'=> $chartTitle
                  )
                )  
            )
        ),
        'legend' => array (
            'display' => $displayLegend,
            'position' => $legendPos,
            'labels' => array (
            'fontSize' => 12,
            'usePointStyle'=> true,
            )
        ),
        'title'=>array (
            'display'=>true,
            'text'=> $chartTitle,
            'fontSize' => 12,
            'position'=>$titlePos

        )
    );

    //html attributes fot the canvas element
    $attributes = array('id' => 'example', 'width' => 300, 'height' => 200, 'style' => 'display:inline; padding-left:5px');

    $datasets = array(
                    array('data' => $data, 'label' =>$legend_label)+$colors[$color_index] ,
                    //array('data' => $data, 'label' =>'Inactive')+$colors[2] ,
                    //array('data' => $data, 'label' =>'Inactive')+$colors[2] ,
                    //array('data' => $data[1], 'label' => "Legend2") + $colors[1],
                    //array('data' => $data[0], 'label' => "Legend1") + $colors[2],
                    //array('data' => $data[1], 'label' => "Legend2") + $colors[2],
                   // array('data' => $data[0]) + $colors[2],
                );

    /*
     * Create charts
     *
     */
    $attributes['id'] = 'status_kop';
    $chart = new ChartJS($chartType, $labels, $options, $attributes);
    $chart->addDataset($datasets[0]);
    //$chart->addDataset($datasets[1]);
    //$Line->addDataset($datasets[0]);    

    return $chart;
  }


  
function group_bar_chart($kanvas_id='chart_content', $dt_array, $lbl_array, $arr_dataset, $showYaxes =true, $yaxeslabel='', $displayLegend=true, $legendPos="bottom", $legendLabel='',$chartTitle='', $titlePos='top' ){
    $data = $dt_array;
    $labels = $lbl_array;

    //html attributes fot the canvas element
    $attributes = array('id' => $kanvas_id, 'width' => 500,  'height' => 400, 'style' => 'display:inline;');

    $datasets =  $arr_dataset ;
                  
    $options = array(
                'responsive' => true,
                'scales' => array(
                    'yAxes' => array(
                        array(
                            'scaleLabel' => array(
                                'display' => $showYaxes,
                                'labelString' =>$yaxeslabel,
                                'fontSize' =>12,
                                'fontStyle'=>'bold',
                                'borderWidth'=>1,
                            ),
                            'ticks'=>array(
                            'beginAtZero'=> true,
                          )
                           
                        )
                    ),
                    'xAxes'=> array(
                        array(
                          'gridLines'=>array(
                            'zeroLineColor'=> "black",
                            'zeroLineWidth'=> 5,
                            'display'=> false
                          ),
                          'ticks'=>array(
                            'autoSkip'=>false,
                            'maxRotation'=> 30,
                            'minRotation'=> 30,                    
                          ),
                          'scaleLabel'=>array(
                          'display'=> false,
                          'fontSize'=>16,
                          'labelString'=> $chartTitle
                          )
                        )  
                    )
                ),
                'legend' => array (
                    'display' => $displayLegend,
                    'position' => $legendPos,
                    'labels' => array (
                    'fontSize' => 11,
                    'usePointStyle'=> false,
                    )
                ),
                'title'=>array (
                    'display'=>true,
                    'text'=> $chartTitle,
                    'fontSize' => 14,
                    'position'=>$titlePos

                )
            );

   // $attributes['id'] = $kanvas_id;
    $chart = new ChartJS('bar', $labels, $options, $attributes);
    $i=0;
    foreach($arr_dataset as $dt){
        $chart->addDataset($datasets[$i]);
        $i++; 
    }    
    return $chart;
}



?>