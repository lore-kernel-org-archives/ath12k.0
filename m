Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B156C53200
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hru35mpumEbkOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=; b=UICj2YLkewTdVLAkHCJ4lpL30d
	51jUofM4AQ8S8YtuH0qq+BhG5Bei11+tgfbqrn0odZYRx2XitkHTF2w/5wIKPTj+o+WuYFY7ZOpA7
	DUnujNYnKX5kqYJXP1R9S34ZD1wjuuSkRryg2VqbBHXs98CSFIp6VmCJLhIvr8wpsmqYvdGWEAHkA
	y2j0ltDVM8L83x+zbPDJ7q0wnSMnIPNLnB0L4fs+K/IwazemP23rorN4Ss+9N4U9zI7Q8JA7bEW56
	11PsresoC97MDM0APfix+c/1JOBtbZ+92ekZb3FrHjBI5yFkjfjoScQsBTHnYWx4L2dRNfgnLq1I5
	t31kVmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD8-00000009D9q-3fWY;
	Thu, 30 Jul 2026 01:05:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD7-00000009D89-1IyC
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:05:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0x8GB3487157
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hru35mpumEb
	kOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=; b=G8aZRNGaf7yQm8jK6VNifzlUbCH
	VEQw5yKfkBonyTfiH5RX8F2nplDfIjkWwiiydqPLvZAjfJciBvceugVVeccTX0f2
	XRFic0g5lbXsCtEYEmZhtp36V2U4cfbepZVEFoON8vOKFwabHXCbXUwrwwQBhbOW
	o7FNBjP0RW1MRee0lGXHoGB8n8MpKJkeBuEdKhP8K25Xl716f3b7nt114xNju32e
	8K3Ivv2SSgRmWfmWzsyVZEqUmJx7pnPMgB5X/wezQnj6M+cdmoUBszOyEDjziVSQ
	QkPxbD8fAGXfcr1VTpsVnkJXh6in9K5UC2avDHXDUm0O7fbBKX3CLcwKaSQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqvj580hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so231759b3a.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785373519; x=1785978319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hru35mpumEbkOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=;
        b=LZweeRvr9F5Ia5RYJ9A4DGP5bTPb25yjgcRA14z1lm9qDkOYTVru/42SzDpnnJI7rr
         +g+cSQG+Q2ZQ23k1+xJ6Cwn+ru+C4J7POsnmhvqHhrsFYU2haWsCCb2Kawzox5T646lN
         xPg7qVvznJqdROJjmiHxXym8LYbpsRDiJTATeGS7bXKMkkp1IwRSlYXhDyLFOzs/B15Z
         Zjd6+iE9JoNZe86UXqajoKMySbK3//tF0rk+Dkm5nEge7SUBCja4b+oBdJq42douH2/j
         6wOznuZbfKIBoh1eu3wNLBdkN8+garH0jJveSYQibhgb96u0ldcq2jfVSkSXcFYmx+CV
         sphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785373519; x=1785978319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hru35mpumEbkOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=;
        b=s3Mh2EdKkUpVYDhlDuE0yN/Y7LAc314CKut7zkah1Hl725A6ewJx18idwaYadJ4yjm
         ysV9+4BfR4RZYVRq7GxyM61Yk3V1+JaxrYNDymF13qBK8dNw128dSiAIaEsHo+vEbSLz
         +R1stf96TFQm0MwOEgSUw9RqJ+c4OPccfVLzHgxMYg5qjxBULP+F3kqpVptfQE9OYOpa
         4hdF2oRLtLbUTn1NWyJzDAp6JzgjP4craK38s475YS/0KCl904QqXGDpEREoFApWDeaF
         um6wK4xC4EGgxMX5actuqb4cJoXpmcVbGPeKyP1O/MuCaao8NtEPxEd6JHbO5WfFqNwO
         DtzQ==
X-Gm-Message-State: AOJu0YxlNSvxzCd6PP99N5e3lGV9IcoeuH4wYSTHrFOG2+3oE/xsSrAk
	gSRiTivhpYxDXNHf24cARlDEwFpxIbggK8WKix9qLBcM4yF3c8r0dB/d2DySx/DptV3H7yP3dPX
	Dyd3VDMJg30M2F334mbrP5NshTxF9f1kpmsEwWC7d6xDuLZ+UnFOmrg7qPEWRchA6
