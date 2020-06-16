#include "CLTheory/Theory.h"

// #define DEBUG_THEORY

// --------------------------------------------------------------

void Theory::SetAxioms(vector<pair<CLFormula,string>>& axioms)
{
    mCLaxioms = axioms;
}

// --------------------------------------------------------------

void Theory::Reset()
{
    miConstantsCounter = 0;
    mConstants.clear();
    mConstantsPermissible.clear();
    AddSymbol("false", 0);
    AddSymbol("true", 0);
}

// --------------------------------------------------------------

void Theory::AddAxiom(CLFormula& axiom, string name)
{
    mCLaxioms.push_back(pair<CLFormula,string>(axiom,name));
}

// --------------------------------------------------------------

void Theory::UpdateSignature(CLFormula& axiom)
{
    for (size_t j = 0; j < axiom.GetPremises().GetSize(); j++)
        AddSymbol(axiom.GetPremises().GetElement(j).GetName(), axiom.GetPremises().GetElement(j).GetArity());
    for (size_t j = 0; j < axiom.GetGoal().GetSize(); j++)
        for (size_t k = 0; k < axiom.GetGoal().GetElement(j).GetSize(); k++)
            AddSymbol(axiom.GetGoal().GetElement(j).GetElement(k).GetName(), axiom.GetGoal().GetElement(j).GetElement(k).GetArity());
}

// --------------------------------------------------------------

void Theory::printAxioms() const
{
    for (size_t i = 0; i < mCLaxioms.size(); i++)
        cout << "Axiom " << i << ": " << mCLaxioms.at(i).second << ": " << mCLaxioms.at(i).first << endl;
    cout << "----------------------------------------" << endl;
}


// --------------------------------------------------------------

void Theory::AddEqNegElimAxioms()
{
    if (mOccuringSymbols.find(EQ_NATIVE_NAME) == mOccuringSymbols.end() ||
        mOccuringSymbols.find(PREFIX_NEGATED+EQ_NATIVE_NAME) == mOccuringSymbols.end())
        return;

    DNFFormula conclusion;
    ConjunctionFormula conc0, conc1;
    Fact a,b;
    a.SetName(EQ_NATIVE_NAME);
    a.SetArg(0,"A");
    a.SetArg(1,"B");
    conc0.Add(a);
    b.SetName(PREFIX_NEGATED+EQ_NATIVE_NAME);
    b.SetArg(0,"A");
    b.SetArg(1,"B");
    conc0.Add(b);

    Fact c;
    c.SetName("false");
    conc1.Add(c);
    conclusion.Add(conc1);
    CLFormula axiom(conc0,conclusion);
    axiom.AddUnivVar("A");
    axiom.AddUnivVar("B");
    AddAxiom(axiom, "eq_neg_elim");
}

// --------------------------------------------------------------

void Theory::AddNegElimAxioms()
{
    // add the axiom  R(...) & nR(...) => false for every predicate symbol
    for (size_t i=2; i < mSignature.size(); i+=2) {
        // skip false
        // ugly convention: skip the predicate symbols with _ in their name - those were introduced during normalization

        if (mOccuringSymbols.find(PREFIX_NEGATED+mSignature[i].first) == mOccuringSymbols.end() ||
            mOccuringSymbols.find(mSignature[i].first) == mOccuringSymbols.end())
            continue;

        if (mSignature[i].first.find('_',0) != string::npos)
            continue;

        ConjunctionFormula premises;
        DNFFormula conclusion;
        ConjunctionFormula conc0;
        Fact a,b;
        // ugly convention: in the signature R and nR go one after another
        a.SetName(mSignature[i].first);
        for (size_t j=0; j < mSignature[i].second; j++)
            a.SetArg(j,string(1,'A'+j));
        premises.Add(a);
        a.SetName(mSignature[i+1].first);
        premises.Add(a);
        b.SetName("false");
        conc0.Add(b);
        conclusion.Add(conc0);
        CLFormula axiom(premises,conclusion);
        for (size_t j=0; j < mSignature[i].second; j++)
            axiom.AddUnivVar(string(1,'A'+j));
        string sname(mSignature[i].first);
        sname[0] = std::tolower(sname[0]);
        AddAxiom(axiom, PREFIX_NEGATED+sname+"NegElim");
    }
}


// --------------------------------------------------------------

