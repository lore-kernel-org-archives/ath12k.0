Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27456C369C2
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA1lrpT9l+o2pnM4sMy4XwztzBfcvCUtl1XzLmQjkgc=; b=JF3h8b2opyoAL7g5Mn4Xv/4fwg
	4pH62aUHfd6nnjkKWEhqdiZP811tGYeAhPNQ3SZaKaO5fQNrz8RL3fIGC6sfxB+gPlvx0LsjMcwPv
	fKr3Qs3WHEmTMDkxM9E1TNQTsWQOvPsEX7LfG/cvvibvR0uNWc8S7Id4IxeUhOZsG4fD8vSThLuLx
	Mk+UuwxsZZjH+CmNp5AgKMoOobwYBdELrvOMaMwHkb0QU8Zqzed8pYbsERxw7tEVa0cJ8NmuThSEZ
	qok7wZ5DFbpVL2Kjwka+xACQ2r0pNVgSphorVj0YB3pYQhnp+BbI2zoB9hsCLbHiJ95yK6lb5o7es
	Y6m5NE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0Z-00000003SEq-3n5L;
	Mon, 21 Apr 2025 02:35:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0X-00000003SBn-0T8e
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMSmB1015741
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GA1lrpT9l+o
	2pnM4sMy4XwztzBfcvCUtl1XzLmQjkgc=; b=GcI3AIdt71etcO9hXv+5EFOmpKV
	CMnwlFtoX8Bz8ZFU2M9kwSBh+ZlFC2RMYU3sUHb1r0Kf49rNHC511wOzZUAUomdR
	iAJqYDZpr6905r9L4QarLlB12al/P9Sz6gU/iE41mQ70sZToDCRcxiMmp4ORkgox
	CltAaEH++uH7ZUi0Rx7l+cHVfVm7Ilz3nIrzh1uX8kCCh/pdfX1RpLjZ3lzpavJ9
	l+//FYCZbO0jZ4A5rETj5pWVepj8ph+LbWCglvw3aqlUlnc+3+htU8aCUwDZsP8U
	Iq46Qv6WDRqXD3E+aStv0MI9VVfshtjKbnl6L28zVRyJ8QAB/b8A/m286KA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svau33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242f3fd213so31432595ad.1
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202940; x=1745807740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GA1lrpT9l+o2pnM4sMy4XwztzBfcvCUtl1XzLmQjkgc=;
        b=iBm73MmfBA2XT/TZg/V6jOOeulzmoN3rUTPfM9Xkg0RLHs178IN7a0MZI/KcgiYXGd
         5yQ7YjdeEv856qKLif7fYlQr1KMPOmXFtjkE4/EmSyHUpCecb2Xk90JXumk7e/g8GsQh
         SWEhlIdFPuNsvoauyDXlIcs4OsSVAW6xgiRmjnV65bPYd5jezh6HFWy4l9a+k/1Pymr2
         9hLsiuRs0OzhxDgwy2JF8FH6oPJFJDXpYz2Rgh+NejVKRuWwMEJLHKrieNYayAyjPfXv
         sElMouoavp555FGy2j1XZJrSgeqEi2Hw6+sOdxW3biuNq2qGY6wQPwhzY6brWNekGqaC
         vfOw==
X-Gm-Message-State: AOJu0YxiuH4YiZdSBPG8Z6uPV1MEzjB2rBdUQSaTEqDejWi8dREtKbWG
	/8xOTrB/SM5ZhiSmaYlm5UFwa+tu5nT4nZFUR6t/7SIEiQLX0+vyMM4Mb169yoKZLmZ7rmY0/ad
	zFO1Vv11fr/8k+Jq3l9cbtBA54YQ+a76kwbEI8T0hiH6t6b7hw+OwVeWnU8HsqbarBs5tZY8=
X-Gm-Gg: ASbGncvbHflEwziFpWVH7Klv1qlMZeaFpep3SNnjSjrzywDoBzvKX5Idnq5lTen+Lti
	nH8YYVWG/CoHRMo5lX7Vga0ue+eTdffffboEQGnuvCk8mhL6E/4y3ffFIeLVao233KuBgqY30wL
	bnsBf/eJv1dYln8SyR7oUUq6KTE72zMSmoQ9059VohHvIqYF+UikaGQHs476jQDeIF2KGqAUwet
	PBej3/8bItDV7Sq5VRUtBSh0L6SCpBDlVMJSu9PRVHo/DYnS1sZCbtYpxlorXCj5jsfwyi6OfJD
	Z9VwFmDt+zgNTqHwI1/u98hC2tZUuoQ+UoIb3gPpZqW+5hYuyQO7wWSMBeBj4JROOxU8VVdq8Z2
	6WvbkK56oIHI=
X-Received: by 2002:a17:902:da88:b0:229:1717:882a with SMTP id d9443c01a7336-22c5337a225mr157585095ad.4.1745202939815;
        Sun, 20 Apr 2025 19:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdLl7lCQqDVDymY6ITzNYTFiSixMKbu9+gmtkXWRPhTpOEw7BGtsDW4aEhlFZUweVOzRjm6A==
X-Received: by 2002:a17:902:da88:b0:229:1717:882a with SMTP id d9443c01a7336-22c5337a225mr157584925ad.4.1745202939499;
        Sun, 20 Apr 2025 19:35:39 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:39 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 13/13] wifi: ath12k: enable monitor mode for WCN7850
Date: Mon, 21 Apr 2025 10:34:44 +0800
Message-Id: <20250421023444.1778-14-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cLoenqYQXE3dQqVCBicYj6OX6OGa_1N5
X-Proofpoint-ORIG-GUID: cLoenqYQXE3dQqVCBicYj6OX6OGa_1N5
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6805aefc cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VG1Z7HIe-OYZGDrRaVgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193541_154500_79D7FECE 
X-CRM114-Status: GOOD (  12.65  )
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

Enable monitor mode for WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 482b0f4e8f95..7e2cf0fb2085 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1380,7 +1380,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 				   BIT(NL80211_IFTYPE_P2P_DEVICE) |
 				   BIT(NL80211_IFTYPE_P2P_CLIENT) |
 				   BIT(NL80211_IFTYPE_P2P_GO),
-		.supports_monitor = false,
+		.supports_monitor = true,
 
 		.idle_ps = true,
 		.download_calib = false,
-- 
2.34.1


