# distutils: language = c++
from libcpp.string cimport string

cdef extern from "<iostream>" namespace "std":
    cdef cppclass iostream:
        pass

    cdef cppclass ifstream:
        pass

    cdef cppclass ostream:
        pass

cdef extern from "<streambuf>" namespace "std":
    cdef cppclass streambuf:
        streambuf()

cdef extern from "<fstream>" namespace "std":
    cdef cppclass ofstream(ostream):
        # constructors
        ofstream(const char*) except +
        ofstream(const char*, open_mode) except+


cdef extern from "<sstream>" namespace "std":
    cdef cppclass stringstream(iostream):
        # constructors
        stringstream() except+

        streambuf* rdbuf() const;
        streambuf* rdbuf (streambuf* sb);
        stringstream& operator<< (streambuf* sb);
        stringstream& operator<< (string s)
        string str() const;
        void str (const string& s);


cdef extern from "<istream>" namespace "std":
    cdef cppclass istream:
        pass

    cdef cppclass istringstream(istream):
        # constructors
        istringstream() except+

        string str() const;
        void str (const string& s);
        streambuf* rdbuf() const;
        streambuf* rdbuf (streambuf* sb);