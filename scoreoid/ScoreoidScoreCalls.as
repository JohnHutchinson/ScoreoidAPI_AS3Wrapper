package com.rubberduckygames.scoreoid
{
	import flash.net.URLVariables;

	internal class ScoreoidScoreCalls
	{
		private var api:ScoreoidAPI;
		
		public function ScoreoidScoreCalls(api:ScoreoidAPI)
		{
			this.api = api;
		}
		
		/** Insert a new player score for a game.
		 * @see http://wiki.scoreoid.net/api/score/createscore/
		 * @param score
		 * @param username
		 * @param platform [optional] Matched string
		 * @param unique_id [optional] The unique_id parameter is designed to lock in a player 
		 * into a device or platform IE player "X" can only be played from device "X", 
		 * you can have multiple players on one device but they can only play from that device.
		 * A simple scenario is using the device/platform ID as a primary key for user identification.
		 * @param difficulty [optional] Integer value between 1 to 10 **/
		public function createScore(onResponseCallback:Function, score:String, username:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.score = score;
			optional.username = username;
			api.call(onResponseCallback, ScoreoidURLs.CREATE_SCORE, optional);
		}
		
		/** Returns total number of scores for the game
		 * @see http://wiki.scoreoid.net/api/score/countscores/
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string  
		 * @param difficulty [optional] Integer value between 1 to 10 **/
		public function countScores(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.COUNT_SCORES, optional);
		}
		
		/** Returns total number of best scores for the game
		 * @see http://wiki.scoreoid.net/api/score/countbestscores/
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string  
		 * @param difficulty [optional] Integer value between 1 to 10  **/
		public function countBestScores(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.COUNT_BEST_SCORES, optional);
		}
		
		/** This method is pulling all the scores for a game.
		 * @see http://wiki.scoreoid.net/api/score/getscores/
		 * @param order_by [optional] "date" or "score"
		 * @param order [optional] "asc" or "dsc"
		 * @param limit [optional] "20" retrieves rows 1 - 20 | "10,20" retrieves 20 scores starting from the 10th
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string 
		 * @param difficulty [optional] Integer value between 1 to 10 **/
		public function getScores(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_SCORES, optional);
		}
		
		/** This method is pulling all the best scores for a game.
		 * @see http://wiki.scoreoid.net/api/score/getbestscores/
		 * @param order_by [optional] "date" or "score"
		 * @param order [optional] "asc" or "dsc"
		 * @param limit [optional] "20" retrieves rows 1 - 20 | "10,20" retrieves 20 scores starting from the 10th
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string 
		 * @param difficulty [optional] Integer value between 1 to 10 **/
		public function getBestScores(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_BEST_SCORES, optional);
		}
		
		/** Returns the average score for the game
		 * @see http://wiki.scoreoid.net/api/score/getaveragescore/
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string 
		 * @param difficulty [optional] Integer value between 1 to 10 **/
		public function getAverageScore(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_AVERAGE_SCORE, optional);
		}
	}
}