component ItemRotate
{
    Utility m_UT; //Utilityクラスを宣言する
	Item m_item;
	
	Vector3 m_rotationEuler; //回転スピード
	float m_offset; //回転の開始地点

	public ItemRotate()
	{
        m_UT = new Utility(); //Utilityクラスを初期化する
		m_item = hsItemGetSelf();

		m_rotationEuler = m_UT.StrToVector3(m_item.GetProperty("rotationEuler(Vector3)"));
	}

    //毎フレーム呼びだされる
	public void Update()
	{
        RotateItem();
	}

    //アイテムを回転させる
    void RotateItem()
    {
        //このフレームでのdeltaTimeを取得しておく
        float deltaTime = hsSystemGetDeltaTime();

        //Vector3型のそれぞれの要素にdeltaTimeを掛けた、rotationDirectionを格納する
        Vector3 deltaRotationEuler = makeVector3(deltaTime * m_rotationEuler.x, deltaTime * m_rotationEuler.y, deltaTime * m_rotationEuler.z);

        //Quaternionに変換する
        Quaternion deltaRotation = makeQuaternionEuler(deltaRotationEuler.x, deltaRotationEuler.y, deltaRotationEuler.z);

        //今回のフレームで回転する値を求める
        Quaternion currentRotationQua = makeQuaternionMul(m_item.GetQuaternion(), deltaRotation);

        //回転した値を設定する
		m_item.SetQuaternion(currentRotationQua);
    }
}
