/*
 *  Main authors:
 *    Roberto Castaneda Lozano <rcas@sics.se>
 *    Mats Carlsson <matsc@sics.se>
 *
 *  This file is part of Unison, see http://unison-code.github.io
 *
 *  Copyright (c) 2016, SICS Swedish ICT AB
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *  1. Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright notice,
 *     this list of conditions and the following disclaimer in the documentation
 *     and/or other materials provided with the distribution.
 *  3. Neither the name of the copyright holder nor the names of its
 *     contributors may be used to endorse or promote products derived from this
 *     software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 */


#include "parameters.hpp"

Parameters::Parameters(JSONVALUE root) :

  // Program parameters

  B             (get_vector<int>(getRoot(root, "B"))),
  O             (get_vector<int>(getRoot(root, "O"))),
  P             (get_vector<int>(getRoot(root, "P"))),
  T             (get_vector<int>(getRoot(root, "T"))),
  oblock        (get_vector<int>(getRoot(root, "block"))),
  operands      (get_2d_vector<int>(getRoot(root, "operands"))),
  temps         (get_2d_vector<int>(getRoot(root, "temps"))),
  use           (get_vector<bool>(getRoot(root, "use"))),
  adjacent      (get_2d_vector<int>(getRoot(root, "adjacent"))),
  preassign     (get_2d_vector<int>(getRoot(root, "preassign"))),
  width         (get_vector<int>(getRoot(root, "width"))),
  freq          (get_vector<int>(getRoot(root, "freq"))),
  aligned       (get_2d_vector<int>(getRoot(root, "aligned"))),
  adist         (get_vector<int>(getRoot(root, "adist"))),
  packed        (get_2d_vector<int>(getRoot(root, "packed"))),
  pclass        (get_vector<int>(getRoot(root, "pclass"))),
  minlive       (get_vector<int>(getRoot(root, "minlive"))),
  dep           (get_3d_vector<int>(getRoot(root, "dep"))),
  activators    (get_2d_vector<int>(getRoot(root, "activators"))),

  // Processor parameters

  I             (get_vector<int>(getRoot(root, "I"))),
  R             (get_vector<int>(getRoot(root, "R"))),
  dist          (get_3d_vector<int>(getRoot(root, "dist"))),
  rclass        (get_3d_vector<int>(getRoot(root, "class"))),
  atoms         (get_2d_vector<int>(getRoot(root, "atoms"))),
  instructions  (get_2d_vector<int>(getRoot(root, "instructions"))),
  lat           (get_3d_vector<int>(getRoot(root, "lat"))),
  cap           (get_vector<int>(getRoot(root, "cap"))),
  con           (get_2d_vector<int>(getRoot(root, "con"))),
  dur           (get_2d_vector<int>(getRoot(root, "dur"))),

  // Objective function parameters

  optimize_dynamic (get_scalar<bool>(getRoot(root, "optimize_dynamic"))),
  optimize_resource (get_scalar<int>(getRoot(root, "optimize_resource"))),
  maxf          (get_scalar<int>(getRoot(root, "maxf"))),

  // Additional parameters

  tmp           (get_2d_vector<int>(getRoot(root, "tmp"))),
  definer       (get_vector<int>(getRoot(root, "definer"))),
  oper          (get_vector<int>(getRoot(root, "operation"))),
  congr         (get_2d_vector<int>(getRoot(root, "congr"))),
  ops           (get_2d_vector<int>(getRoot(root, "ops"))),
  RS            (get_vector<int>(getRoot(root, "RS"))),
  maxc          (get_vector<int>(getRoot(root, "maxc"))),
  type          (get_vector<int>(getRoot(root, "type"))),
  copyrel       (get_2d_vector<int>(getRoot(root, "copyrel"))),
  interchangeable (get_2d_vector<int>(getRoot(root, "interchangeable"))),
  cfg           (get_2d_vector<int>(getRoot(root, "cfg"))),
  clusters      (get_2d_vector<int>(getRoot(root, "clusters"))),
  space         (get_vector<int>(getRoot(root, "space"))),
  range         (get_2d_vector<int>(getRoot(root, "range"))),
  home          (get_vector<int>(getRoot(root, "home"))),
  infinite      (get_vector<bool>(getRoot(root, "infinite"))),
  insname       (get_vector<string>(getRoot(root, "insname"))),
  atomname      (get_vector<string>(getRoot(root, "atomname"))),
  classname     (get_vector<string>(getRoot(root, "classname"))),
  spacename     (get_vector<string>(getRoot(root, "spacename"))),
  callersaved   (get_vector<int>(getRoot(root, "callersaved"))),
  calleesaved   (get_vector<int>(getRoot(root, "calleesaved"))),

  // Presolver parameters

  optional_min  (get_vector<int>(getRoot(root, "optional_min"))),
  active_tables (get_vector<PresolverActiveTable>(getRoot(root, "active_tables"))),
  tmp_tables    (get_vector<PresolverCopyTmpTable>(getRoot(root, "tmp_tables"))),
  nogoods       (get_3d_vector<int>(getRoot(root, "nogoods"))),
  nogoods2      (get_3d_vector<int>(getRoot(root, "nogoods2"))),
  precedences   (get_vector<PresolverPrecedence>(getRoot(root, "precedences"))),
  precedences2  (get_vector<PresolverPrecedence>(getRoot(root, "precedences2"))),
  before        (get_vector<PresolverBefore>(getRoot(root, "before"))),
  before2       (get_vector<PresolverBefore>(getRoot(root, "before2"))),
  across        (get_vector<PresolverAcross>(getRoot(root, "across"))),
  set_across    (get_vector<PresolverSetAcross>(getRoot(root, "set_across"))),
  domops        (get_3d_vector<int>(getRoot(root, "domops"))),
  last_use      (get_vector<int>(getRoot(root, "last_use"))),
  memassign     (get_2d_vector<int>(getRoot(root, "memassign"))),
  domuses       (get_2d_vector<int>(getRoot(root, "domuses"))),
  precs         (get_2d_vector<int>(getRoot(root, "precs"))),
  assignhints   (get_2d_vector<int>(getRoot(root, "assignhints"))),
  unsafe_temp   (get_vector<int>(getRoot(root, "unsafe_temp"))),
  dominates     (get_vector<PresolverDominates>(getRoot(root, "dominates"))),
  difftemps     (get_2d_vector<int>(getRoot(root, "difftemps"))),
  diffregs      (get_2d_vector<int>(getRoot(root, "diffregs"))),
  calleesaved_spill (get_2d_vector<int>(getRoot(root, "calleesaved_spill"))),
  strictly_congr    (get_2d_vector<int>(getRoot(root, "strictly_congr"))),
  predecessors      (get_vector<PresolverPred>(getRoot(root, "predecessors"))),
  successors      (get_vector<PresolverSucc>(getRoot(root, "successors"))),
  instr_cond      (get_vector<PresolverInstrCond>(getRoot(root, "instr_cond"))),
  value_precede_chains  (get_vector<PresolverValuePrecedeChain>(getRoot(root, "value_precede_chains"))),
  quasi_adjacent  (get_2d_vector<int>(getRoot(root, "quasi_adjacent")))
{
  compute_derived();
}

