Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02D7CDB479
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rC2n29l+e+U5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=; b=HdcW8/kHtNj6AwxlwqMsYddCBB
	gI+w8XqrbMWt6ug1Q54jXJtVSmds+eZFNvycAz358phHCCURTCLBuY3fq9w9lW/GPxCYdqG4mg/zp
	AomZynnTpF6AzTqTP9+DlYtV2paYmyXxgUZoY9v3/nAXqZu7CezsUvLg4kXCYaxt0Dpft77IiUem4
	YsZFB27fEt6q9Lo3X3lKdREYFJmac44CQAiWJIcXmzTsvOMVmQhhovsxLsqhuCPDGCRhFfe3b9R1K
	rLDdy95NXs7jYiFxSCFmqUvNuTrhov8bcY9+gKm0UMWHVpUOK+jOInYUS5ZGgWX9Fc7x5q2RjOHPJ
	Tuj+LqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYu-00000007Bic-2Nuz;
	Wed, 24 Jun 2026 05:54:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYr-00000007BfZ-2QCs
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 05:54:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1T92N1398559
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rC2n29l+e+U
	5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=; b=VKnngYezdjUbg89jvhh14MuxEKg
	T1u4c70YMymFF1F5/uhEjBmdrWwVm7uguVAj/abv18prOHcwcFPbdm2PZ1X9/pMe
	D0jJN7h/mboAVwAGd4uwLCYpyqNhawFmcvKK8rJT6aKpCxMc4NReYYiKsxounxfR
	jgIESvF97B84onhq/RJgRVTZfuFq7/UkVX8mi+TIhreZsA9MIYPXxV4J4hAT1JVi
	u9SOqZQ12WXmpMICY9kesNB657oTT0iILw+ClRfz5USn+ypItyNXPMiaq6G8H8S/
	gLhW3237ZGBja1ivUG70D2B1JokduILiP1W5AdfX1r6xB7VvQ2LqQ81RkQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aq8qtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b982ec338so931093a91.0
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 22:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782280448; x=1782885248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC2n29l+e+U5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=;
        b=HmabblaQgkbqQWg9Dk04YmUnQaPFzJIP0whH1QUAy6qUJ8qc9+SnzUFAgqCtij9fv3
         bVTJaTois6CbYleFOaNmQxNe/wNmIkiEM6PYYJE/jSFkrErolDrWV2gnbWjryUIF2u+S
         zz8iOpJzkSzaGNsuVDF3r3e1PlNUPipRzTDP9v/zYEqXHLlqgADf2B75W7TiqGoWClsK
         rrT76FgTiqu7gNmj5OKSvsLA8ykHgAYLHoSDYwSiXGd35366zI5r8c7B1hLQTVC2UFZn
         +cprvJluUPCpH46bnUTyHnJbvqH/Pd7LPlV6yHJrtcv1DiNBQSkJE91NddzqoXEhPOxD
         e8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782280448; x=1782885248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rC2n29l+e+U5R273pH7NXFGAsfPxPHZc2q/3DT0Y/gc=;
        b=dPs0U0OJk3RTJvgvQPMW4QJHh0+C2aWvzUA5dkUyguNjiqzMYWy6vOG6ZpIWgXXHfH
         N08/Gtvrr5/Y4RhW/n6/Hkx1KPPLYqTZZKY86Cjq8D0y/BSSGvZd+05k+2mCedaxexOH
         xcIecTPW0bap9oAWn3nHr3bh5BZBqrmn/U0DOZnwYHWyR5W6XZ4ZldVwUXcuHfy+2DQD
         WzdJNDY8+Lbmrr4uFkdxVxBxZLcSjVYrgPUauwtgWN7Po6c9cb7WSOvCQrAK45cDVmd3
         vG2U08oop+qENR0X4k6077oDymVktQ1HpEN+/7drn4m4e285Et/22JP4JugpUUjaOtT9
         21LQ==
X-Gm-Message-State: AOJu0Yy+Yi6sMpfv1OxTNhBf+mhEUAaex3Yoft/Wgn3oQSO9zgnSHcGS
	zjIh85ei11wZHYwSx9ll/MwmwVxynCiTUw+EXZPzhoVT38Lvpw/E1MDR/EQ0BPcKEfE7ta48vFb
	R72FJSM78vQbcgIwptTuavp1CT8+xO0cESYdMhZbeCeZ3zXC7eeW8HjkuSH4uowbSafk6mmo=
X-Gm-Gg: AfdE7cmeFA6Qpw2wNxpFOP4Oj3YPZ2CK8GTuU4JsNGDR1btcoQC6ROBVECliR4JSXtc
	Yq78RSVbBjyOtIoZGPKAu5lAq2B9Z1aTKBtvl3XtHr5vXsnicTn39WEngnVLrO3okaZQj2cy9Yv
	3Ukvjg8lHwsYTBKzH2LSuJ/IGMTYCpDULdSAF6mTDS8PiqQS0oYNpTIrPsIhLnJb8+hZP2urG5T
	zHQbg2CVRY9IG2KpLWfAht488fGsP+gPf4r0uUK0hr7hHYYhpPAlR2NI+zhHnf80eh+/LtTnmjx
	Pq12GOVra6RyWctNexGLWybh6AhaA1kQZAasJfZG9D3EkwyqUf0y3fx41WUfFgnQIbigV41vCXR
	b4ZXuicwZhyrYtWtFJJiebwiBQm3QA0dJBR33ieT5IvjpzjuTmEmFMsZVCwc49HcLWcQcA9YmcI
	59lslVFMmYlALM+vpgTM3UH1U3z8B6mGZy20dH
X-Received: by 2002:a17:902:e80d:b0:2c6:f350:e89e with SMTP id d9443c01a7336-2c7e14af599mr20494515ad.20.1782280447619;
        Tue, 23 Jun 2026 22:54:07 -0700 (PDT)
X-Received: by 2002:a17:902:e80d:b0:2c6:f350:e89e with SMTP id d9443c01a7336-2c7e14af599mr20494405ad.20.1782280447143;
        Tue, 23 Jun 2026 22:54:07 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86aesm122593895ad.49.2026.06.23.22.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:54:06 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next 3/3] wifi: ath12k: Show per-radio center freq in dp stats
Date: Wed, 24 Jun 2026 11:23:57 +0530
Message-Id: <20260624055357.196596-4-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX1h61JiPFc8ck
 7guSuIPWIeRZeNPvCnsc8vdFlncMiJ/dVGHWtDZF8Wn7x5iclUKIeQkThQqRB6OpHk/jhAyKKMP
 T9RdgQiXiGTrfZgnXdcRsZgrcFQkFCI=
X-Proofpoint-GUID: MQX0VJFH1FsWWi2Qhu-cnt-BzOu-tnLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX09vSQo5nN01U
 XR5ufLKVDIRknFzPFMwmZzRdY02ONa+zj6wE8D4DwpjFeaTIeuVIQcGTLnQuO8yCCTXLyWI+UgD
 7KH9c1KGB+DZXHllPQROwvmNqM0TSbtCTQBdVtauulKwT21IRv3VhaNNCj0L8wVpJl2d/IYDegC
 q+t30XrlpS5aXSaojpzfcS9c4i4BQaSM/XfMRBIWVqOxYtmPaaku0Ye9l9jAjiC34tVx7T/cABY
 CCUSZebnU9/dvfM+D5utR6GydjAWzcvuHVOH+RvnOeO5hDgso+ZQA1CevssWby2kM8k7kstY3Dg
 41fgcsQwvwk0zhWYL4pwNkuv5WyYFZ3AA9r1sfSghisl0Svy9O7g3GxjCrs37G8PEE/Zf0L8qvW
 2Qx2ONNOY7IAM5bMIZ3r4ttr/ZL+mg==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3b7100 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JlNIVIk9kHasGwjauWMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: MQX0VJFH1FsWWi2Qhu-cnt-BzOu-tnLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225409_887854_97F7B506 
X-CRM114-Status: GOOD (  14.13  )
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

Currently, the frequency on which each radio is operating
is not available in device_dp_stats. This information is
helpful in debugging the channel-specific throughput and
is available with iw/nl80211 dump.

Extend the device_dp_stats dump to display the center
frequency in the existing per-radio loop.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 57c213111259..d54995b7adb2 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1031,6 +1031,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
 	int len = 0, i, j, ret;
 	struct ath12k *ar;
+	u32 center_freq;
 	const int size = 4096;
 	static const char *rxdma_err[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX] = {
 		[HAL_REO_ENTR_RING_RXDMA_ECODE_OVERFLOW_ERR] = "Overflow",
@@ -1164,6 +1165,12 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ath12k_mac_get_ar_by_pdev_id(ab, DP_SW2HW_MACID(i));
 		if (ar) {
+			spin_lock_bh(&ar->data_lock);
+			center_freq = ar->rx_channel ? ar->rx_channel->center_freq : 0;
+			spin_unlock_bh(&ar->data_lock);
+			len += scnprintf(buf + len, size - len,
+					 "\nradio%d center_freq: %u\n",
+					 i, center_freq);
 			len += scnprintf(buf + len, size - len,
 					"\nradio%d tx_pending: %u\n", i,
 					atomic_read(&ar->dp.num_tx_pending));
-- 
2.34.1


