Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2D606A8A0
	for <ath12k@archiver.kernel.org>; Tue, 17 Nov 2026 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hBOQBoR1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4ODO9RF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=; b=hBOQBoR1yzeCdS8tIyNn3H/Wsg
	IqU1gVMNztrJhVTpwOPh2GjjuROBTRjPcGqPePqW4hDvUQQJ22+0TaN2dNmjMj4ab9IcTEGkzXc4D
	nlXs6i3NKwVrwnfsSKR/StMzvNkMth9EsOfr6kUCeG3UR5zF4d6IUUBV/gCFs2r8Z0rBoyX5I0QyG
	kt4ZEF37WyNSMWHHgS2sL8TBhO3wRscenBwjuEZttC3h9MG7K0sHV/EyxAyPwlJYwnYiepPun9I/8
	ZKYovFZgr3tSVROvABKGSm4UQzzb47K3nID5MnBo3YSUQnmZFgZAeT70/DEurKtFGa3U/PmJjT7RQ
	PGVccV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC7-00000006d5M-2rku;
	Tue, 17 Nov 2026 17:42:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC4-00000006d3s-1jhM
	for ath12k@lists.infradead.org;
	Tue, 17 Nov 2026 17:42:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1428295e9.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937326; x=1795542126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=u4ODO9RFPdry83oh6/HP4oUP38T8iJFzHZxESu6uZc6kes6sze9twYOIpmJHkwZ6EO
         jdjaelmVuhedcCW4pGPth1J+kMLSVJWDmwqcXaO416oqU6DcIe5eNMVF54ogmSyd0Sv+
         W+P9EtkGNpL3m+17e11Je5I9Hneq4O+Jpq3ceYtCKIcQjoGrmhcE8RJjv12+fmaDY+a2
         6FNCn1bsguuyzOxgzryrUNriGbNjPdFpxGPpTnmxDubgAFy4U6CY7cekGLckllXwfEdy
         /zOnxSKvLNSm2dX3HHCR3F5Yem+YqWku37zRN5Ic2bmTB7uUeZP1i7LXmDD8IyBfh93O
         OEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937326; x=1795542126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=n0MOYOkxhHQ8BsH8YWjGCE6tXaFsXiKztlTtcxa0e50P9EoOYsDsszwjGAIWb98OA2
         ITIXVVzLPjJVKJyesFb+ZaAtWwL8zITi/4Z9/j0MRJZgdrXlr59PBe0yzzur0KGrR0uW
         YOPPm3sGGfeMVLEfm26WCnSd/3xn5ci7CmcJp6lu0KvDq6tJNA/z+qiKXwqxWT/ZNhit
         mvawPzubGnvD7uiGG1SOlaPw6TCYXIJ4CmENHBze+T0EO+kokdb+WFdyhCa2LK40E+sl
         ROFz+Uwms9ixBeqlHFJUhz94DRPB4U6DK21nTWRgEZ533im5O3//chUS3P+6Wtk5Pl0+
         /D/g==
X-Forwarded-Encrypted: i=1; AL+hErEQt4DQ/OoLyJuKvWZpBmzOHuHGbi0MURL/eh5sYPHBzlZKIzkK1eOXLAXYFAtmUUq39ZIETCI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+WCqnmbNGSXapJGb/GXIcpi5Y2fCPsaHAJNZYd9w2/omjUdI07
	mJ+l6bscauR1sGpx3U4vEtBxaoc60wSIHbR8xDjw8ZOKS2YSF0Odewmy
X-Gm-Gg: AYBFou0qKACWd+udsIwvcyA2ILML1wWmQzIItpUCOfM++isw4bhGMRSqgw8QfsAFqlU
	LTBxrqA5jD3fCT0PxI1X6kqULgjoVQALVYkCMkeYtL8l7zO2lkE0BOc3U+vg1mSVnq7mdLpIGgb
	5dY+npjJVpOzzJ4hj/i6k7nXhwjs+7s2+bBPZ9H38G2tef70Qk9mZPWIVmR8uTlVmQgzwEWtrdh
	EGWUEvqii6tuqieFUjr5JEI8cpndgTmWiS35hKKBpcgol1GGJdc4Jz38bINmUPaCvm4peeRVHee
	wOdEtmqR5GLQr1U0Cl1NBychPkRxmW85sutaEGheRMCBXACjIAh9MlNZ17zF9GvFchqy1+FYRU+
	a835+4j43hdUNZVVG5VtaewUcjUgI0Ub4Id8Qja464T9qky2YHOjUDsLdTObye9FyXH1qAla1nD
	JA4428uXaPTtpJAn6iJrR9PBuhjtdH+5QSbyxumeHG9j6wNyADYPt1TPPVSI8YkF03bzm8k7JcG
	cpJZOTFDexVPH1trtCXWmJB/LHJLMBJytyupOxxkHP8eilzyEtNVh02/UFjPM2JJ8mm+hEy/tdP
	7f7yawcEENi5261g6JAeXxLc5bFfXeejdRKgU6R2/Ef6I0/ltMjBLJWBXP88FntX5laZV4D6E4n
	GvyAL
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr207958615e9.8.1794937325497;
        Tue, 17 Nov 2026 09:42:05 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:04 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add ath12k calibration variant for Silex SX-PCEBE on Aquila AM69
Date: Tue, 17 Nov 2026 17:41:54 +0000
Message-ID: <20261117174154.549590-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094208_460308_EBCAF8DC 
X-CRM114-Status: GOOD (  10.75  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The module
reports the same PCI and QMI IDs as other WCN7850 designs, and its board
data also comes in variants for different regulatory domains. The IDs
alone therefore cannot identify the right board data. Patch 2 describes
the Wi-Fi device and sets qcom,calibration-variant to select it.

The qcom,ath12k binding requires all nine WCN7850 supplies, which only
fits designs with the chip on the board and its PMU described in DT. On
modules like the SX-PCEBE, the PMU is on the module and powered from the
slot, so there are no supplies to describe. Patch 1 makes them optional.

Patch 1 is for ath-next, patch 2 for ti-k3-dts-next. Patch 2 also relies
on commit 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration
variant for WCN7850"), already in ath-next. There is no build dependency;
until both binding changes are merged, dtbs_check reports the missing
supplies and qcom,calibration-variant for the AM69 Wi-Fi node.

Based on ath/ath-next.

Vitor Soares (2):
  dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
  arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant

 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 15 +++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


