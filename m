Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3BFC5DF66
	for <ath12k@archiver.kernel.org>; Mon, 17 Aug 2026 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goe6aOcHRvgSEXBfM1lwHOaQCDFBo3a8JMtjcthvdTE=; b=aDicwILoBQO5Sem9LYgvemg4Iy
	rP2CVKDIeROKRpx1bctaBNAAyNwd5RpCTDRNdqQL6oxLf+a1t5cb9pk0dY1SPecRsnnoUqJvVjkRJ
	VrkEF5lcvXxna6wWjZG8E2P8FC6kp8uqonTgZkSJsHNmiPwdOmeQqZtDS8SD2AlsqGTwgh7b5vcXP
	ZN72Sh8EzVFVoW8URvBSXs91jH/bsNCJuTTlkLQxgG6UiiyzFqg7wy3gEqcPsrI0hjNQIVIGppTA5
	xk8lFwh1au4nFkXjGC9g3yuLU+fvsFXn2d8SL5YcECVp02W1guLG2/3fF/XjnByxH8DcAL36U7qNk
	O4jZFNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvytG-00000006MWI-0zh0;
	Mon, 17 Aug 2026 15:04:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvytE-00000006MVX-0Lqm
	for ath12k@lists.infradead.org;
	Mon, 17 Aug 2026 15:04:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so28454125e9.1
        for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786979078; x=1787583878; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=goe6aOcHRvgSEXBfM1lwHOaQCDFBo3a8JMtjcthvdTE=;
        b=tF9mvUO5QbooM/bnjv4YDBWldw/zgbxz7EUTQyUwbXEO5J2R6ob8JdTpWJ27lriK1n
         TLDOqnt+O7IXLv/kNLdtqIk6wjMd82oqWGhpUvcQnBKpw1gjbyxQpJgd/VI/LnWVYkHS
         9r4zRjxP4wHBd96A+ixTbiRUxV5xSVrUFGNB9qSBbyB9QfOBItp0LeDCnicXIpuGVrIQ
         +UCI0qig88idN6E0MMzuuCJXg6nEu36mAgsgmTReXvIZLesoz9r0QYPB9/YnTItsLe6E
         bLNfHM+aVMSbah50JpDYFesixw0K8VGNLw52hs6azDs6TaL0ARESOnnEe32EvzJ06E/V
         Jozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979078; x=1787583878;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goe6aOcHRvgSEXBfM1lwHOaQCDFBo3a8JMtjcthvdTE=;
        b=c3HJmhBFpJdu2xrRKVH/DYDTxB14YkWF2BkZIggqYs/8KGYtlwQaANVL0kJgh+T78E
         iCWdFlbDCBIPWhPG6X8p+NEJLJAWTe+Tx+xIdjfDn3rv2+7HMhVcM0TOvgqL3xn9ddlx
         mDuXEiG3CcLsMnY4IdLcUjNG91UX6leZw7cxaZHor7od8HXl6DIrwQuw9RNUi8gExgb/
         rXVaPH1oplOShckoUarp7mrhYbkwBS1DWxwTeoMUc/d6Vhz5ZmxP6wurc5zaf3mcz83j
         GaVVUh9yegUM6iimg07NLpG3Fxg+VhbCRIqurNDg/SGfK88umjgq3Dvb97HB4M/NK7ts
         Xwog==
X-Gm-Message-State: AOJu0Yxwucg3mQbrBHOaAF6TRgPnCJUbf7yj0oYRNc3ceuNvwMvFYBHI
	EJcJuFDr+uoxKjNVzl/ikpnrvhoE3jcU4w/KKWTsMg2cV1GGCMeCD9JQ
