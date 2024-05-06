component CountUpTimer
{
    int triggerStartSystemTime;
    bool m_isCount;
    Item countUpTimerText;
    
    public CountUpTimer()
    {
        countUpTimerText = hsItemGet("CountUpTimerText");
    }

    public void Update()
    {
        Count();
    }

    void Count()
    {
        if(m_isCount)
        {
            int startDurationTime = hsSystemGetTime() - triggerStartSystemTime;
            countUpTimerText.WriteTextPlane(FormatMilliseconds(startDurationTime));
        }
    }

    public void StartCountUpTimer()
    {
        m_isCount = true;
        triggerStartSystemTime = hsSystemGetTime();
    }

    public void StopCountUpTimer()
    {
        m_isCount = false;
    }

    string FormatMilliseconds(int milliseconds)
    {
        string result;

        // ミリ秒から分を計算
        int minutes = milliseconds / 60000;
        // 残りのミリ秒から秒を計算
        int seconds = (milliseconds % 60000) / 1000;
        // 残りのミリ秒
        int millis = (milliseconds % 1000) / 10;

        //mm:ss.msms の形式でフォーマット
        result = ZeroPadding(minutes, 2) + ":" + ZeroPadding(seconds, 2) + "." + ZeroPadding(millis, 2);

        return result;
    }

    //指定した文字数分0で埋める関数
    string ZeroPadding(int num, int length)
    {
        string result = num.ToString();

        //numとして渡した0で埋めたい数字と、0埋めする長さを比較して、
        //0埋めする長さの方が大きければその分0を文字列に追加する
        if(result.Length() < length)
        {
            string seriesOfZeros = "";

            for(int i = 0; i < length - result.Length(); i++)
            {
                seriesOfZeros += "0";
            }

            result = seriesOfZeros + result;
        }

        return result;
    }
}
