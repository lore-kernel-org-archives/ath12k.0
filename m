Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC02CC6B01
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=; b=GGmV9SN3kROKluVmh9u2tnIpTu
	kjnGELXlbaumUP8OEKK4ws6mlRY0lzwwrCokDSKhHnzCbvfVlMxn0l5pWhjAUuyMBnJMThVkUzN0X
	UyENo8kqx0NrrLHtiXII91nDuFDlYRBLKuH2F6uFE6Z6HaRIqwwlh8hhgg2FDawEHnglomJBGLPrn
	ZrOwGtE3iVxfjeR84Eau8yLjiCvoodK0Lqkgnwt0bBAx58j5IWdCFyb/mHaeqG7BI3eQQMUGHInWM
	WO753xIWwdn6XQwDyjE5cwDuIoOMAtgxOgq6MrVyobV17crsxf+XkEbeYAGet6GlcB/W5TMwBNnaI
	w7MEul/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898Z-0000000GgjX-2DLv;
	Thu, 02 Apr 2026 03:54:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898W-0000000Ggi4-3rQf
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Hrp2904005
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=; b=MUez0uUuB71PII6S
	zoqOYG4dVhkR/hcIbNeOxzJZrPY0DwkSJNnNcKTnsQJsc5lHRxO/b5eOyOdRTCsl
	7xCOgvDPDJpfCu6mrtk/EewnYWAz9KRtseShRPrP3n/1nTBB18t7K6U+fvv0qhGI
	6KFYjjnv+X0cUqKoo2fQAZr1eVH8efIeEwQn+dLDDMQnpHLui3P2zVllHOaNLWlv
	riKvo87XfISwlPOhC7Kq2QMQ99uBiiJnXQGwd2SZnT747i+MFObEdmF275Pd99Se
	CTIYEX4hY1akI2JfWYg1/SXjd/P1L0Bp0Kyo2akmQXHLuOeN7sx3wgrgUJ4sXKe/
	t41Vfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954canrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c649dc145so244964b3a.3
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102068; x=1775706868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=OAEylf2VC/qW0YJR+ecaHJEb79putuo6AGQjXOL7ShVa0+HtZ9MSkni8jFd4aWSs68
         Xl1NbtUnz0owOmu7t/vn2hwos7tc8oGiopQmUe+I6dIRpSxs/IKIjn8y2EyaWCwHmSXl
         Q/s1lMODw9kePgXTL394LeX07R9zoPkiJ61Dc8C6ViyeMhTpUUTvu571j8Vs6/TK0B7k
         hDRzNqO6SVbotQ5w2aZLxNuoV5TZiaZyG5iN6FdI6aMmbFGpyMD1vy8s8R0a4wHF9tD1
         KhX4nz4vNZSKtNCF1KqxT1SqB/7F+aFwlY8rnUIP14rcOpMh/ukBkf8/HoYwbl8nAu03
         YZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102068; x=1775706868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h0IyBeCS0RIC8L0kumGdv7nrT1SM/aWdVx2fCYERunk=;
        b=Qnm2ijM+YHoIBcnth33E0Bq2s6eqjbRtLlbo97xup+YmdZa7y99KPGOW8PM6n1psBR
         THdRiWzozTgeJ9+lMersGBaCOoQn3wm7D5pGUBq4zstkRiEvfIz1tn4TiDcb39wIV8Yw
         2aZ7m5uO41DX6l1hxukXHQsomd+H+CEsbMJ9S1CMlIwaXYDxmWM1WwR/8gFXKwFULQBj
         lQF2fZulalhCVj4e+Xh2yaKgBktbPO8FmbZvS4UWkIiQ33K9lGV2BZyEPtDMbZ3IcmzL
         jJI/Tf1CM2dewstDB4b0urNNvwiaigQjTYsnWirxS3Y+u1iCbLOFECYB4X4riQf/7n89
         MRlg==
X-Forwarded-Encrypted: i=1; AJvYcCV10NszGEnM/FJeZko7OZucZOc7sboXzCYQx+3iy+aQaPYyBu2Vbo1qi5TweKXBTL/KVXZ2H8g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqk3N0YxvBIDa5dHevQ/gNW1mK2yB5RB/YtCeg9oRSzefly+tu
	LMDM8lVQa/2GcLUDm8olEw8TtbfXzEcJB3jA3GTWjGDwtzOwp6UcYxIR5EBX3W6g5Kl8+3zC4WO
	N810ifhyrGN/BbkAxf6yI4ClcjIabetdZd/m8CmzQ9WUoSMTPdMUAu9wH6QcF48X1Pw5G1IoG
