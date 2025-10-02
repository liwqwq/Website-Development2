const express = require('express');
const cors = require('cors');
const db = require('./event_db.js');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static('public'));

// Get all active upcoming events (Homepage)
app.get('/api/events', (req, res) => {
    const currentDate = new Date().toISOString().split('T')[0];
    
    const query = `
        SELECT e.*, c.category_name, o.organization_name 
        FROM events e 
        LEFT JOIN categories c ON e.category_id = c.category_id 
        LEFT JOIN organizations o ON e.organization_id = o.organization_id 
        WHERE e.event_datetime >= ? AND e.is_active = TRUE 
        ORDER BY e.event_datetime ASC
    `;
    
    db.query(query, [currentDate], (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json(results);
    });
});

// Get all categories (Search page)
app.get('/api/categories', (req, res) => {
    const query = 'SELECT * FROM categories ORDER BY category_name';
    
    db.query(query, (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json(results);
    });
});

// Search events (Search page)
app.get('/api/events/search', (req, res) => {
    const { date, location, category } = req.query;
    let query = `
        SELECT e.*, c.category_name, o.organization_name 
        FROM events e 
        LEFT JOIN categories c ON e.category_id = c.category_id 
        LEFT JOIN organizations o ON e.organization_id = o.organization_id 
        WHERE e.is_active = TRUE
    `;
    
    const params = [];
    
    if (date) {
        query += ' AND DATE(e.event_datetime) = ?';
        params.push(date);
    }
    
    if (location) {
        query += ' AND e.location LIKE ?';
        params.push(`%${location}%`);
    }
    
    if (category) {
        query += ' AND e.category_id = ?';
        params.push(category);
    }
    
    query += ' ORDER BY e.event_datetime ASC';
    
    db.query(query, params, (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json(results);
    });
});

// Get specific event details (Details page)
app.get('/api/events/:id', (req, res) => {
    const eventId = req.params.id;
    
    const query = `
        SELECT e.*, c.category_name, o.organization_name, 
               o.description as organization_description, o.contact_details 
        FROM events e 
        LEFT JOIN categories c ON e.category_id = c.category_id 
        LEFT JOIN organizations o ON e.organization_id = o.organization_id 
        WHERE e.event_id = ?
    `;
    
    db.query(query, [eventId], (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        
        if (results.length === 0) {
            return res.status(404).json({ error: 'Event not found' });
        }
        
        res.json(results[0]);
    });
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});