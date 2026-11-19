Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506260A2613
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHlCVPux;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DWV+eRa3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pj6C9SaA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Iixqc/javUnJztgMXXupuJF7pw8/6hkzBtQOPlzHrQU=; b=rHlCVPuxM0UCxSr+EhabyjOLJw
	dlL9l/w1+pZSuow2joCEb1nkuSFgRLsQR569nIii/zMnoCeLYLOmOB5VRGoOv4gaBhoWhhHF0y5xX
	ioXYulJmbr0O7XjrnAG5SEsbJLDqmHckwdz+a2fcSK3xrC9CmFQlJTvrqutuRcwb7sGC99rRCW6PE
	U7RPpyBVBjyoznQQ8UpBegNDQVW74kFJs5kLopHDqiXysiPSiSEuXLpVhoP6yLrcp8i4LtfRGZlBL
	C5RHh1wqN5OwyLmGW4xFvAVHVHVWVMbN3RoU1w73mhE3YQalkOPulzzWhhn3RHYbi6PpI9WL9bFGG
	C+8y4RQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsPz-0000000Ak61-47Ki;
	Thu, 19 Nov 2026 03:02:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsPx-0000000Ak5E-3OXw
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 03:02:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1ApLo261502
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 03:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iixqc/javUnJztgMXXupuJ
	F7pw8/6hkzBtQOPlzHrQU=; b=DWV+eRa3nEtI9WmW9ECM9AwBsvCyv7+Fc35IUH
	FpPK4YW2nOH+bUJWzzQdwnB38BsAgEOfbl14BVezeuGhiLNNop4qfiZLcgEEFFe7
	00L3yxmbR4IECAhyenaJ0YCd4tIpBt7N29+2Zn8UoWDc9YjZQacrl2GnZI2gdefr
	eAz+pGRUEYryZZpF7I3e0PSQX/lS2sA2Xw4XHmtSDqrxNu9KT8KrmUhPT2SuYFsm
	zX5dsSOvqAzN98LRybn0xY9QgGlJJhCpncXV29jp40GTU3S/9RaMZgprAJ2g43Ft
	wFfqeNlk3wanaNdCKcswBFISLx050vWBgCvAIAav3fxB8yjw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etntky7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 03:02:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2166389eec.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 19:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795057352; x=1795662152; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iixqc/javUnJztgMXXupuJF7pw8/6hkzBtQOPlzHrQU=;
        b=Pj6C9SaAsKlrHaq1gw7WW1KTT8GHb/n0jyuKI110IxYeNWAM2EVJ3Qy912D9Qm8PHc
         pCU9oLe1ewnN+PZ6tJq4K8xtvocbX+arJ0pUT1c+D5xJcGnvuMverGmZHlgq+EblOi+N
         LkqCgwAW5sQ2BMiMCkR01EVXUWtnnuCM+tFgNwHxtjMa9qbsPDU9V0SlLXm0SywrcKx/
         6Yt2mAd5JEEVbczay/18qsnxgvFGwGHlA8SHgrsTBB1mDWxYXpCRMS6BL9qkAhaOVAbI
         G6vToHCA2LaP9pt+2UR6cNLDuwYMmqyHXIcxsdNww+dvhOrcj+dpKSMncqC5ouAmY8Xr
         1ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057352; x=1795662152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Iixqc/javUnJztgMXXupuJF7pw8/6hkzBtQOPlzHrQU=;
        b=YVWjUa8dZ0jd/CzSlANaEzCDd9crSBgbqk3XlRvVvR152xXYVP11VjTj7gn2cmGXaY
         hDQaGS125x6BLc/yME1ghEiUoPzyJ99xEIguGZophO+v1MZIPlhy0gx3fb3mhSeU3IPN
         0TYroLhHFIRs+G2AV2wtOiclKMOEZmguA0nVhd/WoHec+oZFJYgT9tj6NZ1TNJjnpYEh
         KLU1XVNBMB+ihqmvjt9egWTA8KSSFkeESscxWfpcyp/W5CY4oM+zb/CfHupKy4n/qwOY
         ss64CrwIcIVCo0Jxvr/J9K9nSHIteonmmiycpHLmmSJYjCIfXvIcpccNBSayHgmb0pFX
         +HJw==
