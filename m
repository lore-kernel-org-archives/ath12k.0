Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7E606A31D
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sz2WhBzV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tst0smVk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q7E9UfoWQWnqho2nQB011oITjH0OZoiCPBc9CYnDpQE=; b=Sz2WhBzVyoIZnYEIVxa024tnIp
	cYv+Sk5p2Isjc2IjAYZR9yGfgl50UzpPRRf7rFnev4gQfEHDYO4gwd63dEP4zLOh7Ghv0C0jV3H+K
	1DXH6xkduxu7GT1YPEaR/XE8toWCYkAPzthIwWtTl4oAd7DvrEYbycqBOfcz3RoZ6LvjKNFw5WCoc
	933+cHKIYZBcOnk1BqvntsRCqDRgZY7xT+khHTSyoRz+tt+jqIO119RGKa4wgATQhDFk+69dM+wg6
	dDU5o6I/c+REaIm41Qcz2Me9NxIyv/ik3nNNLZDLzvs7xqgAJmNibuf1Oh04uq66iOHBhqJRepWW1
	z5NibCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTLW-00000009ro6-3BDx;
	Thu, 29 Oct 2026 16:51:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTLT-00000009rmx-3OBc
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 16:51:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48df54150dfso1337240f8f.0
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 09:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292677; x=1793897477; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q7E9UfoWQWnqho2nQB011oITjH0OZoiCPBc9CYnDpQE=;
        b=Tst0smVksKCCjKgqBJ648tnF6ZREOYPJL6KZwSTNoI9uwaQM2GGmudJMjlCe5c6zSM
         ig83i+FIg39LYfp5FIflXzfDIziS85W4u3QBr8g3vFXgt/ypbQzbjUiyLx34zt7LwZIu
         4vvvfhpHhowB5ldcEdycoBC+Bpp0BZqlVPpICzbO3GzC5P0ilTB2U+cOJ3IisgEYPaY/
         ASqrBj1Xk8GOJ9t330vTDW3YAbc32D+qMLa9+L4F3xi8WHxqXvOUOv17uTYBensrsHIp
         MFpA8HNU+0QlJHvVpi4nFbx80xZLo/13p0jfRBdcFDQ0sk4cukvMx2d6alccFPin+PF4
         TKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292677; x=1793897477;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7E9UfoWQWnqho2nQB011oITjH0OZoiCPBc9CYnDpQE=;
        b=wzIoj+yuyZVQIjJTm6FEvlkOktf8MFDJu2SsC5owf+qS+OvdIsD51sNd8QYNgCZ69H
         PESX8TPK2LpwDTbDxvJaePiZloKMq22yh8xpDLUgLEYlG2WVAnID4GMhuH/VdwqGe+nJ
         8WoQC1Ik4uuwrsG72a0gQ4Gt9bqDISrRe9OUwtDL3vfVTm8iu0raYknmRr4IDhN5hnjB
         Z0QZTtz6gG+QK3YVel/RO0NkacijJv1e+e6DdaDMUfta1GUUrdRdyZmPr0s8HCsbWsys
         yADR3Z7GNxuUcd2TZufqtBHAKbmet/ipqYxrrGhW9frRze9X6uy/TZQrZGbbxrQtj2c6
         htPw==
X-Gm-Message-State: AFq9FYLaCYJc1+/CA67yYoYxYACQXiTgaIV3/bviIUFA9sWNVH/J34B2
	c44PKnK2JJigZq4kkt/HRMoTTm3Z8CKWfYYfx+IqfCA0VbyGMELKlnTx
