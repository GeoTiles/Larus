#include <string>
#include <set>
#include <iostream>
#include <sstream>
#include <fstream>
#include <string.h>
#include "CLTheory/Theory.h"
#include "CLProof/CLProof.h"
#include "URSA_ProvingEngine.h"
#include "../STL_Engine/STL_FactsDatabase.h"


//#define DEBUG_OUTPUT

// ---------------------------------------------------------------------------------------

URSA_ProvingEngine::URSA_ProvingEngine(Theory *pT, proverParams& params)
{
    mpT = pT;
    mParams = params;
    mName = "URSA";
}

// ---------------------------------------------------------------------------------------

void URSA_ProvingEngine::SetStartTimeAndLimit(const clock_t& startTime, unsigned timeLimit)
{
    mStartTime = startTime;
    mParams.time_limit = timeLimit;
}


// ---------------------------------------------------------------------------------------

void URSA_ProvingEngine::EncodeAxiom(size_t no, CLFormula& axiom, string name)
{
    stringstream s;

    s << endl;
    s << "nAxiomsCount++;" << endl;
    s << "/* " << no << ". ***** Axiom " << axiom << " (axiom name: " << name << ") ***** */ "                                          << endl;
    s << "nAxiomUniVars[nAxiomsCount]         = " << axiom.GetNumOfUnivVars() << "; /* number of univ quantifiers */"      << endl;
    s << "nAxiomExiVars[nAxiomsCount]         = " << axiom.GetNumOfExistVars() << "; /* number of exi quantifiers */"      << endl;
    s << "nAxiomPremises[nAxiomsCount]        = " << axiom.GetPremises().GetSize() << "; /* number of premises         */" << endl;
    s << "bAxiomBranching[nAxiomsCount]       = " << ((axiom.GetGoal().GetSize()>1) ? "true" : "false") << "; /* axiom is branching or not */" << endl;

    size_t noPremises = axiom.GetPremises().GetSize();
    for (size_t j = 0; j < axiom.GetPremises().GetSize(); j++) {
        s << "nPredicate[nAxiomsCount][" << j << "]         = " << URSA_NUM_PREFIX+ToUpper(axiom.GetPremises().GetElement(j).GetName()) + "; /* " << j << ". predicate in premises */" << endl;
        for (size_t i=0; i<axiom.GetPremises().GetElement(j).GetArity(); i++)
            if ((int)axiom.UnivVarOrdinalNumber(axiom.GetPremises().GetElement(j).GetArg(i)) != -1)
                s << "nBinding[nAxiomsCount][" << j << "*nMaxArg+" << i << "] = " << axiom.UnivVarOrdinalNumber(axiom.GetPremises().GetElement(j).GetArg(i))+1 << "; /*" << i+1 << ". universal variable */" << endl;
            else {
                s << "nBinding[nAxiomsCount][" << j << "*nMaxArg+" << i << "] = 0; /* constant */" << endl;
                s << "nAxiomArgument[nAxiomsCount][" << j << "*nMaxArg+" << i << "] = " <<  URSA_NUM_PREFIX << ToUpper(axiom.GetPremises().GetElement(j).GetArg(i)) << ";" << endl;
            }
        }
    if (axiom.GetGoal().GetSize()>0) { // disjunctions in the goal can have only one disjunct
        s << "nPredicate[nAxiomsCount][" << noPremises << "]         = " << URSA_NUM_PREFIX+ToUpper(axiom.GetGoal().GetElement(0).GetElement(0).GetName()) + "; /* first predicate in goal */" << endl;
        for (size_t i=0; i<axiom.GetGoal().GetElement(0).GetElement(0).GetArity(); i++) {
            if ((int)axiom.UnivVarOrdinalNumber(axiom.GetGoal().GetElement(0).GetElement(0).GetArg(i)) != -1)
                s << "nBinding[nAxiomsCount][" << noPremises << "*nMaxArg+" << i << "] = " << axiom.UnivVarOrdinalNumber(axiom.GetGoal().GetElement(0).GetElement(0).GetArg(i))+1 << "; /* 1th univ var */" << endl;
            else if ((int)axiom.ExistVarOrdinalNumber(axiom.GetGoal().GetElement(0).GetElement(0).GetArg(i)) != -1)
                s << "nBinding[nAxiomsCount][" << noPremises << "*nMaxArg+" << i << "] = " << axiom.GetNumOfUnivVars() + axiom.ExistVarOrdinalNumber(axiom.GetGoal().GetElement(0).GetElement(0).GetArg(i))+1 << "; /* 1th univ var */" << endl;
            else {
                s << "nBinding[nAxiomsCount][" << noPremises << "*nMaxArg+" << i << "] = 0; /* constant */" << endl;
                s << "nAxiomArgument[nAxiomsCount][" << noPremises << "*nMaxArg+" << i << "] = " << URSA_NUM_PREFIX << ToUpper(axiom.GetGoal().GetElement(0).GetElement(0).GetArg(i)) << ";" << endl;
            }
        }
    }
    if (axiom.GetGoal().GetSize()>1) {
        s << "nPredicate[nAxiomsCount][" << noPremises+1 << "]         = " << URSA_NUM_PREFIX+ToUpper(axiom.GetGoal().GetElement(1).GetElement(0).GetName()) + "; /* second predicate in goal */" << endl;
        for (size_t i=0; i<axiom.GetGoal().GetElement(1).GetElement(0).GetArity(); i++) {
            if ((int)axiom.UnivVarOrdinalNumber(axiom.GetGoal().GetElement(1).GetElement(0).GetArg(i)) != -1)
                s << "nBinding[nAxiomsCount][" << noPremises+1 << "*nMaxArg+" << i << "] = " << axiom.UnivVarOrdinalNumber(axiom.GetGoal().GetElement(1).GetElement(0).GetArg(i))+1 << "; /* 1th univ var */" << endl;
            else if ((int)axiom.ExistVarOrdinalNumber(axiom.GetGoal().GetElement(1).GetElement(0).GetArg(i)) != -1)
                s << "nBinding[nAxiomsCount][" << noPremises+1 << "*nMaxArg+" << i << "] = " << axiom.GetNumOfUnivVars() + axiom.ExistVarOrdinalNumber(axiom.GetGoal().GetElement(1).GetElement(0).GetArg(i))+1 << "; /* 1th univ var */" << endl;
            else {
                s << "nBinding[nAxiomsCount][" << noPremises+1 << "*nMaxArg+" << i << "] = 0; /* constant  */" << endl;
                s << "nAxiomArgument[nAxiomsCount][" << noPremises+1 << "*nMaxArg+" << i << "] = " << URSA_NUM_PREFIX << ToUpper(axiom.GetGoal().GetElement(1).GetElement(0).GetArg(i)) << ";" << endl;
            }
        }
    }
    mURSAstringAxioms += s.str();
}


// ---------------------------------------------------------------------------------------

void URSA_ProvingEngine::AddPremise(const Fact& f)
{
    mpT->AddSymbol(f.GetName(), f.GetArity());

    stringstream s;
    s << "/* Premise " << f << " */" << endl;
    s << "nNesting[nPremisesCount] = 1;" << endl;
    s << "bCases[nPremisesCount]  = false; " << endl;
    s << "nAxiomApplied[nPremisesCount] = nAssumption;" << endl;
    s << "nP[nPremisesCount][0] = " + URSA_NUM_PREFIX + ToUpper(f.GetName()) + ";" << endl;
    for (size_t i=0; i<f.GetArity(); i++)
        s << "nA[nPremisesCount][" << i << "] = " + URSA_NUM_PREFIX + ToUpper(f.GetArg(i)) + ";" << endl;
    s << "nPremisesCount++;" << endl << endl;
    mURSAstringPremises += s.str();
}


// ---------------------------------------------------------------------------------------

