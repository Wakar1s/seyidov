class NewsItem {
    private _id: number;
    private _alias: string;
    private _title: string;
    private _anonce: string;
    private _description: string;
    private _image: string | null;
    private _public_at: Date;

    constructor(
        id: number,
        alias: string,
        title: string,
        anonce: string,
        description: string,
        public_at: Date,
        image: string | null = null
    ) {
        this._id = id;
        this._alias = alias;
        this._title = title;
        this._anonce = anonce;
        this._description = description;
        this._public_at = public_at;
        this._image = image;
    }

    get id(): number {
        return this._id;
    }

    get alias(): string {
        return this._alias;
    }
    
    get title(): string {
        return this._title;
    }

    get description(): string {
        return this._description;
    }

    get image(): string | null {
        return this._image;
    }

    get anonce(): string {
        return this._anonce;
    }

    get public_at(): Date {
        return this._public_at;
    }
}

export default NewsItem;