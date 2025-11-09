import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Types } from 'mongoose';

export type OrderDocument = Order & Document;

@Schema({ timestamps: true })
export class Order {
  @Prop({ type: Types.ObjectId, ref: 'User', required: true })
  userId: Types.ObjectId;

  @Prop({
    type: [{
      productId: { type: Types.ObjectId, ref: 'Product' },
      quantity: Number,
      price: Number,
    }],
    required: true,
  })
  items: Array<{
    productId: Types.ObjectId;
    quantity: number;
    price: number;
  }>;

  @Prop({ required: true })
  totalAmount: number;

  @Prop({ default: 'pending' })
  status: string; // pending, processing, completed, cancelled

  @Prop()
  shippingAddress: string;

  @Prop()
  paymentMethod: string;
}

export const OrderSchema = SchemaFactory.createForClass(Order);
