component GameOverManager
{
    Item m_item;
    Item m_despawnHeightItem; //デスポーンの高さ用のアイテム
    Item m_camera; //カメラ用のアイテムを取得する
    Item m_halfwayPointManager;

    int m_remain; //プレイヤーが落下できる数
    bool m_isGameOver; //ゲームオーバー画面かどうか

    public GameOverManager()
    {
        m_item = hsItemGetSelf();
        m_despawnHeightItem = hsItemGet("Magma");
        m_camera = hsItemGet("Camera");
        m_halfwayPointManager = hsItemGet("HalfwayPointManager");

        m_remain = m_item.GetProperty("remain(int)").ToInt();
    }

    public void Update()
    {
        if(! m_isGameOver)
        {
            if(m_despawnHeightItem.GetPos().y >= hsPlayerGet().GetPos().y)
            {
                //HalfwayPointManagerコンポーネントの、WarpHalfwayPointメソッドを実行する
                m_halfwayPointManager.CallComponentMethod("HalfwayPointManager", "WarpHalfwayPoint", "param");
                SetRmain(-1);
            }
        }
    }

    //残機を減らす関数
    void SetRmain(int amount)
    {
        m_remain += amount;
        CheckGameOver();
    }

    //残機が0以下になっていないか確認する関数
    void CheckGameOver()
    {
        if(m_remain <= 0)
        {
            SetGameOver();
        }
    }

    //ゲームオーバー画面に遷移する関数
    void SetGameOver()
    {
        m_isGameOver = true;

        //カメラをゲームオーバー画面のカメラに移す
        m_camera.SetCamera();
    }

    //ボックスのどこかをクリックしたらリトライを行うための関数
    public void OnClickNode(int nodeIndex)
    {
       SetRetry();
    } 

    //リトライ処理
    void SetRetry()
    {
        m_isGameOver = false;

        //リトライ回数を初期値に戻す
        m_remain = m_item.GetProperty("remain(int)").ToInt();

        //カメラをプレイヤーに戻す
        m_camera.ResetCamera(); 

        //プレイヤーをHalfwayPoint_0（初期位置に戻す）
        hsPlayerGet().SetPos(hsItemGet("HalfwayPoint_0").GetPos());

        //プレイヤーの中間地点をHalfwayPoint_0に設定する
        m_halfwayPointManager.CallComponentMethod("HalfwayPointManager", "SetHalfwayPoint", "HalfwayPoint_0");

        //ItemMoveコンポーネントのResetToStartPosition関数を実行する
        m_despawnHeightItem.CallComponentMethod("ItemMove", "ResetToStartPosition", "param");
    }
}
