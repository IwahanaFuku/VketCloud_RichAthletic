component PropertySample
{
    Item m_item;
    string m_propaty;
    public PropertySample()
    {
        m_item = hsItemGetSelf();
        m_propaty = item.GetProperty("propaty");
        hsSystemWriteLine(m_propaty);
    }
}
