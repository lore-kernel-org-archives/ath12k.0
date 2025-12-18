Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EACD68BCC
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSFNXmm0LtiuYvbIDgNIlZ919rAec+/ZE2zBI470eJY=; b=kmNLOk+BTSfVKkjbq31DoRcOkI
	8BaDD5qG81WjStjz41r+0s0eBbmNvFY7gQuelMed0TIH9dRuBduRNrcFgMyLggVYIb/4MT66omw6W
	9ZxjNnlrdauLDBHnpGpYuqP00k2vduLO+zww7jKDrEzhY3n8Qv531ROa1iIFh/jjPXnVo9qeMI+/w
	ZgeQuBdaMCbGC+VRiEdfEvjia9p4Vmh4bha7l1FZd7EafoJo9kTHBduZF4fCNd1QXG7+uLUWKJZUH
	e65NWCqmT49/DRV0zJW6VWsST4P3nAF3A5xcEy9Rp/oEpqT1nL5fDSXwNBPhOu72/zTqjAidn7yIe
	bLogLk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ea-00000007fos-3xEE;
	Thu, 18 Dec 2025 01:55:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3EY-00000007fnL-1T0v
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YwLP3717306
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSFNXmm0LtiuYvbIDgNIlZ919rAec+/ZE2zBI470eJY=; b=jetQ57GZPGMFMJDr
	oWcSBs8DMl5ssBkXT438p/53k/fVjL2BZfaqVT1uEOHCkh6pD4hUxDgxhhWDdkeK
	Hz475B397ijybHs06HRq4bcdDKOU7PjnO9hMARQErNFNJQmkL2lm176AQnT2Q83v
	D4H1CG8eDItKlnEgPgZzxUMDXuPTkxdEAemjElcKvm+9QpYJdnljw5K6OMgUBfac
	p5UOnE8qg1Io/5EH60SeovIgkk0Bvhkcvf+ncegW6IOiLYhdvUEQpeIKqqSi78BL
	6EZ3NbHfcv1A4Qi5cRNzhxcxwA+cGkX4Bke0+lBnIBgrUWMYAoWCLOrPlfDHkKiS
	fITIxw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79as9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso1777495ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022913; x=1766627713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSFNXmm0LtiuYvbIDgNIlZ919rAec+/ZE2zBI470eJY=;
        b=Xiu7Ffj9kylbshkfbIrKGnoz6NnN+w9ThrUAW7IqrDIaLtzBQYPti//ptGdGUl1wcG
         UOTx4KSdIvpTw8ZnExlH2eWtEUaAVe4NUimsbUJHGnTef+FN/uMUvwc5LP3JTqhl6bw8
         sFSP1A29oBhI/NHv8JBLlOFZArFvyaEXJlGFSiFBVap9vXN8wLlLumiigZ4Bj07Mp7v5
         JyBcGhcvjgDsIGN/Lu641rlHql6RIv/LL2ogiyOlczwMzZXepu3PCyY/DH6dFiT46wj0
         z/foeTwxEKbIyXcZXzjkhH1FhDJoSWqru2TJZe/Td8Q1ag7dctiE9PSSrQbVGXBK2j9R
         ELvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022913; x=1766627713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSFNXmm0LtiuYvbIDgNIlZ919rAec+/ZE2zBI470eJY=;
        b=rBZTph85cM8174aOgAr4dtS1z1tf1C9IBfm2uSC9ZZkpRNIItWcPAjCNTSXpHOD5Hn
         PGjqehPf8FGgxGsokFIgJuxQoyNH5lumuEOIiogkwMcPEhbS9+stGWxBfF3AY6Ouq0/R
         rxMaR/0TkxZ2pE7kXC/mAT7wXtGj++JxKxDLhZD3XDPazgQnr5Vsy3Ahi6E9KmEhKex6
         r2vM4IhJ0QqkxhqzOZl3PQ568r3+d8cAk6PTw+azhjb5HesOYAwYGdT2//SpmQwR6UFm
         hDl9BXLAE+mu1TYz6AmIYTQNNecrB0tBR1ITxB4pd6sZfXmNqs9DB4I6dAkygmCwJuh+
         VGFg==
X-Forwarded-Encrypted: i=1; AJvYcCXEPFuRtokqu9R6xejidThoXpQ3gWFnSdRkpzJTuKSKwDfo/+mJzNJe845ZLy58lGbIbUCITl4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKPCTMnPKhR6qXa6d6zuAufeHywYKacd6v25YOdm8H5iIy6x7U
	rVeZqlFt5njFST5IQfKCSqwGYprH17h1wDGKnqgso3ZiWFIAYtCypS0s44wcpLWS7pQ727qVMPZ
	wb39WWG8Z3OfNK4EcVh6kz8KcbMa3u4W9hj1h5S7TH0+niBoAsFww1jHNL6iJcv7p2ib8awwj6y
	g=