void URSA_ProvingEngine::EncodeHint(const tHint& hint)
{
    CLFormula hintFormula = get<0>(hint);
    string hintName = get<1>(hint);
    string ordinal = get<2>(hint);
    Fact justification = get<3>(hint);

    string sURSAstringConstraints;

    int AxiomUsed = -1;
    if (justification.GetName() != "_") {
        int i;
        string arg0, arg1;
        arg0 = stoi(justification.GetArg(0), i) ? itos(i) : URSA_NUM_PREFIX + justification.GetArg(0) + hintName;
        arg1 = stoi(justification.GetArg(1), i) ? itos(i) : URSA_NUM_PREFIX + justification.GetArg(1) + hintName;

        if (justification.GetName() == "leq" && justification.GetArity() == 2) {
            sURSAstringConstraints += "bHints &&= (" + arg0 + " <= " + arg1 + ");\n";
        }
        if (justification.GetName() == "less" && justification.GetArity() == 2) {
            sURSAstringConstraints += "bHints &&= (" + arg0 + " < " + arg1 + ");\n";
        }
        for (size_t i = 0; i < mpT->mCLaxioms.size(); i++)
            if (mpT->mCLaxioms[i].second == justification.GetName()) {
                AxiomUsed = i;
                break;
            }
    }

    assert(hintFormula.GetNumOfUnivVars()==0 && hintFormula.GetNumOfExistVars() == 0 && hintFormula.GetPremises().GetSize() == 0);

    if (hintFormula.GetGoal().GetSize() > 2)
        return;
    if (hintFormula.GetGoal().GetElement(0).GetSize() > 1)
        return;

    stringstream s;
    s << "/* Hint: " << hintFormula << "; proof step: " << ordinal << "; justification: " << justification << "*/" << endl;
    int proofStep, arg;

    if (stoi(ordinal, proofStep)) { // if it is a number, it is a concrete proof step
        s << "   bH = ( "                                                                                 << endl;
        s <<"                " << proofStep << " < nProofSize  && "                                      << endl;
        if (hintFormula.GetGoal().GetSize() == 1)
            s << "                !bCases[" << proofStep << "] &&  "                                      << endl;
        else
            s << "                 bCases[" << proofStep << "] &&  "                                      << endl;
        if (AxiomUsed!=-1) {
            s <<"                  nAxiomApplied[" << proofStep << "] == " << 13+AxiomUsed << " && "         << endl;
            for (size_t i=0; i<justification.GetArity(); i++) {
                if (justification.GetArg(i) == "?" || justification.GetArg(i) == "_")
                    continue;
                if (stoi(justification.GetArg(i), arg)) // if it is a number, it is one of the intro vars
                    s << "                nInst[" << proofStep << "][" << i+1 << "] == " << justification.GetArg(i) << " && "     << endl;
                else // otherwise, we bind it to a new variable
                    s << "                nInst[" << proofStep << "][" << i+1 << "] == nHintVarInst" + hintName + justification.GetArg(i) + " && " << endl;
            }
        }
        else {
            s <<"                  nAxiomApplied[" << proofStep << "] != nQEDbyCases && "                 << endl;
            s <<"                  nAxiomApplied[" << proofStep << "] != nQEDbyAssumption && "            << endl;
            s <<"                  nAxiomApplied[" << proofStep << "] != nQEDbyEFQ && "                   << endl;
            s <<"                  nAxiomApplied[" << proofStep << "] != nQEDbyNegIntro && "              << endl;
        }

        if (hintFormula.GetGoal().GetElement(0).GetElement(0).GetName() != "_") {
            for(size_t j = 0; j < hintFormula.GetGoal().GetSize(); j++) {
                if (hintFormula.GetGoal().GetElement(j).GetSize() > 1)
                    return;
                Fact f = hintFormula.GetGoal().GetElement(j).GetElement(0);
                s << "                nP[" << proofStep << "][" << j << "] == " + URSA_NUM_PREFIX + ToUpper(f.GetName()) +  " && "       << endl;
                for (size_t i=0; i<f.GetArity(); i++) {
                    if (f.GetArg(i) == "?" || f.GetArg(i) == "_")
                        continue;
                    if (stoi(f.GetArg(i), arg)) // if it is a number, it is one of the intro vars
                        s << "                nA[" << proofStep << "][" << j << "*nMaxArg + " << i << "] == " << arg << " && "     << endl;
                    else // otherwise, we bind it to a new variable
                        s << "                nA[" << proofStep << "][" << j << "*nMaxArg + " << i << "] == nHintVar" + hintName + ToUpper(f.GetArg(i)) + " && " << endl;
                }
            }
        }
        s << "                true); "                                                                << endl;
    }

    else { // the given step is one of proof steps
        s << "bH = false; "                                                                           << endl;
        s << "for (nProofStep=nPremisesCount; nProofStep<nPremisesCount+nProofLen; nProofStep++) { "  << endl;
        s << "   bH ||= ( "                                                                           << endl;
        s <<"                   nProofStep < nProofSize  && "                                                            << endl;
        s <<"                   nProofStep == " + URSA_NUM_PREFIX + ordinal + hintName + " && " << endl;
        if (hintFormula.GetGoal().GetSize() == 1)
            s << "                !bCases[nProofStep] &&  "                                      << endl;
        else
            s << "                 bCases[nProofStep] &&  "                                      << endl;

        if (AxiomUsed!=-1) {
            s <<"                  nAxiomApplied[nProofStep] == " << 13+AxiomUsed << " && "         << endl;
            for (size_t i=0; i<justification.GetArity(); i++) {
                if (justification.GetArg(i) == "?" || justification.GetArg(i) == "_")
                    continue;
                if (stoi(justification.GetArg(i), arg)) // if it is a number, it is one of the intro vars
                    s << "                nInst[nProofStep][" << i+1 << "] == " << justification.GetArg(i) << " && "     << endl;
                else // otherwise, we bind it to a new variable
                    s << "                nInst[nProofStep][" << i+1 << "] == nHintVarInst" + hintName + justification.GetArg(i) + " && " << endl;
            }
        }
        else {
            s <<"                  nAxiomApplied[nProofStep] != nQEDbyCases && "                                                            << endl;
            s <<"                  nAxiomApplied[nProofStep] != nQEDbyAssumption && "                                                         << endl;
            s <<"                  nAxiomApplied[nProofStep] != nQEDbyEFQ && "                                                               << endl;
            s <<"                  nAxiomApplied[nProofStep] != nQEDbyNegIntro && "                                                          << endl;
        }

        if (hintFormula.GetGoal().GetElement(0).GetElement(0).GetName() != "_") {
            for(size_t j = 0; j < hintFormula.GetGoal().GetSize(); j++) {
                if (hintFormula.GetGoal().GetElement(j).GetSize() > 1)
                     return;
                Fact f = hintFormula.GetGoal().GetElement(j).GetElement(0);
                s << "                nP[nProofStep][" << j << "] == " + URSA_NUM_PREFIX + ToUpper(f.GetName()) +  " && "                << endl;
                for (size_t i=0; i<f.GetArity(); i++) {
                    if (f.GetArg(i) == "?" || f.GetArg(i) == "_")
                        continue;
                    if (stoi(f.GetArg(i), arg)) // if it is a number, it is one of the intro vars
                        s << "                nA[nProofStep][" << j << "*nMaxArg + " << i << "] == " << arg << " && " << endl;
                    else
                        s << "                nA[nProofStep][" << j << "*nMaxArg + " << i << "] == nHintVar" + hintName + ToUpper(f.GetArg(i)) + " && " << endl;
                }
            }
        }

        s << "                true); "                                                                << endl;
        s << "} "                                                                                     << endl;
    }
    s << "bHints &&= bH; "                                                                        << endl;
    mURSAstringHints += s.str();
    mURSAstringHints += sURSAstringConstraints;

}


// ---------------------------------------------------------------------------------------

bool URSA_ProvingEngine::ProveFromPremises(const DNFFormula& formula, CLProof& proof)
{
    if (system(NULL)) {

        if (formula.GetSize()>0)  // disjunctions in the goal can have only one disjunct
            mpT->AddSymbol(formula.GetElement(0).GetElement(0).GetName(), formula.GetElement(0).GetElement(0).GetArity());
        if (formula.GetSize()>1)
            mpT->AddSymbol(formula.GetElement(1).GetElement(0).GetName(), formula.GetElement(1).GetElement(0).GetArity());

        EncodeProof(formula);
        system("rm sat-proof.txt 2>/dev/null");
        // if (!ret) // do not attempt to read some old proof representation
        //    cout << "The old file sat-proof.txt has been deleted." << endl;
        const string sCall = "timeout " + to_string(mParams.time_limit) + " ./ursa < prove.urs -q -c -l12 -sclasp";
        if (system(sCall.c_str()))  // Find a proof
            return false;
        return (proof.DecodeProof(formula, "sat-proof.txt"));
    }
    return false;
}

// ---------------------------------------------------------------------------------------

