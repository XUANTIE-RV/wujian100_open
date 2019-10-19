/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/* double linked list header */

#ifndef __dl_list_h__
#define __dl_list_h__

#ifdef __cplusplus
extern "C" {
#endif

/* defines */

/* typedefs */

typedef struct _rhino_dlnode	        /* Node of a linked list. */
    {
    struct _rhino_dlnode* next;    	/* Points at the next node in the list */
    struct _rhino_dlnode* previous;    /* Points at the previous node in the list */
    } _RHINO_DL_NODE;

typedef struct			            /* Header for a linked list. */
    {
    _RHINO_DL_NODE* head;	            /* header of list */
    _RHINO_DL_NODE* tail;	            /* tail of list */
    } _RHINO_DL_LIST;

typedef _RHINO_DL_NODE DL_NODE;
typedef _RHINO_DL_LIST DL_LIST;

/* DLL_INIT() initialize the specified list to an empty list. */

#define DLL_INIT(list)                                  \
    {                                                   \
    ((DL_LIST *)(list))->head = NULL;                   \
    ((DL_LIST *)(list))->tail = NULL;                   \
    }


/* DLL_ADD() adds the specified node to the end of the specified list. */

#define DLL_ADD(list, node)                                      \
   {                                                             \
   DL_NODE* listTail = (list)->tail;                             \
   DLL_INSERT ((list), listTail, (node));                        \
   }

/*
* DLL_INSERT() inserts the specified node in the specified list.
* The new node is placed following the specified 'previous' node in the list.
* If the specified previous node is NULL, the node is inserted at the head
* of the list.
*/

#define DLL_INSERT(list, previousNode, node)                           \
    {                                                                  \
    DL_NODE *temp;                                                     \
    if ((previousNode) == NULL)                                        \
        {                                                              \
        temp = ((DL_LIST *)(list))->head;                              \
        ((DL_LIST *)(list))->head = (DL_NODE *)(node);                 \
        }                                                              \
    else                                                               \
        {                                                              \
        temp = ((DL_NODE *)(previousNode))->next;                      \
        ((DL_NODE *)(previousNode))->next = (DL_NODE *)(node);         \
        }                                                              \
    if (temp == NULL)                                                  \
        {                                                              \
        ((DL_LIST *)(list))->tail = (DL_NODE *)(node);                 \
        }                                                              \
    else                                                               \
        {                                                              \
        temp->previous = (DL_NODE *)(node);                            \
        }                                                              \
    ((DL_NODE *)(node))->next = temp;                                  \
    ((DL_NODE *)(node))->previous = (DL_NODE *)(previousNode);         \
    }

/* DLL_REMOVE() Remove the specified node in the doubly linked list.*/

#define DLL_REMOVE(list, node)                                              \
   {                                                                        \
   if (((DL_NODE *)(node))->previous == NULL)                               \
       {                                                                    \
       ((DL_LIST *)(list))->head = ((DL_NODE *)(node))->next;               \
       }                                                                    \
   else                                                                     \
       {                                                                    \
       ((DL_NODE *)(node))->previous->next = ((DL_NODE *)(node))->next;     \
       }                                                                    \
   if (((DL_NODE *)(node))->next == NULL)                                   \
       {                                                                    \
       ((DL_LIST *)(list))->tail = ((DL_NODE *)(node))->previous;           \
       }                                                                    \
   else                                                                     \
       {                                                                    \
       ((DL_NODE *)(node))->next->previous = ((DL_NODE *)(node))->previous; \
       }                                                                    \
   }

/*
* DLL_FIRST() finds the first node in a doubly linked list.
*
* RETURNS: Pointer to the first node in a list, or NULL if the list is empty.
*/

#define DLL_FIRST(pList)		       \
    (					               \
    (((DL_LIST *)(pList))->head)	   \
    )

/*
* DLL_LAST () finds the last node in a doubly linked list.
*
* RETURNS: Pointer to the last node in list, or NULL if the list is empty.
*/

#define DLL_LAST(pList)	                \
    (					                \
    (((DL_LIST *)(pList))->tail)	    \
    )

/*
* DLL_NEXT() locates the node immediately after the node pointed to by the pNode.
*
* RETURNS: Pointer to the next node in list, or NULL if there is no next node.
*/

#define DLL_NEXT(pNode)			        \
    (					                \
    (((DL_NODE *)(pNode))->next)	    \
    )

/*
* DLL_PREVIOUS() locates the node immediately before the node pointed
* to by the pNode.
*
* RETURNS: Pointer to the preceding node in the list, or
* NULL if there is no next node.
*/

#define DLL_PREVIOUS(pNode)		        \
    (					                \
    (((DL_NODE *)(pNode))->previous)	\
    )

/*
* DLL_EMPTY() is used to check if list is empty.
* RETURNS: TRUE if list is empty.  FALSE otherwise
*/

#define DLL_EMPTY(pList)			        \
    (						                \
    (((DL_LIST *)pList)->head == NULL)		\
    )

/*
* DLL_GET() gets the first node from the specified list, deletes the node
* from the list, and returns a pointer to the node gotten.
*
* RETURNS: Pointer to the first node in list, or NULL if there is list empty.
*/

#define DLL_GET(list, node)                                                \
   {                                                                       \
   (node) = (void *)((DL_LIST *)(list))->head;                             \
   if ((node) != NULL)                                                     \
       {                                                                   \
       ((DL_LIST *)(list))->head = ((DL_NODE *)(node))->next;              \
       if (((DL_NODE *)(node))->next == NULL)                              \
            {                                                              \
            ((DL_LIST *)(list))->tail = NULL;                              \
            }                                                              \
       else                                                                \
            {                                                              \
            ((DL_NODE *)(node))->next->previous = NULL;                    \
            }                                                              \
       }                                                                   \
   }

#ifdef __cplusplus
    }
#endif /* __cplusplus */

#endif /* __dl_list_h__ */

