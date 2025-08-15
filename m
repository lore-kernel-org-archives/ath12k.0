Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2804ACA0EE4
	for <ath12k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=; b=nbRqFSxMYApvOQ8LFDr7wyxp6+
	m6nPL/7eiwpkXjVbgC8q8ytV3+9CTfgZPMDkB9831t7TC6jSL0+SorkJWcne8u3CTBseg1Hhfadd+
	Pg4CSTIZlIPaaJSLxM0HRiJCa2s7/zGH80lipwIpapgED9oJxN/vIzB5rHtHE+od68v+IK2NFmYYB
	7DFH020UVt4MLdCnRqjFci5CxXYyhAyEfNLHmRyrkrOxDGEbFKm7oxxGRHYJAL06n+46Aq+p3Y1AL
	Xa0QB+C/2MBEXYJt89ftfmBebcXRvYPjMDp8K/M4gJ/yM7oyP7Sm9eq5ucdSNf0khZOqqoxIO++Bj
	Z4PN9oFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVg-000000013cP-3sdg;
	Fri, 15 Aug 2025 01:45:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVf-000000013bk-42o0
	for ath12k@bombadil.infradead.org;
	Fri, 15 Aug 2025 01:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=; b=MdxNu+5RNmwMb3v/IPTtlpRjlD
	dXU56zb8o6d7/p6ScvkJcpppoyP4CefxlNL/BQlUP9yNLztHDh5j6xRsJq0w+Y51M4A8/aVUUVmR/
	PkZwjYy4AbG1q1A+Sc+7Gj7sX7RujHN6NLgm0MPrpazuoSpRpI4v7OfkBp7KGWNfa7fWn86yM+vzN
	V8JL8ugdUG8pyf8O9jKhq7M7qaONKaT+cOnSupFDCD8TE28GwwARpt6Y1uD7inyuKUN/in/ZWowOk
	kibiAGg/K/owIAPIDQRjKTsA+7foine1AYn84XcpjjNursI3x4XwSKk0O/1wpFV8aQCqt75DVdM/x
	MKE6rWuQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVZ-0000000GaYf-18cE
	for ath12k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EImO5O023986
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=; b=EgSM5PxS9S52676e
	gr39z/Y+zJqcax4+6Mu1IB5gYTTb30zEpnXeH/97wK9CWV9UrxxC2wNIhtVhHUet
	MReBct0n4WQlCksmNam2iwpdckpnjTH7QN2b9AfyhcTfh1tvE19Z5fYLwuC94rzO
	lBaRSxDcpXDwALplPpCYMcxFKojrTwycsK7tq5iCYuOVtpS0mflrBe33M/+UyL13
	TqOkJjiH3XmxJQp5Pz3l/84Ncl8Lq5sefQSgwN1dR0yu4Tg+HBg46Ln9MAQ7IcrV
	hSN4GnUHqfq6DR8gF8eA6MWUyOxACkeI5RH3OiKy1oPwTasHxDkFHLHGwwsC8tQ6
	R7Tiuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rxa5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-323267c0292so1496368a91.1
        for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222322; x=1755827122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=;
        b=nDUmXAd5uEn43DN3uA/rOTJRuL7QWr54VKoY1zQcD0FAv+fgI8gU10v8MdUWsPwCFS
         2z+JcGqnchwc5qYyZzAKwgA3uKlgHPlvHDuymFh5arVW+IxviyP2wF729DXSRPDSRuzt
         HmZKnDng+o0AiXKFGjHL5AGFf7LwjANfZbsaNfoJSO8NmMaDC9Uy5mOVDXrcq65rEl4n
         y87UOq609JdrITEQE2zZlXvj/SumWEvb+BicKKp6ZJPYG17NH53aFM8p0XEu+IBs8QXM
         +ak+C+ALYAyl7PuSsnxFybOxXzxOeBaHh50he/mNN6GV1BYnmRRdt/VP7pzRMC+dNZwv
         FRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8AWwbw9+K+hjnWqmfIcP3mjJgQNP35g0ciPhVWu7eT0G4NLbRcJjD9hY4KXFUDLtduCxjt2g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfgW7qw6xMtVHDIh7CHDVnRu/4587qWzEwKnyn6GZA5PPrY3hr
	p1EmjXSkeRE8w7c56S4MRiJwibgh5/w1AZY92tD3aLvzwW1pVfBF2KJ0GqvTtIwyZnmLXcm+Dy+
	h85lgmyXMJln104Am6ZQL54iNfCc4+oFPzWeqxU/dXRx36M7ywcIawS9ERal1B3rl
