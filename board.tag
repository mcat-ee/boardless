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

		.cardText{
			/*width:100%;*/
			/*height:100%;*/
			flex: 1;
			/*height:100%;*/
			line-height: 50px;
		}

		.cardText:focus{
		    line-height: 50px;
		}
		.rowContainer{
			display: flex;
			flex-direction: row;
			min-width: 300px;
			width:300px;
			min-height: 50px;
			background-color: #eee; 
		}

		.handle {
			flex: 0.25;
		}

		.handle:after {
		  content: '\2807';
		  font-size: 35px;
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

			//<div class="cardText" contenteditable="true" placeholder="Enter text here" >{ this.text || '' }</div>
			var list = document.getElementById("cards");
			var row = document.createElement("div");
			var lead = document.createElement("div");
			// lead.innerHTML = "A";

			lead.className="handle";
			row.appendChild(lead)
			
			row.className="rowContainer";
			  var tag = document.createElement('div');
			  tag.className="cardText";
			  tag.contentEditable="true";
			  // tag.placeholder="Enter text here";
			  tag.setAttribute("placeholder", "Enter text here");
			  row.appendChild(tag);
			  list.appendChild(row)
			  // riot.mount(tag, '');
		}
		$( function() {
		$("#cards").sortable({
			 cursor: "move",
			 delay: 150,
			 distance: 5,
			 handle: ".handle",
		});
		});
		// $("#cards").disableSelection();

	</script>
</board>