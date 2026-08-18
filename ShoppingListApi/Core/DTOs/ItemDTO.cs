namespace ShoppingListApi.Core.DTOs;

public class ItemDTO
{
    public int Id { get; set; }
    public required string Name { get; set; }
    public required string PurchasedBy { get; set; }
    public required bool IsPurchased { get; set; }
}
