Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEDDCE7AA3
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgyTWGbkbQVvLrWWo2qJSUt0tmq/uB9p5M5fSzftSUY=; b=dzVMw/VyMAfFTH8QBy9vcuq7M7
	KvP/j+T6O1+LAEk4tIOPtTljAIWOyEfyvjFyR5wqx6aeq87xanq4mDdaHQ+SMX38f4nDa2yDG5CEz
	WzQEjDwclJW7w1isplcYjE6yfyfhC09NlT06j3MePUvnpGERZ+FvoryHUr147e/xf6gCeJkBaK3t0
	LsP2miNBB9XWE3/i5QDmlN/usW4YuBkByhRV9LOKemcbhsif9jRpvZB9Q5f3J7/OzyXZn2qRGPX9e
	TwUFU/jQ2nzYTRLsIhkco8W0w+XGxMWNeA/14ephagwCKpaXlCDenlzX5FuYpTMDid9+Jn/GF69O0
	h16YzWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqx6-0000000C02u-32Y2;
	Fri, 14 Nov 2025 10:22:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqwz-0000000BzzE-2YDr
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 10:22:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Wcqt1485974
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 10:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgyTWGbkbQVvLrWWo2qJSUt0tmq/uB9p5M5fSzftSUY=; b=pzk/NxzsthTijrP9
	WMKucxELmsPsAyRm+UaQbb/CgpgX0T4Btr+EMDa2Rd/DF4XcIo0J1yY9+x0Sg2zF
	Jg0g2Rzj96G5zISRBgofX+D2ALM9havqbLSbabBvU/L9eLYk6+A4EyBfw1XNp/Sn
	dghMMScDWMSvCPSPO/zUgWWlxlGX4IMH8ZRXjtXf1RQeTK2MNqTswObqko55qwKl
	TUbGJGSfo56A+cT8J9kRks2/fx7ytB6dtrdsmidPWzjrDtmKqbhn/nqskN9wGrax
	JGFW/3fQFBbYmBTYEp1sEan5wnTPlysms2XkWu61W6O15Bpocbwwli74R3brDJ0F
	nS+8Zg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hssms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 10:22:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f3710070so51176755ad.2
        for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 02:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763115760; x=1763720560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgyTWGbkbQVvLrWWo2qJSUt0tmq/uB9p5M5fSzftSUY=;
        b=KsIsDibi/HJ9LuakHLUOi52+ki9zB0iDO6Z0Om2IPo3tZAqloTBDXZyv05B5E8VImu
         YanIALKPw2ZJab49NZLLkUjsVNWv70hIgM00WCFrFEZb+KsAPYPI9N2re5L066RKwVTa
         7T6uYTi1BDmqXWihzbU3M1kLE2eezvkdbjFseqeUvneEUYcEVK71uPNIkv6j55YcNp/M
         em9+VBk+r9pkqNoVA3oUMRyMrM1tBVmCdZqHVkyhat9ehfU4oWLnX7zZQJNqJoVQr5fx
         IgcdQBy3EtXWC6upHpjCznzMYwR1cKQ+A1vQCpM1qmR6CSAL1SLNJyqnDfCWIkhTytXV
         ElLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115760; x=1763720560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UgyTWGbkbQVvLrWWo2qJSUt0tmq/uB9p5M5fSzftSUY=;
        b=tB7GvSV+Y8KHuaQKyt1CHsBgdthXYjPDXNRaUQRj0i8B7M02AA+v4ReqmTTS4NI/iU
         euElTzgxq/kJ/8M0ndFfUBSWC3QPiqIDKqktaZYmMWLaOOCVy5wTU6px66f1CYi4oyrX
         4If0txQKMI0XNbIA7kpy10r+I3dC0+pPJROg30xHka4UtLpM4BJntKXPnDJ8VzfP7CE5
         qHa1eWzBQJV30gEgLTkR8pzLfyIF/zcTs/vU9iu9cHt4ROWnzL2WJJOCo3ENpaBgAix/
         bF4D0rNF97jW14WVWhhmyLxqYqErkvkdLbJyraJOpg/22JtmnTooRHr0mzEho0PcOYKn
         kk9A==
