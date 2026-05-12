Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E45CD37BE
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 04:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7qw0Fy03F3odGqvlO/Dqk6ieb60Odj4xpF8aLqR5+0=; b=UlMisoO7Q38uk+vJJx3HXH6lgq
	ANe3HUkk3V5TXDdSEKZ/lkHkV3J/LBGkxe+yiFxkqeztDOI6qVZ42OYgm8dZ8DVWAzGwCeldJK4qV
	8nMzI9RPsIOP3o2mhJAQWmLtzPhAcU+QvDsxgTt5cf6GgZbg88ftqu5sGsacDVWNLoQ3wA0+SGvnG
	/TcLoQKneppo60O6mhO5XlTQA8mVh8C2Dr2Pc6dM6lqp4Tz7JyaiEgo+AkmL6UUO6CrDeMg+XB6PI
	vh67OfX8B/7kmpLNc0QSBLMJaIUhHsAMJH/bWJpvAR6r6LSHTV0wdEBChhByWeDdkgjdRBPz5IiG4
	13sz1XBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMf3d-0000000FViS-2ATb;
	Tue, 12 May 2026 04:49:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMf3a-0000000FVhb-3FLy
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 04:49:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6RCx1183967
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 04:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M7qw0Fy03F3
	odGqvlO/Dqk6ieb60Odj4xpF8aLqR5+0=; b=kBuMXMVBg/+vmLwQtJn5hmxkEYx
	q2qiSB0K9hjYjPoOH3vUgjsIfJfiiVTdLdKp/qGwznIkScW2LJgI1YHe4tCeZUGF
	l5xe+t7Dmpm7nSMB3plt8Rpw39ZXxCXfdrOdXV2UHDwX1zhk/jtriCGQ8aw8lQA+
	nXse2lTEu6Z6Rpukt9mUsSpUXvg/jyV4w6OEMzDaMKd4abnHcsFtXYk/JisLWfbh
	21BiAe5Mu9dTDhFpKm5QadMPscVWBqMfN3vM+oF9PXw6il6MO9WLTRz9kUD5TNrn
	l2gUUgajJ/2bYbgVGVwQt7bi7/wba7eQeok1MV8VyDwzLSE77/I6sr3FDbQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuy9gdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 04:49:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f2d983d109so5962827eec.0
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 21:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778561361; x=1779166161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7qw0Fy03F3odGqvlO/Dqk6ieb60Odj4xpF8aLqR5+0=;
        b=Yhftv3lnTfitMp4I1lsdLPLdWwi3I7qAx6jFl/QzQ5PURTuLyIQMggu+j6SgUbfmg8
         i8PYkkU5xWL+QtDLgN1RWSczHCraPZ9CZjcnEBAu8SoxrRSujTbsZZtBD9FdUw4cef2t
         sFizqrmhjYjYo53rKJQrxe1lLbqgc0EGArFAxQWg31v5dXqiQxFwK6HJqIWdHUc/xkvF
         WsJ3/mKc9+TFISfZpQEhqnvbnTGuwKyUxt12vGvWLabe/0NAFt4azUu7zwbApRhzUNFy
         e0KIOjspgptuFZAYxSGVnpk6OTAa7fkT3cCq+MG8RRHg6ZElUZLsjpfQx9QsVG0skHaZ
         VxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778561361; x=1779166161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7qw0Fy03F3odGqvlO/Dqk6ieb60Odj4xpF8aLqR5+0=;
        b=Mbf1DUgz/moE1e55R/ZUD8dRE5JUGKxFilkDfJg18SMFZgkxph/T2Zp3ATlQHlNroK
         +YtLwxN/i+PUsPuMJ4Zf/8kt50bOVp40dIQUI1HRIpnTRO1YKnorDhHD2FNMYMx69RmY
         qT8qwaBHhCd16v9w8POnFmM3gqnl7T9NJFe6I8AzkAHC7t6gaUCSP06hfuKsWbCe27G2
         9alygIwCH9EZWCGBDITwD9ClhPIvkZIGdWsKoA0+QHadoNAvBU0f+QVHChoY+GeA+ANp
         ks43W2gcFBCmRn9WVdTD1Vbyptd8BYMf7zqoInq/m2LjMKLzMHW80JZUPX7yIHSm8QtR
         5ILw==
X-Gm-Message-State: AOJu0YzIQMaTVi9FiLV4+5vEIaKnsyrapDuMBEWqKn5uPuk2dCuQUWdi
	fKCfAu+dG4BY5OYGtDIKkfjj77BppDbtkOXi3FxmgYXP/TjjuBkCBB5IbLXPurcung5guRd1JFn
	YEPT/xvTwQMP5IoN7saNgQ/G5x3WngKqKLlNtEofwY7RNEdPFBIUBhb4N87UWuW4M
