import { chain, externalSchematic, Rule } from '@angular-devkit/schematics';

interface Schema {
  name: string;
  directory: string;
}

function getProjectName(schema: Schema): string {
  return `${schema.directory}-state-${schema.name}`;
}

function getModulePath(schema: Schema): string {
  return `libs/${schema.directory}/state-${schema.name}/src/lib/${getProjectName(schema)}.module.ts`;
}

export default function (schema: Schema): Rule {
  const scopeTag = `scope:${schema.directory}`;
  const projectName = getProjectName(schema);
  const modulePath = getModulePath(schema);
  return chain([
    externalSchematic('@nrwl/angular', 'lib', {
      name: `state-${schema.name}`,
      style: 'scss',
      directory: schema.directory,
      tags: ['type:state', scopeTag].join(','),
    }),
    externalSchematic('@nrwl/angular', 'ngrx', {
      project: projectName,
      name: schema.name,
      module: modulePath,
      minimal: true,
      directory: '+state',
      facade: true,
      root: false,
    }),
  ]);
}