void URSA_ProvingEngine::EncodeProof(const DNFFormula& formula)
{
    ofstream ursaFile;
    ursaFile.open ("prove.urs");

    unsigned mnMaxPremises = 0;
    for (vector<pair<CLFormula,string>>::iterator it = mpT->mCLaxioms.begin(); it!=mpT->mCLaxioms.end(); it++)
        if (it->first.GetPremises().GetSize() > mnMaxPremises)
            mnMaxPremises = it->first.GetPremises().GetSize();

    ursaFile << "/* *********************** URSA Specification ********************** */" << endl;
    ursaFile << endl;

    if (mParams.shortest_proof)
        ursaFile << "minimize(nProofLen, " << mParams.starting_proof_length << ", " << mParams.max_proof_length << ");" << endl << endl;
    else
        ursaFile << "nProofLen = " << mParams.max_proof_length << ";" << endl << endl;

    ursaFile << "nMaxDepth = " << mParams.max_nesting_depth << ";" << endl << endl;

    ursaFile << "nMaxPremises = " << mnMaxPremises << ";" << endl << endl;

    ursaFile << "/* Predicate symbols */" << endl;

    mURSAstringAxioms = "";
    for (vector<pair<CLFormula,string>>::iterator it = mpT->mCLaxioms.begin(); it!=mpT->mCLaxioms.end(); it++)
        EncodeAxiom(it-mpT->mCLaxioms.begin(), it->first, it->second);

    mURSAstringHints = "";
    for (size_t i = 0; i < mpHints->size(); i++)
        EncodeHint(mpHints->at(i));

    unsigned nMaxArity = 0;
    unsigned enumerator = 0;
    for (size_t i = 0; i<mpT->mSignature.size(); i++) {
        ursaFile << URSA_NUM_PREFIX << ToUpper(mpT->mSignature[i].first) << " = " << enumerator++ << ";" << endl;
        ursaFile << "nArity[" + URSA_NUM_PREFIX << ToUpper(mpT->mSignature[i].first) << "] = " <<  mpT->mSignature[i].second << ";" << endl;
        if (mpT->mSignature[i].second > nMaxArity)
            nMaxArity = mpT->mSignature[i].second;
        ursaFile << endl;
    }
    ursaFile << "nNumberOfPredicates = " << mpT->mSignature.size() << ";" << endl;

    ursaFile << "/* Intro constants */" << endl;
    enumerator = 0;
    for (vector<string>::const_iterator it = mpT->mConstants.begin(); it != mpT->mConstants.end(); it++)
        ursaFile << URSA_NUM_PREFIX << ToUpper(*it) << " = " << enumerator++ << ";" << endl;
    for (set<string>::const_iterator it = mpT->mConstantsPermissible.begin(); it != mpT->mConstantsPermissible.end(); it++)
        ursaFile << URSA_NUM_PREFIX << ToUpper(*it) << " = " << enumerator++ << ";" << endl;

    stringstream s;
    s << endl;
    s << "/* *************************** Axioms *************************** */          " << endl;
    s << "/* General form:                                                  */          " << endl;
    s << "/* forall ... exist ... P0(...) and P1(...) => P2(...) OR P3(...) */          " << endl;
    s << "/* ************************************************************** */          " << endl;
    s << "/* predicates have nMaxArg args maximally */ "                                  << endl;
    s << "nMaxArg = " << nMaxArity << "; "                                                << endl;
    s << "nPremisesCount=0; "                                                             << endl;
    s << "nAxiomsCount=0; "                                                               << endl;
    s << "nAssumption = nAxiomsCount;      /* Axiom=0, for Assumptions */"                << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nNegIntroStart = nAxiomsCount;   /* Axiom=1, for NegIntro start */"             << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nFirstCase = nAxiomsCount;       /* Axiom=2, for FirstCase in case split */"    << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nSecondCase = nAxiomsCount;      /* Axiom=3, for SecondCase in case split */"   << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nEQSub = nAxiomsCount;           /* Axiom=4, for = substitutivity */ "          << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nEQReflex = nAxiomsCount;        /* Axiom=5, for reflexivity of = */"           << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nEQSymm = nAxiomsCount;          /* Axiom=6, for symmetry of = and != */"       << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nNegElim = nAxiomsCount;         /* Axiom=7, for conclusion by case split */"   << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nExcludedMiddle = nAxiomsCount;  /* Axiom=8, for conclusion by case split */"   << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nQEDbyCases = nAxiomsCount;      /* Axiom=9, for conclusion by case split */"   << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nQEDbyAssumption = nAxiomsCount; /* Axiom=10, for conclusion by assumption */"  << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++;                                                               " << endl;
    s << "nQEDbyEFQ = nAxiomsCount;        /* Axiom=11, for conclusion by EFQ  */"        << endl;
    s <<                                                                                     endl;
    s << "nAxiomsCount++; "                                                               << endl;
    s << "nQEDbyNegIntro = nAxiomsCount;   /* Axiom=12, for conclusion by NegIntro */"    << endl;
    s <<                                                                                     endl;

    ursaFile << s.str();
    ursaFile << mURSAstringAxioms;
    s.str("");

    s << "/* ******************************* Premises ****************************** */" << endl;
    s << "/* *********************************************************************** */" << endl << endl;
    ursaFile << s.str();
    ursaFile << mURSAstringPremises;
    ursaFile << endl;
    s.str("");

    s << "/* *******************************  Hints  ****************************** */" << endl;
    s << "/* *********************************************************************** */" << endl << endl;
    s << "bHints = true; "                                                                       << endl;
    ursaFile << s.str();
    ursaFile << mURSAstringHints;
    ursaFile << endl;

    ursaFile << "/* **************************** Theorem ******************************* */" << endl;
    ursaFile << "/* ******************************************************************** */" << endl << endl;

    ursaFile << "/* *** Goal *** */                                                        " << endl;
    ursaFile << "nFinalStep = nPremisesCount+nProofLen-1;                                  " << endl;
    ursaFile << "nNesting[nFinalStep] = 1;                                                 " << endl;
    if (formula.GetSize()>1)
        ursaFile << "bCases[nFinalStep]  = true;                                              " << endl;
    else
        ursaFile << "bCases[nFinalStep]  = false;                                              " << endl;

    ursaFile << "nP[nFinalStep][0] = " + URSA_NUM_PREFIX + ToUpper(formula.GetElement(0).GetElement(0).GetName()) + ";" << endl;
    for (size_t i=0; i<formula.GetElement(0).GetElement(0).GetArity(); i++)
        ursaFile << "nA[nFinalStep][" << i << "] = " + URSA_NUM_PREFIX + ToUpper(formula.GetElement(0).GetElement(0).GetArg(i)) + ";" << endl;
    if (formula.GetSize()>1) {
        ursaFile << "nP[nFinalStep][1] = " + URSA_NUM_PREFIX + ToUpper(formula.GetElement(1).GetElement(0).GetName()) + ";" << endl;
        for (size_t i=0; i<formula.GetElement(1).GetElement(0).GetArity(); i++)
            ursaFile << "nA[nFinalStep][nMaxArg+" << i << "] = " + URSA_NUM_PREFIX + ToUpper(formula.GetElement(1).GetElement(0).GetArg(i)) + ";" << endl;
    }
    ursaFile << endl;


    ursaFile << "/* ******************* Proof specification ****************** */ "                                                                << endl;
    ursaFile << "/* ********************************************************** */ "                                                                << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile << "nNegIntro = 0; "                                                                                                                  << endl;
    ursaFile << "nConcludeNegIntro = 0; "                                                                                                          << endl;
    ursaFile << "nNegIntroCheck = 1; "                                                                                                             << endl;
    ursaFile << "bProofStepCorrect = true; "                                                                                                       << endl;
    ursaFile << "bProofFinished = false; "                                                                                                       << endl;
    ursaFile << "bProofCorrect = true;  /* accumulated conditions for all proof steps */ "                                                         << endl;
    ursaFile << "for (nProofStep=nPremisesCount; nProofStep<nPremisesCount+nProofLen; nProofStep++) { "                                            << endl;
    ursaFile << "   bMPStep = false; "                                                                                                             << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile << "   for (nAxiom = 13; nAxiom <= nAxiomsCount; nAxiom++) { /* the proof step was obtained by one of the axioms */ "                 << endl;
    ursaFile <<"       /* If the axiom being explored has N premises, each of them has to be justified  */ "                                       << endl;
    ursaFile <<"       /* (in a proper instantiation) in some of the previous steps.                    */ "                                       << endl;

    ursaFile <<"       bMatchPremises = (nAxiomApplied[nProofStep]==nAxiom); "                                                                     << endl;
    ursaFile <<"       bMatchPremises &&= (nNumberOfPremises[nProofStep]==nAxiomPremises[nAxiom]); "    << endl;

    if (mpT->mConstants.size() + mpT->mConstantsPermissible.size() == 0)
        ursaFile <<"       bMatchPremises &&= (nAxiomUniVars[nAxiom]==0 || nProofStep>0); "                                                        << endl;

    ursaFile <<"       for (nPremisesCounter = 0; nPremisesCounter < nAxiomPremises[nAxiom]; nPremisesCounter++) { "                               << endl;

    ursaFile <<"          bMatchOnePremise = false; "                                                                                              << endl;
    ursaFile <<"          bMatchOnePremise ||= (nPredicate[nAxiom][nPremisesCounter] == " +URSA_NUM_PREFIX+"true && nFrom[nProofStep][nPremisesCounter] == 99); " << endl;
    ursaFile <<"          for (n_from = 0; n_from < nProofStep; n_from++) { "                                                                      << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"             b = (nP[n_from][0]==nPredicate[nAxiom][nPremisesCounter]); "                                                          << endl;
    ursaFile <<"             for (nInd = 0; nInd < nArity[nPredicate[nAxiom][nPremisesCounter]]; nInd++) "                                         << endl;
    ursaFile <<"                b &&= ((nA[n_from][nInd]==nInst[nProofStep][nBinding[nAxiom][nPremisesCounter*nMaxArg+nInd]] && "                  << endl;
    ursaFile <<"                                                            nBinding[nAxiom][nPremisesCounter*nMaxArg+nInd] != 0) "                << endl;
    ursaFile <<"                    || (nA[n_from][nInd]==nAxiomArgument[nAxiom][nPremisesCounter*nMaxArg+nInd] && "                               << endl;
    ursaFile <<"                                                            nBinding[nAxiom][nPremisesCounter*nMaxArg+nInd] == 0));"               << endl;
    ursaFile <<"             bMatchOnePremise ||= (nFrom[nProofStep][nPremisesCounter] == n_from && b && bSameProofBranch[n_from][nProofStep] && !bCases[n_from]); "   << endl;
    ursaFile <<"          } "                                                                                                                      << endl;
    ursaFile <<"          bMatchPremises &&= ((nAxiomPremises[nAxiom]>nPremisesCounter && bMatchOnePremise) || "                                   << endl;
    ursaFile <<"                              (nAxiomPremises[nAxiom]<=nPremisesCounter && nFrom[nProofStep][nPremisesCounter] == 99)); "          << endl;

/*    ursaFile <<"          bM = false; "                                                                                              << endl;
    ursaFile <<"          bM ||= (nPredicate[nAxiom][nPremisesCounter] == " +URSA_NUM_PREFIX+"true && nFrom[nProofStep][nPremisesCounter] == 99); " << endl;
    ursaFile <<"          for (n_from = 0; n_from < nProofStep; n_from++) { "                                                                      << endl;
    ursaFile <<"             b = (nP[n_from][0]==nPredicate[nAxiom][nPremisesCounter]); "                                                          << endl;
    ursaFile <<"             bM ||= (nFrom[nProofStep][nPremisesCounter] == n_from && b); "   << endl;
    ursaFile <<"          } "                                                                                                                      << endl;
    ursaFile <<"          bM &&= ((nAxiomPremises[nAxiom]>nPremisesCounter && bMatchOnePremise) || "                                   << endl;
    ursaFile <<"                  (nAxiomPremises[nAxiom]<=nPremisesCounter && nFrom[nProofStep][nPremisesCounter] == 99)); "          << endl;
    ursaFile <<"          bM ||= (nFrom[nProofStep][nPremisesCounter] == 99); "          << endl;
*/

    ursaFile <<"       } "                                                                                                                         << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"       /* Matching disjuncts in conclusions (one or two) */ "                                                                      << endl;
    ursaFile <<"       nGoalIndex = nAxiomPremises[nAxiom]; "                                                                                      << endl;
    ursaFile <<"       bMatchConclusion = (nP[nProofStep][0]==nPredicate[nAxiom][nGoalIndex]); "                                                   << endl;
    ursaFile <<"       for (nInd = 0; nInd < nArity[nPredicate[nAxiom][nGoalIndex]]; nInd++) { "                                                   << endl;
    ursaFile <<"          bMatchConclusion &&= ((nA[nProofStep][nInd]==nInst[nProofStep][nBinding[nAxiom][nGoalIndex*nMaxArg+nInd]] && "           << endl;
    ursaFile <<"                                                                         nBinding[nAxiom][nGoalIndex*nMaxArg+nInd] != 0)"          << endl;
    ursaFile <<"                             || (nA[nProofStep][nInd]==nAxiomArgument[nAxiom][nGoalIndex*nMaxArg+nInd] && "                        << endl;
    ursaFile <<"                                 nBinding[nAxiom][nGoalIndex*nMaxArg+nInd] == 0));"                                                << endl;
    ursaFile <<"          bMatchConclusion &&= (nA[nProofStep][nInd] < ((nProofStep+2)<<3)); "                                                     << endl;
    ursaFile <<"       } "                                                                                                                         << endl;
    // redundant, but helps in checking if two proof steps are the same
/*    ursaFile <<"       for (nInd = nArity[nPredicate[nAxiom][nGoalIndex]]; nInd < nMaxArg; nInd++) "                                                   << endl;
    ursaFile <<"          bMatchConclusion &&= (nA[nProofStep][nInd]==999); "           << endl;*/

    ursaFile <<"       b = bAxiomBranching[nAxiom] && (nP[nProofStep][1]==nPredicate[nAxiom][nGoalIndex+1]); "                                     << endl;
    ursaFile <<"       for (nInd = 0; nInd < nArity[nPredicate[nAxiom][nGoalIndex+1]]; nInd++) { "                                                 << endl;
    ursaFile <<"          b &&= ((nA[nProofStep][nMaxArg+nInd]==nInst[nProofStep][nBinding[nAxiom][(nGoalIndex+1)*nMaxArg+nInd]] && "              << endl;
    ursaFile <<"                                                                         nBinding[nAxiom][(nGoalIndex+1)*nMaxArg+nInd] != 0)"      << endl;
    ursaFile <<"                             || (nA[nProofStep][nMaxArg+nInd]==nAxiomArgument[nAxiom][(nGoalIndex+1)*nMaxArg+nInd] && "            << endl;
    ursaFile <<"                                 nBinding[nAxiom][(nGoalIndex+1)*nMaxArg+nInd] == 0));"                                            << endl;
    ursaFile <<"          b &&= (nA[nProofStep][nMaxArg+nInd] < ((nProofStep+2)<<3)); "                                                            << endl;
    ursaFile <<"       } "                                                                                                                         << endl;
    ursaFile <<"       bMatchConclusion &&= ((!bAxiomBranching[nAxiom] && !bCases[nProofStep]) || (bCases[nProofStep] && b)); "                    << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"       /* Introducing fresh constants   if the axioms used has existential quantifiers */ "                                        << endl;
    ursaFile <<"       bMatchExiQuantifiers = true; "                                                                                              << endl;
    ursaFile <<"       for (nL=0; nL<nAxiomExiVars[nAxiom]; nL++) { "                                                                              << endl;
    ursaFile <<"           /* The id of a new constant is ((nProofStep+1)<<3) + nL, ie. 8*nProofStep+nL - so they don't overlap, "                 << endl;
    ursaFile <<"              unless some axioms introduces >7 witnesses */ "                                                                      << endl;
    ursaFile <<"           bMatchExiQuantifiers &&= nInst[nProofStep][nAxiomUniVars[nAxiom]+nL+1] == ((nProofStep+1)<<3)+nL; /* fresh constants*/ "<< endl;
    ursaFile <<"       } "                                                                                                                         << endl;
    ursaFile                                                                                                                                       << endl;
    ursaFile <<"       /* The MP proof step is correct if it was derived by using some axiom  */ "                                                 << endl;
    ursaFile <<"       bMPStep ||= (/*bM &&*/ bMatchPremises && bMatchConclusion && bMatchExiQuantifiers && "                                                << endl;
    ursaFile <<"                         ((nNesting[nProofStep] == nNesting[nProofStep-1] && nProofStep > 0) ||"                                   << endl;
    ursaFile <<"                          (nNesting[nProofStep] == 1 && nProofStep == 0))); "                                                      << endl;
    ursaFile <<"   } "                                                                                                                             << endl;
    ursaFile <<                                                                                                                                       endl;

    if (false && mParams.mbNativeEQ) {
        //  forall Arg1, ... Argn, X. P(Arg1,,,Argn) & nEQ(Arg1,X) => P(X,...Argn)
        ursaFile <<"   bMatchPremises = (nAxiomApplied[nProofStep] == nEQSub ); "                                                                  << endl;
        ursaFile <<"   bMatchPremise1 = false; "                                                                                                   << endl;
        ursaFile <<"   bMatchPremise2 = false; "                                                                                                   << endl;
        ursaFile <<"   for (n_from = 0; n_from < nProofStep; n_from++) { "                                                                         << endl;
        ursaFile <<"      bSameProofBranch = (nNesting[nProofStep]==nNesting[n_from]); "                                                           << endl;
        ursaFile <<"      for (nI = 1; nI <= nMaxDepth; nI++) "                                                                                    << endl;
        ursaFile <<"         bSameProofBranch ||= ((nNesting[nProofStep]>>nI)==nNesting[n_from]); "                                                << endl;
        ursaFile <<"      b1 = (nP[n_from][0]==nP[nProofStep][0] && nP[n_from][0]!=" + URSA_NUM_PREFIX + "false && nP[n_from][0]!=" + URSA_NUM_PREFIX + "true); " << endl;
        ursaFile <<"      b2 = (nP[n_from][0]==" + URSA_NUM_PREFIX + EQ_NATIVE_NAME + ");  "                                                                        << endl;
        ursaFile <<"      b3 = (nP[n_from][0]==" + URSA_NUM_PREFIX + EQ_NATIVE_NAME + ");  "                                                                        << endl;
        ursaFile <<"      b2 &&= (nA[n_from][1]==nInst[nProofStep][nMaxArg+2]); "                                                                  << endl;
        ursaFile <<"      b3 &&= (nA[n_from][0]==nInst[nProofStep][nMaxArg+2]); "                                                                  << endl;
        ursaFile <<"      bB1 = false;  "                                                                                                          << endl;
        ursaFile <<"      bB2 = false;  "                                                                                                          << endl;
        ursaFile <<"      bB3 = false;  "                                                                                                          << endl;

        ursaFile <<"      bb1 = true;  "                                                                                                           << endl;
        ursaFile <<"      bb2 = true;  "                                                                                                           << endl;
        ursaFile <<"      bb3 = true;  "                                                                                                           << endl;
        ursaFile <<"      for (nJ = 0; nJ < nMaxArg; nJ++) {"                                                                                      << endl;
        ursaFile <<"         for (nInd = 0; nInd < nMaxArg; nInd++) { "                                                                            << endl;
        ursaFile <<"            bb1 &&= (nA[n_from][nInd]==nA[nProofStep][nInd] || (nInd==nJ)); "                                                  << endl;
        ursaFile <<"            bb1 &&= (nA[nProofStep][nJ]==nInst[nProofStep][nMaxArg+2]); "                                                      << endl;
        ursaFile <<"            bb1 &&= (nA[n_from][nInd]==nInst[nProofStep][nInd+1]); "                                                           << endl;
        ursaFile <<"            bb2 &&= (nA[n_from][0]==nInst[nProofStep][nJ+1]); "                                                                << endl;
        ursaFile <<"            bb3 &&= (nA[n_from][1]==nInst[nProofStep][nJ+1]); "                                                                << endl;
        ursaFile <<"         } "                                                                                                                   << endl;

        ursaFile <<"         bB1 ||= bb1;  "                                                                                                       << endl;
        ursaFile <<"         bB2 ||= bb2;  "                                                                                                       << endl;
        ursaFile <<"         bB3 ||= bb3;  "                                                                                                       << endl;

        ursaFile <<"         bMatchPremise1 ||= (nFrom[nProofStep][0] == n_from && (b1 && bB1) && bSameProofBranch && !bCases[n_from]); "          << endl;
        ursaFile <<"         bMatchPremise2 ||= (nFrom[nProofStep][1] == n_from && ((b2 && bB2) || (b3 && bB3)) && bSameProofBranch && !bCases[n_from]); "  << endl;
        ursaFile <<"      } "                                                                                                                      << endl;
        ursaFile <<"   } "                                                                                                                         << endl;
        ursaFile <<"   bMatchPremises &&= (bMatchPremise1 && bMatchPremise2);"                                                                     << endl;
        ursaFile <<"   bMatchConclusion = true; "                                                                                                      << endl;
        ursaFile <<"   for (nInd = 0; nInd < nMaxArg; nInd++) { "                                                                                      << endl;
        ursaFile <<"      bMatchConclusion &&= (nA[nProofStep][nInd] < ((nProofStep+2)<<3)); "                                                         << endl;
        ursaFile <<"   } "                                                                                                                             << endl;
        ursaFile <<"   bMPStep ||= (bMatchPremises && bMatchConclusion  && !bCases[nProofStep] && "                                                    << endl;
        ursaFile <<"                         ((nNesting[nProofStep] == nNesting[nProofStep-1] && nProofStep > 0) ||"                                   << endl;
        ursaFile <<"                          (nNesting[nProofStep] == 1 && nProofStep == 0))); "                                                      << endl;
        ursaFile << endl;


        //  eq(A,A)
        ursaFile <<"   bMatchPremises = (nAxiomApplied[nProofStep] == nEQReflex); "                                                                    << endl;
        ursaFile <<"   bMatchConclusion = (nP[nProofStep][0] == " + URSA_NUM_PREFIX + EQ_NATIVE_NAME + ") && "                                                          << endl;
        ursaFile <<"                      (nA[nProofStep][0] == nA[nProofStep][1]); "                                                                  << endl;
        ursaFile <<"   for (nInd = 0; nInd < 2; nInd++) { "                                                                                            << endl;
        ursaFile <<"      bMatchConclusion &&= (nA[nProofStep][nInd] < ((nProofStep+2)<<3)); "                                                         << endl;
        ursaFile <<"   } "                                                                                                                             << endl;
        ursaFile <<"   bMPStep ||= (bMatchPremises && bMatchConclusion  && !bCases[nProofStep] && "                                                    << endl;
        ursaFile <<"                         ((nNesting[nProofStep] == nNesting[nProofStep-1] && nProofStep > 0) ||"                                   << endl;
        ursaFile <<"                          (nNesting[nProofStep] == 1 && nProofStep == 0))); "                                                      << endl;
        ursaFile <<                                                                                                                                       endl;

        //  eq(A,B) => eq(B,A)
        ursaFile <<"   bMatchPremises = (nAxiomApplied[nProofStep] == nEQSymm ); "                                                                     << endl;
        ursaFile <<"   bMatchPremise1 = false; "                                                                                                       << endl;
        ursaFile <<"   for (n_from = 0; n_from < nProofStep; n_from++) { "                                                                             << endl;
        ursaFile <<"      bSameProofBranch = (nNesting[nProofStep]==nNesting[n_from]); "                                                               << endl;
        ursaFile <<"      for (nI = 1; nI <= nMaxDepth; nI++) "                                                                                        << endl;
        ursaFile <<"         bSameProofBranch ||= ((nNesting[nProofStep]>>nI)==nNesting[n_from]); "                                                    << endl;
        ursaFile <<"      b = (nFrom[nProofStep][0] == n_from && bSameProofBranch && !bCases[n_from]) && "                                             << endl;
        ursaFile <<"           ((nP[n_from][0]==" + URSA_NUM_PREFIX + EQ_NATIVE_NAME + "|| nP[n_from][0]==" + URSA_NUM_PREFIX + PREFIX_NEGATED+ EQ_NATIVE_NAME + ") &&  "   << endl;
        ursaFile <<"           (nP[n_from][0]==nP[nProofStep][0]) && "                                                                                 << endl;
        ursaFile <<"           (nA[n_from][0]==nA[nProofStep][1] && "                                                                                  << endl;
        ursaFile <<"            nA[n_from][1]==nA[nProofStep][0])); "                                                                                  << endl;
        ursaFile <<"      bMatchPremise1 ||= b; "                                                                                                      << endl;
        ursaFile <<"   } "                                                                                                                             << endl;
        ursaFile <<"   bMatchPremises &&= bMatchPremise1;"                                                                                             << endl;
        ursaFile <<"   bMatchConclusion = true; "                                                                                                      << endl;
        ursaFile <<"   for (nInd = 0; nInd < 2; nInd++) { "                                                                                            << endl;
        ursaFile <<"      bMatchConclusion &&= (nA[nProofStep][nInd] < ((nProofStep+2)<<3)); "                                                         << endl;
        ursaFile <<"   } "                                                                                                                             << endl;
        ursaFile <<"   bMPStep ||= (bMatchPremises && bMatchConclusion  && !bCases[nProofStep] && "                                                    << endl;
        ursaFile <<"                         ((nNesting[nProofStep] == nNesting[nProofStep-1] && nProofStep > 0) ||"                                   << endl;
        ursaFile <<"                          (nNesting[nProofStep] == 1 && nProofStep == 0))); "                                                      << endl;
        ursaFile <<                                                                                                                                       endl;
    }


    if (false && mParams.mbNegElim) {
        //  P(Arg1,,,Argn) & ~P(X,...Argn) => false
        ursaFile <<"   bMatchPremises = (nAxiomApplied[nProofStep]== nNegElim ); "                                                                     << endl;
        ursaFile <<"   bMatchPremise1 = false; "                                                                                                       << endl;
        ursaFile <<"   bMatchPremise2 = false; "                                                                                                       << endl;
        ursaFile <<"   for (n_from = 0; n_from < nProofStep; n_from++) { "                                                                             << endl;
        ursaFile <<"      bSameProofBranch = (nNesting[nProofStep]==nNesting[n_from]); "                                                               << endl;
        ursaFile <<"      for (nI = 1; nI <= nMaxDepth; nI++) "                                                                                        << endl;
        ursaFile <<"         bSameProofBranch ||= ((nNesting[nProofStep]>>nI)==nNesting[n_from]); "                                                    << endl;
        ursaFile <<"      b1 = (nP[n_from][0]==nPP[nProofStep] && nPP[nProofStep] < nNumberOfPredicates && (nPP[nProofStep] & 1) == 0); "              << endl;
        ursaFile <<"      for (nInd = 0; nInd < nMaxArg; nInd++) "                                                                                     << endl;
        ursaFile <<"         b1 &&= (nA[n_from][nInd]==nBB[nProofStep][nInd]); "                                                                       << endl;
        ursaFile <<"      b2 = (nP[n_from][0]==nPP[nProofStep]+1);  "                                                                                  << endl;
        ursaFile <<"      for (nInd = 0; nInd < nMaxArg; nInd++) "                                                                                     << endl;
        ursaFile <<"         b2 &&= (nA[n_from][nInd]==nBB[nProofStep][nInd]); "                                                                       << endl;
        ursaFile <<"      bMatchPremise1 ||= (nFrom[nProofStep][0] == n_from && b1 && bSameProofBranch && !bCases[n_from]); "                          << endl;
        ursaFile <<"      bMatchPremise2 ||= (nFrom[nProofStep][1] == n_from && b2 && bSameProofBranch && !bCases[n_from]); "                          << endl;
        ursaFile <<"   } "                                                                                                                             << endl;
        ursaFile <<"   bMatchPremises &&= (bMatchPremise1 && bMatchPremise2);"                                                                         << endl;
        ursaFile <<"   bMatchConclusion = (nP[nProofStep][0] == " + URSA_NUM_PREFIX + "false); "                                                                             << endl;
        ursaFile <<"   bMPStep ||= (bMatchPremises && bMatchConclusion  && !bCases[nProofStep] && "                                                    << endl;
        ursaFile <<"                         ((nNesting[nProofStep] == nNesting[nProofStep-1] && nProofStep > 0) ||"                                   << endl;
        ursaFile <<"                          (nNesting[nProofStep] == 1 && nProofStep == 0))); "                                                      << endl;
        ursaFile <<                                                                                                                                       endl;
    }

    if (false && mParams.mbExcludedMiddle) {
        //  P(Arg1,,,Argn) | ~P(X,...Argn)
        ursaFile <<"   bMatchPremises = (nAxiomApplied[nProofStep]== nExcludedMiddle); "                                                               << endl;
        ursaFile <<"   bMatchConclusion = (nP[nProofStep][0] + 1 == nP[nProofStep][1] && "                                                             << endl;
        ursaFile <<"                       nP[nProofStep][0] != " + URSA_NUM_PREFIX + "false && "                                                                            << endl;
        ursaFile <<"                       nP[nProofStep][0] < nNumberOfPredicates && "                                                                << endl;
        ursaFile <<"                       (nP[nProofStep][0] & 1) == 0); "                                                                            << endl;
        ursaFile <<"   for (nInd = 0; nInd < nMaxArg; nInd++) { "                                                                                      << endl;
        ursaFile <<"         bMatchConclusion &&= (nA[nProofStep][nInd]==nA[nProofStep][nMaxArg+nInd]); "                                              << endl;
        ursaFile <<"         bMatchConclusion &&= (nA[nProofStep][nInd]==nInst[nProofStep][nInd]); "                                                   << endl;
        ursaFile <<"   }  "                                                                                                                            << endl;
        ursaFile <<"   bMPStep ||= (bMatchPremises && bMatchConclusion  && bCases[nProofStep] && "                                                     << endl;
        ursaFile <<"                         ((nNesting[nProofStep] == nNesting[nProofStep-1] && nProofStep > 0) ||"                                   << endl;
        ursaFile <<"                          (nNesting[nProofStep] == 1 && nProofStep == 0))); "                                                      << endl;
        ursaFile <<                                                                                                                                       endl;
    }

    ursaFile <<"   bNegIntroStep = !bCases[nProofStep] "                                                                                           << endl;
    ursaFile <<"                    && (nNesting[nProofStep-1] == 1) "                                                                             << endl; // restricted version!
    ursaFile <<"                    && (nNesting[nProofStep] == 2) "                                                                               << endl; // restricted version!
    ursaFile <<"                    && (nP[nProofStep][0] & 1 == 0) "                                                                              << endl;
    ursaFile <<"                    && (nP[nProofStep][0] != " + URSA_NUM_PREFIX + "false) "                                                       << endl;
    ursaFile <<"                    && (nP[nProofStep][0]+1 == nP[nFinalStep][0]);  "                                                              << endl;
    ursaFile <<"   for (nInd = 0; nInd < nMaxArg; nInd++) "                                                                                        << endl;
    ursaFile <<"      bNegIntroStep &&= (nA[nProofStep][nInd]==nA[nFinalStep][nInd]); "                                                            << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bFirstCaseStep = nProofStep>0 "                                                                                                 << endl;
    ursaFile <<"                    && !bCases[nProofStep] "                                                                                       << endl;
    // harmonize possible values for nesting TODO
    ursaFile <<"                    && (nNesting[nProofStep-1] < 33) "                                                                             << endl;
    ursaFile <<"                    && (nNesting[nProofStep] == (nNesting[nProofStep-1]<<1)) "                                                     << endl;
    ursaFile <<"                    && (nP[nProofStep][0]==nP[nProofStep-1][0]);  "                                                                << endl;
    ursaFile <<"   for (nInd = 0; nInd < nMaxArg; nInd++) "                                                                                        << endl;
    ursaFile <<"      bFirstCaseStep &&= (nA[nProofStep][nInd]==nA[nProofStep-1][nInd]); "                                                         << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bPrevStepGoal = (nProofStep>0)  && (nP[nProofStep-1][0]==nP[nFinalStep][0]) && !bCases[nProofStep-1]; "                         << endl;
    ursaFile <<"   for (nInd = 0; nInd < nArity[nP[nFinalStep][0]]; nInd++) "                                                                      << endl;
    ursaFile <<"       bPrevStepGoal &&= (nA[nProofStep-1][nInd]==nA[nFinalStep][nInd]); "                                                         << endl;
    ursaFile <<"   bPrevStepGoal2 = (nProofStep>0)  && (nP[nProofStep-1][0]==nP[nFinalStep][1]) && !bCases[nProofStep-1]; "                        << endl;
    ursaFile <<"   for (nInd = 0; nInd < nArity[nP[nFinalStep][1]]; nInd++) "                                                                      << endl;
    ursaFile <<"       bPrevStepGoal2 &&= (nA[nProofStep-1][nInd]==nA[nFinalStep][nMaxArg+nInd]); "                                                << endl;
    ursaFile <<"   bPrevStepGoal ||= (bPrevStepGoal2 && bCases[nFinalStep]); "                                                                     << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bMatchBranchingForSecondCase = false; "                                                                                         << endl;
    ursaFile <<"   for (nI = nPremisesCount; nI+1 < nProofStep; nI++) { "                                                                          << endl;
    ursaFile <<"      b = (nNesting[nProofStep] == ((nNesting[nI]<<1) + 1)) "                                                                      << endl;
    ursaFile <<"          && bCases[nI] "                                                                                                          << endl;
    ursaFile <<"          && (nP[nProofStep][0]==nP[nI][1]); "                                                                                     << endl;
    ursaFile <<"      for (nInd = 0; nInd < nMaxArg; nInd++) "                                                                                     << endl;
    ursaFile <<"         b &&= (nA[nProofStep][nInd]==nA[nI][nMaxArg+nInd]); "                                                                     << endl;
    ursaFile <<"      bMatchBranchingForSecondCase ||= b; "                                                                                        << endl;
    ursaFile <<"   } "                                                                                                                             << endl;
    ursaFile <<"   bSecondCaseStep = bMatchBranchingForSecondCase && bPrevStepGoal "                                                                                << endl;
    ursaFile <<"                     && !bCases[nProofStep] "                                                                                      << endl;
    ursaFile <<"                     && (nNesting[nProofStep] == (nNesting[nProofStep-1]+1)); "                                                    << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bGoalReached = (nP[nProofStep][0]==nP[nFinalStep][0]); "                                                                        << endl;
    ursaFile <<"   for (nInd = 0; nInd < nArity[nP[nFinalStep][0]]; nInd++) "                                                                      << endl;
    ursaFile <<"      bGoalReached &&= (nA[nProofStep][nInd]==nA[nFinalStep][nInd]); "                                                             << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bGoalReached2 = (nProofStep>0)  && (nP[nProofStep][0]==nP[nFinalStep][1]); "                                                    << endl;
    ursaFile <<"   for (nInd = 0; nInd < nArity[nP[nFinalStep][1]]; nInd++) "                                                                      << endl;
    ursaFile <<"       bGoalReached2 &&= (nA[nProofStep][nInd]==nA[nFinalStep][nMaxArg+nInd]); "                                                   << endl;
    ursaFile <<"   bGoalReached ||= (bGoalReached2 && bCases[nFinalStep]); "                                                                       << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bTrivGoalReached = (nP[nFinalStep][0]==" + URSA_NUM_PREFIX + "true || nP[nFinalStep][1]==" + URSA_NUM_PREFIX + "true && bCases[nFinalStep]); " << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bQEDbyAssumptionStep = (((nProofStep == 0 && bTrivGoalReached && nNesting[nProofStep] == 1) || "                                << endl;
    ursaFile <<"                           (nProofStep > 0 && bPrevStepGoal && "                                                                   << endl;
    ursaFile <<"                           nNesting[nProofStep-1] == nNesting[nProofStep] && "                                                     << endl;
    ursaFile <<"                           bGoalReached)) "                                                                                        << endl;
    ursaFile <<"                           && (!bCases[nProofStep] || nProofSize==nProofStep)); "                                                  << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bQEDbyEFQStep = ((nProofStep>0) && nP[nProofStep-1][0] == " + URSA_NUM_PREFIX + "false "                                        << endl;
    ursaFile <<"                     && (nNesting[nProofStep-1] == nNesting[nProofStep]) "                                                         << endl;
    ursaFile <<"                     && bGoalReached "                                                                                             << endl;
    ursaFile <<"                     && (!bCases[nProofStep] || nProofSize==nProofStep)) "                                                         << endl;
    ursaFile <<"                     && !bQEDbyAssumptionStep;  "                                                                                  << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bQEDbyCasesStep = (((nNesting[nProofStep-1] & 1) == 1) "                                                                        << endl;
    ursaFile <<"                     && nNesting[nProofStep] == (nNesting[nProofStep-1]>>1) "                                                      << endl;
    ursaFile <<"                     && bGoalReached "                                                                                             << endl;
    ursaFile <<"                     && (!bCases[nProofStep] || nProofSize==nProofStep)); "                                                        << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bQEDbyNegIntroStep = ((nProofStep>0) && nP[nProofStep-1][0] == " + URSA_NUM_PREFIX + "false "                                   << endl;
    ursaFile <<"                     && ((nNesting[nProofStep-1] >> 1) == nNesting[nProofStep]) "                                                  << endl;
    ursaFile <<"                     && !bCases[nProofStep-1] "                                                                                    << endl;
    ursaFile <<"                     && bGoalReached "                                                                                             << endl;
    ursaFile <<"                     && (!bCases[nProofStep] || nProofSize==nProofStep)); "                                                        << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   nNegIntroCheck += ite (nAxiomApplied[nProofStep] == nNegIntroStart, 1, 0); "                                                    << endl;
    ursaFile <<"   nNegIntroCheck -= ite (nAxiomApplied[nProofStep] == nQEDbyNegIntro, 1, 0); "                                                    << endl;

    ursaFile <<"   bPrevStepQED = (nProofStep > 0) && ((nAxiomApplied[nProofStep-1] == nQEDbyCases) || (nAxiomApplied[nProofStep-1] == nQEDbyAssumption) "              << endl;
    ursaFile <<"                  || (nAxiomApplied[nProofStep-1] == nQEDbyEFQ)  || (nAxiomApplied[nProofStep-1] == nQEDbyNegIntro)); "             << endl;

    ursaFile <<"   bProofStepCorrect = true; "          << endl;
    // aux vars for simpler constraint clauses
    ursaFile <<"   bProofStepCorrect &&= !(bMPStep ^^ baMPStep[nProofStep] ); "          << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bFirstCaseStep ^^ baFirstCaseStep[nProofStep]); "                                         << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bSecondCaseStep ^^ baSecondCaseStep[nProofStep]); "                                       << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bNegIntroStep ^^ baNegIntroStep[nProofStep]); "                                      << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bQEDbyCasesStep ^^ baQEDbyCasesStep[nProofStep]); "                                       << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bQEDbyEFQStep ^^ baQEDbyEFQStep[nProofStep]); "                                           << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bQEDbyAssumptionStep ^^ baQEDbyAssumptionStep[nProofStep]); "                             << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bQEDbyNegIntroStep ^^ baQEDbyNegIntroStep[nProofStep]); "                                 << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bProofStepCorrect &&= !bPrevStepQED || (nNesting[nProofStep] != nNesting[nProofStep-1]); "                                      << endl;
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   bProofStepCorrect &&= (nNegIntroCheck == 2 || nNegIntroCheck==1); "                                                               << endl;
    ursaFile <<"   bProofStepCorrect &&= !(bCases[nProofStep-1] ^^ (nAxiomApplied[nProofStep] == nFirstCase));"                                    << endl;
    ursaFile <<"   bProofStepCorrect &&= !((bPrevStepGoal && bPrevStepQED && (nNesting[nProofStep-1] & 1) == 0) ^^ "                               << endl;
    ursaFile <<"                          nAxiomApplied[nProofStep] == nSecondCase);"                                                              << endl;
    ursaFile <<"   bProofStepCorrect &&= !((bPrevStepGoal && bPrevStepQED && (nNesting[nProofStep-1] & 1) == 1 && nNesting[nProofStep-1]!=1) ^^ "  << endl;
    ursaFile <<"                          nAxiomApplied[nProofStep] == nQEDbyCases); "                                                             << endl;
    ursaFile <<"   bProofStepCorrect &&= (nAxiomApplied[nProofStep] <= nAxiomsCount); "                                                            << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baMPStep[nProofStep] ^^ (nAxiomApplied[nProofStep] >= 13 && nAxiomApplied[nProofStep] <= nAxiomsCount) ); "          << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baFirstCaseStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nFirstCase)); "                                         << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baSecondCaseStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nSecondCase)); "                                       << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baNegIntroStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nNegIntroStart)); "                                      << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baQEDbyCasesStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nQEDbyCases)); "                                       << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baQEDbyEFQStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nQEDbyEFQ)); "                                           << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baQEDbyAssumptionStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nQEDbyAssumption)); "                             << endl;
    ursaFile <<"   bProofStepCorrect &&= !(baQEDbyNegIntroStep[nProofStep] ^^ (nAxiomApplied[nProofStep] == nQEDbyNegIntro)); "                                 << endl;

