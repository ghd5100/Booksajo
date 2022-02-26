<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/search_center.css" />

<!-- 여기다가 검색테이블 구현하면.. -->

<script>

<script>
function reloadmodal(){  
      $("#modal").load(window.location.href + "#modal");
}


function 함수이름(){  //10초마다 리로드해줘라.
    setTimeout('location.reload()',10000); 
}

</script>





</script>




    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>모달</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                
            </div>
        </div>
    </div>
    
    
    


<div id="today">


</div>

<div id="best">


</div>


<script src='/js/search_center.js'></script>