X-Forwarded-Encrypted: i=1; AJvYcCXoFnRHe8H7ay2RbYgnAwt7l4uZOE6wp3wY7RswGyROk46/6+HRqtNipXwzUFRzCCzUnF3RRf4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqFBbTL+JalSc+VmdHjhZviwQV+8/PdwHpzPKmg+Uq/lrWKWdC
	cWJgRAACJDuVWN7PVBSQsoTh+cwOe3ZYzd5iFKA6rCG1+NGu/HeCZoEY2KjP5qBZOkPVJr+SiXd
	lcxb6e3Afm4xt8UOhWkXzDfzOzQTwoHchTiG6+t+qHHPGYoZSKsWI5FhMwVRwR3ws
X-Gm-Gg: ASbGnctLjBCb3CPkEA12DvcXvbCVOVAjdwJDNTS/jLVRiwSY/S8joPv7bA/aiiQWrCE
	ltIv0VyC3+h1Ezf3Nf5Be3asgHccFpUpC7VMNYVK5e1XGkivP/cSbrCxTnf4Augcg9pVRToSDEe
	pSp2PVspgIfEj8DDWMdVCz+HxU4pP94LXjkUbMly0vLCKkr9/b08Q43NurQSS5bSKZmCc7I0Ss2
	XTWS0CjlNaXQxD0AnpF8pe3THueQ0BCFTsyEvvuDDy82sVmZELNKPu/18PrVZ4C8rm6DPlAvZOv
	FPKPIwo1EzxbmNdlU2Ut5C4tYR70/vBWUFRGrR3NymmKDMU+061EmR/AJ0NCCmEO9rwY8rmUOqy
	ZK30QE7xe6azweoR8eNejxqUE2efX
X-Received: by 2002:a17:903:2349:b0:298:5abe:4b1 with SMTP id d9443c01a7336-2986a76bc5fmr26587175ad.52.1763115759366;
        Fri, 14 Nov 2025 02:22:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+NJodpENh5gfXKO3wDwpoE6d1mGJnrqIto96tOBNteYm3rrkrIjPNrBF+fIwbuU/gyWQU6w==
X-Received: by 2002:a17:903:2349:b0:298:5abe:4b1 with SMTP id d9443c01a7336-2986a76bc5fmr26586925ad.52.1763115758812;
        Fri, 14 Nov 2025 02:22:38 -0800 (PST)
