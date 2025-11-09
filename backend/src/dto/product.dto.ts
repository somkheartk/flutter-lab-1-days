import { IsString, IsNumber, IsOptional, Min } from 'class-validator';

export class CreateProductDto {
  @IsString()
  title: string;

  @IsNumber()
  @Min(0)
  price: number;

  @IsString()
  description: string;

  @IsString()
  category: string;

  @IsString()
  image: string;

  @IsOptional()
  rating?: {
    rate: number;
    count: number;
  };
}

export class UpdateProductDto {
  @IsOptional()
  @IsString()
  title?: string;

  @IsOptional()
  @IsNumber()
  @Min(0)
  price?: number;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsString()
  category?: string;

  @IsOptional()
  @IsString()
  image?: string;

  @IsOptional()
  rating?: {
    rate: number;
    count: number;
  };
}
