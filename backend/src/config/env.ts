import dotenv from 'dotenv';

dotenv.config();

export interface EnvConfig {
  PORT: number;
  MPESA_CONSUMER_KEY: string;
  MONGO_URI: string;
  OPENAI_API_KEY: string;
}

const required = ['PORT', 'MPESA_CONSUMER_KEY', 'MONGO_URI', 'OPENAI_API_KEY'] as const;

const env: EnvConfig = {
  PORT: parseInt(process.env.PORT || '', 10),
  MPESA_CONSUMER_KEY: process.env.MPESA_CONSUMER_KEY || '',
  MONGO_URI: process.env.MONGO_URI || '',
  OPENAI_API_KEY: process.env.OPENAI_API_KEY || '',
};

for (const key of required) {
  const value = env[key as keyof EnvConfig];
  if (!value && value !== 0) {
    throw new Error(`Missing environment variable ${key}`);
  }
}

export default env;
