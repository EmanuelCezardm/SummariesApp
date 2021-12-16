import 'package:summaries_app/domain/summaries/biology/basic_concepts.dart';
import 'package:summaries_app/domain/summaries/biology/biomes.dart';
import 'package:summaries_app/domain/summaries/biology/ecological_relationships.dart';
import 'package:summaries_app/domain/summaries/biology/food_chain_and_food_web.dart';
import 'package:summaries_app/domain/summaries/chemistry/Inorganic_chemistry.dart';
import 'package:summaries_app/domain/summaries/chemistry/basic_concepts_of_chemistry.dart';
import 'package:summaries_app/domain/summaries/chemistry/physicochemical.dart';
import 'package:summaries_app/domain/summaries/geography/basic_concepts_of_geography.dart';
import 'package:summaries_app/domain/summaries/geography/dynamics_of_the_earths_crust.dart';
import 'package:summaries_app/domain/summaries/geography/rotation_and_translation_of_the_earth.dart';
import 'package:summaries_app/domain/summaries/geography/timezones.dart';
import 'package:summaries_app/domain/summaries/history/ancient_egypt.dart';
import 'package:summaries_app/domain/summaries/history/ancient_greece.dart';
import 'package:summaries_app/domain/summaries/history/mesopotamia.dart';
import 'package:summaries_app/domain/summaries/history/prehistory.dart';
import 'package:summaries_app/domain/summaries/philosophy/pre_socratic_cosmology.dart';
import 'package:summaries_app/domain/summaries/philosophy/sophists_and_socrates.dart';
import 'package:summaries_app/domain/summaries/philosophy/pre_socratic_ontology.dart';
import 'package:summaries_app/domain/summaries/philosophy/introduction_to_philosophy.dart';
import 'package:summaries_app/domain/summaries/physics/keplers_laws.dart';
import 'package:summaries_app/domain/summaries/physics/newtons_laws.dart';
import 'package:summaries_app/domain/summaries/physics/satellite_in_circular_orbits.dart';
import 'package:summaries_app/domain/summaries/physics/universal_law_of_gravitation.dart';
import 'package:summaries_app/domain/summaries/portuguese/sound_figures.dart';
import 'package:summaries_app/domain/summaries/portuguese/syntax_figure.dart';
import 'package:summaries_app/domain/summaries/portuguese/thought_figure.dart';
import 'package:summaries_app/domain/summaries/portuguese/word_figure.dart';
import 'package:summaries_app/domain/summaries/sociology/classical_sociological_theories.dart';
import 'package:summaries_app/domain/summaries/sociology/emergence_of_sociology_and_theories.dart';
import 'package:summaries_app/domain/summaries/sociology/formation_of_capitalist_society.dart';
import 'package:summaries_app/domain/summaries/sociology/scientific_thinking_and_common_sense.dart';

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
  resumos.add(resumoConceitosBasicosBio);
  resumos.add(resumoBiomas);
  resumos.add(resumoRelacoesEcologicas);
  resumos.add(resumoCadeiaAlimentar);
  return resumos;
}

_buildSummariesFilo(List resumos) {
  resumos.add(resumoIntroducaoFilosofia);
  resumos.add(resumoPreSocraticosCosmologia);
  resumos.add(resumoPreSocraticosOntologia);
  resumos.add(resumoSofistasSocrates);
  return resumos;
}

_buildSummariesFis(List resumos) {
  resumos.add(resumoLeisDeKepler);
  resumos.add(resumoLeisDeNewton);
  resumos.add(resumoSateliteOrbitasCirculares);
  resumos.add(resumoLeiGravitacaoUniversal);
  return resumos;
}

_buildSummariesGeo(List resumos) {
  resumos.add(resumoConceitosGeo);
  resumos.add(resumoDinamicaIntCrosta);
  resumos.add(resumoRotacaoTranslacao);
  resumos.add(resumoFusosHorarios);
  return resumos;
}

_buildSummariesHist(List resumos) {
  resumos.add(resumoEgitoAntigo);
  resumos.add(resumoGreciaAntiga);
  resumos.add(resumoMesopotamia);
  resumos.add(resumoPreHistoria);
  return resumos;
}

_buildSummariesPort(List resumos) {
  resumos.add(resumoFigurasSonoras);
  resumos.add(resumoFiguraDeSintaxe);
  resumos.add(resumoFiguraDeLinguagem);
  resumos.add(resumoFiguraDePalavra);
  return resumos;
}

_buildSummariesQuim(List resumos) {
  resumos.add(resumoConceitosBasicosQuimica);
  resumos.add(resumoQuimicaInorganica);
  resumos.add(resumoFisicoQuimica);
  return resumos;
}

_buildSummariesSocio(List resumos) {
  resumos.add(resumoTeoriasSociologicas);
  resumos.add(resumoSurgimentoDaSociologia);
  resumos.add(resumoConsolidacaoSociedadeCapitalista);
  resumos.add(resumoPensamentoCientifico);
  return resumos;
}