Received: from [192.168.1.102] ([120.60.77.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245edasm50883705ad.27.2025.11.14.02.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:22:38 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:52:19 +0530
Subject: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
In-Reply-To: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9048;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=cvW46ry7pIu7R0scHAtxGzfzExIsVr93GRnzo1DinzM=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGkXAt+gRDO6ct4MnDYCpj+7of6Rlq6JRvQD83YvuFDh1OlCx
 okBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJpFwLfAAoJEFWfEeb+kc71OnAH/jZj
 3GhZiZqzaHqWEyIiui5ye6ykDfO/Nw9NmHENl5f4Iov6+bW3OsekjVmUVUgdSl5K5Z8uymnY4R0
 UsjaxQ9/Txv6zu+6f+X+Dos5mlm9GQ8fp4vKmi6iWdYokl3GjVrL2w6n7rFuNO/lLeEIkyCljCG
 MSp5k1PopCLRc939o6GTE0v8owgSqdHy347NiPWwYitvvlCOYu13JMCwSEc6ICUGiBCo+DkZosC
 UaZRRkWKWyM4nefLEYVPpUmJ26+TMqMWZ/3VVzN9o89usYN/ySs8d42nvgb7pnHPLF2ncGHeux8
 15CI1wPpeyLYMf/roAaMAJdnem+4E3Av29NOepc=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: oVDTv6OKY70onUpCHjuSVu2UvEfE424O
X-Proofpoint-ORIG-GUID: oVDTv6OKY70onUpCHjuSVu2UvEfE424O
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=691702f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=9R49FEQIXN7mQozuOwW6cA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u1Wyjy0uBQZ4QtDYgmYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4MiBTYWx0ZWRfX7Rl6UwOF4ESF
 mpvN+BFEwt1PAbeCaficMHX0josm6D7BWReI7j3BEJJSARmCmbJoiJgEMCb3vcnj40NCIdX3djL
 vpPlW+Aghbx8ID7DFCcwFKoDjiNvJd/3UHlaOyXef57Xifje7g09C0DhHbRNRF6SfB3yKFryshz
 MmPIMqyGNIlFwMkOdgVgCfQdVFe5r6ZnwNJLLD+s3d/4E07Mk0smYoCOUypZI8qUfLXYkx4Km7D
 C3knQzUkiO9XH8y5+n6Mv5WXiCeCn1Pv1XiisCT/P1GSlqjbia6cKZ2EzuPBPis5f4zS/KSe6tM
 MTwB/dEq5BYhMkQowYvUeHq7L2EY0fnDbeTQNs5nB2RfiuAj11Ti2K9UFbb9QQp5q8LMFwZ0+8o
 VcdRySTUda70xgpxF0s2JZcsrESdIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_022243_185260_FCB6A3A8 
X-CRM114-Status: GOOD (  18.49  )
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

On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
'qcom,*calibration-variant' property to select the correct calibration data
for device variants with colliding IDs.

But this property based selection has its own downside that it needs to be
added to the devicetree node of the WLAN device, especially for PCI based
devices. Currently, the users/vendors are forced to hardcode this property
in the PCI device node. If a different device need to be attached to the
slot, then the devicetree node also has to be changed. This approach is not
scalable and creates a bad user experience.

To get rid of this requirement, this commit introduces a static calibration
variant table ath_calib_variant_table[], consisting of the platform model
and the calibration variant for all upstream supported devices. The entries
of this table are derived from the upstream DTS files.

The newly introduced helper, ath_get_calib_variant() will parse the model
name from devicetree and use it to do the variant lookup during runtime. If
the platform model name doesn't match, it will fallback to the devicetree
property based lookup.

Going forward, the devicetree based lookup will be deprecated and this
table will be used exclusively for devices connected to the devicetree
based host platforms.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath.h         | 98 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.c |  5 ++
 drivers/net/wireless/ath/ath11k/core.c |  7 +++
 3 files changed, 110 insertions(+)

diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
index 34654f710d8a1e63f65a47d4602e2035262a4d9e..d0a12151b7fc13355161c48ba1fb200e4617ed11 100644
--- a/drivers/net/wireless/ath/ath.h
+++ b/drivers/net/wireless/ath/ath.h
@@ -21,6 +21,7 @@
 #include <linux/skbuff.h>
 #include <linux/if_ether.h>
 #include <linux/spinlock.h>
+#include <linux/of.h>
 #include <net/mac80211.h>
 
 /*
@@ -336,4 +337,101 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
 	return ath_bus_type_strings[bustype];
 }
 
+static const struct __ath_calib_variant_table {
+	const char *machine;
+	const char *variant;
+} ath_calib_variant_table[] = {
+	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
+	{ "8devices Jalapeno", "8devices-Jalapeno" },
+	{ "Google cozmo board", "GO_COZMO" },
+	{ "Google damu board", "GO_DAMU" },
+	{ "Google fennel sku1 board", "GO_FENNEL" },
+	{ "Google fennel sku6 board", "GO_FENNEL" },
+	{ "Google fennel sku7 board", "GO_FENNEL" },
+	{ "Google fennel14 sku2 board", "GO_FENNEL14" },
+	{ "Google fennel14 sku0 board", "GO_FENNEL14" },
+	{ "Google juniper sku16 board", "GO_JUNIPER" },
+	{ "Google makomo sku0 board", "GO_FENNEL14" },
+	{ "Google makomo sku1 board", "GO_FENNEL14" },
+	{ "MediaTek kakadu board sku22", "GO_KAKADU" },
+	{ "MediaTek kakadu board", "GO_KAKADU" },
+	{ "Google katsu board", "GO_KATSU" },
+	{ "Google katsu sku38 board", "GO_KATSU" },
+	{ "MediaTek kodama sku16 board", "GO_KODAMA" },
+	{ "MediaTek kodama sku272 board", "GO_KODAMA" },
+	{ "MediaTek kodama sku288 board", "GO_KODAMA" },
+	{ "MediaTek kodama sku32 board", "GO_KODAMA" },
+	{ "MediaTek krane sku0 board", "LE_Krane" },
+	{ "MediaTek krane sku176 board", "LE_Krane" },
+	{ "Qualcomm Technologies, Inc. Lemans Ride Rev3", "QC_SA8775P_Ride" },
+	{ "Qualcomm Technologies, Inc. Lemans Ride", "QC_SA8775P_Ride" },
+	{ "Qualcomm SA8775P Ride Rev3", "QC_SA8775P_Ride" },
+	{ "Qualcomm SA8775P Ride", "QC_SA8775P_Ride" },
+	{ "Lenovo Miix 630", "Lenovo_Miix630" },
+	{ "Fairphone 5", "Fairphone_5" },
+	{ "Qualcomm Technologies, Inc. QCM6490 IDP", "Qualcomm_qcm6490idp" },
+	{ "SHIFT SHIFTphone 8", "SHIFTphone_8" },
+	{ "Qualcomm Technologies, Inc. QCS615 Ride", "QC_QCS615_Ride" },
+	{ "Qualcomm Technologies, Inc. Robotics RB3gen2", "Qualcomm_rb3gen2" },
+	{ "Qualcomm Technologies, Inc. Robotics RB1", "Thundercomm_RB1" },
+	{ "Qualcomm Technologies, Inc. QRB4210 RB2", "Thundercomm_RB2" },
+	{ "Google Homestar (rev2)", "GO_HOMESTAR" },
+	{ "Google Homestar (rev3)", "GO_HOMESTAR" },
+	{ "Google Homestar (rev4+)", "GO_HOMESTAR" },
+	{ "Google Kingoftown", "GO_KINGOFTOWN" },
+	{ "Google Lazor Limozeen without Touchscreen (rev10+)", "GO_LAZOR" },
+	{ "Google Lazor Limozeen without Touchscreen (rev5 - rev8)", "GO_LAZOR" },
+	{ "Google Lazor Limozeen without Touchscreen (rev9)", "GO_LAZOR" },
+	{ "Google Lazor Limozeen (rev10+)", "GO_LAZOR" },
+	{ "Google Lazor Limozeen (rev4 - rev8)", "GO_LAZOR" },
+	{ "Google Lazor Limozeen (rev9)", "GO_LAZOR" },
+	{ "Google Lazor (rev1 - 2)", "GO_LAZOR" },
+	{ "Google Lazor (rev10+) with KB Backlight", "GO_LAZOR" },
+	{ "Google Lazor (rev10+) with LTE", "GO_LAZOR" },
+	{ "Google Lazor (rev10+)", "GO_LAZOR" },
+	{ "Google Lazor (rev3 - 8) with KB Backlight", "GO_LAZOR" },
+	{ "Google Lazor (rev3 - 8) with LTE", "GO_LAZOR" },
+	{ "Google Lazor (rev3 - 8)", "GO_LAZOR" },
+	{ "Google Lazor (rev9) with KB Backlight", "GO_LAZOR" },
+	{ "Google Lazor (rev9) with LTE", "GO_LAZOR" },
+	{ "Google Lazor (rev9)", "GO_LAZOR" },
+	{ "Google Pazquel (Parade,LTE)", "GO_PAZQUEL360" },
+	{ "Google Pazquel (Parade,WIFI-only)", "GO_PAZQUEL360" },
+	{ "Google Pompom (rev1)", "GO_POMPOM" },
+	{ "Google Pompom (rev2)", "GO_POMPOM" },
+	{ "Google Pompom (rev3+)", "GO_POMPOM" },
+	{ "Google Wormdingler rev1+ (BOE, rt5682s)", "GO_WORMDINGLER" },
+	{ "Google Wormdingler rev1+ BOE panel board", "GO_WORMDINGLER" },
+	{ "Google Wormdingler rev1+ (INX, rt5682s)", "GO_WORMDINGLER" },
+	{ "Google Wormdingler rev1+ INX panel board", "GO_WORMDINGLER" },
+	{ "Qualcomm SC8280XP CRD", "QC_8280XP_CRD" },
+	{ "Lenovo ThinkPad X13s", "LE_X13S" },
+	{ "Microsoft Surface Pro 9 5G", "MS_SP9_5G" },
+	{ "Windows Dev Kit 2023", "MS_Volterra" },
+	{ "Inforce 6560 Single Board Computer", "Inforce_IFC6560" },
+	{ "Thundercomm Dragonboard 845c", "Thundercomm_DB845C" },
+	{ "Qualcomm Technologies, Inc. SDM845 MTP", "Qualcomm_sdm845mtp" },
+	{ "Lenovo Yoga C630", "Lenovo_C630" },
+	{ "F(x)tec Pro1X (QX1050)", "Fxtec_QX1050" },
+	{ "Lenovo Tab P11", "Lenovo_P11" },
+	{ "Qualcomm Technologies, Inc. SM8150 HDK", "Qualcomm_sm8150hdk" },
+	{ "Xiaomi Mi Pad 5 Pro (BOE)", "Xiaomi_Pad_5Pro" },
+	{ "Xiaomi Mi Pad 5 Pro (CSOT)", "Xiaomi_Pad_5Pro" },
+	{ "ASUS Zenbook A14 (UX3407QA)", "UX3407Q" },
+	{ "Google Scarlet", "GO_DUMO" },
+	{ /* Sentinel */ }
+};
+
+static inline const char *ath_get_calib_variant(void)
+{
+	const struct __ath_calib_variant_table *entry = ath_calib_variant_table;
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	const char *model = of_get_property(root, "model", NULL);
+
+	while ((entry->machine) && strcmp(entry->machine, model))
+		entry++;
+
+	return entry->machine ? entry->variant : NULL;
+}
+
 #endif /* ATH_H */
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6ffcf8eb56621ba0e4978ac23e696..099b8592d50bfac37c54dee7b0aa660ac126a410 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1161,6 +1161,10 @@ int ath10k_core_check_dt(struct ath10k *ar)
 	struct device_node *node;
 	const char *variant = NULL;
 