void Parameters::compute_derived() {

  // First clear all parameters so that the method is idempotent

  RC.clear();
  ope.clear();
  C.clear();
  RA.clear();
  in.clear();
  out.clear();
  pb.clear();
  tb.clear();
  bcongr.clear();
  representative.clear();
  operand_congruence.clear();
  fu.clear();
  nu = 0;
  bfu.clear();
  bnu.clear();
  temporary_index.clear();
  operand_index.clear();
  baligned.clear();
  badist.clear();
  bpacked.clear();
  bpclass.clear();
  copyreltop.clear();
  def_opr.clear();
  copies.clear();
  mandatory.clear();
  accman.clear();
  mandatory_index.clear();
  A.clear();
  pairs.clear();
  delimiter.clear();
  G.clear();
  regular.clear();
  global.clear();
  single_temp.clear();
  users.clear();
  use_copies.clear();
  def_copies.clear();
  candidate_spaces.clear();
  fixed_predecessors.clear();
  redefined.clear();
  groupcopyrel.clear();
  preassigned.clear();
  operand_width.clear();
  destroyed.clear();
  avoidhints.clear();
  callee_saved_copies.clear();
  AC.clear();
  activation_class_instructions.clear();
  activation_class_operations.clear();
  activation_class_representative.clear();
  infinite_atom.clear();
  congruent.clear();
  succ.clear();
  binterchangeable.clear();
  min_active_lat.clear();
  GC.clear();
  implied_clusters.clear();
  remat.clear();
  real_temps.clear();
  related_operands.clear();
  first_copy.clear();
  min_lat = 0;
  max_lat = 0;
  atom_set.clear();
  global_operand.clear();
  global_optional.clear();
  global_optional_index.clear();
  first_global_optional_index.clear();
  n_global_optionals.clear();
  ultimate_source.clear();
  p_preassign.clear();
  t_preassign.clear();
  r_calleesaved.clear();
  bactive_tables.clear();
  gactive_tables.clear();
  btmp_tables.clear();
  gnogoods.clear();
  bnogoods.clear();
  bnogoods2.clear();
  bbefore.clear();
  bbefore2.clear();
  bacross.clear();
  bset_across.clear();
  bprecedences.clear();
  bprecedences2.clear();
  bdomops.clear();
  bdomuses.clear();
  bprecs.clear();
  bdominates.clear();
  bdifftemps.clear();
  bdiffregs.clear();
  bpredecessors.clear();
  bsuccessors.clear();
  binstr_cond.clear();

  for (unsigned int rc = 0; rc < space.size(); rc++) RC.push_back(rc);

  for (unsigned int c = 0; c < congr.size(); c++) C.push_back(c);

  instruction maxi = 0;
  for (vector<instruction> iis : instructions) {
    instruction maxii = max_of(iis);
    if (maxii > maxi) maxi = maxii;
  }

  int maxra = 0;

  for (register_space rs : RS) {
    if (range[rs][1] > maxra)
      maxra = range[rs][1];
  }

  for (register_atom a = 0; a <= maxra; a++) RA.push_back(a);

  init_vector(pb, P.size(), -1);
  for (block b : B) {
    set<operand> ps;
    for (operation o : ops[b])
      for (operand p : operands[o]) {
        ps.insert(p);
        pb[p] = b;
      }
    ope.push_back(vector<operand>(ps.begin(), ps.end()));
  }

  init_vector(tb, T.size(), -1);
  for (block b : B)
    for (temporary t : tmp[b])
      tb[t] = b;

  for (block b : B) {
    in.push_back(ops[b][0]);
    out.push_back(*(ops[b].end() - 1));
  }

  for (block b : B) {
    vector<vector<operand> > blockcs;
    for (vector<operand> c : congr) {
      // Filter congruences in block b
      vector<temporary> lc;
      for (operand p : c)
        if (pb[p] == b) lc.push_back(p);
      if (lc.size()) blockcs.push_back(lc);
    }
    bcongr.push_back(blockcs);
  }

  init_vector(representative, C.size(), -1);
  init_vector(operand_congruence, P.size(), -1);
  for (congruence c : C) {
    representative[c] = congr[c][0];
    for (operand p : congr[c])
      operand_congruence[p] = c;
  }

  unsigned int u = 0, bu = 0;
  for (block b : B) {
    bfu.push_back(u);
    for (operand p : ope[b])
      if (use[p]) {
        fu[p] = u;
        u += temps[p].size();
        bu += temps[p].size();
      }
    bnu.push_back(bu);
    bu = 0;
  }
  nu = u;

  map<temporary, unsigned int> emptymap;
  init_vector(temporary_index, P.size(), emptymap);
  for (operand p : P)
    for (unsigned int ti = 0; ti < temps[p].size(); ti++) {
      temporary t = temps[p][ti];
      temporary_index[p][t] = ti;
    }

  for (operation o : O)
    for (unsigned int pi = 0; pi < operands[o].size(); pi++) {
      operand p = operands[o][pi];
      operand_index[p] = pi;
    }

  vector<vector<operand> > empty;
  vector<int> emptyadists;
  init_vector(baligned, B.size(), empty);
  init_vector(badist, B.size(), emptyadists);
  for (unsigned int a = 0; a < aligned.size(); a++) {
    vector<int> al = aligned[a];
    block b = pb[al[0]];
    baligned[b].push_back(al);
    badist[b].push_back(adist[a]);
  }

  vector<register_class> emptypclasses;
  init_vector(bpacked, B.size(), empty);
  init_vector(bpclass, B.size(), emptypclasses);
  for (unsigned int p = 0; p < packed.size(); p++) {
    vector<operand> pa = packed[p];
    block b = pb[pa[0]];
    bpacked[b].push_back(pa);
    bpclass[b].push_back(pclass[p]);
  }

  init_vector(copyreltop, P.size(), -1);
  for (vector<operand> ps : copyrel) {
    operand top = ps[0];
    for (operand p : ps) copyreltop[p] = top;
  }

  int am = 0;
  init_vector(mandatory_index, O.size(), -1);
  for (block b : B) {
    accman.push_back(am);
    vector<operation> bcopies, bmandatory;
    for (operation o : ops[b]) {
      if (type[o] == COPY) bcopies.push_back(o);
      if (instructions[o][0] != NULL_INSTRUCTION) {
        mandatory_index[o] = bmandatory.size();
        bmandatory.push_back(o);
      }
    }
    copies.push_back(bcopies);
    mandatory.push_back(bmandatory);
    am += bmandatory.size() * bmandatory.size();
  }
  accman.push_back(am);

  unsigned int a = 0;
  for (block b : B)
    for (operand p : operands[in[b]])
      for (operand q : operands[out[b]])
        if ((representative[operand_congruence[p]] !=
             representative[operand_congruence[q]]) &&
            (copyreltop[p] == copyreltop[q])) {
          A.push_back(a);
          pairs.push_back(make_pair(p, q));
          a++;
        }

  std::sort(pairs.begin(), pairs.end(),
            [&](pair<operand, operand> ps, pair<operand, operand> qs) {
              return freq[pb[ps.first]] > freq[pb[qs.first]];
            });

  init_vector(delimiter, O.size(), false);
  for (block b : B) {
    delimiter[in[b]] = true;
    delimiter[out[b]] = true;
  }

  unsigned int g = 0;
  for (congruence c : C)
    for (operand p : congr[c])
      if (delimiter[oper[p]]) {
        G.push_back(g);
        regular.push_back(c);
        global[c] = g;
        g++;
        break;
      }

  for (operand p : P)
    if (temps[p].size() == 1 || temps[p].size() == 2)
      for (temporary t : temps[p]) if (t != NULL_TEMPORARY) single_temp[p] = t;

  for (temporary t : T) {
    block b = tb[t];
    vector<operand> us;
    for (operand p : ope[b])
      if (use[p] && contains(temps[p], t)) us.push_back(p);
    users.push_back(us);
  }

  init_vector(def_opr, T.size(), -1);
  for (temporary t : T) {
    def_opr[t] = oper[definer[t]];
  }

  for (global_congruence g : G) {
    vector<operation> ucs, dcs;
    for (operand p : congr[regular[g]])
      if (use[p])
        for (temporary t : temps[p]) {
          operation o = def_opr[t];
          if (type[o] == COPY) dcs.push_back(o);
        }
      else
        for (operand q : users[single_temp[p]]) {
          operation o = oper[q];
          if (type[o] == COPY) ucs.push_back(o);
        }
    use_copies.push_back(ucs);
    def_copies.push_back(dcs);
  }

  for (global_congruence g : G) {
    set<register_space> crss;
    vector<operation> copies;
    for (operation o : def_copies[g]) copies.push_back(o);
    for (operation o : use_copies[g]) copies.push_back(o);
    for (operation o : copies)
      for (vector<register_class> rcs : rclass[o])
        for (register_class rc : rcs)
          crss.insert(space[rc]);
    candidate_spaces.push_back(crss);
  }

  vector<operation> emptyis;
  init_vector(fixed_predecessors, O.size(), emptyis);
  for (block b : B)
    for (unsigned int e = 0; e < dep[b].size(); e++) {
      operation o1 = dep[b][e][0], o2 = dep[b][e][1];
      vector<int> d = dist[b][e];
      if (!(d.size() == 1 && d[0] < 0))
        fixed_predecessors[o2].push_back(o1);
    }

  for (operation o : O) {
    vector<pair<operand, operand> > redefs;
    for (operand p : operands[o]) if (use[p])
      for (operand q : operands[o]) if (!use[q])
        if (representative[operand_congruence[p]] ==
            representative[operand_congruence[q]]) {
          redefs.push_back(make_pair(p, q));
        }
    redefined.push_back(redefs);
  }

  vector<operand> emptyps;
  init_vector(groupcopyrel, B.size(), emptyps);
  for (vector<operand> ps : copyrel) {
    block b = pb[ps[0]];
    for (operand p : ps) groupcopyrel[b].push_back(p);
  }

  // sort assignment hints by execution frequency
  sort(assignhints.begin(), assignhints.end(),
       [&](vector<int> h1, vector<int> h2)
       {return (freq[pb[h1[0]]] > freq[pb[h2[0]]]);});

  init_vector(preassigned, G.size(), false);
  for (vector<int> pa : preassign) {
    operand p = pa[0];
    if (delimiter[oper[p]])
      preassigned[global[operand_congruence[p]]] = true;
  }

  for (operand p : P) {
    for (temporary t : temps[p])
    if (t != NULL_TEMPORARY) {
      operand_width.push_back(width[t]);
      break;
    }
  }

  set<operand> emptyas;
  init_vector(destroyed, B.size(), emptyas);
  for (vector<int> pa : preassign) {
    operand p = pa[0];
    operation o = oper[p];
    if (type[o] != IN && type[o] != OUT) {
      register_atom a = pa[1];
      for (register_atom a1 = a; a1 < a + operand_width[p]; a1++)
        destroyed[oblock[o]].insert(a1);
    }
  }

  // TODO: do only when the related temporaries cross destroy
  // operations, otherwise it can be counterproductive.

  for (global_congruence g : G) {
    set<register_atom> alldestroyed;
    for (operand p : congr[regular[g]]) {
      block b = pb[p];
      alldestroyed.insert(destroyed[b].begin(), destroyed[b].end());
    }
    if (!alldestroyed.empty()) {
      operand p = representative[regular[g]];
      avoidhints.push_back(make_tuple(p, to_vector(alldestroyed)));
    }
  }

  sort(avoidhints.begin(), avoidhints.end(),
       [&](AvoidHint h1, AvoidHint h2)
       {return (freq[pb[get<0>(h1)]] > freq[pb[get<0>(h2)]]);});

  for (vector<int> pa : preassign) {
    operand p = pa[0];
    register_atom a = pa[1];
    if (oper[p] == 0 && contains(calleesaved, a))
      for (operand q : users[single_temp[p]]) {
        operation o = oper[q];
        if (type[o] == COPY && temps[q].size() == 2)
          callee_saved_copies.push_back(o);
      }
  }

  set<instruction> emptyiss;
  set<operation> emptyoss;
  map<set<instruction>,set<operation> > activated;
  for (operation o : O)
    if (!activators[o].empty())
      activated[to_set(activators[o])].insert(o);
  activation_class ac = 0;
  for (auto it = activated.begin(); it != activated.end(); ++it) {
    AC.push_back(ac);
    activation_class_instructions.push_back(emptyiss);
    activation_class_operations.push_back(emptyoss);
    for (instruction i : it->first) activation_class_instructions[ac].insert(i);
    for (operation o : it->second) activation_class_operations[ac].insert(o);
    activation_class_representative.push_back(*(it->second.begin()));
    ac++;
  }

  for (vector<int> ma: memassign) {
    temporary t = ma[0];
    register_atom ra = ma[1];
    assert(contains(RA, ra));
    infinite_atom[t] = ra;
  }

  vector<vector<operation> > emptyint;
  init_vector(binterchangeable, B.size(), emptyint);
  for (vector<operation> inter : interchangeable)
    binterchangeable[oblock[inter[0]]].push_back(inter);

  init_vector(min_active_lat, P.size(), INT_MAX);
  for (operation o : O)
    for (unsigned int ii = 0; ii < instructions[o].size(); ii++)
      if (instructions[o][ii] != NULL_INSTRUCTION)
        for (unsigned pi = 0; pi < operands[o].size(); pi++) {
          operand p = operands[o][pi];
          int l = lat[o][ii][pi];
          if (l < min_active_lat[p]) min_active_lat[p] = l;
        }

  for (congruence c : C)
    if (congr[c].size() > 1)
      for (operand p : congr[c]) {
        congruent.insert(p);
      }

  for (vector<operand> a : adjacent) {
    operand p = a[0], q = a[1];
    if (temps[p][0] == NULL_TEMPORARY || temps[q][0] == NULL_TEMPORARY)
      succ[p].push_back(q);
  }

  unsigned int gc = 0;
  for (vector<operand> ps : clusters) {
    GC.push_back(gc);
    gc++;
  }

  map<operand,global_cluster> operand_cluster;
  for (global_cluster gc : GC) {
    set<global_cluster> emptygcset;
    implied_clusters.push_back(emptygcset);
    for (operand p : clusters[gc])
      operand_cluster[p] = gc;
  }

  for (global_cluster gc : GC) {
    for (operand p : clusters[gc]) {
      if (succ.count(p))
        for (operand q : succ[p]) {
          global_cluster gc0 = operand_cluster[q];
          if (gc0 != gc) implied_clusters[gc0].insert(gc);
        }
    }
  }

  for (global_cluster gc : GC) {
    for (operand p : clusters[gc]) {
      block b = pb[p];
      set<temporary> ts;
      for (temporary t : temps[p]) if (t != NULL_TEMPORARY) ts.insert(t);
      // ts contains temps alternative to ts
      bool changed = true;
      while (changed) {
        changed = false;
        for (operand q : ope[b]) {
          vector<temporary> ts0(ts.begin(), ts.end());
          vector<temporary> ts1;
          for (temporary t : temps[q]) if (t != NULL_TEMPORARY) ts1.push_back(t);
          if (!disjoint_sets(ts0, ts1))
            for (temporary t : ts1) ts.insert(t);
          if (ts.size() != ts0.size()) changed = true;
        }
      }
      for (temporary t : ts) {
        operation o = def_opr[t];
        if (type[o] != COPY && !delimiter[o]) remat[p].insert(o);
      }
    }
  }

  for (operand p : P) {
    vector<temporary> ts;
    for (temporary t : temps[p])
      if (t != NULL_TEMPORARY) ts.push_back(t);
    real_temps.push_back(ts);
  }

  for (operand p : P) {
    set<operand> rel;
    for (temporary t : real_temps[p])
      for (operand p1 : users[t])
        rel.insert(p1);
    for (temporary t : real_temps[p]) rel.insert(definer[t]);
    related_operands.push_back(rel);
  }

  for (temporary t : T) {
    operation o1 = INT_MAX;
    for (operand p : users[t]) {
      operation o2 = oper[p];
      if (type[o2] == COPY && o2 < o1) o1 = o2;
    }
    if (o1 == INT_MAX) first_copy.push_back(-1);
    else first_copy.push_back(o1);
  }

  min_lat = P.empty() ? std::numeric_limits<int>::max() : min_of(lat);
  max_lat = P.empty() ? std::numeric_limits<int>::min() : max_of(lat);

  for (register_class rc : RC) {
    IntArgs Drt(atoms[rc]);
    atom_set.push_back(IntSet(Drt));
  }

  init_vector(global_operand, P.size(), false);
  for (vector<operand> adj : adjacent) {
    global_operand[adj[0]] = true;
    global_operand[adj[1]] = true;
  }

  init_vector(global_optional, P.size(), false);
  int goi = 0;
  for (block b : B) {
    first_global_optional_index.push_back(goi);
    int bgoi = 0;
    for (operand p : ope[b]) {
      if (global_operand[p] && temps[p][0] == NULL_TEMPORARY) {
        global_optional[p] = true;
        global_optional_index[p] = goi;
        goi++;
        bgoi++;
      }
    }
    n_global_optionals.push_back(bgoi);
  }

  for (temporary t : T) {
    temporary t1 = -1;
    operand p = definer[t];
    operation o = oper[p];
    if (type[o] == COPY) {
      set<operation> ds;
      for (temporary t2 : real_temps[operands[o][0]]) {
        if (ultimate_source.size() > (unsigned int)t2)
          ds.insert(ultimate_source[t2]);
      }
      if (ds.empty()) {
        t1 = NULL_TEMPORARY;
      } else {
        t1 = *ds.begin();
      }
    } else {
      t1 = t;
    }
    ultimate_source.push_back(t1);
  }

  // presolver

  init_vector(p_preassign, P.size(), -1);
  for(const vector<int>& pr : preassign)
    p_preassign[pr[0]] = pr[1];

  init_vector(t_preassign, T.size(), -1);
  for(const vector<int>& pr : preassign) {
    operand p = pr[0];
    if (temps[p].size()==1)
      t_preassign[temps[p][0]] = pr[1];
  }

  int nregs = atoms[0].size();	// safe over-estimation
  init_vector(r_calleesaved, nregs, true); // also the default for regs that are neither: Hexagon 29/30/31
  for(int r : callersaved)
    r_calleesaved[r] = false;

  unsigned cnt;
  const Parameters * input = this;

  cnt = active_tables.size();
  vector<PresolverActiveTable> empty_active_tables;
  init_vector(bactive_tables, B.size(), empty_active_tables);
  for (PresolverActiveTable table : active_tables) {
    for (block b : B) {
      if (in_block(table, b, input)) {
	bactive_tables[b].push_back(table);
	goto next_act;
      }
    }
    gactive_tables.push_back(table);
  next_act:
    cnt--;
  }
  assert(cnt == 0);

  cnt = tmp_tables.size();
  vector<PresolverCopyTmpTable> empty_tmp_tables;
  init_vector(btmp_tables, B.size(), empty_tmp_tables);
  for (PresolverCopyTmpTable table : tmp_tables) {
    for (block b : B) {
      if (in_block(table, b, input)) {
	btmp_tables[b].push_back(table);
	cnt--;
      }
    }
  }
  assert(cnt == 0);

  cnt = nogoods.size();
  vector<nogood> empty_nogoods;
  init_vector(bnogoods, B.size(), empty_nogoods);
  for (nogood ng : nogoods) {
    for (block b : B) {
      if (in_block(ng, b, input)) {
	bnogoods[b].push_back(ng);
	goto next_ng;
      }
    }
    gnogoods.push_back(ng);
  next_ng:
    cnt--;
  }
  assert(cnt == 0);

  cnt = nogoods2.size();
  init_vector(bnogoods2, B.size(), empty_nogoods);
  for (nogood ng : nogoods2) {
    for (block b : B) {
      if (in_block(ng, b, input)) {
	bnogoods2[b].push_back(ng);
	cnt--;
      }
    }
  }
  assert(cnt == 0);

  cnt = before.size();
  vector<PresolverBefore> empty_before;
  init_vector(bbefore, B.size(), empty_before);
  for (PresolverBefore bef : before) {
    for (block b : B) {
      if (in_block(bef, b, input)) {
	bbefore[b].push_back(bef);
	cnt--;
      }
    }
  }
  assert(cnt == 0);

  cnt = before2.size();
  init_vector(bbefore2, B.size(), empty_before);
  for (PresolverBefore bef : before2) {
    for (block b : B) {
      if (in_block(bef, b, input)) {
	bbefore2[b].push_back(bef);
	cnt--;
      }
    }
  }
  assert(cnt == 0);

  vector<PresolverPrecedence> empty_precedences;
  init_vector(bprecedences, B.size(), empty_precedences);
  for (PresolverPrecedence p : precedences) {
    bprecedences[oblock[p.i]].push_back(p);
  }

  init_vector(bprecedences2, B.size(), empty_precedences);
  for (PresolverPrecedence p : precedences2) {
    bprecedences2[oblock[p.i]].push_back(p);
  }

  vector<PresolverAcross> empty_across;
  init_vector(bacross, B.size(), empty_across);
  for (PresolverAcross acr : across) {
    bacross[oblock[acr.o]].push_back(acr);
  }

  vector<PresolverSetAcross> empty_set_across;
  init_vector(bset_across, B.size(), empty_set_across);
  for (PresolverSetAcross acr : set_across) {
    bset_across[oblock[acr.o]].push_back(acr);
  }

  vector<vector<vector<int>>> empty_domops;
  init_vector(bdomops, B.size(), empty_domops);
  for (vector<vector<int>> item : domops) {
    bdomops[pb[item[0][0]]].push_back(item);
  }

  vector<PresolverDominates> empty_dominates;
  init_vector(bdominates, B.size(), empty_dominates);
  for (PresolverDominates item : dominates) {
    bdominates[oblock[item.o2]].push_back(item);
  }

  init_vector(bdifftemps, B.size(), empty);
  for (vector<operand> item : difftemps) {
    bdifftemps[pb[item[0]]].push_back(item);
  }

  init_vector(bdiffregs, B.size(), empty);
  for (vector<operand> item : diffregs) {
    bdiffregs[pb[item[0]]].push_back(item);
  }

  init_vector(bdomuses, B.size(), empty);
  for (vector<operand> item : domuses) {
    bdomuses[pb[item[0]]].push_back(item);
  }

  init_vector(bprecs, B.size(), empty);
  for (vector<operation> item : precs) {
    bprecs[oblock[item[0]]].push_back(item);
  }

  vector<PresolverInstrCond> empty_instr_cond;
  init_vector(binstr_cond, B.size(), empty_instr_cond);
  for (PresolverInstrCond item : instr_cond) {
    binstr_cond[oblock[item.o]].push_back(item);
  }

  vector<PresolverPred> empty_predecessors;
  init_vector(bpredecessors, B.size(), empty_predecessors);
  for (PresolverPred item : predecessors) {
    bpredecessors[oblock[item.q]].push_back(item);
  }

  vector<PresolverSucc> empty_successors;
  init_vector(bsuccessors, B.size(), empty_successors);
  for (PresolverSucc item : successors) {
    bsuccessors[oblock[item.p]].push_back(item);
  }

}