X-Gm-Gg: ASbGncu3npAO/3a0ulXspjv4sClCLYLlOY0nx2tqgNZCOZs9FVTru3yJzDbybGc5A96
	uswIEQ2jI8wofKOJuU3MZq8NesOzVcXURgaNvaY7dZ+LAvcMjvpsM1+tODwEH7qvyceFplUKVpp
	OaSs5AHoWGEydO4X/bc7IXywmPXjYGabFIH1Rba0yjjmoVJ7VmVY37256m8PluvyqE3JcFBhbyG
	XgQhiHB/HSNLujJMqUL4xZoXvu2XgXU+NnkG6XcvA8FMoVYQfF75m8ppUCpgIxmy2iRI79hshpS
	KFBKEArCfWm5EUPTc3y3vIx5YoDaY6N8M0QDgHbeBgvkot9n8hfgVnKFUDSHV8btV/Pln8MfclP
	cKq+ifYnlkDBrUwaK
X-Received: by 2002:a17:90b:2542:b0:31f:150:e045 with SMTP id 98e67ed59e1d1-3234224bd01mr480278a91.32.1755222321520;
        Thu, 14 Aug 2025 18:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp4WB24m89Yhcn0ioUDH1nUmYAvdRLnZOaTdAnGSAHnM7xxPbWq3Z6LhNQhmBtmQrugKO+wg==
X-Received: by 2002:a17:90b:2542:b0:31f:150:e045 with SMTP id 98e67ed59e1d1-3234224bd01mr480246a91.32.1755222321004;
        Thu, 14 Aug 2025 18:45:21 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:20 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:44:57 +0800
Subject: [PATCH ath-next 2/3] wifi: ath12k: fix wrong logging ID used for
 CE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-2-f955ddc3ba7a@oss.qualcomm.com>
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX/zzMkX9WW27X
 4PtQ+zkY1niNemhwwyBue1MRfpMVJG2sK3EzdTSj/97/lK0b4hDCNLI06Yrs3sLUPYirr5uHbye
 EEMtiUMbSZO25PvcGxZELiidOPvXLuFle/Cr0piwve2a75JpkM/U5k7saPs3MMTcs/ANnplx40B
 Im06V3fxPU11K8QM+IaU9d4G9WdRrnywUZbhsvss8IE8TF6pho76et2U/yonHnpkwqAe1RC5u9r
 3uELkSE4KGrJBpFk6Ti6KBwe59GdAha+eWKjpUWk2V7NmaUbeXDc0K98bqLWSlW35VgprauAKeo
 2gVMpRAtcXMZ0zh4Uit2aY+eDd/GqrQ3u+KY8XE/vfa7L6Uggnvx8WiD7Wp6taVruvtKLnQnzcp
 mEO9g8Mf
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689e9132 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fHvqFdtNKkU2r1BsT3EA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 2pFTzN5NU5L5izHC-NU3et93yTqaDTtB
X-Proofpoint-GUID: 2pFTzN5NU5L5izHC-NU3et93yTqaDTtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_024530_384101_4BA201C9 
X-CRM114-Status: GOOD (  13.40  )
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

ATH12K_DBG_AHB is used for CE logging which is not proper. Add
ATH12K_DBG_CE and replace ATH12K_DBG_AHB with it.

Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c    | 2 +-
 drivers/net/wireless/ath/ath12k/debug.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index f93a419abf65ec6e9b31e22c78c8c2cdd7bdbc76..c5aadbc6367ce0d18080bb0e15a88d3ddf2e34ff 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -478,7 +478,7 @@ static void ath12k_ce_recv_process_cb(struct ath12k_ce_pipe *pipe)
 	}
 
 	while ((skb = __skb_dequeue(&list))) {
-		ath12k_dbg(ab, ATH12K_DBG_AHB, "rx ce pipe %d len %d\n",
+		ath12k_dbg(ab, ATH12K_DBG_CE, "rx ce pipe %d len %d\n",
 			   pipe->pipe_num, skb->len);
 		pipe->recv_cb(ab, skb);
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index 48916e4e1f6014055bbd56d5c71ef9182c78f3b6..bf254e43a68d08f97171d9baffd0ebc3aabfb3e4 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -26,6 +26,7 @@ enum ath12k_debug_mask {
 	ATH12K_DBG_DP_TX	= 0x00002000,
 	ATH12K_DBG_DP_RX	= 0x00004000,
 	ATH12K_DBG_WOW		= 0x00008000,
+	ATH12K_DBG_CE		= 0x00010000,
 	ATH12K_DBG_ANY		= 0xffffffff,
 };
 

-- 
2.25.1