X-Forwarded-Encrypted: i=1; AL+hErHgMyVW8VoXm/3u8f+jWQXSydp37XzsvHEhMXRqUEn8rhr6bq41JUyF44y8OOdertRYFYnBShI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9vzDsriiezs2Op+jrxWtqnfInBMEdmtxOkf8ipM5bCO1cMMIQq
	/eS2Jl5rbSkHg2CU9k8Le60f0gmFCFovQ6HFGaHzMPinANTxD44rp1VaqKdkjpjdHQUghtmkOME
	HHgSm0Hdy+05DXRDRl5RVVXs7QHzY2ZE21u5HFnB4+nlp1o0DjzZTR6yhnYAWt4gI
X-Gm-Gg: AZFdTZdS/2uSQB8PU4I9lN36PObtR9sDnxQQ/oZGASTexy/g3NBrnlwP2OMaaXELyoD
	Yhu+psXpAWgmz7yuwbc8hGUIEeTFc/qAXjgvsgBYiXYts0TMmx1lYJq7kYtGrlRTDavB6f0LMog
	p0lm+yvhpSVzGxGbWyQnXdWd0c5BpITUyQcn5rADmsrL6KlXeiI90iA5IhNkA4yxEVcjs+bKKzh
	k2AENmhfM05Ap4VAqEQJ4uFm0FWLSv3zu8j0sOhvnLPzSoBXJYrkOp/pH5z7e8JWf8qBpIxjWHo
	YglAxfWVQXZqs237OlHNLk3mFggMH/SSuoIjiqM8SDoOAw8t3Hh+P0YtvlsHgDNyFyrVoSl14De
	OJaRvQEKN0mobZglMm9C9DxKl7zAWXP4nMDWDK0hLwO8bOrfjCQ9EruwEZm3rKtsO0g/bjv3ZHA
	cmJI4ciMrCmxYBehWB2xZS8as=
X-Received: by 2002:a05:7301:1830:b0:37b:dbd0:ba63 with SMTP id 5a478bee46e88-3827da158c1mr3982797eec.3.1795057352171;
        Wed, 18 Nov 2026 19:02:32 -0800 (PST)
X-Received: by 2002:a05:7301:1830:b0:37b:dbd0:ba63 with SMTP id 5a478bee46e88-3827da158c1mr3982773eec.3.1795057351571;
        Wed, 18 Nov 2026 19:02:31 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm132573eec.23.2026.11.18.19.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:02:31 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:58:12 -0800
Subject: [PATCH ath-next v2] wifi: ath12k: use hal_rx_mon_status for PPDU
 parse result
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-hal_mon_status-v2-1-30b7f5d1b999@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMRl/moC/yWM0QrCMAwAf2Xk2ULbiZv+iowR18xGtBtNJoOxf
 7fq43HcbSCUmQQu1QaZ3iw8pQL+UMEQMd3JcCgM3vqTc641EZ/9a0q9KOoipj4GbJy1tj0HKNG
 caeT1N7wCajSJVoXub2S5PWjQ7w/2/QPysG1kfAAAAA==
