# import the logging library
import logging

# Get an instance of a logger
logger = logging.getLogger(__name__)

class CorsMiddleware(object):
    
    def __init__(self, get_response):
        self.get_response = get_response
        
    def __call__(self, request):
        logger.debug('getting request from path=%s', request.get_full_path())
        
        response = self.get_response(request)
        
        response['Access-Control-Allow-Origin']='*'
        response['Access-Control-Allow-Headers'] = 'Content-Type, X-Requested-With, accept, origin, authorization, x-csrftoken'
        response['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
        return response
        
        