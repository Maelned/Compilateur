/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    t_MAIN = 258,
    t_VIRG = 259,
    t_PRINTF = 260,
    t_WHILE = 261,
    t_IF = 262,
    t_ELSE = 263,
    t_TINT = 264,
    t_TVOID = 265,
    t_INT = 266,
    t_FLOAT = 267,
    t_CHAR = 268,
    t_PO = 269,
    t_PF = 270,
    t_AO = 271,
    t_AF = 272,
    t_CO = 273,
    t_CF = 274,
    t_TAB = 275,
    t_ADD = 276,
    t_MUL = 277,
    t_DIV = 278,
    t_DIFF = 279,
    t_COMPAR = 280,
    t_NCOMPAR = 281,
    t_INF_E = 282,
    t_SUP_E = 283,
    t_INF = 284,
    t_SUP = 285,
    t_AFFEC = 286,
    t_RETURN = 287,
    t_GUILLEMET = 288,
    t_PV = 289,
    t_VAR = 290,
    t_STRING = 291,
    t_TCONST = 292
  };
#endif
/* Tokens.  */
#define t_MAIN 258
#define t_VIRG 259
#define t_PRINTF 260
#define t_WHILE 261
#define t_IF 262
#define t_ELSE 263
#define t_TINT 264
#define t_TVOID 265
#define t_INT 266
#define t_FLOAT 267
#define t_CHAR 268
#define t_PO 269
#define t_PF 270
#define t_AO 271
#define t_AF 272
#define t_CO 273
#define t_CF 274
#define t_TAB 275
#define t_ADD 276
#define t_MUL 277
#define t_DIV 278
#define t_DIFF 279
#define t_COMPAR 280
#define t_NCOMPAR 281
#define t_INF_E 282
#define t_SUP_E 283
#define t_INF 284
#define t_SUP 285
#define t_AFFEC 286
#define t_RETURN 287
#define t_GUILLEMET 288
#define t_PV 289
#define t_VAR 290
#define t_STRING 291
#define t_TCONST 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 24 "compilateur_2.y" /* yacc.c:1909  */
 
    int integer;
    char identifier[256];


#line 134 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
