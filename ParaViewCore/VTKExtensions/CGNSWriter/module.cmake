vtk_module(vtkPVVTKExtensionsCGNSWriter
    DEPENDS
      vtkCommonCore
      vtkCommonDataModel
      vtkCommonExecutionModel
      vtkIOCore
      vtkParallelCore
      vtkPVVTKExtensionsCore
    PRIVATE_DEPENDS
      vtkhdf5
      vtkcgns
      vtksys
      vtkParallelCore
      vtkFiltersExtraction
    TEST_DEPENDS
      vtkInteractionStyle
      vtkTestingCore
      vtkTestingRendering
      vtkPVVTKExtensionsCGNSReader
    TEST_LABELS
      PARAVIEW
    KIT
      vtkPVExtensions
)

set_property(GLOBAL PROPERTY
    vtkPVVTKExtensionsCGNSWriter_SERVERMANAGER_XMLS
    ${CMAKE_CURRENT_LIST_DIR}/resources/CGNSWriter.xml
)
