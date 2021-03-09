using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteInEditMode]
public class ShowDecal : MonoBehaviour
{
    bool showDecal=false;
    Material decalMaterial;
    // Start is called before the first frame update
    void Start()
    {
        decalMaterial = GetComponent<Renderer>().sharedMaterial;
    }
    private void OnMouseDown()
    {
        showDecal = !showDecal;
        if (showDecal)
        {
            decalMaterial.SetFloat("_ShowDecal", 1);
        }
        else
        {
            decalMaterial.SetFloat("_ShowDecal", 0);
        }
    }
   
}
