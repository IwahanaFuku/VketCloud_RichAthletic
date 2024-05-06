component ItemMove
{
    Item m_item; //コンポーネントがセットされたItemを取得する
    
	Vector3 m_velocity; //移動する方向と大きさ
    
	Vector3 m_itemInitialPos; //アイテムが配置された初期地点

    public ItemMove()
    {
        m_item = hsItemGetSelf(); //コンポーネントがセットされたItemを取得する

        m_velocity = StrToVector3(m_item.GetProperty("velocity(Vector3)")); //コンポーネントがセットされたItemのvelocity(Vector3)というプロパティを取得する
        
        //アイテムが配置された初期地点を取得しておく
		m_itemInitialPos = m_item.GetPos();
    }

    //毎フレーム呼びだされる。
	public void Update()
	{
        MoveItem();
	}

    //m_velocityに設定した速さを、現在のItemの位置に足す関数
    void MoveItem()
    {
		Vector3 pos = m_item.GetPos();
		pos.Add(Vector3MulFloat(m_velocity, hsSystemGetDeltaTime()));

		m_item.SetPos(pos);
    }

    //String型をVector3型に変換する関数
    Vector3 StrToVector3(string str)
    {
        Vector3 result;

        list<string> strVec = str.Split(",");
        result = makeVector3(strVec[0].ToFloat(), strVec[1].ToFloat(), strVec[2].ToFloat());
        return result;
    }

    //Vector3型とfloat型の掛け算を行う関数
    Vector3 Vector3MulFloat(Vector3 vec, float f)
    {
        Vector3 result;
        result = makeVector3(vec.x * f, vec.y * f, vec.z * f);
        return result;
    }

    //位置をスタート地点にリセットする関数
    public void ResetToStartPosition()
    {
        m_item.SetPos(m_itemInitialPos);
    }

    //プロパティの変更を検知して、設定する
    public void OnChangedProperty(string key, string value)
    {
        if(key == "velocity(Vector3)")
        {
            m_velocity = StrToVector3(m_item.GetProperty("velocity(Vector3)"));
        }
    }
}