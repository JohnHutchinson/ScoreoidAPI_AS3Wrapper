package com.rubberduckygames.scoreoid
{
	public class Scoreoid
	{
		public static const JSON:String = "JSON";
		public static const XML:String = "XML";
		
		private var apiWrapper:ScoreoidAPI;
		
		private var defaultGameCalls:ScoreoidGameCalls;
		private var defaultPlayerCalls:ScoreoidPlayerCalls;
		private var defaultScoreCalls:ScoreoidScoreCalls;
		
		public function Scoreoid(apiKey:String, gameID:String, responseType:String = JSON)
		{
			apiWrapper = new ScoreoidAPI(apiKey, gameID, responseType);
			
			defaultGameCalls 	= new ScoreoidGameCalls(apiWrapper);
			defaultPlayerCalls 	= new ScoreoidPlayerCalls(apiWrapper);
			defaultScoreCalls 	= new ScoreoidScoreCalls(apiWrapper);
		}
		
		public function cancel():void
		{
			apiWrapper.cancel();
		}
		
		public function set gameID(gameID:String):void
		{
			apiWrapper.setGameID(gameID);
		}
		
		public function set responseType(responseType:String):void
		{
			apiWrapper.setResponseType(responseType);
		}
		
		public function get isBusy():Boolean
		{
			return apiWrapper.isBusy;
		}
		
		public function get game():ScoreoidGameCalls
		{
			return defaultGameCalls;
		}
		
		public function get player():ScoreoidPlayerCalls
		{
			return defaultPlayerCalls;
		}
		
		public function get score():ScoreoidScoreCalls
		{
			return defaultScoreCalls;
		}
	}
}