string Parameters::emit_json() {
  stringstream json;
  json << emit_json_line("B", B)
       << emit_json_line("O", O)
       << emit_json_line("P", P)
       << emit_json_line("T", T)
       << emit_json_line("block", oblock)
       << emit_json_line("operands", operands)
       << emit_json_line("temps", temps)
       << emit_json_line("use", use)
       << emit_json_line("adjacent", adjacent)
       << emit_json_line("preassign", preassign)
       << emit_json_line("width", width)
       << emit_json_line("freq", freq)
       << emit_json_line("aligned", aligned)
       << emit_json_line("adist", adist)
       << emit_json_line("minlive", minlive)
       << emit_json_line("dep", dep)
       << emit_json_line("activators", activators)
       << emit_json_line("I", I)
       << emit_json_line("R", R)
       << emit_json_line("dist", dist)
       << emit_json_line("class", rclass)
       << emit_json_line("atoms", atoms)
       << emit_json_line("instructions", instructions)
       << emit_json_line("lat", lat)
       << emit_json_line("cap", cap)
       << emit_json_line("con", con)
       << emit_json_line("dur", dur);
  return json.str();
}

Parameters Parameters::make_local(block b) {

  operation o_offset = ops[b][0];
  operand p_offset = ope[b][0];
  temporary t_offset = tmp[b][0];

  Parameters local;

  local.B = {0};

  for (operation o : ops[b])
    local.O.push_back(o - o_offset);

  for (operand p : P)
    if (pb[p] == b)
      local.P.push_back(p - p_offset);

  for (temporary t : tmp[b])
    local.T.push_back(t - t_offset);

  for (operation o : ops[b]) {
    vector<operand> o_operands;
    for (operand p : operands[o])
      o_operands.push_back(p - p_offset);
    local.operands.push_back(o_operands);
  }

  for (operand p : ope[b]) {
    vector<temporary> p_temps;
    for (temporary t : temps[p])
      p_temps.push_back(t == NULL_TEMPORARY ? NULL_TEMPORARY : t - t_offset);
    local.temps.push_back(p_temps);
  }

  for (operand p : ope[b])
    local.use.push_back(use[p]);

  for (temporary t : tmp[b])
    local.definer.push_back(definer[t] - p_offset);

  vector<temporary> local_tmp;
  for (temporary t : tmp[b])
    local_tmp.push_back(t - t_offset);
  local.tmp.push_back({local_tmp});

  for (vector<int> pa : preassign) {
    operand p = pa[0];
    register_atom a = pa[1];
    if (pb[p] == b) local.preassign.push_back({p - p_offset, a});
  }

  for (temporary t : tmp[b])
    local.width.push_back(width[t]);

  for (vector<operand> c : bcongr[b]) {
    vector<operand> c1;
    for (operand p : c) c1.push_back(p - p_offset);
    local.congr.push_back(c1);
  }

  vector<temporary> local_ops;
  for (operation o : ops[b])
    local_ops.push_back(o - o_offset);
  local.ops.push_back({local_ops});

  local.freq = {freq[b]};

  for (vector<int> a : baligned[b]) {
    vector<int> a1;
    a1.push_back(a[0] - p_offset);
    a1.push_back(a[1]);
    a1.push_back(a[2] - p_offset);
    a1.push_back(a[3]);
    local.aligned.push_back(a1);
  }

  local.adist = badist[b];

  for (temporary t : tmp[b])
    local.minlive.push_back(minlive[t]);

  vector<vector<int> > local_dep;
  for (vector<int> d : dep[b])
    local_dep.push_back({d[0] - o_offset, d[1] - o_offset});
  local.dep.push_back({local_dep});

  for (operation o : ops[b])
    local.activators.push_back(activators[o]);

  local.I = I;

  local.R = R;

  local.dist = {dist[b]};

  for (operation o : ops[b])
    local.rclass.push_back(rclass[o]);

  local.atoms = atoms;

  for (operation o : ops[b])
    local.instructions.push_back(instructions[o]);

  for (operation o : ops[b])
    local.lat.push_back(lat[o]);

  local.cap = cap;

  local.con = con;

  local.dur = dur;

  return local;
}

