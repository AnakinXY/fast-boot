// Code generated by goctl. DO NOT EDIT.
package handler

import (
	"net/http"

	auth "fast-boot/app/api/admin/internal/handler/auth"
	omsorder "fast-boot/app/api/admin/internal/handler/oms/order"
	other "fast-boot/app/api/admin/internal/handler/other"
	pmsgoods "fast-boot/app/api/admin/internal/handler/pms/goods"
	pmsshop "fast-boot/app/api/admin/internal/handler/pms/shop"
	sysdept "fast-boot/app/api/admin/internal/handler/sys/dept"
	sysdict "fast-boot/app/api/admin/internal/handler/sys/dict"
	sysmenu "fast-boot/app/api/admin/internal/handler/sys/menu"
	sysrole "fast-boot/app/api/admin/internal/handler/sys/role"
	sysuser "fast-boot/app/api/admin/internal/handler/sys/user"
	umsuser "fast-boot/app/api/admin/internal/handler/ums/user"
	"fast-boot/app/api/admin/internal/svc"

	"github.com/zeromicro/go-zero/rest"
)

func RegisterHandlers(server *rest.Server, serverCtx *svc.ServiceContext) {
	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodPost,
				Path:    "/login",
				Handler: auth.LoginHandler(serverCtx),
			},
		},
		rest.WithPrefix("/auth"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/refreshToken",
				Handler: auth.RefreshTokenHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/me",
				Handler: auth.MeHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/logout",
				Handler: auth.LogoutHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/auth"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: sysuser.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: sysuser.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: sysuser.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: sysuser.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: sysuser.DelHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/changePwd",
				Handler: sysuser.ChangePwdHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/changeStatus",
				Handler: sysuser.ChangeStatusHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/sys/user"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/routes",
				Handler: sysmenu.RoutesHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: sysmenu.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: sysmenu.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: sysmenu.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/options",
				Handler: sysmenu.OptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: sysmenu.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: sysmenu.DelHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/sys/menu"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: sysrole.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: sysrole.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: sysrole.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/options",
				Handler: sysrole.OptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: sysrole.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: sysrole.DelHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/menuIds/:id",
				Handler: sysrole.MenuIdsHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/setMenuIds",
				Handler: sysrole.SetMenuIdsHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/changeStatus",
				Handler: sysrole.ChangeStatusHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/sys/role"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: sysdept.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: sysdept.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: sysdept.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/options",
				Handler: sysdept.OptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: sysdept.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: sysdept.DelHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/sys/dept"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/typeList",
				Handler: sysdict.TypeListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: sysdict.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/options",
				Handler: sysdict.OptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:typeCode/options",
				Handler: sysdict.TypeOptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: sysdict.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: sysdict.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: sysdict.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: sysdict.DelHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/type/add",
				Handler: sysdict.TypeAddHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/type/update",
				Handler: sysdict.TypeUpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/type/:id",
				Handler: sysdict.TypeGetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/type/del/:ids",
				Handler: sysdict.TypeDelHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/sys/dict"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: umsuser.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: umsuser.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: umsuser.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: umsuser.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: umsuser.DelHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/thirdList",
				Handler: umsuser.ThirdlistHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/user"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodPost,
				Path:    "/add",
				Handler: pmsshop.AddHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/update",
				Handler: pmsshop.UpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/options",
				Handler: pmsshop.OptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: pmsshop.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: pmsshop.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: pmsshop.DelHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/category/add",
				Handler: pmsshop.CategoryAddHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/category/update",
				Handler: pmsshop.CategoryUpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/category/options/:id",
				Handler: pmsshop.CategoryOptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/category/:id",
				Handler: pmsshop.CategoryGetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/category/list",
				Handler: pmsshop.CategoryListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/category/del/:ids",
				Handler: pmsshop.CategoryDelHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/category/attribute/add",
				Handler: pmsshop.CategoryAttributeAddHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/category/attribute/list",
				Handler: pmsshop.CategoryAttributeListHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/brand/add",
				Handler: pmsshop.BrandAddHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/brand/update",
				Handler: pmsshop.BrandUpdateHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/brand/options/:id",
				Handler: pmsshop.BrandOptionsHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/brand/:id",
				Handler: pmsshop.BrandGetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/brand/list",
				Handler: pmsshop.BrandListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/brand/del/:ids",
				Handler: pmsshop.BrandDelHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/shop"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: pmsgoods.GetHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: pmsgoods.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodPost,
				Path:    "/edit",
				Handler: pmsgoods.EditHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/del/:ids",
				Handler: pmsgoods.DelHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/goods"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodGet,
				Path:    "/list",
				Handler: omsorder.ListHandler(serverCtx),
			},
			{
				Method:  http.MethodGet,
				Path:    "/:id",
				Handler: omsorder.GetHandler(serverCtx),
			},
		},
		rest.WithJwt(serverCtx.Config.Auth.AccessSecret),
		rest.WithPrefix("/order"),
	)

	server.AddRoutes(
		[]rest.Route{
			{
				Method:  http.MethodPost,
				Path:    "/upload",
				Handler: other.FileUploadHandler(serverCtx),
			},
		},
		rest.WithPrefix("/other"),
	)
}
