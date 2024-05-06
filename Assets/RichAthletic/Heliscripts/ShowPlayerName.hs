component ShowPlayerName
{ 
    public void ShowText()
    {
        Item playerNameText = hsItemGet("PlayerNameText");
        string playerName = hsPlayerGet().GetName();
        playerNameText.WriteTextPlane(playerName);
    }
}
