component UnstableFooting
{
    Item m_item;
    string m_velocityValue;
    string m_strengthValue;

    int m_stableTime;
    int m_unstableTime;

    string m_state;
    int m_onFootingTime;
    bool m_isOnFooting;

    public UnstableFooting()
    {
        m_item = hsItemGetSelf();
        
        m_velocityValue = m_item.GetProperty("velocity(Vector3)");
        m_strengthValue = m_item.GetProperty("strength(float)");

        m_stableTime = m_item.GetProperty("stableTime(float)").ToFloat() * 1000;
        m_unstableTime = m_item.GetProperty("unstableTime(float)").ToFloat() * 1000;

        InitializeFooting();
    }

    void StartUnstableFooting(string param)
    {
        list<string> paramList = param.Split(",");

        m_isOnFooting = true;
        m_onFootingTime = hsSystemGetTime();
    }

    // 初期化時にステートをstableに戻して、位置も初期状態に戻す。
    public void InitializeFooting()
    {
        m_state = "stable";
        m_item.CallComponentMethod("ItemMove", "ResetToStartPosition", "param");
    }
    
    public void Update()
    {
        // 足場の上のコライダーに侵入したら足場のステートを監視する
        if(m_isOnFooting)
        {
            ChackState();
        }

        // 足場の上のステートを更新
        FootingState();
    }

    void ChackState()
    {
        // 足場の上のコライダーに侵入した時からstabeleステートを経過した場合、unstableステートに移行
        if(m_onFootingTime + (m_stableTime) < hsSystemGetTime())
        {
            m_state = "unstable";
        }

        // unstableステートも経過した場合、fallステートにに移行
        if(m_onFootingTime + (m_stableTime + m_unstableTime) < hsSystemGetTime())
        {
            m_state = "fall";
        }
    }

    // 足場のステートの更新
    public void FootingState()
    {
        switch (m_state)
        {
            //足場を揺らさず、移動もさせない
            case "stable":
                m_item.SetProperty("strength(float)", "0");
                m_item.SetProperty("velocity(Vector3)", "0,0,0");
                break;

            //足場を揺らして不安定な感じを演出する
            case "unstable":
                m_item.SetProperty("strength(float)", m_strengthValue);
                break;
            
            //足場を落とす
            case "fall":
                m_item.SetProperty("velocity(Vector3)", m_velocityValue);
                break;

            default:
                break;
        }
    }
}