+	variant = ath_get_calib_variant();
+	if (variant)
+		goto copy_variant;
+
 	node = ar->dev->of_node;
 	if (!node)
 		return -ENOENT;
@@ -1173,6 +1177,7 @@ int ath10k_core_check_dt(struct ath10k *ar)
 	if (!variant)
 		return -ENODATA;
 
+copy_variant:
 	if (strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext)) < 0)
 		ath10k_dbg(ar, ATH10K_DBG_BOOT,
 			   "bdf variant string is longer than the buffer can accommodate (variant: %s)\n",
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2810752260f2f7eee226f88d5aea7cdabe7e9ed4..2db067d6357c8848ede7384ec4a615ca22282650 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -20,6 +20,8 @@
 #include "wow.h"
 #include "fw.h"
 
+#include "../ath.h"
+
 unsigned int ath11k_debug_mask;
 EXPORT_SYMBOL(ath11k_debug_mask);
 module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
@@ -1362,6 +1364,10 @@ int ath11k_core_check_dt(struct ath11k_base *ab)
 	const char *variant = NULL;
 	struct device_node *node;
 
+	variant = ath_get_calib_variant();
+	if (variant)
+		goto copy_variant;
+
 	node = ab->dev->of_node;
 	if (!node)
 		return -ENOENT;
@@ -1374,6 +1380,7 @@ int ath11k_core_check_dt(struct ath11k_base *ab)
 	if (!variant)
 		return -ENODATA;
 
+copy_variant:
 	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
 		ath11k_dbg(ab, ATH11K_DBG_BOOT,
 			   "bdf variant string is longer than the buffer can accommodate (variant: %s)\n",

-- 
2.48.1