X-Change-ID: 20261118-hal_mon_status-34da7100089d
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795057350; l=2938;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Mnj+KP1qNFf6q674uDLc8Z4e6SKvAqhw1TeCa2+MBwU=;
 b=treNwdehkTRVpP3rSlAkpToPGptRNOFO886TUhzQgRrPCd46EgYSxpWhu5Izq4rdgTMye7wVm
 /cjrb3AbVbdBfNRMKXzQG+FLKXaJavjtnSTJ+yKN2E4adrfcQAbLruq
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afe66c8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hn8_Ye6xlahrUiIuuysA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: qeGHuEn-FjpSw8RaF94YZlx0qAYoux-M
X-Proofpoint-ORIG-GUID: qeGHuEn-FjpSw8RaF94YZlx0qAYoux-M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX4EgNKtVtszvH
 JvWkiUB2notMctBKbYdlE2KOKV0hIb23TwpBcQVYOV8To6iqDDlzAKGcXyd0JMyt0homAJYlHtL
 sGnwrrquTJgZOM72WSCa37BeRpGHAOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX18NOEuN0Kjr6
 ejJqt5hQVTeMNakJcBBkUdbjyulA0tUmYTgl5NdJ8eNbDlMumaMbWEaK8/cpaWYLpJOSZRwQgbE
 k8b8VYtrpIZoUev7j3vXiPKjUL0Ktu+wejAGCMylQdPhoUMCSchkHnRTGsgvwQW+z0m+l1mHwc4
 hH9qdTNVSkcOCE5kCheMs9/fpEvIFeZu8QuXYrLt+r9tgS+4CpWHM/RgvNudoTkkGm0PafZwsmc
 9N8+LH8gz4piysiPVfhYFwbKZ+6wsAcKwxpeIuhV4gL06I3Sjh5JK+7FONVO7YD5U+uP4MF/n4p
 Uj20oMq4uvqH0hdTgXJGag5TGpS5P7BJZQxVYznbcZiGxoBxoB0JuFJEqsa9t7NXZ+N3C283PuG
 Xy68yzxl80vOU+leXDbsj+M7NHEqCCbzRwe6csn2pr73Sdswg8C2UBfMp1fnV+6jNCuTD/tCXRs
 Zi50RepIvUov6XlkHrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_190233_865105_595FA610 
X-CRM114-Status: GOOD (  12.34  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_wifi7_dp_mon_parse_rx_dest() returns enum
hal_rx_mon_status, but one caller still checks the result against
HAL_TLV_STATUS_PPDU_DONE.

Use HAL_RX_MON_STATUS_PPDU_DONE instead. This is a cleanup only
since both values are identical.

Also, ath12k_wifi7_dp_mon_srng_process() stores the enum
hal_rx_mon_status returned by ath12k_wifi7_dp_mon_rx_parse_mon_status()
in a u32 variable. Declare it as enum hal_rx_mon_status as well.

Remove the now unused HAL_TLV_STATUS_* defines.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
v2: replace u32 with enum hal_rx_mon_status.
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 5 +++--
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h | 5 -----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1c4fa29626a1..c6477ea4f915 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -3214,7 +3214,7 @@ __ath12k_wifi7_dp_mon_process_ring(struct ath12k *ar, int mac_id,
 
 		hal_status = ath12k_wifi7_dp_mon_parse_rx_dest(&ar->dp, pmon, skb);
 
-		if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
+		if (hal_status == HAL_RX_MON_STATUS_PPDU_DONE) {
 			ppdu_info->ppdu_continuation = false;
 			if (ar->monitor_started &&
 			    pmon->mon_ppdu_status == DP_PPDU_STATUS_START) {
@@ -3253,7 +3253,8 @@ ath12k_wifi7_dp_mon_srng_process(struct ath12k_pdev_dp *pdev_dp, int *budget,
 	struct sk_buff_head skb_list;
 	u64 cookie;
 	int num_buffs_reaped = 0, srng_id, buf_id;
-	u32 hal_status, end_offset, info0, end_reason;
+	enum hal_rx_mon_status hal_status;
+	u32 end_offset, info0, end_reason;
 	u8 pdev_idx = ath12k_hw_mac_id_to_pdev_id(ab->hw_params, pdev_dp->mac_id);
 
 	__skb_queue_head_init(&skb_list);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index dd60626b3240..3d7694c22774 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -41,11 +41,6 @@ struct hal_rx_mon_status_tlv_hdr {
 	u8 value[];
 };
 
-#define HAL_TLV_STATUS_PPDU_NOT_DONE            0
-#define HAL_TLV_STATUS_PPDU_DONE                1
-#define HAL_TLV_STATUS_BUF_DONE                 2
-#define HAL_TLV_STATUS_PPDU_NON_STD_DONE        3
-
 enum hal_rx_mon_status {
 	HAL_RX_MON_STATUS_PPDU_NOT_DONE,
 	HAL_RX_MON_STATUS_PPDU_DONE,

---
base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
change-id: 20261118-hal_mon_status-34da7100089d

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


