component PlayerSettings
{
    Player  m_player;

    public PlayerSettings()
    {
        m_player = hsPlayerGet();
    }

    public void Update()
    {
        Vector3 vec = m_player.GetPos();
        vec.Add(makeVector3( 0.1f, 0.1f, 0.1f));
        m_player.SetPos(vec);
        m_player.SetRotate(0f);
    }

    public void playersetting(string param)
    {
        hsSystemWriteLine("call");
        m_player = hsPlayerGet();
        hsSystemWriteLine(m_player.GetName());
    }
}