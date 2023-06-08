<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InterviewManagement._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <style>
@media screen and (min-width: 768px) {
    
    .ml14 {
            font-weight: 200;
            font-size: 2.5em;
            font-family: serif!important;
            margin-top:0%!important;
        }

            .ml14 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 2.0em;
                padding-right: 0.05em;
                padding-left:6em;
                padding-bottom: 0.15em;
            }

            .ml14 .line {
                opacity: 0;
                position: absolute;
                left: 2.2em;
                height: 2px;
                width: 100%;
                background-color: #17a2b8;
                transform-origin: 100% 100%;
                bottom: 0;
            }

            .ml14 .letter {
                display: inline-block;
                line-height: 1em;
            }
        .tree li a{
            padding: 1px 16px!important;
            font-size: 0.93em!important;
                 font-family: serif!important;
        }

         .li_head {
            padding: 8px 62px!important;
        }
         .tree li{
                 padding: 26px 5px 0 4px!important;
         }
}
/* Extra small devices (phones, 600px and down) */
@media only screen and (max-width: 600px) {
  .ml14 {
            font-weight: 200;
            font-size: 0.95em;
            font-family: serif!important;
            margin-top:0%!important;
        }

            .ml14 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 2.0em;
                padding-right: 0.05em;
                padding-left: 0.5em;
                padding-bottom: 0.15em;
            }

            .ml14 .line {
                opacity: 0;
                position: absolute;
                left: 0em;
                height: 2px;
                width: 100%;
                background-color: #17a2b8;
                transform-origin: 100% 100%;
                bottom: 0;
            }

            .ml14 .letter {
                display: inline-block;
                line-height: 1em;
            }
        .tree li a{
            padding: 1px 16px!important;
            font-size: 0.93em!important;
                 font-family: serif!important;
        }

         .li_head {
            padding: 8px 62px!important;
        }
         .tree li{
                 padding: 26px 5px 0 4px!important;
         }

}
/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {
  .ml14 {
            font-weight: 200;
            font-size: 2.5em;
            font-family: serif!important;
            margin-top:0%!important;
        }

            .ml14 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 2.0em;
                padding-right: 0.05em;
                padding-left: 6em;
                padding-bottom: 0.15em;
            }

            .ml14 .line {
                opacity: 0;
                position: absolute;
                left: 3.2em;
                height: 2px;
                width: 100%;
                background-color: #17a2b8;
                transform-origin: 100% 100%;
                bottom: 0;
            }

            .ml14 .letter {
                display: inline-block;
                line-height: 1em;
            }
        .tree li a{
            padding: 1px 16px!important;
            font-size: 0.93em!important;
                 font-family: serif!important;
        }

         .li_head {
            padding: 8px 62px!important;
        }
         .tree li{
                 padding: 26px 5px 0 4px!important;
         }
 
}
/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {
    
    .ml14 {
            font-weight: 200;
            font-size: 1.3em;
            font-family: serif!important;
            margin-top:0%!important;
        }

            .ml14 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 2.0em;
                padding-right: 0.05em;
                padding-left: 0.5em;
                padding-bottom: 0.15em;
            }

            .ml14 .line {
                opacity: 0;
                position: absolute;
                left: 0em;
                height: 2px;
                width: 100%;
                background-color: #17a2b8;
                transform-origin: 100% 100%;
                bottom: 0;
            }

            .ml14 .letter {
                display: inline-block;
                line-height: 1em;
            }
        .tree li a{
            padding: 1px 16px!important;
            font-size: 0.93em!important;
                 font-family: serif!important;
        }

         .li_head {
            padding: 8px 62px!important;
        }
         .tree li{
                 padding: 26px 5px 0 4px!important;
         }
}
/* Large devices (laptops/desktops, 992px and up) */
@media only screen and (min-width: 992px) {
   
    .ml14 {
            font-weight: 200;
            font-size: 2.5em;
            font-family: serif!important;
            margin-top:0%!important;
        }

            .ml14 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 2.0em;
                padding-right: 0.05em;
                padding-left: 6em;
                padding-bottom: 0.15em;
            }

            .ml14 .line {
                opacity: 0;
                position: absolute;
                left: 3.2em;
                height: 2px;
                width: 100%;
                background-color: #17a2b8;
                transform-origin: 100% 100%;
                bottom: 0;
            }

            .ml14 .letter {
                display: inline-block;
                line-height: 1em;
            }
        .tree li a{
            padding: 1px 16px!important;
            font-size: 0.93em!important;
                 font-family: serif!important;
        }

         .li_head {
            padding: 8px 62px!important;
        }
         .tree li{
                 padding: 26px 5px 0 4px!important;
         }
}
/* Extra large devices (large laptops and desktops, 1200px and up) */
@media only screen and (min-width: 1200px) {
    .ml14 {
            font-weight: 200;
            font-size: 2.5em;
            font-family: serif!important;
            margin-top:0%!important;
        }

            .ml14 .text-wrapper {
                position: relative;
                display: inline-block;
                padding-top: 2.0em;
                padding-right: 0.05em;
                padding-left: 6em;
                padding-bottom: 0.15em;
            }

            .ml14 .line {
                opacity: 0;
                position: absolute;
                left: 3.2em;
                height: 2px;
                width: 100%;
                background-color: #17a2b8;
                transform-origin: 100% 100%;
                bottom: 0;
            }

            .ml14 .letter {
                display: inline-block;
                line-height: 1em;
            }
        .tree li a{
            padding: 1px 16px!important;
            font-size: 0.93em!important;
                 font-family: serif!important;
        }

         .li_head {
            padding: 8px 62px!important;
        }
         .tree li{
                 padding: 26px 5px 0 4px!important;
         }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
      <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1 class="ml14">
                    <span class="text-wrapper">
                        <span class="letters">WELCOME TO THE STAFF INTERVIEW MANAGEMENT PORTAL ECC</span>
                        <span class="line"></span>
                    </span>
                </h1>
            </div>
        </div>
    </div>
    <div class="demo-container no-bg">
        <div class="row" style="margin-top:6%!important;">
              <div class="col-md-1"></div>
            <div class="col-md-10">
        <telerik:RadDiagram ID="theDiagram" runat="server" Width="100%" Height="500" Skin="Metro" ZoomRate="0">
            <ClientEvents OnLoad="diagram_load" />
            <ShapeDefaultsSettings Visual="visualizeShape">
                <StrokeSettings Color="#fff" />
            </ShapeDefaultsSettings>
            <ShapesCollection>
                <telerik:DiagramShape Id="start" Type="start" X="30" Y="60"  Width="120" Height="120" Editable="false" Selectable="false">
                    <FillSettings Color="#cf3737" />
                    <ContentSettings Text="Interview\nFeedback Form\nEntry\n(Dept.Head)" />
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="start1" Type="start1" X="30" Y="260"  Width="120" Height="120" Editable="false" Selectable="false">
                    <FillSettings Color="#cf3737" />
                    <ContentSettings Text="HR Dept.\n(RICHARD)" />
                </telerik:DiagramShape>
                 <telerik:DiagramShape Id="start1Entry" Type="text" X="350" Y="300"  Editable="false" Selectable="false">
                    <ContentSettings Text="Adding Group Salary Range" />
                    <StrokeSettings Color="#000"/>
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="HRManager" Type="question" Width="140" Height="140" X="350" Y="50"  Editable="false" Selectable="false">
                    <FillSettings Color="#f8b72a"/>
                    <ContentSettings Text="HR Manager"/>
                </telerik:DiagramShape> 
                <telerik:DiagramShape Id="HRManagerRejected" Type="text" X="450" Y="40"  Editable="false" Selectable="false">
                    <ContentSettings Text="Rejected" />
                    <StrokeSettings Color="#000"/>
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="HRManagerApproved" Type="text" X="590" Y="100"  Editable="false" Selectable="false">
                    <ContentSettings Text="Approved" />
                    <StrokeSettings Color="#000"/>
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="management" Type="question" Width="140" Height="140" X="650" Y="50"  Editable="false" Selectable="false">
                    <FillSettings Color="#25a0da" />
                    <ContentSettings Text="Management" />
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="managementRejected" Type="text" X="750" Y="40"  Editable="false" Selectable="false">
                    <ContentSettings Text="Rejected" />
                    <StrokeSettings Color="#000"/>
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="managementApproved" Type="text" X="840" Y="100"  Editable="false" Selectable="false">
                    <ContentSettings Text="Approved" />
                    <StrokeSettings Color="#000"/>
                </telerik:DiagramShape>
                 <telerik:DiagramShape Id="FinalHRManager" Type="question" Width="140" Height="140" X="900" Y="50"  Editable="false" Selectable="false">
                    <FillSettings Color="#f8b72a"/>
                    <ContentSettings Text="HR Manager"/>
                </telerik:DiagramShape> 
                 <telerik:DiagramShape Id="FinalHRApproved" Type="text" X="1090" Y="100"  Editable="false" Selectable="false">
                    <ContentSettings Text="Placing an Offer" />
                    <StrokeSettings Color="#000"/>
                </telerik:DiagramShape>
                <telerik:DiagramShape Id="end" Type="end" X="1150" Y="70" Editable="false" Selectable="false">
                    <FillSettings Color="#49a046" />
                    <ContentSettings Text="End" />
                </telerik:DiagramShape>
            </ShapesCollection>
            <ConnectionsCollection>
                <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="start" />
                    <ToSettings ShapeId="HRManager" />
                </telerik:DiagramConnection>
                 <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="start1" />
                    <ToSettings ShapeId="HRManager" />
                </telerik:DiagramConnection>
                <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="HRManager" Connector="Right" />
                    <ToSettings ShapeId="management" />
                </telerik:DiagramConnection>
                <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="HRManager" Connector="Top" />
                    <ToSettings ShapeId="end" Connector="Top" />
                    <PointsCollection>
                        <telerik:DiagramConnectionPoint X="420" Y="20" />
                        <telerik:DiagramConnectionPoint X="1100" Y="20" />
                    </PointsCollection>
                </telerik:DiagramConnection>
                <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="management"  Connector="Right" />
                    <ToSettings ShapeId="FinalHRManager" />
                </telerik:DiagramConnection>
                <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="management"  Connector="top" />
                    <ToSettings ShapeId="end" />
                </telerik:DiagramConnection>
                <telerik:DiagramConnection Editable="false" Selectable="false">
                    <FromSettings ShapeId="FinalHRManager" Connector="Right" />
                    <ToSettings ShapeId="end"/>
                </telerik:DiagramConnection>
            </ConnectionsCollection>
        </telerik:RadDiagram>
                </div>
            <div class="col-md-1"></div>
        </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script type="text/javascript">    
        //$("._PageHeader").text("");
        // Wrap every letter in a span
        var textWrapper = document.querySelector('.ml14 .letters');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

        anime.timeline({ loop: true })
            .add({
                targets: '.ml14 .line',
                scaleX: [0, 1],
                opacity: [0.5, 1],
                easing: "easeInOutExpo",
                duration: 900
            }).add({
                targets: '.ml14 .letter',
                opacity: [0, 1],
                translateX: [40, 0],
                translateZ: 0,
                scaleX: [0.3, 1],
                easing: "easeOutExpo",
                duration: 800,
                offset: '-=600',
                delay: (el, i) => 150 + 25 * i
            }).add({
                targets: '.ml14',
                opacity: 0,
                duration: 1000,
                easing: "easeOutExpo",
                delay: 1000
            });
    </script>
     <script>
         (function (global, undefined) {
             var diagram;

             function pageLoad() {
                 capAllConnections(diagram.connections);
                 cleanUpShapesContent(diagram.shapes);
             }

             function diagram_load(sender) {
                 diagram = sender.get_kendoWidget();
             }

             function visualizeShape(options) {
                 var ns = kendo.dataviz.diagram,
                     diagramCanvas = getDiagramCanvasOnPage(),
                     lineHeight = 16,
                     type = options.type,
                     shapeGroup = new ns.Group({ autoSize: true }),
                     textGroup = new ns.Group(),
                     textLines = [];

                 if (options.type != 'text' && options.content && options.content.text) {
                     text = options.content.text.split('\\n');

                     var textHeight = options.height - (text.length - 1) * lineHeight;

                     for (var i = 0; i < text.length; i++) {
                         var y = (i * lineHeight);

                         textLines.push(new ns.TextBlock({
                             autoSize: false,
                             text: text[i],
                             x: 0,
                             y: y,
                             width: options.width,
                             height: textHeight + 2 * y,
                             color: options.stroke.color,
                             fontFamily: 'Segoe UI'
                         }));
                     }
                     options.content.text = '';
                 }

                 if (type == 'rectangle') {
                     var rectangle = new ns.Rectangle(options);

                     appendToGroupWithoutOffset(rectangle, shapeGroup);
                 } else if (type == 'question') {
                     options.data = 'M70,0 L140,70 L70,140 L0,70 z';
                     var path = new ns.Path(options);

                     appendToGroupWithoutOffset(path, shapeGroup);
                 } else if (type == 'start' || type == 'start1' || type == 'end') {
                     var circle = new ns.Circle(options);

                     appendToGroupWithoutOffset(circle, shapeGroup);
                 }

                 if (options.type != 'text') {
                     diagramCanvas.append(shapeGroup);
                     var lineHeight_x2 = 2 * lineHeight,
                         box = shapeGroup.drawingElement.bbox(),
                         largestTextContainerHeight = box.size.height + lineHeight * (textLines.length - 1);

                     for (var j = textLines.length - 1, textEdge = largestTextContainerHeight; j >= 0; j--, textEdge -= lineHeight_x2) {
                         var textLine = textLines[j];

                         shapeGroup.append(textLine);
                         var containerRect = new kendo.dataviz.diagram.Rect(box.origin.x, box.origin.y, box.size.width, textEdge);

                         alignTextShape(containerRect, textLine);
                     }
                     diagramCanvas.remove(shapeGroup);
                 }

                 return shapeGroup;
             }

             function appendToGroupWithoutOffset(shape, group) {
                 shape.position(0, 0);
                 group.append(shape);
             }

             function alignTextShape(containerRect, textLine) {
                 var aligner = new kendo.dataviz.diagram.RectAlign(containerRect);
                 var contentBounds = textLine.drawingElement.bbox(null);

                 var contentRect = new kendo.dataviz.diagram.Rect(0, 0, contentBounds.width(), contentBounds.height());
                 var alignedBounds = aligner.align(contentRect, 'center middle');

                 textLine.position(alignedBounds.topLeft());
             }

             function createCustomMarker() {
                 return new kendo.dataviz.diagram.ArrowMarker({
                     path: 'M 0 0 L 8 4 L 0 8 L 2 4 z',
                     fill: '#6c6c6c',
                     stroke: {
                         color: '#6c6c6c',
                         width: 0.5
                     },
                     id: 'custom',
                     orientation: 'auto',
                     width: 10,
                     height: 10,
                     anchor: new kendo.dataviz.diagram.Point(7, 4)
                 });
             }

             function capAllConnections(connections) {
                 Array.forEach(connections, function (connection) {
                     var marker = createCustomMarker();

                     connection.path._markers.end = marker;
                     connection.path.drawingContainer().append(marker.drawingElement);
                     connection.path._redrawMarkers(true, connection.path.options);
                 });
             }
             function cleanUpShapesContent(shapes) {
                 Array.forEach(shapes, function (shape) {
                     if (!/Approved|Rejected|Adding Group Salary Range|Placing an Offer/.test(shape.content())) {
                         shape.visual.remove(shape._contentVisual);
                     }
                 });
             }

             function getDiagramCanvasOnPage() {
                 return $telerik.$('.k-diagram').getKendoDiagram().canvas;
             }

             global.pageLoad = pageLoad;
             global.diagram_load = diagram_load;
             global.visualizeShape = visualizeShape;
         })(window);
     </script>
</asp:Content>
