package web

import (
	"encoding/json"
	"net/http"

	"github.com/santosjordi/fc_challenge_clean_arch/internal/usecase"
)

type ListOrdersHandler struct {
	ListOrdersUseCase *usecase.ListOrdersUseCase
}

func NewListOrdersHandler(listOrdersUseCase *usecase.ListOrdersUseCase) *ListOrdersHandler {
	return &ListOrdersHandler{
		ListOrdersUseCase: listOrdersUseCase,
	}
}

func (h *ListOrdersHandler) ListOrders(w http.ResponseWriter, r *http.Request) {
	// We don't expect any payload or query params for now
	output, err := h.ListOrdersUseCase.Execute()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	err = json.NewEncoder(w).Encode(output)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
