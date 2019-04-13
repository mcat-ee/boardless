<board>
	<style type="text/css">
		.cardContainer{
			min-width: 300px;
			width:300px;
			background-color: #fefefe; 
			margin-right:15px;
		}

		#cards{
			  display:flex;
			  flex-direction: column;
		}
		.addCardButton{
			width:100%;
			padding-top:25px;
			padding-bottom:25px;
			text-align: center;
			background-color: #ccc
		}

		.boardTitle:focus{
		}

		.boardTitle{
			font-size: 2em;
		}

		[contenteditable=true]:empty:before {
		  content: attr(placeholder);
		  display: block;  
		}

		.cardText{
			flex: 1;
			line-height: 30px;
			width:25%;
			padding-right:20px;
		}

		.cardText:focus{
		    line-height: 30px;
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

		}

		.handle:after {
			  content: '\2807';
			  font-size: 35px;
		 }
		 
		 .menuToggle {
		 	flex: 0.25;
		 	
		 }

		  .menuToggle:after {
		  	content: '\2809';
		  font-size: 35px;
		  }
	</style>
	<div class="cardContainer">
		<div class="boardTitle" contenteditable="true" placeholder="Enter title here"></div>
		<div id="cards" class={"cards " + this.opts.classNameForCards}>
			<div each={item in items} class="rowContainer">
				<div class="handle"></div>
				<div class="cardText" contenteditable="true" placeholder="Enter text here"></div>
				<div class="menuToggle"></div>
			</div>
		</div>
		<div class="addCardButton" onclick={() => this.addCard()} tabindex="0">
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
			var boardTags = window.boardTags.map(item => "."+item);
			$(".cards").each (function() 
				{
					var boardElement = $(this);
					boardElement.sortable({
					 	 cursor: "move",
						 delay: 150,
						 distance: 5,
						 handle: ".handle",
						 connectWith: boardTags,
					}); 
			});				
		});

	</script>
</board>