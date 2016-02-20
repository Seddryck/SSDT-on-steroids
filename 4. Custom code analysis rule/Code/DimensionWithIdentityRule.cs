using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Dac.CodeAnalysis;
using Microsoft.SqlServer.Dac.Model;
using Microsoft.SqlServer.TransactSql.ScriptDom;

namespace CustomCodeAnalysisRule
{
    [ExportCodeAnalysisRuleAttribute("SR7001"
            , "Dimension table must have an identity attribute."
            , Category="SqlSaturday.Rules.Design"
            , RuleScope=SqlRuleScope.Element)]
    public class DimensionWithIdentityRule : SqlCodeAnalysisRule
    {
        public DimensionWithIdentityRule()
        {
            SupportedElementTypes = new[] { Table.TypeClass };
        }

        public override IList<SqlRuleProblem> Analyze(SqlRuleExecutionContext ruleExecutionContext)
        {
            var problems = new List<SqlRuleProblem>();

            var tableElement = ruleExecutionContext.ModelElement;
            var tableName = GetElementName(ruleExecutionContext, tableElement);

            //Ensure that it's effectively a dimension table
            if (tableElement.Name.HasName && tableElement.Name.Parts.Last().StartsWith("Dim", StringComparison.OrdinalIgnoreCase))
            {
                //Get the columns of the table
                var columns = tableElement.GetReferenced(Table.Columns);
                if (columns.Count() == 0)
                    problems.Add(new SqlRuleProblem(string.Format("The dimension table {0} has no column", tableName), tableElement));

                //Ensure that one of them is effecively an identity
                var identityColumn = columns.FirstOrDefault(c => c.GetProperty<bool>(Column.IsIdentity));
                if (identityColumn == null)
                    problems.Add(new SqlRuleProblem(string.Format("No identity column for the dimension table {0}", tableName), tableElement));
            }

            return problems;
            
        }

        private static string GetElementName(SqlRuleExecutionContext ruleExecutionContext, TSqlObject modelElement)
        {
            // Get the element name using the built in DisplayServices. This provides a number of 
            // useful formatting options to
            // make a name user-readable
            var displayServices = ruleExecutionContext.SchemaModel.DisplayServices;
            string elementName = displayServices.GetElementName(modelElement, ElementNameStyle.EscapedFullyQualifiedName);
            return elementName;
        }
    }
}