X-Gm-Gg: ATEYQzzNHI6Jzw0pCn650hklw7dx1t9GW0/7xmjGE5iJ7WzXxVPkMfSYXfufjrWs+JS
	SkEm9vTMnmIb64H/W8VkhFqTOUYxzbtZ95FZd9RPZHYGcBCMjQplkTD/clOL9hmX6Mabt+20pHX
	CCbPDBKB9It0dMLrM27k4KEA7bXabVP7inMPVBSh3HUfvo4KT6SPp7XGkJnjxH1Cj+M3Cn515R3
	7y+H/vraOZWHsCzh1almlL6ezuxNNgGhPLgVwAqSFBtEHKWf9lBAip84G8Ep8lmjcXy1WU3MzGS
	VKA0igcIFhlVsauc6ByYoKWVdAIHRopgU4TYjTqoWf165LYo31FPAVYKBRhcubxZaPLp2r+TgJp
	oFAQrRk2zVTWKlOucepBgA9I9csS1mmuFYsb6RQ7QOOcaysQPO29HWeNLki0Fa1FNA5NRR3or0+
	QVajIeToHKEZ/K3dQJiCPHD/buzvN22RmDFK74G/s=
X-Received: by 2002:aa7:88ca:0:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-82ce86be17dmr7041555b3a.0.1775102067567;
        Wed, 01 Apr 2026 20:54:27 -0700 (PDT)
X-Received: by 2002:aa7:88ca:0:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-82ce86be17dmr7041527b3a.0.1775102067106;
        Wed, 01 Apr 2026 20:54:27 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:26 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:01 +0530
Subject: [PATCH ath-next v4 3/6] wifi: ath12k: add ath12k_hw_version_map
 entry for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-3-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69cde874 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=V2VgLR5doq-8DBhT5hEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: eryrNnwSYo909WlgTy5TmF2Yvwl2t8PS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX+a/kEyDw2P8Y
 SOXGATV4FLRKf1Z473P6eySNLx1r9t6usTrT2D8veBf9FVn3ZkGjBSm8sCvx/kCPx9dnSyGKsVW
 8ra1Ti49x8QLb0OBgQ2agMPgrIIXKjWG1aJYu/NVRwS05bXtuyRvnloORvHxrn/rjmJr/zaLSe/
 b3lNKoqa6xULrnRFh7r6Dmx+wWOZmjfAR6PsywTL2XThdzrXux2GEqCmt04XWL/zFip674cz8tR
 P443mWZackp9u+vUL+oBvj6SY5hYFJzkicidWIinjoQvMggZrBVcjm2e3c9Wf5kPRVlOO1xS9GI
 uWR6l7FRE8+CFsUrAl/YzSboRT1uMND+3q9Gi8Rza4ypHr2/tK7dBdZVcKuhVJeUkxdNZaLL7b7
 4191Dce2jz8qvyoOKSjJ4Nk8w4bCMg7e7hhdzXXWgWKqQLkZLVKvy6Wi49V3T8yyd+RGVQR/Fo8
 hnyMwYeaa9XlLDDYZFg==
X-Proofpoint-ORIG-GUID: eryrNnwSYo909WlgTy5TmF2Yvwl2t8PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205428_997226_946403BC 
X-CRM114-Status: GOOD (  11.48  )
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

Add a new ath12k_hw_version_map entry for the AHB based WiFi 7 device
IPQ5424.

Reuse most of the ath12k_hw_version_map fields such as hal_ops,
hal_desc_sz, tcl_to_wbm_rbm_map, and hal_params from IPQ5332. The
register addresses differ on IPQ5424, hence set hw_regs temporarily
to NULL and populated it in a subsequent patch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index bd1753ca0db6..c2cc99a83f09 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -50,6 +50,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_wcn7850,
 		.hw_regs = &qcc2072_regs,
 	},
+	[ATH12K_HW_IPQ5424_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = NULL,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)

-- 
2.34.1


