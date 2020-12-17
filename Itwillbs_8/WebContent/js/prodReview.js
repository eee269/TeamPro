	
	// basicCode 가져오기
	function scriptQuery() {
		// 자신을 찾기위해 <script> 태그들을 찾음
	    var script = document.getElementsByTagName('script');   
	    script = script[script.length-1].src   // 가장 마지막이 자신이 됨
	       .replace(/^[^\?]+\?/, '') // 물음표 이전을 지움
	       .replace(/#.+$/, '') // 혹시 모를 해쉬도 지움
	       .split('&'); // '&' 으로 나눔                                   
	     var queries = {} // 결과용                        
	       , query;
	     while(script.length){ // &으로 나눈 갯수만큼                     
	          query = script.shift().split('='); // =로 나눠   
	          queries[query[0]] = query[1]; // 앞은 배열키, 뒤는 배열 값
	     }
	     return queries; // 스크립트 주소에서 쿼리 리턴
	}
	var member_id = scriptQuery().member_id;
	var basicCode = scriptQuery().basicCode;
	