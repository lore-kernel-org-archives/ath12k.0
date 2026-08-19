Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405D8C5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljCy5O5Q13zJ0R0deOdY6rUGXlXk5toVBCxTqHElnkE=; b=rlUpghhEHaEYBTBOzvsx/knqMl
	mty5x/tfKwWcqGzdhqg+U+OmDd3nBD0xohU40HE9foSv3VnhLb2fOfKN1kL8f85GYIWy2lWwqdoPE
	eZf3ctfcVD+W79Z5PMjULHRnH9oQ2k2kt1mF1GT2GmKjbJsIwu+rjvP3Cyze0tYoPxGn10JsuVj4o
	0Ko+N2rgWAMWhoxJzC5gUAiJ6N/TfcfDohzdoMF5KyE7GPD3TVzjndJcTiR9suXW6RghWsOPfvjTv
	yha1gxuE0I72e/Z3+BajX16TiGyRCVnTJSbMRqIZdifxURKUKCs69/OA04/TYYNIsOxZGmHNTFDQu
	VIGOx8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvL-0000000914u-3es9;
	Wed, 19 Aug 2026 05:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvD-0000000913Z-16yw
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5IXqK362533
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ljCy5O5Q13z
	J0R0deOdY6rUGXlXk5toVBCxTqHElnkE=; b=Ni6k4Bzofx4L9jeiHsfuornG53I
	SNk8CEIgK5Wl4P6F2lwfEzJGs9gCyKU5L0ChuO2FfhAxr4j9mO09Jt3Z50W8U4eb
	je/Pc/MXdF+Lf1S2zuiQUy4sTNmypAKMcbr/l7W8twE9yOuGTEsMa3suMkZTO0z5
	/9fQQV+zQ2N9F6PWLllWpVGAcj/Pr1gDY+nn13ssPY9hpjqkxWeiifIzkTyafUp2
	YJufLKIFZw+gL3i6VCkcIh2wtlcF4N2ug6TWy5valzl4fEjJUUmbRb/OMG7wvygc
	aqZ/XGioAulVKN+Aibcxp4jflEHiIKxdcIXAU28tDgsj1IEjO0xFs519LMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1gcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so1634995a91.0
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117585; x=1787722385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljCy5O5Q13zJ0R0deOdY6rUGXlXk5toVBCxTqHElnkE=;
        b=KG0uVBnJOijqKoFPDSMQxgzqCmLv2/Tacdspft9f8hys6DQboQuPB8vQD52aj41+ou
         TlhQTngKvH1EjRfgHhw+IeBAPcYga4jxK/mdLZLnii6iqWW4//nbAeoZmxvnjNKaklzZ
         NqlYotF+iO8lppKhpNrcXH8LgL5QC88y1fe4u7Ho8j4E7IWM8bdvpreBBbcWdXOMJb7W
         ltW/RMPCbREQUKKnSH/5J32UhxjfrtB+ECmbbMa5LQt8IxwpSxbMEt+Z5Z1BFRChywy1
         ZXp6ytnsOL0MF0sn1wz77qJk8TdWdFk0ZEWFbeEdNZxK+6GRlgoJPpCO3zSRgf19Dpe/
         1Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117585; x=1787722385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ljCy5O5Q13zJ0R0deOdY6rUGXlXk5toVBCxTqHElnkE=;
        b=nASzQ99LXVdOwb/iywDz79hrg179FqScJoqIKpIWfea5jtIBPe4bgzPqp99K4IeSyU
         g9cTGstb4Y6pAELdH2lFGzDORPDaWyRFrYmWEwSz4ve2OQH8qfR0gXK5dd6cq6XgFCTS
         2+V2KZeb0L5k5b7Eg3HBU1qW+24j5q9D72hBn2ESQt1SAibquZGImP8UVD+3g7ppoAIY
         j7y5FNttdN07BO/UFYwMGbwuVlco47zc3Zm8KxIyxXvBXJm/K7Rx4OONksI8humfkhHH
         1ynFvXSmBQJ2bFyC7rnA4bkrqjcXlDqFZfrCKgnUJ0dJerRmKXS/gW2YnOU9zvY6c+Dc
         0xxg==
X-Gm-Message-State: AOJu0YzEPfW/dTb3Jj4xzHPv4g5n/5PbCb2JHefyWELZJnloa+x6uIEA
	wV9grP0mGthyR8umK+CKoMW+S6UuWQ+A2FkxUq8oKSgrrE5TtzXhuh3byiwEJHohLFG3pbFNc5h
	fvxG6pI4XfYsfDbU5fXPd9Non1uRAO3/8JpXqDQTuCgDKKyUz2BwEfqT8EOpjWMAqrsZ2mhfe
