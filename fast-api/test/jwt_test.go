package test

import (
	"fast-boot/common/ghelp"
	"fast-boot/common/jwtx"
	"fmt"
	"testing"
)

func Test_Jwt_Parse(t *testing.T) {
	signingKey := "ad879037-c7a4-4063-9236-6bfc35d54b7d"
	tokenString := "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTkxODc3MTUsImlhdCI6MTY5OTEwMTMxNSwiand0VXNlcklkIjoxfQ.HF3NikInPM_12lD4mMaIX8jTAgHUp8S75GtJ9umstAA"

	fmt.Println("uid", jwtx.GetUidByToken(signingKey, tokenString))

}

func Test_Arr(t *testing.T) {
	arr := []int{1, 2, 4, 3, 5, 5}
	brr := []int{6, 7, 8, 4, 5}
	m := ghelp.ArrayIntersection(arr, brr)
	fmt.Println(m)

}
