component ItemPendulum
{
	Utility m_UT; //Utilityクラスを宣言する
	Item m_item;
	
	Vector3 m_oneRoundDurationEuler; //反復するスピード
	float m_amplitude;  //反復の開始地点
	Vector3 m_offset; //反復の開始地点

	Quaternion m_itemInitialQua;
	Vector3 m_timeCounter;

	public ItemPendulum()
	{
		m_UT = new Utility(); //Utilityクラスを初期化する
		m_item = hsItemGetSelf();

		Vector3 beforOneRoundDurationEuler = m_UT.StrToVector3(m_item.GetProperty("oneRoundDurationEuler(Vector3)"));
		m_oneRoundDurationEuler = m_UT.Vector3MulFloat(beforOneRoundDurationEuler, 2 * PI);
		m_amplitude = m_item.GetProperty("amplitude(float)").ToFloat();

		Vector3 beforOffset = m_UT.StrToVector3(m_item.GetProperty("offset(Vector3)"));
		m_offset = m_UT.Vector3MulFloat(beforOffset, 2 * PI);

		m_itemInitialQua = m_item.GetQuaternion();
		m_timeCounter = new Vector3();
	}

    //毎フレーム呼びだされる
	public void Update()
	{
        PendulumItem();
	}

	//振り子の動き
	void PendulumItem()
	{
		//反復する方向と大きさに経過時間をかけて、Sinカーブに設定する値を求める
		m_timeCounter.Add(m_UT.Vector3MulFloat(m_oneRoundDurationEuler, hsSystemGetDeltaTime()));

		//オフセットに設定した値を足し合わせる
		Vector3 m_offsetTimeCounter = makeVector3(m_timeCounter.x + m_offset.x, m_timeCounter.y + m_offset.y, m_timeCounter.z + m_offset.z);

		//ベクトルの要素ごとにSinカーブを求める
		Vector3 sinRotateEuler = makeVector3(hsMathSin(m_offsetTimeCounter.x), hsMathSin(m_offsetTimeCounter.y), hsMathSin(m_offsetTimeCounter.z));

		//振幅の大きさを求める
		Vector3 resultRotateEuler = m_UT.Vector3MulFloat(sinRotateEuler, m_amplitude);

		//反復した位置に対して、最初の配置位置を加える
		Quaternion resultQuaternion = makeQuaternionMul(m_itemInitialQua, makeQuaternionEuler(resultRotateEuler.x, resultRotateEuler.y, resultRotateEuler.z));

		//回転を設定する
		m_item.SetQuaternion(resultQuaternion);
	}
}
