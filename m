Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30A4CFD376
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 01:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=; b=axsRcLI0t08X052rDPA/fVKSzc
	W0TpQJAa7txaoqV9mVovFrCX6K99sefRZvDJGZaX00wtTM5e6xTgbvbwu4bXcrXfNYZZlhyvv3w3r
	i9Me95GbWXQt9CjlLY47h2UgFmKy80f9Lr4DE8YBtjdXFRwvKE2c7Pr+lJyD6YuOxCSjohxonxRH6
	WSJbSyFoSfUENn/coELtDuokabPhzqdXhWJItoXoIDtjOUZN+V1sZSb8/MFuzOz6K/RKBV8kCfxaG
	e9aWTN+wI0UINayKG2girxtiwDroLSLdtTfuqguMoGKUDrcqsuQ4LOjZUsIK7mJUk6MoPIYAnKaGL
	wj5gf/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsWC-00000002jsp-0OFv;
	Mon, 01 Dec 2025 01:15:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPsW8-00000002jsO-01Xi
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 01:15:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779a637712so20694455e9.1
        for <ath12k@lists.infradead.org>; Sun, 30 Nov 2025 17:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551750; x=1765156550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=;
        b=ZbsR14yPPcEM70adz4NQesW0ilSfF7eLEEJqhkWDnvX1OMntdipATtK+a0HyRnINab
         SSFTV22YqBkEGs4rsy5kNqPJUqqgF5wThkRV5wEz4plUtnbpIEWUHSuLn5/qtjUx+J7c
         7uqCutttT2XXRPKYe2/sRshckJw2Lmz0jfmWVMw0I3aLIeKh6vUQD4X/FCpyzTo4KqWk
         Z++6g0BSpCsvKLnGXoGEyAYFBI5IhnFb/PoY3gVp2m4g1O8fmuCV17qoEyZpLPBTA2xm
         qpUoIS9NPcVA8sGMFUJpoZ3lLs0xyh3G0URCP+NPPE7o20hGzHbBJvo/p0jg70Sf6JK7
         1qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551750; x=1765156550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx/uBhoEOHIhsehasECkzayBzot/ALhISZ90zdBh0Qs=;
        b=gIR/qltey8fDkEHuc0xIrF/4BJv075s1/Acs+a8oO2q7pFvXcqi+cnK/YDHmRPjuP1
         yQIRDoKgH4qHQoeI29ML9lWaDM6wna2sWGea/O8no97mjN+p4Jj1fHKyL0o2mBr8Bd7f
         EtNyYGiDVBtjbaI3no4a+sdDiHLiIG8+JqAzbBSkP6b/RHJnL3FzPRKcdkq09/Ia/VfH
         ZD4IBUcacGBQH9aYTN9FZMMjk07l6PFaU/h2LcSsSB6P/TxVRrusk0Go+XUaccK+kX7U
         TcGwhtISSJzzrHR5CdRgYzJynQ8OGe985/cH9/XlswFyjZBwX9uws5apr0fH3Xt8MUrJ
         t5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUR5+04/Inx8DiKbLHaivZmW4hsdisrtxxdi4QpoywcFrQ36hgp7/Fc/AC7cmAFKHsEt1pRkdY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDkuhgFnyN5RyiOf1de9rsq0kM/Q3b3R2SqDkm+awm3cmwhn7P
	hrYWsK5hdjnfx1Zod2934UdshZGpDq39UnyvL0xAzeA75n3o6u+zFX34
X-Gm-Gg: ASbGncsfMBv51Ufti4Iyyp7N5AF6AqlqCG0yXTJL0LWiLbCOWcdNdpErloETeZYEMDn
	kbRRxZ0d7yxQcwKYfKvGtonaIf5HaBDHlPd9JSzefRlSACw8Z+g1zVZZeOAJATszWc3I5vQKjyA
	cynByZHT8W1tJ9ELbOvvb8lcjs/bRb9Rbme9nPMmI0EdTKnSjP8tNHabtzU9nnQjQL4Xn1ywEI4
	2AbLaLesOIcAiHzjNGQRKX6Ne1Fj6kQUOL4CZCB3tb7ajbC5xuamN5RarlTiRTLMf6BqXMtft9c
	h1DEa2kU3I/ycTVhcCHXcIpWW8ONik1C6WVSNok3eR2ANQYbgIyS3qtG8+Dy5r/tbfvs1Hjm5Zq
	1z+s2y13r+Tz6+3B6OrPDXcdSX+yFU+ev1psmV6MOqcLrpbrumihJYbl9tvLEHlD4BT/aSOPUEH
	VPUePGHlMI7XTqCwRo7pBxvdGQiq1320lYSP4eiv61gSnrdZxEmKMXQw==
X-Google-Smtp-Source: AGHT+IGHjRl74icUPwWh1aQ2xdTwSRRUQMAjgiSVanlvJksDJ6M0AluYsyZQkKBUguFBzPL4kDKIoQ==
X-Received: by 2002:a05:600c:3110:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-477c01b4b2amr432822595e9.16.1764551749507;
        Sun, 30 Nov 2025 17:15:49 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:49 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 0/8] Microsoft Surface Pro 11 support
Date: Mon,  1 Dec 2025 01:14:41 +0000
Message-ID: <20251201011457.17422-1-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_171552_086097_484CA8CB 
X-CRM114-Status: UNSURE (   9.35  )
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

This series brings support for the X1E80100/X1P64100-based Microsoft
Surface Pro 11.

Patches 6 to 8 are included as RFC as we are unsure of how best to
achieve the required functionality, however the implementation is
functional.

v2:
  - Dropped ATNA30DW01 patch as it was merged.
  - Split device tree into x1e (OLED)/x1p (LCD) specific *.dts files and move common code into x1-microsoft-denali.dtsi (patch 4).
  - Device tree now enables higher external monitor refresh rates/resolutions (patch 4).
  - Device tree now enables partially working audio output; requires alsa-ucm-conf and audioreach-topology definitions in userspace (patch 4).
  - Replaced 'Work around bogus maximum link rate' with a quirk-based approach (patch 5).
  - Improve the commit message about the disable-rfkill property in response to feedback (patch 6).

Dale Whinham (5):
  firmware: qcom: scm: allow QSEECOM on Surface Pro 11
  platform/surface: aggregator_registry: Add Surface Pro 11
  arm64: dts: qcom: Add support for Surface Pro 11
  wifi: ath12k: Add support for disabling rfkill via devicetree
  arm64: dts: qcom: x1-microsoft-denali: Disable rfkill for wifi0

Jérôme de Bretagne (3):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
  drm/msm/dp: Add dpcd link_rate quirk for Surface Pro 11 OLED
  dt-bindings: wireless: ath12k: Add disable-rfkill property

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../bindings/net/wireless/qcom,ath12k.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    | 1340 +++++++++++++++++
 .../qcom/x1e80100-microsoft-denali-oled.dts   |   20 +
 .../dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/display/drm_dp_helper.c       |    2 +
 drivers/gpu/drm/msm/dp/dp_panel.c             |   14 +
 drivers/net/wireless/ath/ath12k/core.c        |    3 +
 .../surface/surface_aggregator_registry.c     |   18 +
 include/drm/display/drm_dp_helper.h           |    7 +
 12 files changed, 1429 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts

-- 
2.52.0