void Theory::AddExcludedMiddleAxioms()
{
    // add the axiom  R(...) | nR(...) for every predicate symbol (skip false | true)
    for (size_t i=2; i < mSignature.size(); i+=2) {
        // skip false

        string ass = PREFIX_NEGATED+mSignature[i].first;

        // ugly convention: skip the predicate symbols with _ in their name - those were introduced during normalization
        if (mOccuringSymbols.find(PREFIX_NEGATED+mSignature[i].first) == mOccuringSymbols.end() ||
            mOccuringSymbols.find(mSignature[i].first) == mOccuringSymbols.end())
            continue;

        if (mSignature[i].first.find('_',0) != string::npos)
            continue;

        ConjunctionFormula premises;
        DNFFormula conclusion;
        ConjunctionFormula conc0, conc1;
        Fact a,b;
        // ugly convention: in the signature R and nR go one after another
        a.SetName(mSignature[i].first);
        for (size_t j=0; j < mSignature[i].second; j++)
            a.SetArg(j,string(1,'A'+j));
        conc0.Add(a);
        b.SetName(mSignature[i+1].first);
        for (size_t j=0; j < mSignature[i].second; j++)
            b.SetArg(j,string(1,'A'+j));
        conc1.Add(b);
        conclusion.Add(conc0);
        conclusion.Add(conc1);
        CLFormula axiom(premises,conclusion);
        for (size_t j=0; j < mSignature[i].second; j++)
            axiom.AddUnivVar(string(1,'A'+j));
        AddAxiom(axiom, mSignature[i].first+"ExcludedMiddle");
    }
}

// --------------------------------------------------------------

void Theory::AddEqExcludedMiddleAxiom()
{
    if (mOccuringSymbols.find(EQ_NATIVE_NAME) == mOccuringSymbols.end() ||
        mOccuringSymbols.find(PREFIX_NEGATED+EQ_NATIVE_NAME) == mOccuringSymbols.end())
        return;

    ConjunctionFormula premises;
    DNFFormula conclusion;
    ConjunctionFormula conc0, conc1;
    Fact a,b;
    // ugly convention: in the signature R and nR go one after another
    a.SetName(EQ_NATIVE_NAME);
    a.SetArg(0,"A");
    a.SetArg(1,"B");
    conc0.Add(a);
    b.SetName(PREFIX_NEGATED+EQ_NATIVE_NAME);
    b.SetArg(0,"A");
    b.SetArg(1,"B");
    conc1.Add(b);
    conclusion.Add(conc0);
    conclusion.Add(conc1);
    CLFormula axiom(premises,conclusion);
    axiom.AddUnivVar("A");
    axiom.AddUnivVar("B");
    AddAxiom(axiom, "eq_excluded_middle");
}

// --------------------------------------------------------------

void Theory::AddEqSubAxioms()
{
    if (mOccuringSymbols.find(EQ_NATIVE_NAME) == mOccuringSymbols.end())
        return;

    // add the axiom  eq(A,B) & R(..A..) => R(..B..) false for every predicate symbol
    for (size_t i=1; i < mSignature.size(); i++) {
        // ugly convention: skip the predicate symbols with _ in their name - those were introduced during normalization
        if (mSignature[i].first.find('_',0) != string::npos)
            continue;

        if (mSignature[i].first.find(PREFIX_NEGATED,0) != string::npos)
            continue;

        for (size_t j=0; j < mSignature[i].second; j++) {
            ConjunctionFormula premises;
            DNFFormula conclusion;
            ConjunctionFormula conc0;
            Fact a,b,c;
            b.SetName(mSignature[i].first);
            for (size_t k=0; k < mSignature[i].second; k++)
                b.SetArg(k,string(1,'A'+k));
            premises.Add(b);
            a.SetName(EQ_NATIVE_NAME);
            a.SetArg(0,string(1,'A'+j));
            a.SetArg(1,"X");
            premises.Add(a);
            c.SetName(mSignature[i].first);
            for (size_t k=0; k < mSignature[i].second; k++)
                c.SetArg(k, string(1,'A'+k));
            c.SetArg(j,"X");
            conc0.Add(c);
            conclusion.Add(conc0);
            CLFormula axiom(premises,conclusion);
            for (size_t k=0; k < mSignature[i].second; k++)
                axiom.AddUnivVar(string(1,'A'+k));
            axiom.AddUnivVar("X");
            AddAxiom(axiom, mSignature[i].first+"EqSub"+to_string(j));
        }
    }
}


