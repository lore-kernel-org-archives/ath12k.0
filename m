Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6890BC54F51
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5WnxcIEaVC0j3CtWI+yiPRs8vygJw8ntQCvpp65dOv4=; b=ITGtG7kzN6Eb9HVsYpo7pB8Siw
	DIBKfeBZoieyUd6jGs7wJ+6q0qn/v0XqROpOxMpmnY7UHsUepoI+tOEgNgkjq9dcXm44Eo7UjyujN
	ewBL44DrC/r05eFmF1HsMPMuFuSdUH8o+lFCSe2UtMsaOwbhkhNJO1GKedVG90oeyX1YpBOWrisu7
	ZX5wY3QXxqMEt0vdVwREI8PkmF39IaWxtIMv8Ydr2mG/qpeOXw/tdhYE7tMwENdLZxSdglytkFC2T
	M6MVlScCRPMdxCFKmkwJZBS/v5AuqAEzxnvj+kehTRGNbLVw2RgJtR2fLgrR0zSm3OD8tZ39arIPJ
	Eeqr6wNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0bn-00000007NJ5-0Rp8;
	Wed, 29 Jul 2026 09:29:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0bk-00000007NID-1Aj3
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 09:29:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49557167508so6313685e9.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317386; x=1785922186; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WnxcIEaVC0j3CtWI+yiPRs8vygJw8ntQCvpp65dOv4=;
        b=LFoSB2Fqtvc1Zzzp5Sm3soxM9KxtcvQ/wxqegeYlzxWW4mNaZ1Hl1q8M67pX30foEt
         imQMFy4HcHn4pzmWiaWHXKhYDLOppzxKRQxuyYCr9Zia++ZwWOo1lxgaLvxC+t6PnIZd
         JTS2SD7MSBFqBKqsqp6J5P9+kIzm/Jy54/SBOvFJX/iyVrXkhr9w4n2jR/+nQsiE37z5
         VIDIzlgL86bbQ2M9YLFAQ7mCMhoPQ4Ok6SDH9oCjjYqvdGlxnSxfHUTeyekaCj2Rw3G4
         N+KpDX5olrqKMuaAKzDNKA+SQ5GsmyyuGREqgdP6SNPUPVcX1mKy8S8btG55Y0/5Pq5Y
         136w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317386; x=1785922186;
        h=mime-version:user-agent:content-transfer-encoding:content-type:date
         :cc:to:from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5WnxcIEaVC0j3CtWI+yiPRs8vygJw8ntQCvpp65dOv4=;
        b=P5pbB67i+QKoUddh2/NoyAg6QaeTYesyPwNDByqGf5AijjPFqdqlREWQ1zw6dFPJC9
         JWcUv1f1TcfDXbNevnvLec/ghUBoUWfzNqhOTAKWT3YuafOlUff0Ci9E8seu55S7MYcq
         ZFyjK2sauxgQdS9XqHBMnt5vH8UWWdqoUgFtWR/Muqclf/DfPDD+e4tJVLdh+0k93gQt
         TtbKYtPkcYn4NPZ9T3XWcINm6l7Pbf9BOLQoYG7gXs9qitC3iFFsF2UOQ548YKEZoB9+
         H43MOtC0/SyPhM3FOa974uX/AO8Gckuk3/J4KeWwq8uwnNIpeXopl6oncFv6UdDtFHOv
         3a+A==
X-Gm-Message-State: AOJu0YwqqU85C7Y2Ijvsf5NJbXD0f0f3rieGpucUZEu9NCZreAGocECu
	Yly5oBeEJcexKOB5aijSSWqEvIEhXATXZn7/nQRTzGhY9J0A/uB2fNR4
X-Gm-Gg: AR+sD10GWYS3Ao2FvDo43YowG4WLM6rAiBvpILGc578rv7CdRv+uvsAGF0AF6WPzLZT
	s96XhrN/EWTObEq8Vwrt2jfLNRcPhbmMu5ELItxnhVDyL/jE58AxrOA0v2prLaTfhF/EgjK3/1m
	sElIm7dHiVWB5RZtIOS36kmuf/wa7/3JSHGpWFYJn57kFV46qQ+nuHemxNS3hRPppFNSVYDeddR
	M1k7424hXgQg026+sVsnuZ05OCDp9Bo4uReoIDI8xHvq7FjL+uPIeBdQGG5Er4mvFAfZ+Pk598z
	UwxWhk4YE2a0fQE5lNq5v/hYbjQyib1BSi2E28+BEt/n28D4jQTATAC6xO9WCHw1t/GZlouhKJb
	ZhbwrDuR+T7ZlW3HPTePsMmbn5d1oze5HkWekf+1yew2RqdY9qp4/e2dEQwpoT+qN8Xanozm2VY
	cyfvXB+UcdTLVUXHmRWlkAXzQXaT+C/k0X2bHJ763/bAxqdpjqKE9m9QKWUnieb8f9jX1iSliYU
	nRlxjunM4NSEIc+vhHr82+biF9y
X-Received: by 2002:a05:600c:3b26:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-496c64151d0mr69763385e9.1.1785317385761;
        Wed, 29 Jul 2026 02:29:45 -0700 (PDT)
Received: from ?IPv6:2001:8a0:c4c6:f00:6d7d:cc54:8605:a888? ([2001:8a0:c4c6:f00:6d7d:cc54:8605:a888])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d848edsm43293315e9.4.2026.07.29.02.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:29:45 -0700 (PDT)
Message-ID: <3ac168e7dfe22133daf09adc3f6587098ec85619.camel@gmail.com>
Subject: ath12k: recommended regulatory country source for embedded AP
 products?
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, Wen Gong <quic_wgong@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo
	 <kvalo@kernel.org>
Date: Wed, 29 Jul 2026 10:29:43 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_022948_342477_2846F438 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

I'm integrationg the=C2=A0Silex SX-PCEBE module (Qualcomm WCN7850, ath12k) =
on the
ARM-based Toradex Aquila SoM family, using a recent mainline kernel (7.2-rc=
).

Hardware/firmware: wcn7850 hw2.0 (PCI),
WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
(fw_version 0x1103006c).

I'm trying to understand the intended way to set the regulatory country for
ath12k on embedded products where the country is configured by the integrat=
or of
our SoM or at deployment time by the end user.

My current understanding is that ath12k registers the wiphy as self-managed=
, but
userspace regulatory hints, e.g. "iw reg", are ignored in ath12k_reg_notifi=
er()
unless CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS=3Dy, which in turn depends on
CONFIG_CFG80211_CERTIFICATION_ONUS.

The SMBIOS coounty-code path, looks intended for fixed regional SKUs, Howev=
er,
it is not available on our ARM platform.

So, I have 2 related questions:

1 - Is the expected ath12k model for this type of product to enable=20
ATH_REG_DYNAMIC_USER_REG_HINTS and use userspace regulatory hints before
starting hostapd, with the regulatory responsibility on the product/integra=
tor?


Or is there another mechanism you would recomment for this use case?

2 - Since ath12k is a self-managed regulatory device and the firmware owns =
and
enforces the regulatory database, is the CFG80211_CERTIFICATION_ONUS gate
intended to apply to this case as well?

In other words, should a userspace-selected country for a self-managed ath1=
2k
device be treated the same as dynamic user regulatory hints for non-self-ma=
naged
devices, or is this dependency inherited from the common ath regulatory mod=
el?

Without a country, the ath12k falls back to world "00", where 5 GHz AP oper=
ation
is blocked by NO_IR.

Thanks,
Vitor Soares


