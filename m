Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A0C25B7E
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLa27fvWZ3xHzK1QFpz+dfI8TGigIxfiGyK3xtryc0c=; b=mE+afJIaKmxY3y6pJkJsM3h1uz
	WUU0y2tRdW1C8krxaCAFiyyg0vQWTDB/dyphoVKA6P9cRR/vUX8ksfPY7bd7DRloeZFMoXQNCxNdV
	SmNV2bqAjpCK4n0AwiMb1dHLpftVszv70vLsLWOA1RFQVaAGpu3fqMAHOpydifH4tTAWcutL9ZM/D
	i7aeFPMZNgQ1A7Hy6ZZqXlm+mFqEZmULsFXvqgLBA9ZJKNyFeXxyxc+RoQVt9FpON4rjvMzmb76Q3
	FXq3BTUPuE8W+elRScqot0myE0Oc/7RGEXnOSXptTV3VHgK+3v4pjMz3EUsFb/dwdECfc37ljgH0N
	wvnsfm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27O-00000001jzS-44fj
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:04:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC274-00000001jhN-2TPY
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-420180b5898so8893145e9.2
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923037; x=1717527837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLa27fvWZ3xHzK1QFpz+dfI8TGigIxfiGyK3xtryc0c=;
        b=xsMcObFFDRiEQy+t5xk0Poc4PcGmZd7369RmvAoKKP+Q4IXfKY8vq9y7zBe2YAnUnH
         O6V+GLELG6gRcz7DQ0eiiZo9EV/UyimXV2vl3b8ipWfufagtNk+0FmSyDf/xV0nV0AaL
         YPyUPrlOjrCHBWt9Lw2sM24FsB3RZLJZWlsESewe/T4krn7Ijm3IThV+YypV1O+q87nL
         H4029NijfrzhHTeHhKk2o/DMSdg1V3HLuqs4/5QQAe/462vyukGxYtnt6KG7OkK0JxWg
         XnX9BhqF7HpeTodE3AGdD67KMOpVlekrP9csb8/KVQf7O18TjGMrOvQ9EWuApcPcFIAT
         QRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923037; x=1717527837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLa27fvWZ3xHzK1QFpz+dfI8TGigIxfiGyK3xtryc0c=;
        b=V5ocp/UyPq5uD8u6W0g//6OFsJJEeVJJyomqgvomPskcgGizE6jPMH12iZmp3iy0dV
         qWGTRIs7HGr/tMIG4TxjdIlzBTCiNQGR4SGWA2E+w6nfKS/tH1owpY6nDa3WINnsgXOd
         0eDkVKMZLPPEAkMdNnD+GO5Qcou388o1jgm13HW/cuOPz/x9MRfxY1PyrJoTWQoKMx0z
         hEwi41kaaiowjQ82tp9pXUxh7UzlfNjtxjb3ETWWAlqKvq+mvmlpqVALKZ9ii/Q2s+T5
         5L9c7acDVBypnl5zF4XT8UGixqdxjezkvgbVHY6ycxDL1MJ/9W1S7YHlquvLmRIiWhKJ
         gQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxG0m/XKhi0Ae+Uz/roZm4AmpG68ywL3gYGqbN/kfhfzunP5lZrLzLoXzXWq32/t2JQCjN/9hzHhPoGYfMlv1AIgsZZRgh3NH3WA==
X-Gm-Message-State: AOJu0YxyFRCrIJE0LtfiPhp4dHJqL9NXgFB3YtS10dpqGVXCIQKJ/WV+
	B+siJuFLB8yUqPmL5sEiFy2rygF+kjEeKgmJNnZ+EefZP1DLfaKVycyRasFb0+E=
X-Google-Smtp-Source: AGHT+IGoCzWaS7M9ghnvAci7Ksdr02C5X0xku+g9bCWhaRV3dAa+VUwjLce7VBhVr4MskeyIPIu73Q==
X-Received: by 2002:a7b:ce8c:0:b0:41b:cb18:e24b with SMTP id 5b1f17b1804b1-421089d2d7amr87487655e9.9.1716923037195;
        Tue, 28 May 2024 12:03:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:03:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:15 +0200
Subject: [PATCH v8 07/17] arm64: dts: qcom: sm8650-qrd: add the Wifi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-7-d354d52b763c@linaro.org>
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CTlF2PNNDKg3EHqzuBhLG4C20XnWl+M+qvvHDXFzICc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqOCasMtV+U3OiBytvnFUjf7QPlMy0DZWpFp
 bK6na7SRHOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjgAKCRARpy6gFHHX
 cuQ/EADjIhEEPA5J8QYcTFkc56bRpWrArA5URK9C7G54AR8GRnMkHClAQ8SuJeONZlIaADyfMxR
 e3YrgCacVGd3yFqxz8ddZJl3zs7mkR4NugIWGYZrkXbTqPyyEihWhGdPAoDvqt3+F/rA5AyLADA
 LsOWSAKwsJGdlhoipb8qKL8wJ9nqtoWX02nnRiiDyanFTfAJodDu11n2tU6SsnJhpraa6dwzgSW
 YZC9uDnyQpX1iWp1ulEWP2NeRg8YgAC9g0tpI+MxZanJWn4s/TpWl/181+pvvsMEBXc5/APMRxB
 gkAhUlSGiaxArWJjB7HMTaug3INxGN8Ik4RnGPip2aiV3bOI+xLhU/5Wag0NhfO9CmHSm9M3GMa
 JeaTzNbdscOt2TBmHmoYy9WJJOyRlq7ZGn6H6rb3lag841ueXexgO6Iw8+HYqdVzFTQtmrpbcZq
 Sd7xwcyDoSjAoT3IhRSBblLX0UxnL2EPUe4vPDb/9VgKRJhLhTDqVsBgA5A/fgbfQxh4Z77yw5Z
 GgAKpa8Fesz5arVgs0SXPC3JWcEkwNa4cW84vnptOvCIk9GnS1TPK2k6Z3w+I9S8aZDy7073tTU
 TiLAs66lNa3OqJxblLX93+GuxbfT31v79HjTGtEs4qdPv8lbNJJV/EXkuwJ8QMOBbSrBB9cMNsF
 66h12Wl2a7d1bCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120358_770465_5373346E 
X-CRM114-Status: GOOD (  12.83  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the ath12k WLAN on-board the WCN7850 module present on the
board.

[Neil: authored the initial version of the change]
Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 89 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    |  2 +-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 98f6a272ce5a..6e3c4d8dcc19 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -203,6 +203,71 @@ wcd_codec_headset_in: endpoint {
 			};
 		};
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		/*
+		 * TODO Add bt-enable-gpios once the Bluetooth driver is
+		 * converted to using the power sequencer.
+		 */
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -844,6 +909,23 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -1138,6 +1220,13 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
 };
 
 &uart14 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d7c432552233..0fb971169f38 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2289,7 +2289,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			status = "disabled";
 
-			pcie@0 {
+			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.43.0


