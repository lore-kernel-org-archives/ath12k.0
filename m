Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AB4606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VppOUvT7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIHKyRTJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=; b=VppOUvT7ckTuuyNfQgTGmHv8Bc
	e51d9Yz6VdfFEVz4nHRGLMk3MNA7L8OOaVsZPP7TaJIik2pVGPO6mbC1Wdm2fBmmRe1BDEsK/EYrq
	OvuZtYEXRTGmRMZtUjwsJrE7zwNOv+7tgk6zxN8MWydS9GmgkoBcf5q7ZK0ftjkLO3RHejIgl1EVn
	2TNT8KT+RfGkPXNh5mID1amY4n8vJadIAhVpDs/EbP38bW0d8loMjsvVJf82BBbIJ4NaWYMHsAgqG
	BeOrvlPPe/Lv9vyLNpkz/WpkCH4+33uFOM281zLjt/pE4WhwxQ7X4fctof1fkUz3Xsu2LHyV/ufXT
	Z/w65rDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTew9-00000008sIi-2LZ8;
	Wed, 18 Nov 2026 12:38:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTew7-00000008sHQ-1DGu
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 12:38:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so591446f8f.3
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005529; x=1795610329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=TIHKyRTJFFSpMXS+HquANL69a/DVeDiZ+0AZeJb1WF9FPzWpPgqUzt691Tf22H/aVb
         r4S4flu5T8HOuoskZDxFQuJEJAXuBvn68RWcoRQWt/jeJ7LgVa4WiY6OMikGS31S0X2d
         vWNpUnNN/WqRCMK3Lvb8L2BXF9NBH/kjXJ0v9zdma9tA9NNh+UfMuvKLt50Yp/Np/5fK
         cMMfIS9EFtyweGo7ILDh6mxvhDM8Mcd/GJH7JicAFTpyoZIk15bvVko+vhV8AiGwTSkC
         u8lRtsZnorjMq4G7P/m6eaEl+6syGjCXS9fnh2/OkCyCnjbOxu2/pDtoXhsOY8um1/tH
         6rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005529; x=1795610329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCeTG5B3FnqoW+qGoo1FXEjHCoH6J7aBegNAVVKMa/Q=;
        b=Wtcm3tXEv6WU3/KMUWYAMkaJ5Qfn2hC6v+yUF1HziAoui0rBY6mr5aNaUBIStrQxPp
         2K+DNud/TVyZDk0pPka3iJTUBnyKEBkq2idn05USUTQazOLY9d1EnIEJVAAt1VUHjAWP
         tbrO6CZQ4Guppx3/E8bdWw5jhf8V5TfwLUCzfV2NG0L2Gdn+E2Ui8Sxhp0r3KtVeEC5M
         Q9f7tNNrokwGeEVBV9pcGo3HSngM5T82P4J9+q3AKecNz8eFXG82b+1P3F4ZQXyZnGXj
         KS9ir+efezDC7rfd+Fc+sfKWhYvAQSRq/MvWJj7/Lr+iUTuHMU4x+kaMt6hWYRjqbxQZ
         PpgQ==
X-Forwarded-Encrypted: i=1; AL+hErFJLe6yDfYWbXouWcD2+zK4WjEnZvGDoXjyh7vUtBFdh8o6Fk3XRPaWN6VfUtfwFX25dK5kQQo=@lists.infradead.org
X-Gm-Message-State: APuU4Z/4pSo9yHsLqKcEN8cnr+D0G3jnHRForDRqXKvzuimSzQ7iH776
	fRCZZ3b07zbKYMkv4YFqMhZv/dzAu6DlyPK/1cOXn/+pK1o6UXt3XnqN
X-Gm-Gg: AZFdTZfoqqo8HgovcDqqjLXa5omZeBBOsebMVROr/hze4MVE0tfJ+vik9r5vmrH/0K4
	7cP2zmuQC1sm6EkaF8zJAN0YacjsgG1CTglOf4tEuuKlQ9e4aXKIxQ2W7X9B/TA+VLZrc9Ffopz
	Cu4boJNL+6+opzIdrt24oFk2RJLrvUTm7O91lDiKZApZGX3XTRYDqyxMdTrCrcauvBvZU9371TZ
	UwFRqoNsETrVDvRZBXFIqJRQUbA9hkjStOgMhjHU8bRtq08+P2qtJ+2a7WrJcs+e/4BX0cfFcSY
	/pCXiBWakCXQPttGQNVxxvI3AmCHLtkpqhpGqHMJ1MkfDAUQ9V0oulfhYsvArEZjqMrTGA90gsD
	/xGEI0+GB06Un8eFNLC/CJGqhFU06X/3mG9JMERFH+6jwjtP36QLxI0ApMUK7RvK2rN4xa8oDhu
	hOudpDkuXuRcy17JU22c/OyTtRULvkMdBSM7kCvModvKnlGXtH/qVJAHCvs/+4wFZGMeiS6syY8
	04qY6iSJIypQ/wpSF/1y7E8QVB504kKG8UJSA6XHSThmP5CEvpT7pWkuzZSpmBMmcX6fTvXw0T6
	7BxzPtKzZCIaZNZAzMOeoSR6UPH/2axezQ==
X-Received: by 2002:a05:6000:1a85:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4a7ed957d61mr1616041f8f.22.1795005529035;
        Wed, 18 Nov 2026 04:38:49 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:370f:e244:9816:c590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2efcdsm4539201f8f.5.2026.11.18.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:38:48 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
Date: Wed, 18 Nov 2026 12:38:37 +0000
Message-ID: <20261118123837.651915-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_043851_350478_506DB188 
X-CRM114-Status: GOOD (  10.65  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
module reports the same PCI and QMI IDs as other WCN7850 designs, and
its board data also comes in variants for different regulatory domains
(US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
the right board data.

Describe the Wi-Fi device behind the PCIe1 root port and set
qcom,calibration-variant to the US/EU/JP board data.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Depends on the qcom,ath12k binding changes in ath-next:
- 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration variant for WCN7850")
- "dt-bindings: wireless: ath12k: Make WCN7850 supplies optional"
  https://lore.kernel.org/all/20261117174154.549590-5-ivitro@gmail.com/

Until they are merged, dtbs_check reports the missing supplies and
qcom,calibration-variant for this node.
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index a1870f7b2eca..a73d137af2c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -621,6 +621,14 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Silex_SX-PCEBE_US_EU_JP";
+	};
+};
+
 /* Aquila I2S_1 */
 &sai2 {
 	pinctrl-names = "default";

base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.53.0