// neg intro temporarily disabled TODO
    ursaFile <<                                                                                                                                       endl;
    ursaFile <<"   /* ... the proof step is correct if it was one of cases from some case split */ "                                               << endl;
    ursaFile <<"   bProofStepCorrect &&= (baMPStep[nProofStep] /*|| baNegIntroStep[nProofStep] */ || baFirstCaseStep[nProofStep] || baSecondCaseStep[nProofStep]  "                                     << endl;
    ursaFile <<"                   || baQEDbyCasesStep[nProofStep] || baQEDbyAssumptionStep[nProofStep] || baQEDbyEFQStep[nProofStep] /*|| baQEDbyNegIntroStep[nProofStep]*/); "                       << endl;

    ursaFile <<"   bProofStepCorrect &&= !(baMPStep[nProofStep] && baFirstCaseStep[nProofStep]) && "                                                                         << endl;
    ursaFile <<"                         !(baMPStep[nProofStep] && baSecondCaseStep[nProofStep]) &&  "                                                                       << endl;
    ursaFile <<"                         !(baMPStep[nProofStep] && baQEDbyCasesStep[nProofStep]) &&  "                                                                       << endl;
    ursaFile <<"                         !(baMPStep[nProofStep] && baQEDbyAssumptionStep[nProofStep]) &&  "                                                                  << endl;
    ursaFile <<"                         !(baMPStep[nProofStep] && baQEDbyEFQStep[nProofStep]) &&  "                                                                         << endl;
    ursaFile <<"                         !(baMPStep[nProofStep] && baQEDbyNegIntroStep[nProofStep]) &&  "                                                                    << endl;
    ursaFile <<"                         !(baFirstCaseStep[nProofStep] && baSecondCaseStep[nProofStep]) &&  "                                                                << endl;
    ursaFile <<"                         !(baFirstCaseStep[nProofStep] && baQEDbyCasesStep[nProofStep]) &&  "                                                                << endl;
    ursaFile <<"                         !(baFirstCaseStep[nProofStep] && baQEDbyAssumptionStep[nProofStep]) &&  "                                                           << endl;
    ursaFile <<"                         !(baFirstCaseStep[nProofStep] && baQEDbyEFQStep[nProofStep]) &&  "                                                                  << endl;
    ursaFile <<"                         !(baFirstCaseStep[nProofStep] && baQEDbyNegIntroStep[nProofStep]) &&  "                                                             << endl;
    ursaFile <<"                         !(baSecondCaseStep[nProofStep] && baQEDbyCasesStep[nProofStep]) &&  "                                                               << endl;
    ursaFile <<"                         !(baSecondCaseStep[nProofStep] && baQEDbyAssumptionStep[nProofStep]) &&  "                                                          << endl;
    ursaFile <<"                         !(baSecondCaseStep[nProofStep] && baQEDbyEFQStep[nProofStep]) &&  "                                                                 << endl;
    ursaFile <<"                         !(baSecondCaseStep[nProofStep] && baQEDbyNegIntroStep[nProofStep]) &&  "                                                            << endl;
    ursaFile <<"                         !(baQEDbyCasesStep[nProofStep] && baQEDbyAssumptionStep[nProofStep]) &&  "                                                          << endl;
    ursaFile <<"                         !(baQEDbyCasesStep[nProofStep] && baQEDbyEFQStep[nProofStep]) &&  "                                                                 << endl;
    ursaFile <<"                         !(baQEDbyCasesStep[nProofStep] && baQEDbyNegIntroStep[nProofStep]) &&  "                                                            << endl;
    ursaFile <<"                         !(baQEDbyAssumptionStep[nProofStep] && baQEDbyEFQStep[nProofStep]) &&  "                                                            << endl;
    ursaFile <<"                         !(baQEDbyAssumptionStep[nProofStep] && baQEDbyNegIntroStep[nProofStep]) &&  "                                                       << endl;
    ursaFile <<"                         !(baQEDbyEFQStep[nProofStep] && baQEDbyNegIntroStep[nProofStep]);  "                                                                << endl;

    ursaFile <<                                                                                                                                                                 endl;
    ursaFile <<"   for (nProofStep1 = 0; nProofStep1 < nProofStep; nProofStep1++) { "                                                                                        << endl;
    ursaFile <<"      /* Memoization */ " <<                                                                                                                                    endl;
    ursaFile <<"      bsb = (nNesting[nProofStep] == nNesting[nProofStep1]); "                                                                                               << endl;
    ursaFile <<"      for (nI = 1; nI <= nMaxDepth; nI++) "                                                                                                                  << endl;
    ursaFile <<"         bsb ||= ((nNesting[nProofStep]>>nI)==nNesting[nProofStep1]); "                                                                                      << endl;
    ursaFile <<"      bProofStepCorrect &&= !(bSameProofBranch[nProofStep1][nProofStep] ^^ bsb); "                                                                           << endl;
    ursaFile <<"   } "                                                                                                                                                       << endl;

    ursaFile <<"   /* ***************** Symmetry breaking ********************* */ "                                                                                                                                 << endl;

    ursaFile <<"   nProofStep1 = nProofStep-1; "                                                                                                                             << endl;
