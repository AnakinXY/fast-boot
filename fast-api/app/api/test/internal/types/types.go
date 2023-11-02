// Code generated by goctl. DO NOT EDIT.
package types

type RegRequest struct {
	UserName string `json:"username"`
	Password string `json:"password"`
	Mobile   string `json:"mobile"`
	Age      int64  `json:"age" validate:"gte=1,lte=130"`
}

type LoginRequest struct {
	UserName string `json:"username"`
	Password string `json:"password"`
}

type TokenResponse struct {
	Token string `json:"token"`
}

type UserInfoResponse struct {
	Id        int64  `json:"uid"`
	NickName  string `json:"nickname"`  //昵称
	AvatarURL string `json:"avatarUrl"` //头像地址
}