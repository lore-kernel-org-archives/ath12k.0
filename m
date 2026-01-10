Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7DCD277DB
	for <ath12k@archiver.kernel.org>; Sat, 10 Jan 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/ghqoyCFvaXAF6G/PKfR+AZHXiZ6tsiRcHJoOAnAaU=; b=vXG1qvJng39tzXHRrrsg3JQggL
	3dGMyBIRUOxFLAfPMYkGn7sJi5qxhUknaQpLk/p+1Psm9X9/6cb0GkynrEPlaJPB1j6FQKPDtelHA
	YD77MfUyDeyYPe5p9CwoAVgvXuUkQz0e9sl9bAvw4/1fDaxUDrySBgVhB6rKZAySH4DJKuL0L6MfB
	oqcyCQQQdcPMQuJdY19bVBNujMqlGJ3GjHAkXeRhcIWHvLQzI8tqtdeSUnxISIr9PwH+I+E7iPgDP
	V6djmyzwKFAbthOqcSBs1eGQJHWgE3m0XPrp1jxe50Sr73hQ8xAOuPQ/oVWJveRepzbJxuzBA/EI5
	B82inanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veX0T-00000003Q6y-0yGm;
	Sat, 10 Jan 2026 11:19:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veX0Q-00000003Q6c-2dIZ
	for ath12k@lists.infradead.org;
	Sat, 10 Jan 2026 11:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768043983; x=1799579983;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Fo+c18Xe2tfWUtdNEYdFNt+2/i05dN2dynXzKW1h+gk=;
  b=aFkV58iR4mGOH0h1Gol603VgTmiQMTCV1dO9Hr1hI2ip+FbZzfh+44Oc
   EYQcgxdA3xVpwLFEnKVvZoDsN5hctIIT6tdhBCf8wNUcNjAtr4ZO9HOx8
   32dfCE7Mxr07382hAClMHIKBVez5+1mJ6WZTwY6EUVkaKf4essj9fauoG
   84LFcwHC4TH6z8Wccj3BO8GCGDRc0exQWJ8LhB59Gi4YNtyatj3vMKYHx
   KFlkXoxSWc3E6Y5NOSg2dYGM9U/Ulg0dDdKqggBoXejanT4ZsGtDe2XtI
   uRXhDQgoqw2nzgzii3654qZTzMfsRyB49E25w0hCVswPHWkRRq3WUTAbA
   w==;
X-CSE-ConnectionGUID: iIoEfBJUT+mHJoWKY6XrZw==
X-CSE-MsgGUID: iI2QqndxRImovoDsD7Px4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69558907"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69558907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 03:19:42 -0800
X-CSE-ConnectionGUID: SN3I9PJbST+nPQa1VKqNxw==
X-CSE-MsgGUID: rbP7RPyoSeSgZrQrabMSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="234890814"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 03:19:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 10 Jan 2026 13:19:31 +0200 (EET)
To: =?ISO-8859-15?Q?J=E9r=F4me_de_Bretagne?= <jerome.debretagne@gmail.com>
cc: Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    Lorenzo Bianconi <lorenzo@kernel.org>, 
    Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
    Dale Whinham <daleyo@gmail.com>, 
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] platform/surface: aggregator_registry: Add Surface
 Pro 11 (QCOM)
In-Reply-To: <20251220-surface-sp11-for-next-v6-3-81f7451edb77@gmail.com>
Message-ID: <17f18028-730f-9e9f-7df5-8b792fe6c9c5@linux.intel.com>
References: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com> <20251220-surface-sp11-for-next-v6-3-81f7451edb77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-495146878-1768043971=:1002"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_031942_744651_AE3AE32B 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-495146878-1768043971=:1002
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 20 Dec 2025, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:

> From: Dale Whinham <daleyo@gmail.com>
>=20
> This enables support for the Qualcomm-based Surface Pro 11.
>=20
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/dri=
vers/platform/surface/surface_aggregator_registry.c
> index 78ac3a8fbb736384f7e50f1888a71297a892a7c3..0599d5adf02e61583cf3e1fc1=
1000070f51f7be3 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group_s=
p9_5g[] =3D {
>  =09NULL,
>  };
> =20
> +/* Devices for Surface Pro 11 (ARM/QCOM) */
> +static const struct software_node *ssam_node_group_sp11[] =3D {
> +=09&ssam_node_root,
> +=09&ssam_node_hub_kip,
> +=09&ssam_node_bat_ac,
> +=09&ssam_node_bat_main,
> +=09&ssam_node_tmp_sensors,
> +=09&ssam_node_hid_kip_keyboard,
> +=09&ssam_node_hid_kip_penstash,
> +=09&ssam_node_hid_kip_touchpad,
> +=09&ssam_node_hid_kip_fwupd,
> +=09&ssam_node_hid_sam_sensors,
> +=09&ssam_node_kip_tablet_switch,
> +=09NULL,
> +};
> +
>  /* -- SSAM platform/meta-hub driver. -----------------------------------=
----- */
> =20
>  static const struct acpi_device_id ssam_platform_hub_acpi_match[] =3D {
> @@ -482,6 +498,8 @@ MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_matc=
h);
>  static const struct of_device_id ssam_platform_hub_of_match[] __maybe_un=
used =3D {
>  =09/* Surface Pro 9 5G (ARM/QCOM) */
>  =09{ .compatible =3D "microsoft,arcata", (void *)ssam_node_group_sp9_5g =
},
> +=09/* Surface Pro 11 (ARM/QCOM) */
> +=09{ .compatible =3D "microsoft,denali", (void *)ssam_node_group_sp11 },
>  =09/* Surface Laptop 7 */
>  =09{ .compatible =3D "microsoft,romulus13", (void *)ssam_node_group_sl7 =
},
>  =09{ .compatible =3D "microsoft,romulus15", (void *)ssam_node_group_sl7 =
},

Applied PATCH 3/4 to the review-ilpo-next branch.

--=20
 i.

--8323328-495146878-1768043971=:1002--

