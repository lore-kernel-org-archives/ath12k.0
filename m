Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFE1CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=bPhOaLN41G1in/X3tbdfNkWYlA
	P1ZmLfSoOlyjDjEv+ujNlKRCFNuOOB3g7rDffqxhGrZNorJKLlaW7H3Yb0cScF5f9YlZxSEDiS4U8
	Qx5UHRIujuAaJ1jkn5nTPypjjseMhzh0TAO05CVTKT7YtNGOtRYsU6vpC2Git3ueJhoWe7Q9LIRmR
	14lr4amIX7Mk0b+Ocd8QBxQJIG4X1asATJQU0uc73C7p868dOh5bsINtP4kMwYQ8EFjWGqBYPJkam
	PDQtrPwkB5zoZ6n37vC78vMK2e9dhaSI4L4p+VFoQdSwQ6/yOP868OOYn+n/ZZSt8EkzV4yWHVIUv
	26Z470kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXC-00000001q5D-0oKf;
	Fri, 16 Oct 2026 03:23:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXA-00000001q2F-2bHR
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=fXSio6QLLLA06vGYdsrmx2m05/
	PNftlklv7q0fjZk44srDjjIvAAW86m5bfWNiDrhMy6tO6jQYyIcBX8nkZ79u14WxEVGC+tLFTZS8A
	S7VIBTl3/yPeO8rjJJafhUjqp9T1UGrwGkoCKmgE6TY8YOgWz8N+iLL/wV4I8/O9rkmkUqitB/516
	Ztp2vXFQfvQTTJTFSAM31IxhCqHnwmZyZJEZ46Gv2Mr7GAcSWbfN9y+h9GTwtmwEwwrDC2p9z47eL
	6EUEiw3+0o5xYP5bNCpXJNEUFrSFUZd4ERX/nepJmbG6KGembGbzka1Z3zOX5ZimIxUUUnLwTbGdI
	QJu5vugA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYX7-00000000fsi-0pn8
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:23:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1mrfR3202262
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=V9cQwHtG7H4kmGlb
	MMG+3KoQmqVOJgthF2mfGHDSw/qVwyXK/RjAsNZuq6QJQLvb2XeZ/NJfYycdG3KT
	wa3h0C3z3wIIHm6KNBpnvYx5pCK0pBPmTDhW5d5d3kgdiHVPKtloyhJvsukefiMK
	RqMcS86F0burvx/9qDvI3zOU89h01PIfganbNMIci4fRj7Nk4IoEU6RQtt1xgQcD
	pVczQGkdsNEzqopEt7iD4bavGk/HE4DkE0Ft61sI7iPZK4DUbGQjuTjUTeZnoQG9
	LQMZ5FDb06LeAxBAGtBPrj/4ObfSh63CLmavXDn+YiEWr+NzUpPSEW1hKEsK70mF
	IQnlSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39u2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so4049670eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120978; x=1792725778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=dQpdH9BcAxW1Ic+HR8WLVIVaxxK68rV+5dzZLHECE5afO7e/iXMQntIpCI9jmBTbly
         OmX/rcnIC1v6w6Xo31E+0oJ15nq462cTDS69rnEUaYzaEGkznJnU2TO/hCTqSkM/Vxx/
         sTnuX/V4Avx1LAGbmwGN5ASf7nKQ/qRZs6OWdUg/klAqV64S+rBdqD9NGOlVe6yqAV/5
         q5x/yaYn0mM6Hq8rBmXnCwtFYhHg6gr9gZmQIt3Tfl/wZ6wyIZKbd9j4O7H5TpP1t8y4
         qdil2Mk80l+SFPSZqhw6SIxbxVdCdkYjs26YQTgmLn9U1GFVpaKjGZwXPVEq5IQlwqyc
         ex7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120978; x=1792725778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=XpzJAGg7xsx+PVo/SfGxWG+MDgrQ80e1YVyUGOW5eHU2bugtWSbuvc2XMLRymlkH2e
         IBU66XEIToSPA5O+ab5lt0QtPzqq0JWhl3b4D9O+AHDjNlpLgQR4C76aLcKacT/Ij9DG
         cJHuwog7bbqa80iYUGNT+TpUpqR4gG8vbtqZtNx9E86qpCIqpar02z8gM7+oHWI0cj1T
         UL9CC0T9ixNEqjNIxaZYNKkH++bh2vb7uMn47Qkwyv7mMYFpIBRzHgJ5BQMvvsvpOzaw
         iKCV5hrud5KqVyez7OcuRF+jv46pYXeR96kGgfZvDWP02j26JvrrL+FbhzxJuR/h+9lB
         x7mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcPQfChd3fp9S/46dH7VIHK8DhDg5//aZYsOJkleNAVPKUpWLmwHuyr/M17/crE3c+9wHKiaA=@lists.infradead.org
