.. _layouts_styles:

Layouts & Styles
================

``Sphinx-Needs`` provides functions to manipulate the layout and the style of a need.

Layouts are defined by a preconfigured table grid and the data, which shall be shown inside specific grid cells.
Styles define mostly the color of a need.

Both features can be set directly during need-configuration or inside the sphinx ``conf.py`` file.

``Sphinx-Needs`` provides some preconfigured, ready-to-use standard layouts:

   * clean
   * complete
   * focus

.. contents::
   :local:
   :depth: 2

.. _layouts:

Layouts
-------
Layouts are using a predefined :ref:`grid system <grids>` and define which data shall be shown in which grid-cells.

There can be multiple layouts using the same :ref:`grid system <grids>`, but maybe showing different data.
E.g. a layout for bugs and one for specifications.

``Sphinx-Needs`` comes with some predefined layouts.
But the user is free to create own layouts and use only them.

Most useful layouts are:

.. list-table::
   :header-rows: 1
   :stub-columns: 1
   :widths: 20 20 60

   - * Layout
     * Used grid
     * Comment
   - * clean
     * :ref:`grid_simple`
     * The standard ``Sphinx-Needs`` layout
   - * complete
     * :ref:`grid_complex`
     * Divided head, meta, footer rows. Showing really all user-added data.
   - * focus
     * :ref:`grid_content`
     * Content focused layout. Showing content only. Nothing more.

**Examples**

.. req:: CLEAN layout
   :id: EX_CLEAN
   :status: open
   :tags: a, b, c, example
   :links: EX_COMPLETE, EX_FOCUS
   :layout: clean

   This is a need using **CLEAN layout**.

.. req:: COMPLETE layout
   :id: EX_COMPLETE
   :status: open
   :tags: a, b, c, example
   :links: EX_CLEAN, EX_FOCUS
   :layout: complete

   This is a need using **COMPLETE layout**.

.. req:: FOCUS layout
   :id: EX_FOCUS
   :status: open
   :tags: a, b, c, example
   :links: EX_COMPLETE, EX_CLEAN
   :layout: focus

   This is a need using **FOCUS layout**.
   The same meta is set as the two needs above.


There are also some *extensions* for the layouts above available:

.. list-table::
   :header-rows: 1
   :stub-columns: 1
   :widths: 20 20 60

   - * Layout
     * Used grid
     * Comment
   - * clean_l
     * :ref:`grid_simple_side_left`
     * Like `clean` but with an extra side element on left side
   - * clean_r
     * :ref:`grid_simple_side_right`
     * Like `clean` but with an extra side element on right side
   - * clean_lp
     * :ref:`grid_simple_side_left_partial`
     * Like `clean` but with an extra, small side element on left side
   - * clean_rp
     * :ref:`grid_simple_side_right_partial`
     * Like `clean` but with an extra, small side element on right side
   - * focus_f
     * :ref:`grid_content_footer`
     * Adds a small footer below content with the need id.
   - * focus_l
     * :ref:`grid_content_side_left`
     * Adds a small footer to the left side of content, showing the need id.
   - * focus_r
     * :ref:`grid_content_side_right`
     * Adds a small footer to the right side of content, showing the need id.

The layouts ``clean_l``, ``clean_r``, ``clean_lp`` and ``clean_rp`` are using the value from the field ``image`` as
source for the image in the side element. This field must made available via :ref:`needs_extra_options`.
If you need another field as source, you must create your own layout.
The image must also be available in the ``_static`` folder.

**Examples**

.. req:: CLEAN_L layout
   :id: EX_CLEAN_L
   :status: open
   :tags: a, b, c, example
   :image: needs_logo.png
   :layout: clean_l

   This is a need using **CLEAN_L layout**.

.. req:: CLEAN_R layout
   :id: EX_CLEAN_R
   :status: open
   :tags: a, b, c, example
   :image: needs_logo.png
   :layout: clean_r

   This is a need using **CLEAN_R layout**.

.. req:: CLEAN_LP layout
   :id: EX_CLEAN_LP
   :status: open
   :tags: a, b, c, example
   :image: needs_logo.png
   :layout: clean_lp

   This is a need using **CLEAN_LP layout**.

.. req:: CLEAN_RP layout
   :id: EX_CLEAN_RP
   :status: open
   :tags: a, b, c, example
   :image: needs_logo.png
   :layout: clean_rp

   This is a need using **CLEAN_RP layout**.

.. req:: FOCUS_F layout
   :id: EX_FOCUS_F
   :status: open
   :tags: a, b, c, example
   :layout: focus_f

   This is a need using **FOCUS_F layout**.

.. req:: FOCUS_L layout
   :id: EX_FOCUS_L
   :status: open
   :tags: a, b, c, example
   :layout: focus_l

   This is a need using **FOCUS_L layout**.

.. req:: FOCUS_R layout
   :id: EX_FOCUS_R
   :status: open
   :tags: a, b, c, example
   :layout: focus_r

   This is a need using **FOCUS_R layout**.


