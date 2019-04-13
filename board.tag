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
		<div id="cards" class={"cards " + this.opts.classNameForCards}>
			<div each={item in items} class="rowContainer">
				<div class="handle"></div>
				<div class="cardText" contenteditable="true" placeholder="Enter text here"></div>
			</div>
		</div>
		<div class="addCardButton" onclick={() => this.addCard()}>
			Add Card
		</div>
	</div>

	<script type="text/javascript">
		this.items = opts.items || [];
		this.addCard = () => {
			this.items.push("");
			this.update();
		};

		$( function() {
			// var elements = document.getElementsByClassName("addCardButton");
			var boardTags = window.boardTags.map(item => "."+item);
			// for(var i = 0 ; i < elements.length ; i++) {
				// var el = elements[i];
				
					$(".cards").each (function() 
						{
							var boardElement = $(this);
							boardElement.sortable({
							 	 cursor: "move",
								 delay: 150,
								 distance: 5,
								 handle: ".handle",
								 // connectWith: boardTags,
							}); 
					});				
			// }

		});

	</script>
</board>