X-Gm-Gg: AR+sD13X9dwMqUioM3I05WQX7gJmYA/7S2rwip4sEA2DaLGwQtIhOOamHe9aGB+mY8r
	cTBvs5fJQOg+DjJieQRImr2zRE69/fEKJfluNAvuBg9+H23hQiSCZxi9QWYr4BsqrlXb/qWrdNl
	YX1P8Zrz/8ie3saViACtYdhgxkNJe2NXFE38OcK0Jz897gUgKrd3u2MqW8BxaueYRz1ShINbKoL
	YM0hvXPHQcM2vQ84wydwI/1i4bLf29sghz4P9FAtHc4a/obLdY5A+ugooOvmVuE/vUnB+nWxldy
	8pLidQYBGYg1jChGmV2bkONIYzGsJxbxVBQUajvyO/jsJ2hGYhLYGipDU6uRtqnpM3lz0xEid3C
	SlZl7Amx2JUK/b0QP/f1FBe3PdzJVRB17vzDBCYmGeRMIbClJtYMG
X-Received: by 2002:a17:90a:e7cb:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39580aa5106mr3748468a91.5.1787117585414;
        Tue, 18 Aug 2026 22:33:05 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cb:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39580aa5106mr3748378a91.5.1787117584916;
        Tue, 18 Aug 2026 22:33:04 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:33:04 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 2/8] wifi: ath12k: rename wbm_status to htt_status in HTT TX completion
Date: Wed, 19 Aug 2026 11:02:41 +0530
Message-Id: <20260819053247.1420393-3-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX8tZ69+3sxWk5
 OsqS8TCmBC0kjOGjsNxUYWreepKd49qvo4tsdzH0vuGWmhfqgjCF5SEJJpNQNrJ5Y5BG7tEU1D8
 XItPkj8aV1W7prtoJwu+IgVPatpAIr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX1F25DgT6jRdR
 JT3dKoMC5LgEfYzd/cKCw8PwmuVkRPXMW05uI2I+K8Hg7lyQ8jMeorq+hRRa2RZS/q3KHIx36Ua
 44pY/IRMmHMqNCNzSEb6yO+IQrV8PAhUULB9Uc9qVxwLDGWnK67+12QyhiMyDGpuYweei8PPaRQ
 2J570kiYRcKcQH/OEsNVW+kES1zHOgwds6i0wGRq1u2VC7qXtTZPCvNWgAcRzQfOIyq4poNiFTi
 H8Ael7uYix2zqcE89snf0eC7Xbdw/YBLCUIYCKqQcCy4paqN2QYQgwW+XpK0dINTXL2eY1nb9RM
 IzNnNYE8Ba7zSNZHOyB7IJMQuwloS8ksD4xAFIq8rCLvm4qi3rMml5+3NSNJE4kR7dIAaGJstbv
 GrduUAmMob6/KSh+KKSFah8RXtS2OBOcYlkjBa/CLkcFk2dDOBm/PBK2AGpQgEotlMk0vA7bR09
 n3z5rMiobMpxbLgPurw==
X-Proofpoint-ORIG-GUID: ONne5XVeaOfzrFN1wrcJAMUuEPaqmIaO
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a854012 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RuwI03aZ9ZQFnXGR-2kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ONne5XVeaOfzrFN1wrcJAMUuEPaqmIaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223307_315980_6B0680C1 
X-CRM114-Status: GOOD (  12.69  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

The variable wbm_status in ath12k_dp_tx_process_htt_tx_complete()
holds a value from the HTT TX WBM completion status field, not a
generic WBM status. Rename it to htt_status to accurately reflect
the field origin and improve code clarity.

Also fix ts.acked assignment inside the HAL_WBM_REL_HTT_TX_COMP_STATUS_OK
case to use true directly since the condition is always true within
that case branch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 3d635cac8f8c..a8afc1cb0712 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -575,19 +575,19 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath12k_dp_htt_wbm_tx_status ts = {};
-	enum hal_wbm_htt_tx_comp_status wbm_status;
+	enum hal_wbm_htt_tx_comp_status htt_status;
 	u16 peer_id;
 
 	status_desc = desc;
 
-	wbm_status = le32_get_bits(status_desc->info0,
+	htt_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	if (likely(wbm_status < MAX_FW_TX_STATUS))
-		dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(htt_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[htt_status]++;
 
-	switch (wbm_status) {
+	switch (htt_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
-		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
+		ts.acked = true;
 		ts.ack_rssi = le32_get_bits(status_desc->info2,
 					    HTT_TX_WBM_COMP_INFO2_ACK_RSSI);
 
@@ -609,7 +609,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 		 */
 		break;
 	default:
-		ath12k_warn(dp->ab, "Unknown htt wbm tx status %d\n", wbm_status);
+		ath12k_warn(dp->ab, "Unknown htt tx status %d\n", htt_status);
 		break;
 	}
 }
-- 
2.34.1