/*    ursaFile <<"   bsymm = false; "                                                                                                                                          << endl;
    ursaFile <<"   for (ni1 = 0; ni1 < nMaxPremises; ni1++)  "                                                                                                               << endl;
    ursaFile <<"      for (ni = 0; ni < nMaxPremises; ni++)  "                                                                                                               << endl;
    ursaFile <<"          bsymm ||= nFrom[nProofStep][ni] >= nFrom[nProofStep1][ni1]; "                                                                                      << endl;
    ursaFile <<"   bProofStepCorrect &&= (!(baMPStep[nProofStep1] && baMPStep[nProofStep] && "                                                                               << endl;
    ursaFile <<"                          !bCases[nProofStep] && " << endl;
    ursaFile <<"                          nNesting[nProofStep1]==nNesting[nProofStep]) "                                                                                   << endl;
    //ursaFile <<"                            bSameProofBranch[nProofStep1][nProofStep]) "                                                                                     << endl;
    ursaFile <<"                          || bsymm);"                                                                                                                        << endl;
*/

/*  Symmetry breaking - best constraint: */
    ursaFile <<"   bb = true; "                                                                                                                                              << endl;
    ursaFile <<"   for (ni1 = 0; ni1 < nMaxPremises; ni1++)  "                                                                                                               << endl;
    ursaFile <<"      bb &&= ((nNumberOfPremises[nProofStep] <= ni1) || (nFrom[nProofStep][ni1] < nProofStep1)); "                                                           << endl;
    ursaFile <<"   bB =  ((nNumberOfPremises[nProofStep] > nNumberOfPremises[nProofStep1]) "  << endl;
    ursaFile <<"          || (nAxiomApplied[nProofStep] >= nAxiomApplied[nProofStep1])); " << endl;
    ursaFile <<"   bProofStepCorrect &&= (nProofStep == 0) || (!(baMPStep[nProofStep1] && baMPStep[nProofStep] && "                                                         << endl;
    ursaFile <<"                             !bCases[nProofStep] && " << endl;
    ursaFile <<"                             !bCases[nProofStep1] && " << endl;
    ursaFile <<"                             nNesting[nProofStep1]==nNesting[nProofStep] && bb) "                                                                                << endl;
    ursaFile <<"                             || bB); " << endl;


    // Julien: no two same proof steps
