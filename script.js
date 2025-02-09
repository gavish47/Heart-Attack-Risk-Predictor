document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("predictionForm").addEventListener("submit", async function(event) {
        event.preventDefault();

        // Collect input values
        const age = document.getElementById("age").value;
        const chestPain = document.getElementById("chest_pain").value;
        const smoking = document.getElementById("smoking").value;
        const drinking = document.getElementById("drinking").value;
        const stress = document.getElementById("stress").value;

        // Prepare data
        const requestData = {
            age: parseInt(age),
            chest_pain: parseInt(chestPain),
            smoking: parseInt(smoking),
            drinking: parseInt(drinking),
            stress: parseInt(stress)
        };

        try {
            const response = await fetch(" https://c34f-2409-40d1-101b-7d43-c176-259c-1daf-ba54.ngrok-free.app", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(requestData)
            });

            const data = await response.json();
            
            if (data.prediction !== undefined) {
                // Convert numeric prediction to readable text
                let riskLevel = data.prediction == 1 ? "High Risk" : "Low Risk";
                document.getElementById("resultText").textContent = `Risk Level: ${riskLevel}`;
            } else {
                document.getElementById("resultText").textContent = "Error: Invalid response from server";
            }
        } catch (error) {
            document.getElementById("resultText").textContent = "Error: Failed to fetch prediction";
        }
    });
});
