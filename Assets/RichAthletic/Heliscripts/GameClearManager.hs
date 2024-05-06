component GameClearManager
{
    public void OnClickNode(int nodeIndex)
    {
       GameClear();
    } 

    public void GameClear()
    {
        Item despawnHeightItem = hsItemGet("Magma");
        despawnHeightItem.SetProperty("velocity(Vector3)", "0,0,0");
    }
}
