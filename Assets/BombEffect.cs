using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteInEditMode]
public class BombEffect : MonoBehaviour
{
    Material mat;
    public float rateOfChange = 0.1f;
    void Start()
    {
        mat = GetComponent<Renderer>().sharedMaterial;
    }

    private void OnMouseDown()
    {
        float a = mat.GetFloat("_Amount");
        if (a>1.0)
        {
            return;
        }
        else
        {
            a += rateOfChange;
            mat.SetFloat("_Amount", a);
        }
    }
    private void DecomposeMesh()
    {
        if (Input.GetKeyDown(KeyCode.Mouse1))
        {
            float a = mat.GetFloat("_Amount");
            if (a < -1.0)
            {
                return;
            }
            else
            {
                a -= rateOfChange;
                mat.SetFloat("_Amount", a);
            }
        }
    }

    private void Update()
    {
        DecomposeMesh();
    }

}