Special layouts:

.. list-table::
   :header-rows: 1
   :stub-columns: 1
   :widths: 20 20 60

   - * Layout
     * Used grid
     * Comment
   - * debug
     * :ref:`grid_content_footer`
     * Shows **all** meta data (also internal ones) in the footer.
       Useful do see what data is available for a need and which can be used in :ref:`filter_string`.

**Examples**

.. req:: DEBUG layout
   :id: EX_DEBUG
   :status: open
   :tags: a, b, c, example
   :layout: debug

   This is a need using **DEBUG layout**.

Using layouts
~~~~~~~~~~~~~
There are two ways of setting a layout for a need:

Set it globally via :ref:`needs_default_layout` in your ``conf.py`` file::

   # conf.py
   needs_default_layout = 'complete'

Or set it locally for each need by using :ref:`need_layout` option::

   .. req:: My requirement
      :layout: complete


Defining own layouts
~~~~~~~~~~~~~~~~~~~~

A full, valid layout configuration look like this::

   # Sphinx-Needs definition of the  *clean* layout
   'clean': {
        'grid': 'simple',
        'layout': {
            'head': [
                '<<meta("type_name")>>: **<<meta("title")>>** <<meta_id()>>  <<collapse_button("meta", collapsed="icon:arrow-down-circle", visible="icon:arrow-right-circle", initial=False)>>'
            ],
            'meta': [
                '<<meta_all(no_links=True)>>',
                '<<meta_links_all()>>'
            ],
        }
    },

Please see :ref:`needs_layouts` for a detailed explanation of the format and how to use it.

.. _layout_functions:

Layout functions
++++++++++++++++

To get custom data into your layout the usage of layout function is needed.
A layout function may look like ``<<meta(arg1, arg2, kwarg=data)>>``

Available layout functions are:

* :func:`meta <sphinxcontrib.needs.layout.LayoutHandler.meta>`
* :func:`meta_all <sphinxcontrib.needs.layout.LayoutHandler.meta_all>`
* :func:`meta_links <sphinxcontrib.needs.layout.LayoutHandler.meta_links>`
* :func:`meta_links_all <sphinxcontrib.needs.layout.LayoutHandler.meta_links_all>`
* :func:`meta_id <sphinxcontrib.needs.layout.LayoutHandler.meta_id>`
* :func:`image <sphinxcontrib.needs.layout.LayoutHandler.image>`
* :func:`link <sphinxcontrib.needs.layout.LayoutHandler.link>`
* :func:`collapse_button <sphinxcontrib.needs.layout.LayoutHandler.collapse_button>`

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.meta(name, prefix=None, show_empty=False)

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.meta_id()

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.meta_all(prefix='', postfix='', exclude=None, no_links=False, defaults=True, show_empty=False)

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.meta_links(name, incoming=False)

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.meta_links_all(prefix='', postfix='')

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.image(url, height=None, width=None, align=None, no_link=False)

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.link(url, text=None, image_url=None, image_height=None, image_width=None)

.. autofunction:: sphinxcontrib.needs.layout.LayoutHandler.collapse_button(target='meta', collapsed='Show', visible='Close', initial=False)

.. _styles:

Styles
------
Styles handle mostly colors for background, border and co. for a need.
Their definition is done in css files, so that ``Sphinx-Needs`` only cares about setting the correct class in HTML
output. This also means that styles do not have any impact to the need design in PDFs and other output formats.

Default styles are:

.. list-table::

   - * **green** or **implemented**
     * Green background
   - * **red** or **open**
     * Red background
   - * **yellow** or **in_progress**
     * Yellow background
   - * **blue**
     * Blue background
   - * **green_border**
     * Green border, but normal background
   - * **red_border**
     * Red border, but normal background
   - * **yellow_border**
     * Yellow border, but normal background
   - * **blue_border**
     * Blue border, but normal background
   - * **clean**
     * Removes all style information. Looks like normal text. Mostly used with layout **focus**.

**Examples**

.. req:: Green background
   :id: EX_STYLE_GREEN
   :tags: example
   :style: green

.. req:: Red background
   :id: EX_STYLE_RED
   :tags: example
   :style: red

.. req:: Yellow background
   :id: EX_STYLE_YELLOW
   :tags: example
   :style: yellow

.. req:: Blue background
   :id: EX_STYLE_BLUE
   :tags: example
   :style: blue

.. req:: Clean style
   :id: EX_STYLE_CLEAN
   :tags: example
   :style: clean

.. req:: Green border
   :id: EX_STYLE_GREEN_BORDER
   :tags: example
   :style: green_border

.. req:: Red border
   :id: EX_STYLE_RED_BORDER
   :tags: example
   :style: red_border

.. req:: Yellow border
   :id: EX_STYLE_YELLOW_BORDER
   :tags: example
   :style: yellow_border

.. req:: Blue border
   :id: EX_STYLE_BLUE_BORDER
   :tags: example
   :style: blue_border

