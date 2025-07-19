using AssestManagementWebApi.Models;
using AssestManagementWebApi.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace AssestManagementWebApi.Service
{
    public interface IAssetService
    {
        public Task<ActionResult<IEnumerable<Asset>>> GetAllAssetsAsync();
        public Task<ActionResult<Asset>> GetAssetByIdAsync(int id);
        public Task<ActionResult<IEnumerable<Asset>>> SearchAssetsByNameAsync(string name);
        public Task<ActionResult<Asset>> CreateAssetAsync(Asset asset);
        public Task<ActionResult<Asset>> UpdateAssetAsync(int id, Asset asset);
        public Task<ActionResult<string>> DeleteAssetAsync(int id);
        public Task<ActionResult<IEnumerable<AssetViewModel>>> GetAssetsByNameFromSP(string name);
      
    }
}