X-Gm-Gg: AYBFou3gXzzj09O6BqpnMhxYxmMpTxaPMV3+24nD+ZZajzG6GHXoj8gXJYfkNCjmQ9d
	xJExOyTYdL0XBgGLbYGooFLhJRWxSHkV2pcB/XAAJkZkYEk80NxzaYb6jD/39/vbIw4dT4Yo29R
	poqlSosOrxgD1RRMnrW3G8bHW0NMerbGzL0YKxVFKUZCHFua2y638aO+DgVtybztkaa9knylCwr
	Oz64LKa1GMG9wWBVpQxhKBWfiHrHSlaNRRKD7Cwv4RwiwEyklku6Xb/GjFT3IqfYXZObpF/tBDb
	AdHMtp+WdJ1VkU8GfelGYRqQefUWXDJlpbvBU3HMzwkXrlh+fepU/HPbw4z0ZIAhf0aqN07qxa/
	xGUwna9GabOh+wVXhqXvSb4VaFeGQ9LR7G/Z5FvfzwNuZr2SO6lpQPeIWT3C/KgCBhfHQFPFwN8
	wPeqq/PfG6tHpUFMPC3epj/71IoStNyUYlyNPTniq9zXpMj3YG5cFAH5KAAru+7ITUPnuwtsdS6
	5/sU49xjlzs07+ugQTLSaCv1mFE9R5aX+ejdchGBAqlRw3IE3iciQcbo+CTc9rgB1s1lUrFzWKW
	bXJy2GO/MVSWscaPChvQCiZmn3Sa4wWEusAKKWunKaLbuVYQibxraZIq66DAA3bKHgJUw7E=
X-Received: by 2002:a05:6000:716:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e5d5c9c95mr13396446f8f.44.1793292676786;
        Thu, 29 Oct 2026 09:51:16 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:e9da:bea7:ee57:4c6d? ([2001:8a0:c4c6:f00:e9da:bea7:ee57:4c6d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6dfa0605sm264471f8f.32.2026.10.29.09.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:51:16 -0700 (PDT)
Message-ID: <03564cc2f89c64f9dd06624dae01d6575a202bad.camel@gmail.com>
Subject: Re: ath12k: recommended regulatory country source for embedded AP
 products?
From: vitor <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, Wen Gong <quic_wgong@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo
	 <kvalo@kernel.org>, francesco.dolcini@toradex.com, lxluxo23@gmail.com
Date: Thu, 29 Oct 2026 16:51:14 +0000
In-Reply-To: <3ac168e7dfe22133daf09adc3f6587098ec85619.camel@gmail.com>
References: <3ac168e7dfe22133daf09adc3f6587098ec85619.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095119_864043_97508360 
X-CRM114-Status: GOOD (  20.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi,


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
ator of
> our SoM or at deployment time by the end user.
>=20
> My current understanding is that ath12k registers the wiphy as self-manag=
ed, but
> userspace regulatory hints, e.g. "iw reg", are ignored in ath12k_reg_noti=
fier()
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
> starting hostapd, with the regulatory responsibility on the product/integ=
rator?
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
> device be treated the same as dynamic user regulatory hints for non-self-=
managed
> devices, or is this dependency inherited from the common ath regulatory m=
odel?
>=20
> Without a country, the ath12k falls back to world "00", where 5 GHz AP op=
eration
> is blocked by NO_IR.
>=20
> Thanks,
> Vitor Soares


A follow-up with some new information, as this now blocks 5/6 GHz AP
support for our customers.

I checked the Qualcomm Linux kernel (linux-qcom), used by meta-qcom:
it enables both CONFIG_CFG80211_CERTIFICATION_ONUS and
CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS by default for all arm64
machines, in arch/arm64/configs/qcom.config.

General-purpose distributions, on the other hand, keep
CFG80211_CERTIFICATION_ONUS disabled. Some of our customers run Debian
on our modules: with the Debian kernel, the WCN7850 stays in the world
domain whatever country is configured in hostapd, so it cannot start
an AP on 5 GHz or 6 GHz.

I understand that ATH_REG_DYNAMIC_USER_REG_HINTS was added in commit
94e7876daa43 ("ath: add support for proper dynamic regulatory hints")
to keep user regulatory changes behind CFG80211_CERTIFICATION_ONUS.

Would it be acceptable to update the Kconfig dependency or help text,
or to add an ath12k specific option, so that distributions can enable
it?

Alternatively, Luis sent a patch for the same problem that allows user
hints only while the firmware reports the world domain:
https://lore.kernel.org/all/20260228201023.116947-1-lxluxo23@gmail.com/

Either approach would unblock us. Any guidance on how to proceed
would be much appreciated, and I'm happy to help with the patch.

Thanks,
Vitor