X-Gm-Gg: AR+sD13L4+zlH/zZITr8TBO9csHvhd/O+XvqWymDjHiskfZb6rDqWr2j7N5qvzwJ6bE
	LiQQmrajx7oA1bX36h5MgcbnwTDnJhF5WOEBROrY/iNZIBGsu3Hrnwwb2LeSQYryPTs1oZVp/UM
	fjMZ4f1xExc5FVv1oahlcGSf8iesFKGj3cxxXqN+41U7Nm0zPYrxD695+3dyrwZhZtMhsCg75rW
	SxPSJGpV+7meYyUcT5MrZ6qAaHi0wTMDhcliJG3SO3FmFiKEznvucPRbQlWQEX7Xv3SfwDXPtWq
	wz/a6wXzFs2Uf/cvT5wm/EzXMDqVE7OIaKqkWyy7kThostq7NLJLdMtnlAMKnpkF1vUJFNmGu+6
	LtF+13jsphYPk/c5ErUy7C0NEy9hxQ/9CioWeP7ker0izZBKSnFRw4hY0RKL+WygCotwVIRyBiJ
	4VIRCbgsNbES/y2PyexnWb8k7xdxw02J61HvgOuCED0Z8GNuGDYrlFVvLkPbiwzkCKGe33zQSou
	/YL1tqd8fxztv71BIDIe3Nxj5Mw
X-Received: by 2002:a05:600c:a4d:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-49987981e52mr422766515e9.19.1786979077455;
        Mon, 17 Aug 2026 08:04:37 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:d76f:1095:5248:4cb1? ([2001:8a0:c4c6:f00:d76f:1095:5248:4cb1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d10be27sm60932455e9.14.2026.08.17.08.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:04:36 -0700 (PDT)
Message-ID: <c7609911037798c2026636ddd13208cdf000cc55.camel@gmail.com>
Subject: Re: ath12k: recommended regulatory country source for embedded AP
 products?
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, Wen Gong <quic_wgong@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo
	 <kvalo@kernel.org>, vdosreis@qti.qualcomm.com, lucia@qti.qualcomm.com, 
	dbenitez@qti.qualcomm.com, jeff.johnson@oss.qualcomm.com, 
	bqiang@qti.qualcomm.com, wgan@qti.qualcomm.com
Date: Mon, 17 Aug 2026 16:04:35 +0100
In-Reply-To: <3ac168e7dfe22133daf09adc3f6587098ec85619.camel@gmail.com>
References: <3ac168e7dfe22133daf09adc3f6587098ec85619.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_080440_141909_F57DEBC1 
X-CRM114-Status: GOOD (  17.78  )
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



Hello,

Adding a few Qualcomm contacts in Cc who may be able to help here, or point=
 me
to the right people.


Thanks,
Vitor Soares

On Wed, 2026-07-29 at 10:29 +0100, Vitor Soares wrote:
> Hello,
>=20
> I'm integrationg the=C2=A0Silex SX-PCEBE module (Qualcomm WCN7850, ath12k=
) on the
> ARM-based Toradex Aquila SoM family, using a recent mainline kernel (7.2-=
rc).
>=20
> Hardware/firmware: wcn7850 hw2.0 (PCI),
> WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> (fw_version 0x1103006c).
>=20
> I'm trying to understand the intended way to set the regulatory country f=
or
> ath12k on embedded products where the country is configured by the integr=
ator
> of
> our SoM or at deployment time by the end user.
>=20
> My current understanding is that ath12k registers the wiphy as self-manag=
ed,
> but
> userspace regulatory hints, e.g. "iw reg", are ignored in
> ath12k_reg_notifier()
> unless CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS=3Dy, which in turn depends o=
n
> CONFIG_CFG80211_CERTIFICATION_ONUS.
>=20
> The SMBIOS coounty-code path, looks intended for fixed regional SKUs, How=
ever,
> it is not available on our ARM platform.
>=20
> So, I have 2 related questions:
>=20
> 1 - Is the expected ath12k model for this type of product to enable=20
> ATH_REG_DYNAMIC_USER_REG_HINTS and use userspace regulatory hints before
> starting hostapd, with the regulatory responsibility on the
> product/integrator?
>=20
>=20
> Or is there another mechanism you would recomment for this use case?
>=20
> 2 - Since ath12k is a self-managed regulatory device and the firmware own=
s and
> enforces the regulatory database, is the CFG80211_CERTIFICATION_ONUS gate
> intended to apply to this case as well?
>=20
> In other words, should a userspace-selected country for a self-managed at=
h12k
> device be treated the same as dynamic user regulatory hints for non-self-
> managed
> devices, or is this dependency inherited from the common ath regulatory m=
odel?
>=20
> Without a country, the ath12k falls back to world "00", where 5 GHz AP
> operation
> is blocked by NO_IR.
>=20
> Thanks,
> Vitor Soares
>=20


