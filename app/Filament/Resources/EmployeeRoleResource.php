<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EmployeeRoleResource\Pages;
use App\Filament\Resources\EmployeeRoleResource\RelationManagers;
use App\Models\EmployeeRole;
use App\Models\Permission;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class EmployeeRoleResource extends Resource
{
    protected static ?string $model = EmployeeRole::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->label('Nombre')
                    ->required(),
                Forms\Components\Textarea::make('description')
                    ->label('Descripción')
                    ->nullable(),
                Forms\Components\Toggle::make('active')
                    ->label('Activo'),
                Forms\Components\Select::make('permission_id')
                    ->label('Permiso')
                    ->options(Permission::all()->pluck('name', 'id'))
                    ->searchable()
                    ->nullable()
                    ->helperText('Selecciona un permiso para este rol.'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->label('Nombre'),
                Tables\Columns\TextColumn::make('description')->label('Descripción'),
                Tables\Columns\IconColumn::make('active')
                    ->boolean()
                    ->trueIcon('heroicon-o-check-badge')
                    ->falseIcon('heroicon-o-x-mark')
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEmployeeRoles::route('/'),
            'create' => Pages\CreateEmployeeRole::route('/create'),
            'edit' => Pages\EditEmployeeRole::route('/{record}/edit'),
        ];
    }
}
