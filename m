Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB42CD5BD0
	for <ath12k@archiver.kernel.org>; Wed, 27 May 2026 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCF93p0pPbudh0wfYlc1I9a7H3qyspnUPz7c6ldVCIo=; b=0K5MnlcALNDMBtur609mKF2la8
	S/9z5Z2dI5/XKfpc910x/KWugH0IGDPiAVlPywROI8nh2M7NhePO70nDFE+wGgA+hsdfD8vv6dCWM
	OiUiJYeRGwSmlpPMXTwjNgZJ0PyW92XwLcL0Bj1A1NLSof/HIofr3371k6V311R4cC5mYh1vLYcF9
	WSMyEfnsYX0ftJA/mT5jzL1PSFL2u+QuJX70m1/m0wo+zfbxcVHOwk2qMI12qR87aIT0VMLTKQteq
	ULfhQSOUm4CPX4PTb+/7BJkXoff8NBmVSY5D7QdpKq0+iI9e0CWyOOOkEyir/rw9BEr6/k8alPstz
	g874E/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGsL-00000004TmH-2rhV;
	Wed, 27 May 2026 16:12:57 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGsJ-00000004Tlc-2OZk
	for ath12k@lists.infradead.org;
	Wed, 27 May 2026 16:12:56 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-914bfa75911so581352285a.1
        for <ath12k@lists.infradead.org>; Wed, 27 May 2026 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779898374; x=1780503174; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCF93p0pPbudh0wfYlc1I9a7H3qyspnUPz7c6ldVCIo=;
        b=J8lhgKRFQMSbBUoVxgVsY5bM809HSHWJ0y9IzHwlNUrz45ASRh61vsqMZKQ8lbhs9O
         VVB84E1F+Jx/Qp+dzbBSva0kcNSdX4juzD7yJfYQj2qTR+i4Mf8N/N+gXvbPwytxgHdD
         J8NF9k+TM/UcXBrblqyetHbKZRqeHLOVv4Y2LiUpoczL+k566qVDrAbqDaBzirYktO3A
         vXZ/Au7z25H4KNruWIgpdlsyp87IAWEjzIdP9DYgJnxL66NnCKzv5Ijd3YuV7H+3ejgD
         PHt/DSv1O/CRI7Fd1iGSroeHz0VhFRF5n24YCe3ZKyIym/wf6Y2zIAPuXJwkQndpnZb9
         9h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898374; x=1780503174;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCF93p0pPbudh0wfYlc1I9a7H3qyspnUPz7c6ldVCIo=;
        b=UDg3b4seKpp9uyPONLxEnZ2ZvmS63C5wG8DEWdKCg4/9CbuDmF1CpfaFCGy80r06/G
         zqnZNyWA1Mt0PJGdvSQYUXj+qY7+1h7j2dpNlRj+Yfnz9phcTA98zYyzU0HpI1XJjnHK
         JzOPWzri730PsdwijdNgCD0UaqXcxfLDGwUBsOHHCUy4d10qE/7uTHLA96SzJ1k6D8Ka
         DucdaM2q2Y3G2WHvfnJUjWtC4jw5HSRBWfsDD+WXJmOYDtbeHXL0HkImScbjyMDmLaFw
         xDSc3CialN5w4Qhqo01oc2jPv50Um5MPRAL0gl+tRu1RETpLDSASJ3iNy3iSp1U8H26L
         Jmcg==
X-Forwarded-Encrypted: i=1; AFNElJ/cjU0t+fFXnColmcXOAHbu0CDAPd7ZPBPxoo1OeMw03CRdZuGPQRIHtu94uWUY8j/v8tC2V6U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Yf4e+E724rkmd5vDaE9StITuqA+AQ4VFv2bfJ41I4+ctGrLf
	0ZoK00wMqwTTeJjVMHmSKfiaRcd0dhyeCxiRLU50MKUfpBZi/FpZtFeV
X-Gm-Gg: Acq92OGS+kbe8NSwJr2w0qDFXWZGGHPl/o3T/Ye7C3T0SspHtvUibb39mZi7cdywXyp
	4E8w6zqvTXg79eaZMlg3eK/63duVrEo2+bNmL4w0E9zft1QyTxtmv7DVRVqmqWkun+ImNuB71qi
	jgjF9w7s0u/pw2/ea4ASIH0g18Ipb7ggUxGWNyhwaM2zEd1QHujV1QREKt6Ns1dyM4Q/lZiGf6K
	JWV4QaZvuCGxKokFlKQDRYpkbwEQo513sRWKYQNwjrbKnTg8yWJqZnWjhKT6vDw2q+UMQj71oHp
	C55JvyGQAJRkt20m4wHMFP5sfkafTj0KKcTHTQ6D/5/PZbsGyWdpzkYWV9Sda79AbQcypXG7cIi
	RquyKdqiTn4BrsyYqg33+E+ohaZ5nNaPPzu/CldpaPi7k4eJif5WqB/SIKHsJr204Hd1499QPiA
	SeZ5PD4I3qfpG2GOLkcrSybpvZsWzFzgwJuERIy5UOLgNCm/vHv13eM2nyeNpp9Cnzxy5SQdM5M
	pkMnbqVqUkNw4Dpb3B6jLgkWVVBwunKZQPeHImQKDQQBJ+PuVgZ5HVw/dkFpw==
X-Received: by 2002:a05:620a:454b:b0:911:fba0:6d02 with SMTP id af79cd13be357-914b510b65dmr2927962085a.22.1779898373714;
        Wed, 27 May 2026 09:12:53 -0700 (PDT)
Received: from smtpclient.apple ([2601:19b:4200:392f:e976:246b:e928:1bf7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87d26basm515826085a.24.2026.05.27.09.12.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2026 09:12:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 1/1] wifi: ath12k: support calibration-variant from device
 tree
From: Andrew LaMarche <andrewjlamarche@gmail.com>
In-Reply-To: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
Date: Wed, 27 May 2026 12:12:41 -0400
Cc: linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
References: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091255_622872_334AFF68 
X-CRM114-Status: GOOD (  26.68  )
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

Hi,

A kind ping here. I=E2=80=99m not sure why this functionality is missing =
in the first place, but it is needed for loading caldata from the device =
tree.

Cheers,
Andrew

> On Jan 30, 2026, at 7:32=E2=80=AFPM, Andrew LaMarche =
<andrewjlamarche@gmail.com> wrote:
>=20
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The =
ath12k-wsi
> binding already describes using qcom,calibration-variant and
> qcom,ath12k-calibration-variant, but it is not implemented in the =
code.
>=20
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may =
not
> come up or will not be calibrated correctly.
>=20
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant node or ath12k-specific
> qcom,ath12k-calibration-variant node. This allows the driver to =
properly
> select, read and apply the correct BDF.
>=20
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
> ---
> drivers/net/wireless/ath/ath12k/core.c | 25 +++++++++++++++++++++++++
> drivers/net/wireless/ath/ath12k/core.h |  2 +-
> drivers/net/wireless/ath/ath12k/qmi.c  |  4 ++++
> 3 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/ath/ath12k/core.c =
b/drivers/net/wireless/ath/ath12k/core.c
> index cc352eef1939..e45f76d81337 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -806,6 +806,31 @@ int ath12k_core_check_smbios(struct ath12k_base =
*ab)
> 	return 0;
> }
>=20
> +int ath12k_core_check_dt(struct ath12k_base *ab)
> +{
> +	size_t max_len =3D sizeof(ab->qmi.target.bdf_ext);
> +	const char *variant =3D NULL;
> +	struct device_node *node;
> +
> +	node =3D ab->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,calibration-variant",
> +			&variant);
> +	if (!variant)
> +		of_property_read_string(node, =
"qcom,ath12k-calibration-variant",
> +				&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
> +				"bdf variant string is longer than the =
buffer can accommodate (variant: %s)\n", variant);
> +
> +	return 0;
> +}
> +
> static int ath12k_core_soc_create(struct ath12k_base *ab)
> {
> 	int ret;
> diff --git a/drivers/net/wireless/ath/ath12k/core.h =
b/drivers/net/wireless/ath/ath12k/core.h
> index 3c1e0069be1e..39700a780ee2 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1352,7 +1352,7 @@ int ath12k_core_fetch_bdf(struct ath12k_base =
*ath12k,
> 			  struct ath12k_board_data *bd);
> void ath12k_core_free_bdf(struct ath12k_base *ab, struct =
ath12k_board_data *bd);
> int ath12k_core_fetch_regdb(struct ath12k_base *ab, struct =
ath12k_board_data *bd);
> -int ath12k_core_check_dt(struct ath12k_base *ath12k);
> +int ath12k_core_check_dt(struct ath12k_base *ab);
> int ath12k_core_check_smbios(struct ath12k_base *ab);
> void ath12k_core_halt(struct ath12k *ar);
> int ath12k_core_resume_early(struct ath12k_base *ab);
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c =
b/drivers/net/wireless/ath/ath12k/qmi.c
> index b7c48b6706df..22ef5aab871f 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -2903,6 +2903,10 @@ int ath12k_qmi_request_target_cap(struct =
ath12k_base *ab)
> 	if (r)
> 		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name =
not set.\n");
>=20
> +	r =3D ath12k_core_check_dt(ab);
> +	if (r)
> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not =
set.\n");
> +
> 	r =3D ath12k_acpi_start(ab);
> 	if (r)
> 		/* ACPI is optional so continue in case of an error */
> --=20
> 2.43.0
>=20


