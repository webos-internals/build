function ChangeLogAssistant()
{
    this.menuModel =
	{
	    visible: false,
	    items: []
	};
};

ChangeLogAssistant.prototype.setup = function()
{
    this.controller.setupWidget(Mojo.Menu.appMenu, { omitDefaultItems: true }, this.menuModel);
	
    this.titleContainer = this.controller.get('title');
    this.dataContainer =  this.controller.get('data');
	
	this.titleContainer.innerHTML = Mojo.appInfo.title;
	
    var html = '';
	if (Mojo.appInfo.message)
	{
    	html += '<div class="text">' + Mojo.appInfo.message + '</div>';
	}
	if (Mojo.appInfo.changeLog.length > 0)
	{
	    for (var v = 0; v < Mojo.appInfo.changeLog.length; v++)
		{
		    html += Mojo.View.render({object: {title: 'v' + Mojo.appInfo.changeLog[v].version}, template: 'change-log/row'});
		    html += '<ul class="changelog">';
		    for (var l = 0; l < Mojo.appInfo.changeLog[v].log.length; l++)
			{
			    html += '<li>' + Mojo.appInfo.changeLog[v].log[l] + '</li>';
			}
		    html += '</ul>';
		}
	}
    this.dataContainer.innerHTML = html;
};

// Local Variables:
// tab-width: 4
// End:
