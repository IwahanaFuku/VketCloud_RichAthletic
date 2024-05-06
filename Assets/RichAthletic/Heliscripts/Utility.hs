class Utility
{
    //String型をVector3型に変換する関数
    public Vector3 StrToVector3(string str)
    {
        Vector3 result;

        list<string> strVec = str.Split(",");
        result = makeVector3(strVec[0].ToFloat(), strVec[1].ToFloat(), strVec[2].ToFloat());
        return result;
    }

    //Vector3型とfloat型の掛け算を行う関数
    public Vector3 Vector3MulFloat(Vector3 vec, float f)
    {
        Vector3 result;
        result = makeVector3(vec.x * f, vec.y * f, vec.z * f);
        return result;
    }
}
