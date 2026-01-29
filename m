Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB159D46C19
	for <ath12k@archiver.kernel.org>; Thu, 29 Jan 2026 02:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pY13GG9DO1zh5OeFJun0oKXROykALiQB3J38i+zIA6Q=; b=PRqu98nHpBtZ1ON4IIGXz3y4hO
	YxWNpAhxQB3WG5JoZuZF3fmAFxCBv9vRKq0sls3spBLZtmSbquQcsFb1oDOq4hydAe2EJEzL40apY
	V8kaZdV64vpR2C/d65e8QDzU6Xc/vNnTPXtEvRquJFfjdr+QtkjG/4zzZDr7oImeuJpyuE+5b9G7o
	sJyK3Mf3/s4iLqq3d1A9YzBpb7KtV+PJyteZTkzoEXw9gpSxNmEKa20sHg05GBd12/cdmKI+aYkDC
	f9Qo/1Uqj9a4BZs2ojRgTwvzW2RGqMNpUK2xGRyU2k0jEjkvjLOrvXRhi/IDFd7bYXQOPke3EHLVt
	7muF535Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHhr-0000000H7fb-2Yx3;
	Thu, 29 Jan 2026 02:24:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHho-0000000H7f3-2Rfr
	for ath12k@lists.infradead.org;
	Thu, 29 Jan 2026 02:24:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH2oRj801375
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY13GG9DO1zh5OeFJun0oKXROykALiQB3J38i+zIA6Q=; b=aqb/MqtydqLSOvSe
	LT9y4aprlaU3zwOc8p0a5TtoZOE8NccCyA//1McL1j3b/pUo8UaB2kVGrdGe9h/s
	CXeDLexydqP542UZgUpE3giyCu8K7Yscyd2WF9r0j1f95iVIdpXX3lmDoqE/1nFz
	dsizTAssVqFap8q+KwwhN4Y2Ffv92oWxWRpZ1Ru/fV5RfWwHmSxDByW3JC4kh+hy
	XUtoTWb0etybeaYgcsf8i2gOZScS43Jk/1RJnz27D2k05nKs7eISZlM4XhcMt9jY
	U2M4E8hTdkuvlKUsTqHKv0S288EexuRMG2Ze61eNwR0jIlwRYspJLH3gng8zNhLm
	Ib52pA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrhjvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:24:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6328so10491605ad.2
        for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 18:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769653463; x=1770258263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pY13GG9DO1zh5OeFJun0oKXROykALiQB3J38i+zIA6Q=;
        b=Ae+7xiYqDYiWvsQzJUIVVzVG5oAAJK7scm/v9MJGbXdERxBlKHooyMyAz3Ad5p9Dkk
         g2Mq8BVrvD5skvRMal8d4Za2EU9vAhAUJqfLr4qaUyniAoYTRtjmiANAXyiUTkQ5fj/a
         gNvla1NH0E9YxKmN1DW4R4/kUx3ea6iakHXlKRrQxzpFh1qXbrusX2fa7tNgZQGJyJW6
         c8E8MBUODd4FVwKShIlTABLTqO93Bys3zQlDLUROu8s4JWEm/CWG6YLbVQ6MECzU8XaL
         jyudOCw+i//BkJQQ1/V0q4LKyNabdIdPOxJvbngS4x1vyb3Qc11/TXLFwwC5aF079Bdy
         k7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653463; x=1770258263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pY13GG9DO1zh5OeFJun0oKXROykALiQB3J38i+zIA6Q=;
        b=iXO49piTmW5RmrIkge26uRC90D2HzLZhFnWxRv9rWbG7HV0ka19a28tYTABCxA/V69
         DHxXZL1s+s+npyam6nELB/zl9r8Nh8rSy+MXkVbMd4CEnOvE/VtbSPnx64TcWMsFs2+c
         8UVdXA2/n6fzmC14x14adEdgozSxJxrLz919HuIKJUi8wSUoVO3Cu/4vPWQcARwE208I
         NjD0qHfKHL8u0ugLsmx7oOk32ctEZE05hPES2VzitKymrcW7ZPu8kXoKuYHrmC2wiHY4
         JrtYxD0loigx8PDW4pxEd1u6Mn+S8Qr3HRQisTXc3st2Ew9C4XIj09G5DwlOksrIltBU
         8ZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8CPwmSzoJsV3cJVxzQQSymq49BPqA/dKNVKRpyoaG7iOAiNuwYmuOHXLnoMhcPaX8BmAUZfQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcoJGtXkAsdpejNthto9SWU0LdxVsPJ1ElrB2sSyvBOn4PTHgS
	doS35oIekWcVAsZTraOmFOT2p6Dx6R+d1BU3tIKR0CLVPaMImMkytWFq78bgYXDioJHfBMkVPTk
	1k6C6v7fS6PRgd0vrZH78S+lTTAWKPDhCxjEMo3xuhxvnxTvFKVDG8L9neow9oA/2
