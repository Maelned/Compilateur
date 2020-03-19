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
    t_VIRGULE = 259,
    t_PRINTF = 260,
    t_WHILE = 261,
    t_FOR = 262,
    t_IF = 263,
    t_INT = 264,
    t_FLOAT = 265,
    t_CHAR = 266,
    t_CHIFFRE = 267,
    t_PARENTHESE_OUVRANTE = 268,
    t_PARENTHESE_FERMANTE = 269,
    t_ACCOLADE_OUVRANTE = 270,
    t_ACCOLADE_FERMANTE = 271,
    t_TAB = 272,
    t_ADDITION = 273,
    t_MULTIPLICATION = 274,
    t_DIVISION_ENTIERE = 275,
    t_MODULO = 276,
    t_SOUSTRACTION = 277,
    t_POINT = 278,
    t_OU = 279,
    t_ET_LOGIQUE = 280,
    t_TEST_EGALITE = 281,
    t_INFERIEUR_OU_EGAL = 282,
    t_SUPERIEUR_OU_EGAL = 283,
    t_INFERIEUR = 284,
    t_SUPERIEUR = 285,
    t_EGAL = 286,
    t_NEGATION = 287,
    t_RETURN = 288,
    t_GUILLEMET = 289,
    t_POINT_VIRGULE = 290,
    t_VARIABLE = 291
  };
#endif
/* Tokens.  */
#define t_MAIN 258
#define t_VIRGULE 259
#define t_PRINTF 260
#define t_WHILE 261
#define t_FOR 262
#define t_IF 263
#define t_INT 264
#define t_FLOAT 265
#define t_CHAR 266
#define t_CHIFFRE 267
#define t_PARENTHESE_OUVRANTE 268
#define t_PARENTHESE_FERMANTE 269
#define t_ACCOLADE_OUVRANTE 270
#define t_ACCOLADE_FERMANTE 271
#define t_TAB 272
#define t_ADDITION 273
#define t_MULTIPLICATION 274
#define t_DIVISION_ENTIERE 275
#define t_MODULO 276
#define t_SOUSTRACTION 277
#define t_POINT 278
#define t_OU 279
#define t_ET_LOGIQUE 280
#define t_TEST_EGALITE 281
#define t_INFERIEUR_OU_EGAL 282
#define t_SUPERIEUR_OU_EGAL 283
#define t_INFERIEUR 284
#define t_SUPERIEUR 285
#define t_EGAL 286
#define t_NEGATION 287
#define t_RETURN 288
#define t_GUILLEMET 289
#define t_POINT_VIRGULE 290
#define t_VARIABLE 291

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
