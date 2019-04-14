'use strict';
let AWS = require('aws-sdk');
let docClient = new AWS.DynamoDB.DocumentClient();

module.exports.hello = async (event) => {
  return {
    statusCode: 200,
     headers: { 
                    'Access-Control-Allow-Origin': 'https://mcat-ee.github.io',
                    'Access-Control-Allow-Credentials': true, 
                },
    body: JSON.stringify({
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event,
    }),
  };

  // Use this code if you don't use the http event with the LAMBDA-PROXY integration
  // return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};


module.exports.getBoards = (event, context, callback) => {
	return  getBoards()
		.then(result => {
			 const response = {
                headers: { 
                       'Access-Control-Allow-Origin': 'https://mcat-ee.github.io',
                       'Access-Control-Allow-Credentials': true,
                    },
              statusCode: 200,
              body: JSON.stringify(result),
            };
            callback(null, response);
		})
}

function getBoards(cb) {
    return new Promise(function(resolve,reject) {
        const params = {
            TableName: process.env.DB_TABLE,
            Key: {
                uuid: "boards",
            },
            ReturnValues: 'ALL_OLD'
        };

        docClient.get(params, (error, result) => {
        	if(Object.keys(result).length == 0) {
        		//No boards doc found
        		const defaultBoardsObject = {
        			initialGeneration: true,
        			boards: [
        				{
        					boardTitle: "Click me",
        					cards: [
        						"Change the board title!"
        					]
        				},
        				{
        					boardTitle: "Done",
        					cards: [
        					]
        				}
        			]
        		}

        		//TODO: Save
        		resolve(defaultBoardsObject);
        		
        	}
            else if (error) {
                console.error(error);
                reject({msg:'Error!', code: 400});

                return;
            }
            resolve(result.Item);
        });
    });
};