X-Gm-Gg: Acq92OHzNKLsYeqPVP+NhFKK0LhJbaVlQqK3+UqidRBFG6ELVt3XUkf+/7+zr1BYk1K
	QSlAAlDr5b33dN3oSUxMcZH7iJDbQeKsfCtk3stWSI9feHvL6ZCDZ5hnobbH13HJ1ghhTUemDT1
	g1w/5FpqueIitUB4ROXVgpOQhPtPuHrLHoi66CNts0Oc0q92CJrK4a+1/a74BgWGDj+2fAw8Deg
	BvKthq8FUo3xYAVf4Mub8KPHpDmjC5JPVQPmTB68pyDRO5kUK4vdrfC4qA+/4KoDrQFPrz7RcgZ
	3KJWntl5oWrPXF3ClyTR6ZUc6Tu4xovJz3FUOshwsuP0gkoJyqgzE4RZKGG3i4ONIq8EdLiVd/L
	w1YMxjZyJf29vThXIztZmzoSfqzbesmiGsRdch/HSDSDC9pQfWO0VfpCSevdMgbnphlMdcH8mzO
	cGmw==
X-Received: by 2002:a05:7300:478e:b0:2dd:405f:89b3 with SMTP id 5a478bee46e88-2f858348089mr9746722eec.0.1778561361140;
        Mon, 11 May 2026 21:49:21 -0700 (PDT)
X-Received: by 2002:a05:7300:478e:b0:2dd:405f:89b3 with SMTP id 5a478bee46e88-2f858348089mr9746703eec.0.1778561360548;
        Mon, 11 May 2026 21:49:20 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm16032926eec.11.2026.05.11.21.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:49:20 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
Date: Mon, 11 May 2026 21:49:04 -0700
Message-ID: <20260512044906.1735821-2-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
References: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZfpKQD0zls5Km0tFMNSLdpIXXUm_c0lQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0MSBTYWx0ZWRfX6sBG3qLjPkq7
 tM/Fx1YuOxDT10V4A9kcy1Y/Yvbb6DpOmNOLlXGiugffHVOfuhoyPnNiZoOmcKHwNAuJPKVLmMP
 fNmm698N2Q4BsZbD5QvQCieA2n+NOxOPYBp4UEZ5hsgK8hNrDMrVV02V9MKnt+vASp0wiwoHvlT
 mABGwxjuInD0aYnP8EXEEk1C4/1bgW9E4k/Dd7HzisXguK5v4ULj3mYZ9M4z2HtGLgWTQ8hBdDz
 4DARCrcn3IrnaicQpKISW8IEAdRg6tD+QWJsygXB5nPYmCuHfbF+UYj7Bsf4R9dIildcOZnoFjE
 a4lE2SDomuGgQE/yQuBsG8MzqReoWHx6scc05WyTX14LRt1gTcA1sC78OxLJg09pGXAdyycEfW+
 MVw7w98Rf+Ge4oFXB3b+lHfkgWcktRWzdeGgT8lUf0x4Vf+Ku+ecieR0Z1A3y6bmGRQo4Brrcvs
 CLgA5IrDWolBs4rgldQ==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02b152 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZZFM_UldhxCcaClkVvkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ZfpKQD0zls5Km0tFMNSLdpIXXUm_c0lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_214922_817247_22767B78 
X-CRM114-Status: GOOD (  14.54  )
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

ath12k_mac_vdev_create() has three error path issues that leave arvif
in an inconsistent state:

1. When ath12k_wmi_vdev_create() fails, the function returns directly
   without clearing arvif->ar, which was already set before the WMI
   call. Subsequent code checking arvif->ar to determine vdev readiness
   will see a non-NULL value despite no vdev existing in firmware.

2. When ath12k_wmi_send_peer_delete_cmd() fails in err_peer_del, the
   code jumped to err: skipping the DP peer cleanup and vdev rollback,
   leaving num_created_vdevs, vdev maps and arvif list membership live.

3. When ath12k_wait_for_peer_delete_done() fails, the code jumped to
   err_vdev_del: skipping the DP peer cleanup.

Fix by changing the ath12k_wmi_vdev_create() failure to goto err instead
of returning directly, routing both err_peer_del failure paths through
err_dp_peer_del: for proper DP peer and vdev rollback, and consolidating
the arvif state cleanup at err:.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal for MLO")
Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2dc7dba53ec8..8f8456509468 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10290,7 +10290,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	if (ret) {
 		ath12k_warn(ab, "failed to create WMI vdev %d: %d\n",
 			    arvif->vdev_id, ret);
-		return ret;
+		goto err;
 	}
 
 	ar->num_created_vdevs++;
@@ -10437,13 +10437,13 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 		if (ret) {
 			ath12k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
 				    arvif->vdev_id, arvif->bssid);
-			goto err;
+			goto err_dp_peer_del;
 		}
 
 		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						       arvif->bssid);
 		if (ret)
-			goto err_vdev_del;
+			goto err_dp_peer_del;
 
 		ar->num_peers--;
 	}
@@ -10460,8 +10460,6 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 	ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
 	ar->num_created_vdevs--;
-	arvif->is_created = false;
-	arvif->ar = NULL;
 	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
 	ab->free_vdev_map |= 1LL << arvif->vdev_id;
 	ab->free_vdev_stats_id_map &= ~(1LL << arvif->vdev_stats_id);
@@ -10470,6 +10468,7 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 	spin_unlock_bh(&ar->data_lock);
 
 err:
+	arvif->is_created = false;
 	arvif->ar = NULL;
 	return ret;
 }
-- 
2.34.1


