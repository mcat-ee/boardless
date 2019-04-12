<board>
	<style type="text/css">
		.cardContainer{
			min-width: 300px;
			width:300px;
			background-color: #fefefe; 
			margin-right:15px;
		}

		#cards{
			  /*position: relative;*/
			  display:flex;
			  flex-direction: column;
		}
		.addCardButton{
			width:100%;
			height:75px;
			text-align: center;
			background-color: #ccc
			/*vertical-align: middle;*/
		}

		.boardTitle:focus{
		    /*line-height: 50px;*/
		    /*font-size: 2em;*/
		}

		.boardTitle{
			font-size: 2em;
		}

		[contenteditable=true]:empty:before {
		  content: attr(placeholder);
		  display: block;  
		}

		
	</style>
	<div class="cardContainer">
	<!-- <card></card> -->
		<div class="boardTitle" contenteditable="true" placeholder="Enter title here"></div>
		<div id="cards"></div>
		<div class="addCardButton" onclick="addCard()">
			Add Card
		</div>
	</div>

	<script type="text/javascript">
		addCard = () => {
			var list = document.getElementById("cards");
			  var tag = document.createElement('card');
			  tag.className="item";
			  list.appendChild(tag)
			  riot.mount(tag, '');
		}

	</script>
</board>