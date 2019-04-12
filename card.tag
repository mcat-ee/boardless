<card>
	<style type="text/css">
		.cardContainer{
			min-width: 300px;
			width:300px;
			min-height: 50px;
			background-color: #eee; 
		}

		.cardText{
			width:100%;
			height:100%;
		}

		.cardText:focus{
		    line-height: 50px;
		}

		[contenteditable=true]:empty:before {
		  content: attr(placeholder);
		  display: block;  For Firefox 
		}

	</style>
	<div class="cardContainer ">
		<div class="cardText" contenteditable="true" placeholder="Enter text here" >{ this.text || '' }</div>
	</div>
</card>