#ifdef GRAPHICS

QScriptValue Parameters::getRoot(QScriptValue root, string p) {
  return root.property(p.c_str());
}

void Parameters::get_element(QScriptValue root, bool & b) {
  assert(root.isBoolean());
  b = root.toBoolean();
}

void Parameters::get_element(QScriptValue root, int & i) {
  assert(root.isNumber());
  i = root.toInt32();
}

void Parameters::get_element(QScriptValue root, string & s) {
  assert(root.isString());
  s = root.toString().toStdString();
}

void Parameters::get_element(QScriptValue root, PresolverActiveTable & at) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  at.os = get_vector<int>(iti.value());
  iti.next();
  at.tuples = get_2d_vector<int>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverCopyTmpTable & ctt) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  ctt.os = get_vector<int>(iti.value());
  iti.next();
  ctt.ps = get_vector<int>(iti.value());
  iti.next();
  ctt.tuples = get_2d_vector<int>(iti.value());
}


void Parameters::get_element(QScriptValue root, PresolverPrecedence & p) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  p.i = iti.value().toInt32();
  iti.next();
  p.j = iti.value().toInt32();
  iti.next();
  p.n = iti.value().toInt32();
  iti.next();
  p.d = get_3d_vector<int>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverBefore & b) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  b.p = iti.value().toInt32();
  iti.next();
  b.q = iti.value().toInt32();
  iti.next();
  b.d = get_3d_vector<int>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverAcrossItem & ai) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  ai.t = iti.value().toInt32();
  iti.next();
  ai.d = get_3d_vector<int>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverAcross & a) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  a.o = iti.value().toInt32();
  iti.next();
  a.ras = get_vector<register_atom>(iti.value());
  iti.next();
  a.as = get_vector<PresolverAcrossItem>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverSetAcross & sa) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  sa.o = iti.value().toInt32();
  iti.next();
  sa.ras = get_vector<register_atom>(iti.value());
  iti.next();
  sa.tsets = get_2d_vector<temporary>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverDominates & d) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  d.o1 = iti.value().toInt32();
  iti.next();
  d.o2 = iti.value().toInt32();
  iti.next();
  d.ins = get_vector<operation>(iti.value());
  iti.next();
  d.temps = get_vector<temporary>(iti.value());
}

