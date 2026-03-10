Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC8EB106F
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqcakmoHDuBBUbMmN3usT4bN+rL094zzXf0IoFNFqRY=; b=Nj18HdI/d59mCBIDcK1zol6NRM
	nFQQi8qzXGqPod7K8zkE7z4Eujf4u+rtQ2lhEUFLa25in6K5kBM5Cs3btff23NpL0rLyO/EAtS/J3
	JLPAJslb8kS7/ZiEsxBQT9YJy3E7Vy/43tyVKDDVC/zaHBIj/AfPFzFIikHTiMKSqKPFG94jSi5KS
	rt/6fFoBTxmxLjBoeNIyqbTRh+khy4h9z9Q4ZG8b4GBtbypVMXQwkV6M5JqkkWFuwyqPdceXZXJYb
	LlA8SgkQsa8FvkqWl6gm6HTJuM/I1VqsYgTAOhHUk6F+aEEh+pfj0DU/G31fOE7DqAUBXrxOhHq/6
	0HyG/SmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyoo-00000009m6U-2Dnc;
	Tue, 10 Mar 2026 15:16:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyol-00000009m5d-3nQS
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 15:16:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaSDw3295304
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqcakmoHDuBBUbMmN3usT4bN+rL094zzXf0IoFNFqRY=; b=KJmxE6TjokllmSpz
	LKM/hQLno0qsrIVXRl8bqQIAtpgRhqTmJPOlwVSzlthgU4Ard5o3ha244Ig1ZzRr
	XLkdBBNSqs+YKr9iEncSamQoc5J/2QsQA0LCNebsjGA4E3E4Tg2d2Zd5/AdIsfNL
	bliDT9aYD1bxQ/mrSE9tEkM4rEHF4qHwUXcgk7tfQki6H5mrU5YUU7IrU6u5IBa8
	boGxcDMHxOpp3bLrE6KI797V8cqYQRvGcAxLjpxFcumUUF1h7j7dSKkHP9BFZgLZ
	hQTZJ41SUkw2pThcxOUYfS5H5xNLfxHh9eo11FcL67OfsaERTnQq5l7r8Nx+4/ey
	JuJq7A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1msfen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 15:16:18 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-417015062ecso25807887fac.1
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773155778; x=1773760578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqcakmoHDuBBUbMmN3usT4bN+rL094zzXf0IoFNFqRY=;
        b=WX7Opyht9S0s/t813PwLPDpXUzkwZ/H4UczlDPVk47OV05enAjvgh5vHluV98P1GXi
         AnLd6PiOHd4YUrPw5yXL7/S1s9SusnVgHjmx66iDUwU0AtxQxu4W2ZxUyMohzGxnhGjP
         3zeixIPVFP+QZD/TqIey4ijE7eYf/umobVSZZVxuS278yaJCdlyTijdJ/yCCE//GDIlU
         AG7DF+Q/Ull8Pxod3d6cs0Bjr4pdEycWh26RRD5QsJpYADrzZIKviS3587H/YeKajAFh
         rUuxaOIk0ID4E9COpFsFPx8duw9UvdEGJZHrNjSo3X17uwVletg36GrZ59n4OmmqMSEk
         WhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155778; x=1773760578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bqcakmoHDuBBUbMmN3usT4bN+rL094zzXf0IoFNFqRY=;
        b=U6l5mBTU4MFCj1LlZUTq1qK33nEU2ZUWWZAiWJ/uQeaPgCKxHvJ9yohYpgaEwZk+8X
         /E23RQ/eT9qkQ1CMR4z8vXuLgVpEOg8jnehVPnOSzu5nAhGy6Ob2PxGemQKyGgHAZxMa
         kTQ8BfFPWi+zlEBr9/FjAhQTW7E7Kcruz6QuVMlMg20qsLvUiIWf9KPk+HeRq9KgndtI
         z73BqfQuqc1vtd91SPeHrAYTRkMhZ2ZCdPkzYtE8TD8x7xEWbFG5ISP7kL3MzmiZ0gzZ
         VAvggB/I+5dXnphApgjGpBNnV30mvVbU0VR3gCOXCH4HUngBEB3ooY1KscPdAd+C58uE
         Vv9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwCQhkaLxL5Gcgp/IoUyd7GSk1pyhaqaB0ekU/6fj1dQGqh55HLt/6JihpBRYaamPL91tSl+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1cZnbLssmHhVwh9vPfL/wdOOX9iM0bvyVj3rvar1PHrZHnXb
	6BEbvdbbwd57YpjE4etx2SFWRSYcyq2Tm+iaTaahghKEBoCwCVFiOfuWJaps9ji4Vh/rbRm0R1r
	JMC+aoqwNePKhTdPx0YZTlRhnUxJgDjJZ/nGyJgDegIlv7nj7yQpa6jcoFY2yXQ3V