X-Gm-Gg: AZuq6aJbSEjPdDsorxfH9L+mYUuxJ6FHLGyq8lH34GDuliAHslP8ZC+dPwRvmCaIqmR
	JRp1zB0cYaRLrbtZKnqCBUPRvoyA7v/3RyfLPk8Y9QHCKoiTsDkoCk3hp3dItqc+itLVWzpDIkM
	gbF3e6jINOa2XYMJ5BO2Yn32Py09kJUKYYceHB2xwarB4+oX/XpGxeNekH7LxOeC8d+zpIaMs6i
	ZmDeRfL/ICPdV/VLQlWI2itO7emUgAIBJbU6WT97h68UbERD8AVu2YoxrjAMMV6/fePQopBPPE9
	0D2fxJoboQb7jegUXT3XzSAnB1XVEpIx5Qs74CFqEbjBQ9Hv9WPmAHoiLaAPH0BHFi/wCxztFAI
	pr/Tx0cNkV5uSz8NQe3j9mB3UXhnvCILK6iHzcYawDRoVX3YDuvJmRDiTfDc0p7w=
X-Received: by 2002:a17:903:1a88:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a870e18d4amr75738325ad.28.1769653463368;
        Wed, 28 Jan 2026 18:24:23 -0800 (PST)
X-Received: by 2002:a17:903:1a88:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a870e18d4amr75738095ad.28.1769653462790;
        Wed, 28 Jan 2026 18:24:22 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm33851035ad.69.2026.01.28.18.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:24:22 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:24:05 +0800
Subject: [PATCH ath-next 1/2] wifi: ath12k: use correct pdev id when
 requesting firmware stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-ath12k-fw-stats-fixes-v1-1-55d66064f4d5@oss.qualcomm.com>
References: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
In-Reply-To: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697ac4d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XAc05n2krQg3agKh30oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: rVXtcdvkwaKIgs22NTQII6VdR0p-egmH
X-Proofpoint-ORIG-GUID: rVXtcdvkwaKIgs22NTQII6VdR0p-egmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxNiBTYWx0ZWRfX5Z4PAAaFsDYf
 X+4/KdSYGngDqMiBt6cd23i5fEB7vS1umiRNsvgkdLsZhCsAv1SFYe5xXXEJr1FNXb18g1tplDS
 wmjH8fzUX0KCDpMNrUT/3RwgZPINPqYMtEeu+8YdcZdkaLGbkLOwjqszAKku7WE2EGtbUSNRWS+
 a8FPaFKC8OkYuY5XARWoTGCYdAg2Q/GFWTiofjSzNngNU4iWLMjNKo67jqeq6T0j835tENHMedb
 373Ia5wRYrZMrr88TYLZNWmTe5IqaoPiYW7OjHZ/9leZ5a1KJbb235w/xClPWFYvDWh14QHOQxP
 QY5qieKbPHA9BYbwFY2H2Z7ldycig0MsS1Tw/ELFYMwVCMXq1DRNymyeCk1/RKoFod6uwPXoBHE
 CqDzA6y2o+0Eodv8Z0AgMkT3l3p1RfzIxPJeJ28Wpf7UlzftTVQsQYwzwpeOeViXdoQlwgmZWBb
 hPHmR3APjjYnS+tjsbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_182424_630764_F2EC480D 
X-CRM114-Status: GOOD (  18.54  )
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

