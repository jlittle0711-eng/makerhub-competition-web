async function loadLiveEntries() {
    const snapshot = await db.collection("entries")
        .where("status", "==", "live")
        .get();

    const items = [];

    snapshot.forEach(doc => {
        items.push({ id: doc.id, ...doc.data() });
    });

    return items;
}