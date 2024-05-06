Player  g_player;

component PlayerInit
{
    bool m_isPlayerInit;

    public PlayerInit()
    {
        m_isPlayerInit = false;
    }

    public void Update()
    {
        if(! m_isPlayerInit){
			g_player = hsPlayerGet();
			m_isPlayerInit = true;
        }
    }
}