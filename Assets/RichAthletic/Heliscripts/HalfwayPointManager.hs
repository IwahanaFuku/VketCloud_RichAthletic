component HalfwayPointManager
{
    Vector3 m_warpPoint; //ワープした後の位置
    float m_rotate; //ワープした後のY軸の向き

    //中間スポーン用のItemの名前をもとに中間ポイントを更新する
    public void SetHalfwayPoint(string halfwayPointName)
    {
        Item warpPointItem = hsItemGet(halfwayPointName);
        m_warpPoint = warpPointItem.GetPos();
        m_rotate = warpPointItem.GetWorldRotate().y;
	}

    //中間ポイントにワープする
	public void WarpHalfwayPoint()
	{
        Player player = hsPlayerGet();
		player.SetPos(m_warpPoint);
        player.SetRotate(m_rotate);

        OnHalfwayPointWarp();
	}

    //中間ポイントにワープするした時に呼ぶメソッド
    void OnHalfwayPointWarp()
    {
        hsItemGet("UnstableFooting").CallComponentMethod("UnstableFooting", "InitializeFooting", "");
    }
}