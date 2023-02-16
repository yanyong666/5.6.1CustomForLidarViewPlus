vtk_module(vtkRenderingParallelLIC
  IMPLEMENTS
    vtkRenderingLICOpenGL2
  KIT
    vtkParallel
  DEPENDS
    vtkCommonCore
    vtkCommonDataModel
    vtkParallelMPI
    vtkRenderingOpenGL2
  PRIVATE_DEPENDS
    vtkIOLegacy
    vtkParallelCore
    vtkRenderingCore
  )