X-Gm-Gg: AR+sD13aGvv09LtXiPjFvv/h1RS5K1nLi0S2/uEnEBc+8ovlgO3TT296T2y7IGaO6uZ
	OB7eFuvKZcnvnvtWPtzywdaOpfLCj6Wu99XuUrUDEbaA2eTcyznhFvvj7S6FTodiixINc5mb/DF
	UH7hFjy442ds4WUzF3rU6WPdOy0e16NtkoFGluv13pHr+TWO4pPqorVTm4G95TTe5GTi7NWxkbo
	ngEDj3C5vyf6ZUmLTw9AR1c95HqHgGz/+johBA4nSAikAtuEKzNklTKy04gDQPyZmr1ZJf1daVv
	51aswk9aCvi2OL1sVDdxMa5KQZiJauCr81I0WmqxixjYd/wNo5y7t1TV//o+3wr33hVuEzc10Et
	2Uf54biGpB80rOF8eY/hvNZCknxW6kGuURShDwbKjUWcskL7fOLryLLHXhbY=
X-Received: by 2002:a05:6a00:748c:b0:848:3576:3204 with SMTP id d2e1a72fcca58-84ebdf47d90mr157929b3a.34.1785373519080;
        Wed, 29 Jul 2026 18:05:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:748c:b0:848:3576:3204 with SMTP id d2e1a72fcca58-84ebdf47d90mr157896b3a.34.1785373518582;
        Wed, 29 Jul 2026 18:05:18 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2168563b3a.11.2026.07.29.18.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 18:05:18 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current 3/3] wifi: ath11k: unregister PM notifier on QMI init failure path
Date: Thu, 30 Jul 2026 09:05:05 +0800
Message-Id: <20260730010505.143458-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
References: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwMyBTYWx0ZWRfX2oJgkN+BYV1n
 YifkR1y8PxPmkzBm7J4zN7AwVqDSi8bGxziLNjJwHW8snKaDJAr587xBiRmUHglyC92WSHigSte
 z+oUMt13VtOdAGA6Lk0pRfxbqZ21dBH0jZ4wAZ8IByaXlORpcDhvTNTJVAp9jrqkp4tMU5C/pCA
 wLtuVp1wLpFvlt5TPq3TCgm8HuGEBbT/PFNbUfVOOBfAbNpG+PKPN0CO0JndxSZ42eeNidg+Ijj
 Tm+d9t/qZ39AOduYsS7oGPGduW0tssMHbC6TuVYTvPopvjNlygBt+nEdy+iqnZxr6Kz7zbdOvoz
 T2c0eGrBE1IkADllnW5E1PNFBuhXo1+G37Qie2PH/I6Tf5da3EIb8r9MlnEpFIhuNaPmqBALEou
 N/Gf8uwePwnEpwumSyVjUlbcDzloRoo8kLkjidkTkQxLvrgl8I52WvJpoTQAAqrtrHKnt1oroMr
 BxWHGD4un4yh6skE3ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwMyBTYWx0ZWRfX5P+7nlYuQZdQ
 OJRh67rnEWgD3ksOxuhTO9PwP/eu/y76xu/8W2qI5UTepY0p3I+QYkvNrkXfI173DfGZWOJfNI2
 NQ778RFRp9rlahB1aiYCZcAjF8a2z/k=
X-Proofpoint-GUID: z2kswSG32IsMTFQ_XqYfukqp3wfFyraE
X-Proofpoint-ORIG-GUID: z2kswSG32IsMTFQ_XqYfukqp3wfFyraE
X-Authority-Analysis: v=2.4 cv=UcVhjqSN c=1 sm=1 tr=0 ts=6a6aa350 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FJAr2BPrIL5JYYbaf3kA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_180521_474100_4115D8AC 
X-CRM114-Status: GOOD (  12.26  )
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

ath11k_core_init() registers a PM notifier before the QMI server
becomes available. If the QMI server never arrives, the device remove()
path can take the early-exit path introduced for QMI initialization
failures, skipping ath11k_core_deinit().

As a result, the PM notifier remains registered after the ath11k base
object has been freed. A subsequent suspend or resume event may invoke
the stale notifier and trigger a use-after-free.

Fix this by explicitly unregistering the PM notifier in the QMI failure
cleanup path before releasing ath11k resources.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7f5f5c8d7c56..bdb8c99f10fa 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1272,6 +1272,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 		ath11k_ahb_power_down(ab, false);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
+		ath11k_core_pm_notifier_unregister(ab);
 		goto qmi_fail;
 	}
 
-- 
2.34.1