X-Gm-Gg: ATEYQzx2s0Bse43JgjOgv+rFcAr66bdECQCcPIBSgSdQMV5hiGlK7bf6/jZ2mAljvtp
	lHnmKmZv5VlCr+ZWIztuZwDi6l4d75yddw5iXXB7FDDI9TIqV4NjZ0u3jprhvlb6N3dkc4sOMZK
	9xVwbrOhC6ZqoAUExUJBg/x+duILUhNWCJVwpyHYdzSgNmQcTDVPZcfPDghUPQGFRRJbFs4yBF4
	QizcCzYE3VxG97FVJdTMxLwP4vl2d7wN07seF7BKrfcH0P2CnOyL3bt3jRenp1bzmrmrZGM/J+W
	9/WIciiMBjzQxjeZDOl7XW6qCboMd2Fs210oBLncfUpUQGDhGobbHyZhw+fIfcaQ8vQAY9zIuLi
	xB4SI67cvL9MEXhheaYf514q4rhOjrjwKDFS2MFVoy73LpLWZYGqbvc9zLyV/57IXXYPdNbTeT5
	ce
X-Received: by 2002:a05:6871:288c:b0:409:bd2b:91a3 with SMTP id 586e51a60fabf-416e44a1f90mr9624375fac.32.1773155778207;
        Tue, 10 Mar 2026 08:16:18 -0700 (PDT)
X-Received: by 2002:a05:6871:288c:b0:409:bd2b:91a3 with SMTP id 586e51a60fabf-416e44a1f90mr9624353fac.32.1773155777763;
        Tue, 10 Mar 2026 08:16:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756dbc7afsm2714603fac.14.2026.03.10.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:16:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 08:16:13 -0700
Subject: [PATCH ath-next 2/2] wifi: ath12k: Remove unused DFS Unit Test
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-ath12k-unit-test-cleanup-v1-2-03e3df56f903@oss.qualcomm.com>
References: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
In-Reply-To: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b035c2 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bMVfQdeosIbDT_emMCAA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: uwkSs4aiSlWvSsnKfIKuDv0OIRn_lGOT
X-Proofpoint-GUID: uwkSs4aiSlWvSsnKfIKuDv0OIRn_lGOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzMiBTYWx0ZWRfXzEiaH/srPeSp
 aUkE4gJgCdj5M0Jax8GrlSHbERYhbysNa8FpYTcqiQRoXeBYKQrGSR+ZGHuqe0irtlPS5VVNYeg
 5AkbdKdBPsFpNkffHctKxGIu9f1VgrK6qwxnnBbyVMiKr1edPLs99q2OTMa5BEvD/EQXPRGoknG
 gSL40J8X4WOimYGwOF6PkIethnfN2Jm1AZDGqEzrFWxk86HmMFsKO+Hv+mXgbFHDraD8S2rIwdA
 hv6swNM3sMW8dCPh6HfRruJnge92lksomN9sn8ZmpHs0rSoQd/QGwCx1wW8fMLF2CyI700bwG0Q
 CPRI2X0yOj4866WTA5WCldkj8hSn7nNsDF1Fr7Ncg1KW6IPQ6hzEfPH3EMStTGHtmM4dPbPbsaH
 vKytQTOSHkwUF9b6jVQrHw7QAtn8wmJ6G/yosnJAKMxixe8Pl+fUp3ezXKFMv0E4C0WRXaY0D1Y
 CtbPNOAmJKsuJOPafUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_081620_091766_D614644C 
X-CRM114-Status: GOOD (  10.11  )
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

The following are unused, so remove them:
struct wmi_dfs_unit_test_arg
macro DFS_PHYERR_UNIT_TEST_CMD

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8d766dd5b304..5ba9b7d3a888 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4193,7 +4193,6 @@ struct wmi_addba_clear_resp_cmd {
 	struct ath12k_wmi_mac_addr_params peer_macaddr;
 } __packed;
 
-#define DFS_PHYERR_UNIT_TEST_CMD 0
 #define DFS_UNIT_TEST_MODULE	0x2b
 #define DFS_UNIT_TEST_TOKEN	0xAA
 
@@ -4204,12 +4203,6 @@ enum dfs_test_args_idx {
 	DFS_MAX_TEST_ARGS,
 };
 
-struct wmi_dfs_unit_test_arg {
-	u32 cmd_id;
-	u32 pdev_id;
-	u32 radar_param;
-};
-
 /* update if another test command requires more */
 #define WMI_UNIT_TEST_ARGS_MAX DFS_MAX_TEST_ARGS
 

-- 
2.43.0