// --------------------------------------------------------------

void Theory::AddAxiomEqSymm()
{
    if (mOccuringSymbols.find(EQ_NATIVE_NAME) == mOccuringSymbols.end())
        return;

    ConjunctionFormula premises;
    DNFFormula conclusion;
    ConjunctionFormula conc0;
    Fact a,b;
    a.SetName(EQ_NATIVE_NAME);
    a.SetArg(0,"A");
    a.SetArg(1,"B");
    premises.Add(a);
    b.SetName(EQ_NATIVE_NAME);
    b.SetArg(0,"B");
    b.SetArg(1,"A");
    conc0.Add(b);
    conclusion.Add(conc0);
    CLFormula axiom(premises,conclusion);
    axiom.AddUnivVar("A");
    axiom.AddUnivVar("B");
    AddAxiom(axiom, "eq_sym");
}

// --------------------------------------------------------------

void Theory::AddAxiomNEqSymm()
{
    if (mOccuringSymbols.find(PREFIX_NEGATED+EQ_NATIVE_NAME) == mOccuringSymbols.end())
        return;

    ConjunctionFormula premises;
    DNFFormula conclusion;
    ConjunctionFormula conc0;
    Fact a,b;
    a.SetName(PREFIX_NEGATED+EQ_NATIVE_NAME);
    a.SetArg(0,"A");
    a.SetArg(1,"B");
    premises.Add(a);
    b.SetName(PREFIX_NEGATED+EQ_NATIVE_NAME);
    b.SetArg(0,"B");
    b.SetArg(1,"A");
    conc0.Add(b);
    conclusion.Add(conc0);
    CLFormula axiom(premises,conclusion);
    axiom.AddUnivVar("A");
    axiom.AddUnivVar("B");
    AddAxiom(axiom, "not_eq_sym");
}


// --------------------------------------------------------------

void Theory::AddAxiomEqReflexive()
{
    if (mOccuringSymbols.find(EQ_NATIVE_NAME) == mOccuringSymbols.end())
        return;

    ConjunctionFormula premises;
    DNFFormula conclusion;
    ConjunctionFormula conc0;
    Fact b;
    b.SetName(EQ_NATIVE_NAME);
    b.SetArg(0,"A");
    b.SetArg(1,"A");
    conc0.Add(b);
    conclusion.Add(conc0);
    CLFormula axiom(premises,conclusion);
    axiom.AddUnivVar("A");
    AddAxiom(axiom, "eq_refl");
}

// --------------------------------------------------------------

size_t Theory::NumberOfAxioms() const
{
    return mCLaxioms.size();
}

// --------------------------------------------------------------

const pair<CLFormula,string>& Theory::Axiom(size_t i) const
{
    return mCLaxioms[i];
}

// --------------------------------------------------------------

void Theory::AddConstant(string s)
{
    //    mConstants.insert(s);
    if (!IsConstant(s))
        mConstants.push_back(s);
}

// --------------------------------------------------------------

void Theory::AddSymbol(const string& pp, unsigned arity)
{
    string p = pp;
    if (mOccuringSymbols.find(p) == mOccuringSymbols.end())
        mOccuringSymbols.insert(p);
    /*for (std::set<std::string>::iterator it = mOccuringSymbols.begin();
         it != mOccuringSymbols.end(); it++)
       cout << "sadrzaj: " << *it << endl;*/

// This is ugly convention: predicates with names beginning with PREFIX_NEGATED are negated versions
//    mSignature[p] = mSignature.size()+1;
//    mArity[p] = arity;
#ifdef DEBUG_THEORY
    cout << "adding:" << p << endl;
#endif
    if (p[0] == '$')
        p = p.substr(1,p.size()-1);

    for(size_t i = 0; i<mSignature.size(); i++)
    {
        if (mSignature[i].first == p)
        {
#ifdef DEBUG_THEORY
            cout << p << " already present" << endl;
#endif
            return;
        }
    }

    if (p == "false") {
        mSignature.push_back(pair<string,unsigned>("false",0));
        mSignature.push_back(pair<string,unsigned>("true",0));
    }
    else if (p == "true") {
        mSignature.push_back(pair<string,unsigned>("false",0));
        mSignature.push_back(pair<string,unsigned>("true",0));
    } else if (p.size()>3 && p.substr(0,3) == PREFIX_NEGATED) {
        mSignature.push_back(pair<string,unsigned>(p.substr(3,p.size()-3),arity));
        mSignature.push_back(pair<string,unsigned>(p,arity));
    } else {
        mSignature.push_back(pair<string,unsigned>(p,arity));
        mSignature.push_back(pair<string,unsigned>(PREFIX_NEGATED+p, arity));
    }
}