X-Gm-Gg: AY/fxX74uk4jBQoaQ3scdaWRRiRLTSQ09cFhjV3TuGCa9BcMHu7HFJZxSjXCGV08qed
	5iQ3tjbIMXY9gPRWNOgXQfzUN9+lp+afcMAUwmp8BuN8CNHjU8G5XRSWhFYzuz0gtOdC+BAgKJV
	pcjcEJtr0P+Uy4frlD7kp/AWJJ0qpd4SePMOfixhdXNF9ilsKdxq/sLIvynkkw50p+PxRkW2d0Y
	LKj1eFr/vPCm5BfebaFiUnf1ovc4m8Nv8jPv2N2VknM7isrUH9gloDt3VBfDVS1LZG+kWt+iE5W
	TI9c5R2Mv6nvrcLjC7BMz99dGfdR7nel+S1wQ8+f4ZjvDZDI6BQqGDgqPvJh2Rf6ZINJi9f/PQ1
	AuHhNt5up1iCoFpGEHBs2DLmJDZlzD0bsdH6iv6d6VGRJvRDKvUoQXEZ7FEKilOs=
X-Received: by 2002:a17:903:388d:b0:29d:9f5a:e0d1 with SMTP id d9443c01a7336-29f23e70d05mr211542755ad.27.1766022912902;
        Wed, 17 Dec 2025 17:55:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2fG0SxSh7MPfQcvIoBJd6bn8zGv3anKRrLDdDQSdfsSGlMi/5nF5b3CvxiXl3RyooODfiHw==
X-Received: by 2002:a17:903:388d:b0:29d:9f5a:e0d1 with SMTP id d9443c01a7336-29f23e70d05mr211542545ad.27.1766022912446;
        Wed, 17 Dec 2025 17:55:12 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:12 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:18 +0800
Subject: [PATCH ath-next 04/19] wifi: ath12k: fix preferred hardware mode
 calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-4-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: f3DXvNK8Kio31GRzweK8iLBypslDZhRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXytNgaD9QmGWv
 o3yM4RwoOgGJMhO6mhIhuIn59Eyp9x28aogxld+eqr236EO3Hw/C9iIDhb2xB0ZnoeWPXjO/sBC
 ivSMOeaKl0OceKOHb6Rg+vXYxqOZkMANSPfcdUuRce4JPF0nSIxT22X3ZcqShnks0bEO45OiuAf
 UBytUPBt4f90oJOMQjX8gZYdStI+zmwJNmd60a+27ooy+KPHpgbKdJvxho5MqPuiGuNtvu/5lsc
 F5n9OXEcRn12iXJ/AunRR2T2v29dfsoIJZbWysntFtKxf8dg2HKCXP+9Kd/n8y9FcVbsAhTSU6+
 v8dvrHCbLM03cOnzp8FSCSw0RkEPp6IzUnJdMuqTVHOntcw0c4vGv4wYC2NWLqCq001Kf3IZnMx
 pPyGlD+Q7TDztT8draubPLU6y20esw==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69435f02 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zY3FkhqSlrVAWUjZaU8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: f3DXvNK8Kio31GRzweK8iLBypslDZhRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175514_400240_603BE4FF 
X-CRM114-Status: GOOD (  15.49  )
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

For single pdev device like WCN7850/QCC2072, preferred_hw_mode is
initialized to WMI_HOST_HW_MODE_SINGLE. Later when firmware sends
supported modes to host, each mode is compared with the initial one
and if the priority of the new mode is higher, update the parameter
and store mode capability.

For WCN7850, this does not result in issue, as one of the supported
mode indeed has a higher priority. However the only available mode of
QCC2072 at this stage is WMI_HOST_HW_MODE_SINGLE, which fails the
comparison, hence mode capability is not stored. Subsequently driver
initialization fails.

Fix it by accepting a mode with the same priority.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 150b04d0a21c..ce2bbf6acb4a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4449,7 +4449,7 @@ static int ath12k_wmi_hw_mode_caps(struct ath12k_base *soc,
 
 		pref = soc->wmi_ab.preferred_hw_mode;
 
-		if (ath12k_hw_mode_pri_map[mode] < ath12k_hw_mode_pri_map[pref]) {
+		if (ath12k_hw_mode_pri_map[mode] <= ath12k_hw_mode_pri_map[pref]) {
 			svc_rdy_ext->pref_hw_mode_caps = *hw_mode_caps;
 			soc->wmi_ab.preferred_hw_mode = mode;
 		}

-- 
2.25.1