To get firmware statistics, currently ar->pdev->pdev_id is passed as an
argument to ath12k_mac_get_fw_stats() in ath12k_mac_op_sta_statistics().
For single pdev device like WCN7850, its value is 0 which represents the
SoC pdev id. As a result, WCN7850 firmware sends the same reply to host
twice, which further results in memory leak:

  unreferenced object 0xffff88812e286000 (size 192):
  comm "softirq", pid 0, jiffies 4294981997
  hex dump (first 32 bytes):
    10 a5 40 11 81 88 ff ff 10 a5 40 11 81 88 ff ff  ..@.......@.....
    00 00 00 00 00 00 00 00 80 ff ff ff 33 05 00 00  ............3...
  backtrace (crc cecc8c82):
    __kmalloc_cache_noprof
    ath12k_wmi_tlv_fw_stats_parse
    ath12k_wmi_tlv_iter
    ath12k_wmi_op_rx
    ath12k_htc_rx_completion_handler
    ath12k_ce_per_engine_service
    ath12k_pci_ce_workqueue
    process_one_work
    bh_worker
    tasklet_action
    handle_softirqs

Detailed explanation is:

  1. ath12k_mac_get_fw_stats() called in ath12k_mac_op_sta_statistics() to
     get vdev statistics, making the caller thread wait.
  2. firmware sends the first reply, ath12k_wmi_tlv_fw_stats_data_parse()
     allocates buffers to cache necessary information. Following that, in
     ath12k_wmi_fw_stats_process() if events of all started vdev haved been
     received, is_end flag is set hence the waiting thread gets waken up by
     the ar->fw_stats_done/->fw_stats_complete signals.
  3. ath12k_mac_get_fw_stats() wakes up and returns successfully.
     ath12k_mac_op_sta_statistics() saves required parameters and calls
     ath12k_fw_stats_reset() to free buffers allocated earlier.
  4. firmware sends the second reply. As usual, buffers are allocated and
     attached to the ar->fw_stats.vdevs list. Note this time there is no
     thread waiting, therefore no chance to free those buffers.
  5. ath12k module gets unloaded. If there has been no more firmware
     statistics request made since step 4, or if the request fails (see
     the example in the following patch), there is no chance to call
     ath12k_fw_stats_reset(). Consequently those buffers leak.

Actually for single pdev device, using SoC pdev id in
ath12k_mac_op_sta_statistics() is wrong, because the purpose is to get
statistics of a specific station, which is mapped to a specific pdev. That
said, the id of actual individual pdev should be fetched and used instead.
The helper ath12k_mac_get_target_pdev_id() serves for this purpose, hence
use it to fix this issue. Note it also works for other devices as well due
to the single_pdev_only check inside.

The same applies to ath12k_mac_op_get_txpower() and
ath12k_mac_op_link_sta_statistics() as well.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 79e7b04b5388 ("wifi: ath12k: report station mode signal strength")
Fixes: e92c658b056b ("wifi: ath12k: add get_txpower mac ops")
Fixes: ebebe66ec208 ("wifi: ath12k: fill link station statistics for MLO")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index cdb72439dcf4..46253347e357 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5264,7 +5264,7 @@ int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
 					 ar->last_tx_power_update))
 		goto send_tx_power;
 
-	params.pdev_id = ar->pdev->pdev_id;
+	params.pdev_id = ath12k_mac_get_target_pdev_id(ar);
 	params.vdev_id = arvif->vdev_id;
 	params.stats_id = WMI_REQUEST_PDEV_STAT;
 	ret = ath12k_mac_get_fw_stats(ar, &params);
@@ -13286,7 +13286,7 @@ void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	/* TODO: Use real NF instead of default one. */
 	signal = rate_info.rssi_comb;
 
-	params.pdev_id = ar->pdev->pdev_id;
+	params.pdev_id = ath12k_mac_get_target_pdev_id(ar);
 	params.vdev_id = 0;
 	params.stats_id = WMI_REQUEST_VDEV_STAT;
 
@@ -13414,7 +13414,7 @@ void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->ab->dp->dp_lock);
 
 	if (!signal && ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
-		params.pdev_id = ar->pdev->pdev_id;
+		params.pdev_id = ath12k_mac_get_target_pdev_id(ar);
 		params.vdev_id = 0;
 		params.stats_id = WMI_REQUEST_VDEV_STAT;
 

-- 
2.25.1


