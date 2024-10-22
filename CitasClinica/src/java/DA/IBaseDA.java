/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DA;

import java.util.List;

/**
 *
 * @author George
 */
public interface IBaseDA<T> {

    public List<T> ReadAll();

    public T GetById(String c);

    public boolean Delete(String c);

    public boolean Update(T item);

    public boolean Insert(T item);

}
