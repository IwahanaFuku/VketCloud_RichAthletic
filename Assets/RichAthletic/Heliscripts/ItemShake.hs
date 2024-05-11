component ItemShake
{
    Item m_item;
	Vector3 m_itemInitialPos;
	float m_strength;

	bool m_isShake;
	Vector3 m_beforeRandomPos; //1フレーム前の移動距離

    public ItemShake()
    {
        m_item = hsItemGetSelf();
		m_itemInitialPos = m_item.GetPos();

        m_strength = m_item.GetProperty("strength(float)").ToFloat();

		m_beforeRandomPos = new Vector3();
    }

	public void Update()
	{
		ShakeItem();
	}

	void ShakeItem()
	{
		//ランダムな値の粒度
		int resolution = 10;

		//ランダムなVector3の値を取得する
		Vector3 randomPos = RandomVector(m_strength, resolution);

		//今回のフレームで移動するポジションを格納するための変数を用意して、現在の位置を格納する
		Vector3 resultPos = m_item.GetPos();

		//ランダムの値を加算し続けて、意図しない位置に移動しないように前回のフレームの移動量を戻す
		resultPos.Sub(m_beforeRandomPos);

		//現在の位置にランダムなVector3の値を足してランダムに移動させる
		resultPos.Add(randomPos);

		//ランダムなポジションを設定する
		m_item.SetPos(resultPos);

		//次回フレームで元のポジションに戻すために今回のフレームのランダムな値を保持しておく。
		m_beforeRandomPos = makeVector3(randomPos.x, randomPos.y, randomPos.z);
	}

	//strengthの大きさと、resolutionの粒度の細かさに応じてランダムな値を取得する
	Vector3 RandomVector(float strength, int resolution)
	{
		// resolutionの粒度でランダムな値を生成し、strengthでスケールを調整した後、中心を0にシフトする
        Vector3 result = makeVector3((hsMathRandom(resolution) / resolution - 0.5f) * strength,
                                     (hsMathRandom(resolution) / resolution - 0.5f) * strength,
									 (hsMathRandom(resolution) / resolution - 0.5f) * strength); 
		return result;
	}

    //プロパティの変更を検知して、設定する
    public void OnChangedProperty(string key, string value)
    {
        if(key == "strength(float)")
        {
            m_strength = m_item.GetProperty("strength(float)").ToFloat();
        }
    }
}