/*    ursaFile <<"   for (nProofStep1 = 0; nProofStep1 < nProofStep; nProofStep1++) { "                                                                                        << endl;
    ursaFile <<"      bB = (nP[nProofStep][0]==nP[nProofStep1][0]); "                                     << endl;
    ursaFile <<"      for (nInd = 0; nInd < nMaxArg; nInd++)  "                                                 << endl;
    ursaFile <<"          bB &&= (nA[nProofStep][nInd]==nA[nProofStep1][nInd]); "              << endl;
    ursaFile <<"      bProofStepCorrect &&= (nProofStep == 0) || (!(baMPStep[nProofStep1] && baMPStep[nProofStep] && "                                                         << endl;
    ursaFile <<"                                !bCases[nProofStep] && " << endl;
    ursaFile <<"                                !bCases[nProofStep1] && " << endl;
    ursaFile <<"                                nNesting[nProofStep1]==nNesting[nProofStep]) "                                                                                << endl;
    ursaFile <<"                                || (nProofStep == nProofStep1 || !bB)); " << endl;
    ursaFile <<"    } "                                                                                                                                                       << endl;
*/


    ursaFile <<                                                                                                                                                                 endl;
    ursaFile <<"   bProofCorrect &&= ((nProofStep > nProofSize) || bProofStepCorrect); "                                                                                     << endl;

