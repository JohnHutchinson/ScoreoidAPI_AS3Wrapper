package com.rubberduckygames.scoreoid
{
	
	import flash.net.URLVariables;

	internal class ScoreoidGameCalls
	{
		private var api:ScoreoidAPI;
		
		public function ScoreoidGameCalls(api:ScoreoidAPI)
		{
			this.api = api;
		}
		
		/** Get all the game info.
		 * @see http://wiki.scoreoid.net/api/game/getgame/**/
		public function getGame(onResponseCallback:Function):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_GAME);
		}
		
		/** Get a specific field from the game info.
		 * @see http://wiki.scoreoid.net/api/game/getgamefield/
		 * @param field **/
		public function getGameField(onResponseCallback:Function, field:String):void
		{
			var urlVariables:URLVariables = new URLVariables();
			urlVariables.field = field;
			api.call(onResponseCallback, ScoreoidURLs.GET_GAME_FIELD, urlVariables);
		}
		
		/** This method is pulling all players for a game.
		 * @see http://wiki.scoreoid.net/api/game/getplayers/
		 * @param order_by [optional] "date" or "score"
		 * @param order [optional] "asc" or "dsc"
		 * @param limit [optional] "20" retrieves rows 1 - 20 | "10,20" retrieves 20 scores starting from the 10th
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string **/
		public function getPlayers(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_PLAYERS, optional);
		}
		
		/** Returns the average value of the input field
		 * @see http://wiki.scoreoid.net/api/game/getgameaverage/
		 * @param field
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string **/
		public function getGameAverage(onResponseCallback:Function, field:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.field = field;
			api.call(onResponseCallback, ScoreoidURLs.GET_GAME_AVERAGE, optional);
		}
		
		/** Returns the top value of the input field.
		 * @see http://wiki.scoreoid.net/api/game/getgametop/
		 * @param field 
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string **/
		public function getGameTop(onResponseCallback:Function, field:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.field = field;
			api.call(onResponseCallback, ScoreoidURLs.GET_GAME_TOP, optional);
		}
		
		/** Returns the lowest value of the input field.
		 * @see http://wiki.scoreoid.net/api/game/getgamelowest/
		 * @param field 
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string  **/
		public function getGameLowest(onResponseCallback:Function, field:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.field = field;
			api.call(onResponseCallback, ScoreoidURLs.GET_GAME_LOWEST, optional);
		}
		
		/** Returns the total value of the input field.
		 * @see http://wiki.scoreoid.net/api/game/getgametotal/
		 * @param field
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string  **/
		public function getGameTotal(onResponseCallback:Function, field:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.field = field;
			api.call(onResponseCallback, ScoreoidURLs.GET_GAME_TOTAL, optional);
		}
		
		/** This method gets the active notifications for a game.
		 * @see http://wiki.scoreoid.net/api/game/getnotification/ **/
		public function getNotification(onResponseCallback:Function):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_NOTIFICATION);
		}
	}
}