X-Gm-Message-State: AFq9FYKupG5VTLVDwhyxbjL0NGVXSt/E6H02DeEG87wCfnABh3b7SYgk
	HPhhJ6hhiQ2RPR1Xvv4+nJSIvK3UMsMtiXSToRJDlwUP7Jn9dDDjMB961fP0Crb2yEzQDmclqjx
	4b4HnZ/RQF3h2ikF4jJshWS4FQBwURiTplzgnim0U/8aqtnwIMoQ1jonJ/uJFIxVd
X-Gm-Gg: AYBFou2T0i31GH8VRgqS2fk4npKWAoLtip5aG7ssrtIpAvQm4m4OFR6pbuiGgV+9ToT
	32AC6/ZreypR3D9J8nARFnbb1DVX0Tm/84+8WBufA8TnIGI39Z3blafnMbtTwn3/xsEI9r1+o6f
	DHImAfIGG3ZNaQw5YE3Put/LgMkmWlb91nhWXwzOczAECpQErcjgZ5ZARn/6X+PKKMe+6P6opWe
	ikfgEHda/F1LYnffI1qZAtq9GKu0htdsm2BJ30SmC5Ujg6WlsZTZhh97MvhlWJn+/qBn4DcKAQq
	kRPk7ixXoe+iJSaIA2Q1x2852K3Xt4bm4WpJ/7fsZIqjhCDGj32l/tJO853JXn8RKROP25uvEP7
	v3N6/ckXOSJTOrMJz/Q2oXauacGwDwh0UuCUbDGP30wWn6QnEynZNKU7QDIMCwIFi1JJd+p2I+s
	NCkuYG9OcAJztRzwr4Rqa/wg==
X-Received: by 2002:a05:693c:20d1:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-35ce69632e9mr11810147eec.24.1792120978224;
        Thu, 15 Oct 2026 20:22:58 -0700 (PDT)
X-Received: by 2002:a05:693c:20d1:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-35ce69632e9mr11810126eec.24.1792120977713;
        Thu, 15 Oct 2026 20:22:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:57 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:52 +0530
Subject: [PATCH ath-next v2 15/17] wifi: ath12k: Derive QMI service
 instance ID per protection domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-15-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX4lEIwQFl9IKb
 WBeudFwci8P3xjRIBn6ZMkpis2lZhslTh1FNb3vCB1nPaDSD25i2usXGw54WmaL/JXQQObTLpyB
 LCcSjAkSU+qloZO5PIvmMBMRchOdG5yGAvHmE/9nL3Hg57RWN/hKyett03juq93CE1LKiye1QHD
 8hDy/FlxXsoJHJJMiK0F5+tfStR3ggIaxkHBrWch0bK2Y0zBZFP7XuuDB4chhebvHuPDi/wfFN2
 8eR692SM0UPHUJZnMhdMRB0LyRUHP2Dv8eHoTcOMZb3UtzKwo5mJqwio9GQk6fxloEvVysMPVX4
 Br7fjF8Cj3psnFTeneCqIDqEl6WNqBRVM1ssmMa5MCMlkH7FfcN8URHYU+MSlwlVkpwfuRvRbNU
 jmpwGiD6Dcdo8fKtydhJhOmFm2nVGnBFN+hNMSiQpe8ZM4JKhXti1UCMKDxC87b3x751MBUe9eh
 kRM0YvRPI6iFanEEqQw==
X-Proofpoint-GUID: w_QJaFS06m36a1vWi_hG2MrQi4RjFabg
X-Proofpoint-ORIG-GUID: w_QJaFS06m36a1vWi_hG2MrQi4RjFabg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8hYJA+AHzpdc
 tylADInCwxUs6A0xmq5MciEMM13yt4f8QpNbC7wbxqut++XhfHFxHUj9rfQlwBcA1JMwZ23n6vl
 WHSiIqqLnVfug3F7FSFWC84WTRfOEBQ=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad19893 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042301_924366_FEE19F5A 
X-CRM114-Status: GOOD (  11.53  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

IPQ5332 platform variants are supporting multiple Protection Domains
(PDs), each PD exposes its own instance of QMI services. The current
implementation uses a fixed qmi_service_ins_id from hw_params, which
results in multiple PDs sharing the same service instance ID.

Update ath12k_ahb_init_qmi_ce_config() to derive the QMI service
instance ID based on the user PD identifier. Offset the base
qmi_service_ins_id with (userpd_id - 1) to ensure each PD gets a
unique service instance.

This avoids QMI service instance conflicts and enables correct
operation on multi-PD targets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index b9ec14e86def..cecafc12e8a8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -567,12 +567,14 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
 	cfg->tgt_ce_len = ab->hw_params->target_ce_count;
 	cfg->tgt_ce = ab->hw_params->target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params->svc_to_ce_map;
-	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id +
+				 (ab_ahb->userpd_id - ATH12K_AHB_USERPD_ID_0);
 }
 
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)

-- 
2.34.1