//    ursaFile <<"   bEarlyEndOfProof = (nProofStep == nFinalStep); "                                                                                                                                << endl;
    ursaFile <<"   bEarlyEndOfProof = true; "                                                                                                                                << endl;
    ursaFile <<"   bEarlyEndOfProof &&= (nNegIntroCheck == 1); "                                                                                                             << endl;
    ursaFile <<"   bEarlyEndOfProof &&= (nNesting[nProofStep]==1); "                                                                                                         << endl;
    ursaFile <<"   bEarlyEndOfProof &&= (bQEDbyCasesStep || bQEDbyAssumptionStep || bQEDbyEFQStep /*|| bQEDbyNegIntroStep*/); "                                              << endl;
    ursaFile <<"   bProofFinished ||= (bEarlyEndOfProof && nProofSize == nProofStep); "                                                                                      << endl;

    // This counter is moved down here, so it don't count nProofStep in case it is the final step and has a disjunction
    ursaFile <<"} "                                                                                                                                                          << endl;
    ursaFile <<                                                                                                                                                                 endl;
    ursaFile <<"assert(bProofCorrect  && bProofFinished && bHints);  "                                                                                                       << endl;
    ursaFile <<                                                                                                                                                                 endl;
    ursaFile.close();
}

// ---------------------------------------------------------------------------------------