void Parameters::get_element(QScriptValue root, PresolverPred & d) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  d.p = get_vector<operation>(iti.value());
  iti.next();
  d.q = iti.value().toInt32();
  iti.next();
  d.d = iti.value().toInt32();
}

void Parameters::get_element(QScriptValue root, PresolverSucc & d) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  d.p = iti.value().toInt32();
  iti.next();
  d.q = get_vector<operation>(iti.value());
  iti.next();
  d.d = iti.value().toInt32();
}

void Parameters::get_element(QScriptValue root, PresolverInstrCond & d) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  d.o = iti.value().toInt32();
  iti.next();
  d.i = iti.value().toInt32();
  iti.next();
  d.q = iti.value().toInt32();
}

void Parameters::get_element(QScriptValue root, PresolverValuePrecedeChain & d) {
  assert(root.isArray());
  QScriptValueIterator iti(root);
  iti.next();
  d.ts = get_vector<temporary>(iti.value());
  iti.next();
  d.rss = get_2d_vector<register_atom>(iti.value());
}

#else

Json::Value Parameters::getRoot(Json::Value root, string p) {
  return root.get(p, "null");
}

void Parameters::get_element(Json::Value root, bool & b) {
  assert(root.isBool());
  b = root.asBool();
}

void Parameters::get_element(Json::Value root, int & i) {
  assert(root.isInt());
  i = root.asInt();
}

