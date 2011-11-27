function AppAssistant() {}

AppAssistant.prototype.handleLaunch = function(params)
{
	var mainStageController = this.controller.getStageController('mainStage');
	
	try
	{
		if (!params) 
		{
	        if (mainStageController) 
			{
				mainStageController.popScenesTo('change-log');
				mainStageController.activate();
			}
			else
			{
				this.controller.createStageWithCallback({name: 'mainStage', lightweight: true}, this.launchScene.bind(this));
			}
		}
	}
	catch (e)
	{
		Mojo.Log.logException(e, "AppAssistant#handleLaunch");
	}
};

AppAssistant.prototype.launchScene = function(controller)
{
	controller.pushScene('change-log');
};

// Local Variables:
// tab-width: 4
// End:
