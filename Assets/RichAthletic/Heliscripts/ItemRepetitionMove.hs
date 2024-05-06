component ItemRepetitionMove
{
    Utility m_UT; //Utilityクラスを宣言する
	Item  m_item; //コンポーネントがセットされたItemを取得する

	Vector3 m_oneRoundDuration; //反復する方向と大きさ
	float m_amplitude; //反復する幅
	float m_offset; //反復の開始地点
    float m_pauseTime; //一時停止の時間
	
	Vector3 m_itemInitialPos; //アイテムが配置された初期地点
    Vector3 m_timeCounter; //時間ごとの位置を格納する
    int m_changeDirectionTime; //進行方向が変わったときの時間
    Vector3 m_resultPos; //移動結果の位置
    float m_prevDistance; //1フレーム前の移動距離
    float m_prevSign; //1フレーム前の移動方向
    bool m_isPaused; //ポーズを行うかを格納する
    

    public ItemRepetitionMove()
    {
        m_UT = new Utility(); //Utilityクラスを初期化する
        m_item = hsItemGetSelf();

		Vector3 beforOneRoundDuration = m_UT.StrToVector3(m_item.GetProperty("oneRoundDuration(Vector3)"));
        m_oneRoundDuration = m_UT.Vector3MulFloat(beforOneRoundDuration, 2 * PI);
		m_amplitude = m_item.GetProperty("amplitude(float)").ToFloat();
		m_offset = m_item.GetProperty("offset(float)").ToFloat() * 2 * PI;
		m_pauseTime = m_item.GetProperty("pauseTime(float)").ToFloat() * 1000f;

		m_itemInitialPos = m_item.GetPos();
        m_timeCounter = new Vector3();
        m_resultPos = new Vector3();
	}

    //毎フレーム呼びだされる。
	public void Update()
	{
        if(m_isPaused)
		{
            //フラグが経った時間と、m_pauseTimeに設定した秒数を加えた時間待つ
			if(m_changeDirectionTime + (m_pauseTime) < hsSystemGetTime())
			{
				m_isPaused = false;
			}
		} 
        else
        {
            RepetitionMoveItem();
            CheckConversion();
        }
	}

    //ItemをSinカーブに沿って反復させる関数。経過時間とパラメータを基に新しい位置を計算し、Itemに適用する。
	void RepetitionMoveItem()
	{
        //反復する方向と大きさに経過時間をかけて、Sinカーブに設定する値を求める
        m_timeCounter.Add(m_UT.Vector3MulFloat(m_oneRoundDuration, hsSystemGetDeltaTime()));

        //ベクトルの要素ごとにオフセットを加えたSinカーブを求める
        Vector3 sinPos = makeVector3(hsMathSin(m_offset + m_timeCounter.x), hsMathSin(m_offset + m_timeCounter.y), hsMathSin(m_offset + m_timeCounter.z));

        //振幅の大きさを求める
        m_resultPos = m_UT.Vector3MulFloat(sinPos, m_amplitude);

        //反復した位置に対して、最初の配置位置を加える
        m_resultPos.Add(m_itemInitialPos);

        //ポジションを設定する
        m_item.SetPos(m_resultPos);
	} 

    // 1フレーム前と現在のポジションの変化を検出し、進行方向が変わったかどうかをチェックする関数
	void CheckConversion()
	{
        // m_itemInitialPos（初期ポジション）とm_resultPos（現在のポジション）間の距離を計算
        float distance = Distance(m_itemInitialPos, m_resultPos);
        // 今フレームから前フレームの距離距離を引いた値の符号を計算（進行方向の変化を検出）
        float sign = Sign(distance - m_prevDistance);

        // 前フレームの符号と今フレームの符号が異なり、かつ、その符号が-1である場合
        if (m_prevSign != sign && sign == -1f)
        {
            m_isPaused = true;
            m_changeDirectionTime = hsSystemGetTime();
        }

        // 現在の距離と符号を次のフレームの比較のために保持
        m_prevDistance = distance;
        m_prevSign = sign;
	}

    //二つのVector3の距離を返す関数
    float Distance(Vector3 vec1, Vector3 vec2)
    {
        float result;

        float deltaX = vec2.x - vec1.x;
        float deltaY = vec2.y - vec1.y;
        float deltaZ = vec2.z - vec1.z;
        
        float delta = deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ;
        result = hsMathSqrt(delta);

        return result;
    }

    //floatの符号を返す関数
	int Sign(float value)
	{
		int result;

		if (value < 0)
		{
			result = -1;
		}
		else
		{
			result =  1;
		}

		return result;
	}
}