void Parameters::get_element(Json::Value root, string & s) {
  assert(root.isString());
  s = root.asString();
}

void Parameters::get_element(Json::Value root, PresolverActiveTable & at) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  at.os = get_vector<int>(*iti);
  iti++;
  at.tuples = get_2d_vector<int>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverCopyTmpTable & ctt) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  ctt.os = get_vector<int>(*iti);
  iti++;
  ctt.ps = get_vector<int>(*iti);
  iti++;
  ctt.tuples = get_2d_vector<int>(*iti);
}


void Parameters::get_element(Json::Value root, PresolverPrecedence & p) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  p.i = (*iti).asInt();
  iti++;
  p.j = (*iti).asInt();
  iti++;
  p.n = (*iti).asInt();
  iti++;
  p.d = get_3d_vector<int>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverBefore & b) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  b.p = (*iti).asInt();
  iti++;
  b.q = (*iti).asInt();
  iti++;
  b.d = get_3d_vector<int>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverAcrossItem & ai) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  ai.t = (*iti).asInt();
  iti++;
  ai.d = get_3d_vector<int>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverAcross & a) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  a.o = (*iti).asInt();
  iti++;
  a.ras = get_vector<register_atom>(*iti);
  iti++;
  a.as = get_vector<PresolverAcrossItem>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverSetAcross & sa) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  sa.o = (*iti).asInt();
  iti++;
  sa.ras = get_vector<register_atom>(*iti);
  iti++;
  sa.tsets = get_2d_vector<temporary>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverDominates & d) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  d.o1 = (*iti).asInt();
  iti++;
  d.o2 = (*iti).asInt();
  iti++;
  d.ins = get_vector<operation>(*iti);
  iti++;
  d.temps = get_vector<temporary>(*iti);
}

void Parameters::get_element(Json::Value root, PresolverPred & d) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  d.p = get_vector<operation>(*iti);
  iti++;
  d.q = (*iti).asInt();
  iti++;
  d.d = (*iti).asInt();
}

void Parameters::get_element(Json::Value root, PresolverSucc & d) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  d.p = (*iti).asInt();
  iti++;
  d.q = get_vector<operation>(*iti);
  iti++;
  d.d = (*iti).asInt();
}

void Parameters::get_element(Json::Value root, PresolverInstrCond & d) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  d.o = (*iti).asInt();
  iti++;
  d.i = (*iti).asInt();
  iti++;
  d.q = (*iti).asInt();
}

void Parameters::get_element(Json::Value root, PresolverValuePrecedeChain & d) {
  assert(root.isArray());
  Json::ValueIterator iti = root.begin();
  d.ts = get_vector<temporary>(*iti);
  iti++;
  d.rss = get_2d_vector<register_atom>(*iti);
}

#endif