Different styles can also be combined by setting a comma-separated string: ``yellow, red_border``.

.. req:: Yellow background + Red border
   :id: EX_STYLE_YELLOW_RED
   :tags: example
   :style: yellow, red_border

Using styles
~~~~~~~~~~~~
There are two ways of setting a style for a need:

Set it globally via :ref:`needs_default_style` in your ``conf.py`` file::

   # conf.py
   needs_default_style = 'red'

Or set it locally for each need by using :ref:`need_style` option::

   .. req:: My requirement
      :style: red

By setting a style to ``None``, no style is set and the normal Sphinx-Needs style is used.

Own style configuration
~~~~~~~~~~~~~~~~~~~~~~~~

If you need to customize the css definitions, there are twi ways of doing it:

* Provide a css file by using :ref:`needs_css`
* Set own css on sphinx level

.. _styles_css:

Sphinx-needs CSS option
+++++++++++++++++++++++

A css file can be set in the **conf.py** file by setting **needs_css**.
See :ref:`needs_css` on the configuration page for more information.

Sphinx-needs provides the following css styles:

**blank.css**

.. image:: _static/need_blank.png

**modern.css**

.. image:: _static/need_modern.png

**dark.css**

.. image:: _static/need_dark.png

Own CSS file on sphinx level
++++++++++++++++++++++++++++

If you want to use most of the sphinx-needs internal styles but only need some specific changes for single elements, you
can provide your own CSS file by register it inside your conf.py::

    def setup(app):
        app.add_stylesheet('css/my_custom.css')  # may also be an URL

.. hint::

    Do not name it **custom.css** if you are using `Read the docs <http://readthedocs.org>`_ as
    this name is already taken.

HTML output
-----------

For **html output** the used layout and style names are added as css-class to the need table object.
Beside this also the used grid system is added::

   <table class="need needs_grid_simple needs_layout_complex needes_style_blue docutils" id="SPEC_1">

The above line contains the following css classes:

* need: Each html table, which represents a ``need`` has the **need** class
* needs_grid_simple: Used grid system of the layout
* needs_layout_complex: Used layout
* needs_style_needs_blue: Used style

Please note, that the classes added by ``Sphinx-Needs`` always contain a prefix:
``needs_grid_``, ``needs_layout_``, ``needs_style_``.
So if a user defined layout has the name ``specification_layout``, the related css class is
``needs_layout_specification_layout``

.. _grids:

Grids
-----
The following grids are available.

Simple grids
~~~~~~~~~~~~

.. _grid_simple:

simple
++++++
This is the default layout used by ``Sphinx-Needs``.

+---------+
| head    |
+---------+
| meta    |
+---------+
| content |
+---------+

.. _grid_simple_footer:

simple_footer
+++++++++++++
+---------+
| head    |
+---------+
| meta    |
+---------+
| content |
+---------+
| footer  |
+---------+

.. _grid_simple_side_left:

simple_side_left
++++++++++++++++
+------+---------+
| side | head    |
|      +---------+
|      | meta    |
|      +---------+
|      | content |
+------+---------+


.. _grid_simple_side_right:

simple_side_right
+++++++++++++++++
+---------+------+
| head    | side |
+---------+      |
| meta    |      |
+---------+      |
| content |      |
+---------+------+


.. _grid_simple_side_left_partial:

simple_side_left_partial
++++++++++++++++++++++++
+------+------+
| side | head |
|      +------+
|      | meta |
+------+------+
| content     |
+-------------+

.. _grid_simple_side_right_partial:

simple_side_right_partial
+++++++++++++++++++++++++
+------+------+
| head | side |
+------+      |
| meta |      |
+------+------+
| content     |
+-------------+

Complex grids
~~~~~~~~~~~~~

.. _grid_complex:

complex
+++++++

+-------------+--------+--------------+
| head_left   | head   | head_right   |
+-------------+----+---+--------------+
| meta_left        | meta_right       |
+------------------+------------------+
| content                             |
+-------------+--------+--------------+
| footer_left | footer | footer_right |
+-------------+--------+--------------+

Content focused grids
~~~~~~~~~~~~~~~~~~~~~

.. _grid_content:

content
+++++++
+---------+
| content |
+---------+

.. _grid_content_footer:

content_footer
++++++++++++++
+---------+
| content |
+---------+
| footer  |
+---------+

.. _grid_content_side_left:

content_side_left
+++++++++++++++++
+------+---------+
| side | content |
+------+---------+

.. _grid_content_side_right:

content_side_right
++++++++++++++++++
+---------+------+
| content | side |
+---------+------+

.. _grid_content_footer_side_left:

content_footer_side_left
++++++++++++++++++++++++
+--------+---------+
| side   | content |
|        +---------+
|        | footer  |
+--------+---------+

.. _grid_content_footer_side_right:

content_footer_side_right
+++++++++++++++++++++++++
+---------+------+
| content | side |
+---------+      |
| footer  |      |
+---------+------+