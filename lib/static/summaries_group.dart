/*enum SummariesGroup{
  biologia,
  filosofia,
  fisica,
  geografia,
  historia,
  portugues,
  quimica,
  sociologia,
}

extension SummariesGroupUtilities on SummariesGroup{
  List<Map> getSummariesGroup() {
    switch (this) {
      case SummariesGroup.biologia
    }
  }
}*/

import 'package:summaries_app/domain/summaries/geography/basic_concepts_of_geography.dart';
import 'package:summaries_app/domain/summaries/philosophy/aristotle.dart';
import 'package:summaries_app/domain/summaries/philosophy/greek_world.dart';
import 'package:summaries_app/domain/summaries/philosophy/introduction_to_philosophy.dart';

getGroupList(int index) {
  List resumos = [];

  switch (index) {
    case 1:
      return _buildSummariesBio(resumos);

    case 2:
      return _buildSummariesFilo(resumos);

    case 3:
      return _buildSummariesFis(resumos);

    case 4:
      return _buildSummariesGeo(resumos);

    case 5:
      return _buildSummariesHist(resumos);

    case 6:
      return _buildSummariesPort(resumos);

    case 7:
      return _buildSummariesQuim(resumos);

    case 8:
      return _buildSummariesSocio(resumos);
  }
}

_buildSummariesBio(List resumos) {
  return resumos;
}

_buildSummariesFilo(List resumos) {
  resumos.add(resumoAristoteles);
  resumos.add(resumoMundoGrego);
  resumos.add(resumoIntroducaoFilosofia);
  //resumos.add(//resumoPreSocraticos);
  return resumos;
}

_buildSummariesFis(List resumos) {
  return resumos;
}

_buildSummariesGeo(List resumos) {
  resumos.add(resumoConceitosGeo);
  return resumos;
}

_buildSummariesHist(List resumos) {
  return resumos;
}

_buildSummariesPort(List resumos) {
  return resumos;
}

_buildSummariesQuim(List resumos) {
  return resumos;
}

_buildSummariesSocio(List resumos) {
  return resumos;
}
