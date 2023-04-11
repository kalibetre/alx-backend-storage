#!/usr/bin/env python3
""" 101-students module """


def top_students(mongo_collection):
    """
    returns all students sorted by average score
    """
    return mongo_collection.aggregate([{
        "$unwind": "$topics"
    }, {
        "$group": {
            "_id": {
                "_id": "$_id",
                "name": "$name"
            },
            "averageScore": {
                "$avg": "$topics.score"
            }
        }
    }, {
        "$project": {
            "_id": "$_id._id",
            "name": "$_id.name",
            "averageScore": "$averageScore"
        }
    }, {
        '$sort': {
            "averageScore": -1
        }
    }])
