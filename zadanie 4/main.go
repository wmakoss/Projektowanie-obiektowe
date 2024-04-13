package main

import (
	"encoding/json"
	"fmt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"net/http"
)

type avgPrice struct {
	Mins      int    `json:"mins"`
	Price     string `json:"price"`
	CloseTime int64  `json:"closeTime"`
}

func main() {

	e := echo.New()

	e.Static("/", "./static")

	//Example endpoint
	//e.GET("/", func(c echo.Context) error {
	//	return c.String(http.StatusOK, "Hello, World!")
	//})

	e.Use(middleware.CORS())

	e.GET("/price/:symbol", func(c echo.Context) error {
		symbol := c.Param("symbol")

		resp, err := http.Get(fmt.Sprintf("https://api.binance.com/api/v3/avgPrice?symbol=%s", symbol))
		//resp, err := http.Get("https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT")
		if err != nil {
			return err
		}
		defer resp.Body.Close()

		//fmt.Println(resp.Body)

		var avgprice avgPrice
		if err := json.NewDecoder(resp.Body).Decode(&avgprice); err != nil {
			fmt.Println(err)
			return err
		}

		//fmt.Println(avgprice)

		return c.JSON(http.StatusOK, avgprice)
	})

	e.Logger.Fatal(e.Start(":1323"))
}