// --------------------------------------------------------------

size_t Theory::GetSymbolArity(string p)
{
    for(size_t i = 0; i<mSignature.size(); i++)
        if (mSignature[i].first == p)
            return mSignature[i].second;
    return 0;
}

// --------------------------------------------------------------

string Theory::MakeNewConstant()
{
    // return GetConstantName(miConstantsCounter++);
    unsigned id = mConstants.size() + mConstantsPermissible.size();
    string s;
    if (id < 26) {
        s = "ca";
        s[1] += id;
    }
    else
        s = "c" + to_string(id);
    mConstants.push_back(s);
    return s;
}

// --------------------------------------------------------------

string Theory::GetConstantName(unsigned id) const
{
    if (id >= mConstants.size() + mConstantsPermissible.size())   {
        string s;
        if (id < 26) {
            s = "ca";
            s[1] += id;
        }
        else
            s = "c" + to_string(id);
        return s;
    }
    return mConstants[id];
/*    if (id < 27) {
        string s = "a";
        s[0] += id;
        return s;
    }
    return "p" + to_string(id);*/
}


// --------------------------------------------------------------

bool Theory::IsConstant(string s) const
{
    /* return ((mConstants.find(s) != mConstants.end()) ||
        (mConstantsPermissible.find(s) != mConstantsPermissible.end()));*/
    for (vector<string>::const_iterator it = mConstants.begin(); it != mConstants.end(); it++)
        if (*it == s)
            return true;
    for (set<string>::iterator it = mConstantsPermissible.begin(); it != mConstantsPermissible.end(); it++)
        if (*it == s)
            return true;
    return false;
}

// --------------------------------------------------------------

bool Theory::MakeNextConstantPermissible()
{
    if (mConstants.begin() != mConstants.end()) {
        mConstantsPermissible.insert(*mConstants.begin());
        mConstants.erase(mConstants.begin());
        return true;
    };
    return false;
}

// --------------------------------------------------------------

void Theory::StoreInitialConstants()
{
    mInitialConstants = mConstants;
}

// --------------------------------------------------------------

size_t Theory::NumberOfConstantsWaiting()
{
    return mConstants.size();
}

// ---------------------------------------------------------------------------------------

void Theory::InstantiateGoal(const CLFormula& cl, map<string,string>& instantiation, DNFFormula& fout, bool bInstantiateVars)
{
    DNFFormula f = cl.GetGoal();
    ConjunctionFormula cnf;
    fout = f;
    size_t size = f.GetSize();
    for(size_t i = 0; i < size; i++) {
        InstantiateGoalDisj(cl, i, instantiation, cnf, bInstantiateVars);
        fout.SetElement(i,cnf);
    }
}

// ---------------------------------------------------------------------------------------

void Theory::InstantiateGoalDisj(const CLFormula& cl, size_t i, map<string,string>& instantiation, ConjunctionFormula& fout, bool bInstantiateVars)
{
    Fact fact;
    ConjunctionFormula f = cl.GetGoal().GetElement(i);
    fout = f;
    size_t size = f.GetSize();
    for(size_t j = 0; j < size; j++) {
        InstantiateFact(f.GetElement(j), instantiation, fact, bInstantiateVars);
        fout.SetElement(j,fact);
    }
}

// ---------------------------------------------------------------------------------------

void Theory::InstantiateFact(const Fact& f, map<string,string>& instantiation, Fact& fout, bool bInstantiateVars)
{
    fout = f;
    size_t size = f.GetArity();
    for(size_t i = 0; i < size; i++) {
        if (instantiation.find(f.GetArg(i)) == instantiation.end()) {
            if (!IsConstant(f.GetArg(i)) && bInstantiateVars)
            {
                string newc = MakeNewConstant();
                // AddConstant(newc);
                instantiation[f.GetArg(i)] = newc;
                fout.SetArg(i, instantiation[f.GetArg(i)]);
            }
        }
        else
        fout.SetArg(i, instantiation[f.GetArg(i)]);
    }
}

// ---------------------------------------------------------------------------------------

