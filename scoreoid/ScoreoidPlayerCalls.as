package com.rubberduckygames.scoreoid
{
	import flash.net.URLVariables;

	internal class ScoreoidPlayerCalls
	{
		private var api:ScoreoidAPI;
		
		public function ScoreoidPlayerCalls(api:ScoreoidAPI)
		{
			this.api = api;
		}
		
		/** Create a new player for a game.
		 * @see http://wiki.scoreoid.net/api/player/createplayer/
		 * @param username
		 * @param password [optional]
		 * @param score [optional]
		 * @param difficulty [optional] Integer value between 1 to 10
		 * @param unique_id [optional]
		 * @param first_name [optional]
		 * @param last_name [optional]
		 * @param email [optional]
		 * @param created [optional]
		 * @param updated [optional]
		 * @param bonus [optional]
		 * @param achievements [optional]
		 * @param best_score [optional]
		 * @param gold [optional]
		 * @param money [optional]
		 * @param kills [optional]
		 * @param lives [optional]
		 * @param time_played [optional]
		 * @param unlocked_levels [optional]
		 * @param unlocked_items [optional]
		 * @param inventory [optional]
		 * @param last_level [optional]
		 * @param current_level [optional]
		 * @param current_time [optional]
		 * @param current_bonus [optional]
		 * @param current_kills [optional]
		 * @param current_achievements [optional]
		 * @param current_gold [optional]
		 * @param current_unlocked_levels [optional]
		 * @param current_unlocked_items [optional]
		 * @param current_lives [optional]
		 * @param xp [optional]
		 * @param energy [optional]
		 * @param boost [optional]
		 * @param latitude [optional]
		 * @param longitude [optional]
		 * @param game_state [optional]
		 * @param platform [optional] **/
		public function createPlayer(onResponseCallback:Function, username:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.username = username;
			api.call(onResponseCallback, ScoreoidURLs.CREATE_PLAYER, optional);
		}
		
		/** Edit player information.
		 * @see http://wiki.scoreoid.net/api/player/editplayer/
		 * @param username
		 * @param password [optional]
		 * @param score [optional]
		 * @param difficulty [optional] Integer value between 1 to 10
		 * @param unique_id [optional]
		 * @param first_name [optional]
		 * @param last_name [optional]
		 * @param email [optional]
		 * @param created [optional]
		 * @param updated [optional]
		 * @param bonus [optional]
		 * @param achievements [optional]
		 * @param best_score [optional]
		 * @param gold [optional]
		 * @param money [optional]
		 * @param kills [optional]
		 * @param lives [optional]
		 * @param time_played [optional]
		 * @param unlocked_levels [optional]
		 * @param unlocked_items [optional]
		 * @param inventory [optional]
		 * @param last_level [optional]
		 * @param current_level [optional]
		 * @param current_time [optional]
		 * @param current_bonus [optional]
		 * @param current_kills [optional]
		 * @param current_achievements [optional]
		 * @param current_gold [optional]
		 * @param current_unlocked_levels [optional]
		 * @param current_unlocked_items [optional]
		 * @param current_lives [optional]
		 * @param xp [optional]
		 * @param energy [optional]
		 * @param boost [optional]
		 * @param latitude [optional]
		 * @param longitude [optional]
		 * @param game_state [optional]
		 * @param platform [optional] **/
		public function editPlayer(onResponseCallback:Function, username:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.username = username;
			api.call(onResponseCallback, ScoreoidURLs.EDIT_PLAYER, optional);
		}
		
		/** This method deletes a player and all the scores of the player.
		 * @see http://wiki.scoreoid.net/api/player/deleteplayer/
		 * @param username **/
		public function deletePlayer(onResponseCallback:Function, username:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.username = username;
			api.call(onResponseCallback, ScoreoidURLs.DELETE_PLAYER, optional);
		}
		
		/** Check if player exists and returns the player information. 
		 * Post parameters work as query conditions
		 * This method can be used for login by adding username and password parameters
		 * @see http://wiki.scoreoid.net/api/player/getplayer/
		 * @param id [optional]
		 * @param username [optional]
		 * @param password [optional]
		 * @param email [optional] **/
		public function getPlayer(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.GET_PLAYER, optional);
		}
		
		/** Gets a players field.
		 * @see http://wiki.scoreoid.net/api/player/getplayerfield/
		 * @param username
		 * @param field see https://www.scoreoid.com/console/getPlayerField **/
		public function getPlayerField(onResponseCallback:Function, username:String, field:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.username = username;
			optional.field = field;
			api.call(onResponseCallback, ScoreoidURLs.GET_PLAYER_FIELD, optional);
		}
		
		/** Updates a players field.
		 * @see http://wiki.scoreoid.net/api/player/updateplayerfield/
		 * @param username
		 * @param field see https://www.scoreoid.com/console/updatePlayerField
		 * @param value **/
		public function updatePlayerField(onResponseCallback:Function, username:String, field:String, value:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.username = username;
			optional.field = field;
			optional.value = value;
			api.call(onResponseCallback, ScoreoidURLs.UPDATE_PLAYER_FIELD, optional);
		}
		
		/** Get all the scores for a player
		 * @see http://wiki.scoreoid.net/api/player/getplayerscores/
		 * @param username
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param difficulty [optional] Integer value between 1 to 10 **/
		public function getPlayerScores(onResponseCallback:Function, username:String, optional:URLVariables = null):void
		{
			if (optional == null)
				optional = new URLVariables();
			optional.username = username;
			api.call(onResponseCallback, ScoreoidURLs.GET_PLAYER_SCORES, optional);
		}
		
		/** Returns total number of players for the game (as "players")
		 * @see http://wiki.scoreoid.net/api/player/countplayers/
		 * @param start_date [optional] YYYY-MM-DD
		 * @param end_date [optional] YYYY-MM-DD
		 * @param platform [optional] Matched string
		 * **/
		public function countPlayers(onResponseCallback:Function, optional:URLVariables = null):void
		{
			api.call(onResponseCallback, ScoreoidURLs.COUNT_PLAYERS, optional);
		}
	}
}