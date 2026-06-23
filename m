Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE7FCD98F0
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 04:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mgWYK/3t4tydqwON+x1o64YgIx5N7PNAyLLJ9nxeIqE=; b=VFZnY0dImJkNSE1DJnKlI0u9xQ
	dv/sXURubvZj7OcDNSmMGO47mO56kZdyMLf2I1ffzMaK1goOa+IEgQ9hbkg33qmuzzikU44d3QtH0
	ImS0EW+c3/vpu/MpGURnOK73VXAlkqbEEfT9y8CC/8/85Pgq4hH7YYwE70bhjQucfP9latYUFQeMj
	f8ArjIk10Kq+dDn8whJwLgudJrSNNcCCOYoEPUcriLvPmZUjYbG2bdaLiEEaxQREC+7E/bYRjaWO4
	K7FQEsPHjfwigYywdOBKhrPVL9PJF1noGb4hBtwti6Rxx7d/LxQ6QgM2HAYtPOaGTiiRYY4xiJUtS
	48XRsmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsN7-00000005gKY-1IfQ;
	Tue, 23 Jun 2026 04:04:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbsN5-00000005gKC-1Afo
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 04:04:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0hiLf2207828
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 04:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mgWYK/3t4tydqwON+x1o64
	YgIx5N7PNAyLLJ9nxeIqE=; b=AwBSxz3RwV+ZrVTIGqfHoM1r/0AKKSInY5dcQk
	vhk6bOP6A/HnBYB8AGAGk/tz3+2ZTEuxZcRYSX7bq43ggoP0QFMcViyqsosNhX5+
	vrC9HUlpA+7Rl7t5xwv1DpBEArUOhxJyL7dmS7kL31m+dV9xgLG/TNUaws557R1k
	0/NMmVabbaKLkndW4Am/z2yxADfcF30/z45UZtZ8qcE9rpcR2mAcSdDv1bwW+d8F
	nTLYxJHdVnBe00CXdqt1hmN9wPou/PBfEiQo/NDjlK3oFwr+dDCF3cY/rdt5hHml
	uZw1KlhCXYfpy8tMUaJLAJYYEesFi6QX6P7GKWvTpxhogjOQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729th87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 04:04:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so5921346b3a.2
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 21:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782187461; x=1782792261; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgWYK/3t4tydqwON+x1o64YgIx5N7PNAyLLJ9nxeIqE=;
        b=aEvnM8chkOm4pL3icovQBQfDhzgLnOadefYyxyP5OMMtlGkNsJWJ16KlAftZDFmFLw
         79kmdHGSWzI0mVGnTo5Memd5XJj/b2GGGRmMNeCglb/xpvEOphVbB7OYpXBw0S71bikV
         Gwvy1f/EbfI1dsmQNMzTAn8kPBalSE0t1QSUJkEa1L+UJ81brV1eVOrtRBj0eCfmYpsT
         M0ZVcbBBNPcDaOBbjhzkwYq61TqM/t+rWeOS49rasuvaOzgMBD9tNvwXDWXwgAB4v3pK
         /v6p+g4O2fAGAo4YuXIuSyaWn46fhtiEveDkKAeV8l25ampt9OR17bmXKKVn/q6WOuyN
         n0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782187461; x=1782792261;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgWYK/3t4tydqwON+x1o64YgIx5N7PNAyLLJ9nxeIqE=;
        b=aCrvBKJ8WyOMBEMd+w7MO9WtQKYydxMk0xnz7bGOUTmrlCMmqhYYOcIIJWi0+UmGBI
         iqyduub1zIUEMmAYvAej//ANVjAMuIj0Rk+qwctRhT/kTj6RTU+GarlLyV+i2mIjgJtR
         hKtvzUj5zPs7SRRDQrnlKpzObrMOGPP2I5nRQgatRb9Y5t9bBfjOpubZyHNU3MYJjG03
         cIC9/f4G9lKhnD+/S5onVRNANAV4ivUwiwPdBLPuPCtFwT55TgB/NgsqYuNw1N4VH20f
         k+7Jz0MxMKGtMTDitB+rB5F2m5RQ+/WLThJKXJNUBkC9SUEYWlT3oxyDYEAOjQKxmy0f
         5FSg==
X-Forwarded-Encrypted: i=1; AFNElJ9rxqRLxsduKdIW1pmfUXAtrBFqPfxq5O4Vx1EwsjGj/WZSM5YRTd6AyVZlyuc54SuII8//koI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTc2+2oj/LSkd39W2rFcrMAVDHUjIXbc/yfKpCULg6OZoAXYOu
	xj9H3HR8+E1yOGQIZQsZeFKd8ilI5zJM0asanBUJGsD5JYOEAMko60YXeaomTudCdsZLa9XUsp7
	uDHQAQjDRzyIK+GSVsmLkkQb221Y5VX3mcZpnRyw1Qj2KnFgy25a0R63J3uYGOtuY
X-Gm-Gg: AfdE7cm/KXKyYkb7IbFsAukAkr5/FdQrxFnL8RVlr0rtWN+JoXZ8EwnadLlZjw41G0H
	FgI75V9sVciH1kGIFnX8fKWWVaWPYN5TzTD38qmxWJ/k2FR2e6/43uvDB82yHPoB8ef0MG7xFT1
	QJXY1zuf0E+gU6ByDgm1r1/Tm6EBrdvzB62kUR4fZPxiefMLIq6nWPSCZkPM7vr1Wlmz8S5Buww
	6TM23gYf6QfUSUfqdEAyHEw1KF7wPjM18xO8UHnKWKqgG+rq1ovNf7ICvscZKh1XUld4lZADTCe
	IZJsLon4qLar2+74vFZ3uvxSRVyThlw9iCGmmlu9rnC1pdEj4fZQA+4c+Q0XebujduoWtaZAqqy
	W82UJe6nW7a7eswobwrs7CF2Z4aN7Q42IRx3sEHQ0+MPJ0rLsUKzfWsjkBcp67pY667n9zHJwvu
	AJryEuhI/vEygBsEJhrB2PcW1zJT48
X-Received: by 2002:a05:6a00:1d8b:b0:845:17a6:5741 with SMTP id d2e1a72fcca58-84595210aa1mr1311527b3a.1.1782187460842;
        Mon, 22 Jun 2026 21:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d8b:b0:845:17a6:5741 with SMTP id d2e1a72fcca58-84595210aa1mr1311496b3a.1.1782187460363;
        Mon, 22 Jun 2026 21:04:20 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6bf73sm9156325b3a.5.2026.06.22.21.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:04:19 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:34:17 +0530
Subject: [PATCH ath-next] wifi: ath12k: use %u for unsigned variables in
 QMI debug logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMAFOmoC/x3MQQ5AMBBA0avIrE3SliCuIhatjpqEokUk4u4ay
 7f4/4FIgSlCmz0Q6OLIq0+QeQbDpL0jZJsMSqhKVKrAfWG0ZE6H8+qwtqJWsjSjbAykZgs08v3
 /OtDHhJ7uA/r3/QBPihdgaQAAAA==
X-Change-ID: 20260623-qmi-debug-log-7d07214bf18b
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDAyOSBTYWx0ZWRfX1nARSdEVyYXn
 QwmO8OkyRXf/qPIB50kceFRTQBGYWTxtweM9T0vmF6/OAC9YJj+akJ4SdOyyg/6+KmDP5QB5ywE
 MpKjmyM6FY8zz0E1z6FL/40X1/bSwLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDAyOSBTYWx0ZWRfXyF4KYuebq7jL
 cd0C7de8p6aqBze2CkyGB1COm2fxfufln8vRRMp9NfGOz64dFVe6WMydCdRcSb1IkE+bwbNHyHL
 n4XMNagWdPLbdoVmXxgqMHFwseDYW/mSl8rSqdRKfRS7KSA5mK74znjr73RfwmGmiCedNjM++AR
 h/Wya9Lrj0g2g6Uj0PoRQjEyZZGttaphdv3obM4YwmnoHB9CBeHYy+mPZpGOVgNbqnF579W78jB
 T+n9tJfgj4X8GPPfDh8lTpZVtYiskffKC+NS0LqQguyQC9TxUpc7DlHQn6Y7tm8X9izskJnR3n8
 WYX0usXL9P1G+KLPNkCnEWwWbGPO+zN8bjr+d+OojQjvwKMSo7vcmyaiAkvzy7FquIfK6mgyG2t
 e/8vxi9lZkos0ULfjOoBFninTQ2io2Jog+3dli/Y5N0WinSf7vurV/GJqztrhAkksb75OKGM5g0
 iXuUSPiN5Loflp4BgpA==
X-Proofpoint-ORIG-GUID: 7MONRQeg0w8IJxw6uibPc_X9lMmAB4b5
X-Proofpoint-GUID: 7MONRQeg0w8IJxw6uibPc_X9lMmAB4b5
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a05c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sI5m5gy1iff1vHILgfUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_210423_354133_4CF9711A 
X-CRM114-Status: GOOD (  14.11  )
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

Replace incorrect %d format specifiers with %u for unsigned variables
in qmi.c debug messages. Also add missing trailing '\n' in log messages
to ensure proper termination. No functional change intended.

Tested-on: Compile tested only.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 70 +++++++++++++++++------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index fd762b5d7bb5..b9a606c8ec82 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2094,14 +2094,14 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 
 	if (!ag->mlo_capable) {
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
-			   "MLO is disabled hence skip QMI MLO cap");
+			   "MLO is disabled hence skip QMI MLO cap\n");
 		return 0;
 	}
 
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
 		ag->mlo_capable = false;
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
-			   "skip QMI MLO cap due to invalid num_radio %d\n",
+			   "skip QMI MLO cap due to invalid num_radio %u\n",
 			   ab->qmi.num_radios);
 		return 0;
 	}
@@ -2125,7 +2125,7 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_num_chips_valid = 1;
 	req->mlo_num_chips = ag->num_devices;
 
-	ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo capability advertisement device_id %d group_id %d num_devices %d",
+	ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo capability advertisement device_id %u group_id %u num_devices %u\n",
 		   req->mlo_chip_id, req->mlo_group_id, req->mlo_num_chips);
 
 	mutex_lock(&ag->mutex);
@@ -2146,14 +2146,14 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 		info->chip_id = partner_ab->device_id;
 		info->num_local_links = partner_ab->qmi.num_radios;
 
-		ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo device id %d num_link %d\n",
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo device id %u num_link %u\n",
 			   info->chip_id, info->num_local_links);
 
 		for (j = 0; j < info->num_local_links; j++) {
 			info->hw_link_id[j] = partner_ab->wsi_info.hw_link_id_base + j;
 			info->valid_mlo_link_id[j] = 1;
 
-			ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo hw_link_id %d\n",
+			ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo hw_link_id %u\n",
 				   info->hw_link_id[j]);
 
 			hw_link_id++;
@@ -2268,7 +2268,7 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 		goto out;
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "Host capability request failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "Host capability request failed, result: %u, err: %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -2320,7 +2320,7 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 	ab->qmi.num_radios = resp.num_phy;
 
 	ath12k_dbg(ab, ATH12K_DBG_QMI,
-		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
+		   "phy capability resp valid %u single_chip_mlo_support %u valid %u num_phy %u valid %u board_id %u\n",
 		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
 		   resp.num_phy_valid, resp.num_phy,
 		   resp.board_id_valid, resp.board_id);
@@ -2332,7 +2332,7 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 	ab->qmi.num_radios = ab->hw_params->def_num_link;
 
 	ath12k_dbg(ab, ATH12K_DBG_QMI,
-		   "no valid response from PHY capability, choose default num_phy %d\n",
+		   "no valid response from PHY capability, choose default num_phy %u\n",
 		   ab->qmi.num_radios);
 }
 
@@ -2393,7 +2393,7 @@ static int ath12k_qmi_fw_ind_register_send(struct ath12k_base *ab)
 	}
 
 	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "FW Ind register request failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "FW Ind register request failed, result: %u, err: %u\n",
 			    resp->resp.result, resp->resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -2428,7 +2428,7 @@ int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 	if (!test_bit(ATH12K_FLAG_FIXED_MEM_REGION, &ab->dev_flags) &&
 	    ab->qmi.target_mem_delayed) {
 		delayed = true;
-		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi delays mem_request %d\n",
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi delays mem_request %u\n",
 			   ab->qmi.mem_seg_count);
 	} else {
 		delayed = false;
@@ -2474,7 +2474,7 @@ int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 		if (delayed && resp.resp.error == 0)
 			goto out;
 
-		ath12k_warn(ab, "Respond mem req failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "Respond mem req failed, result: %u, err: %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -2606,13 +2606,13 @@ static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
 		if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
 			ab->qmi.target_mem_delayed = true;
 			ath12k_warn(ab,
-				    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
+				    "qmi dma allocation failed (%u B type %u), will try later with small size\n",
 				    chunk->size,
 				    chunk->type);
 			ath12k_qmi_free_target_mem_chunk(ab);
 			return -EAGAIN;
 		}
-		ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
+		ath12k_warn(ab, "memory allocation failure for %u size: %u\n",
 			    chunk->type, chunk->size);
 		return -ENOMEM;
 	}
@@ -2659,7 +2659,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			mlo_size += chunk->size;
 			if (ag->mlo_mem.mlo_mem_size &&
 			    mlo_size > ag->mlo_mem.mlo_mem_size) {
-				ath12k_err(ab, "QMI MLO memory allocation failure, requested size %d is more than allocated size %d",
+				ath12k_err(ab, "QMI MLO memory allocation failure, requested size %d is more than allocated size %d\n",
 					   mlo_size, ag->mlo_mem.mlo_mem_size);
 				ret = -EINVAL;
 				goto err;
@@ -2668,7 +2668,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			mlo_chunk = &ag->mlo_mem.chunk[mlo_idx];
 			if (mlo_chunk->paddr) {
 				if (chunk->size != mlo_chunk->size) {
-					ath12k_err(ab, "QMI MLO chunk memory allocation failure for index %d, requested size %d is more than allocated size %d",
+					ath12k_err(ab, "QMI MLO chunk memory allocation failure for index %d, requested size %u is more than allocated size %u\n",
 						   mlo_idx, chunk->size, mlo_chunk->size);
 					ret = -EINVAL;
 					goto err;
@@ -2699,7 +2699,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 	if (!ag->mlo_mem.mlo_mem_size) {
 		ag->mlo_mem.mlo_mem_size = mlo_size;
 	} else if (ag->mlo_mem.mlo_mem_size != mlo_size) {
-		ath12k_err(ab, "QMI MLO memory size error, expected size is %d but requested size is %d",
+		ath12k_err(ab, "QMI MLO memory size error, expected size is %d but requested size is %d\n",
 			   ag->mlo_mem.mlo_mem_size, mlo_size);
 		ret = -EINVAL;
 		goto err;
@@ -2884,7 +2884,7 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "qmi targetcap req failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "qmi targetcap req failed, result: %u, err: %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -2936,7 +2936,7 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 		    ab->qmi.target.chip_id, ab->qmi.target.chip_family,
 		    ab->qmi.target.board_id, ab->qmi.target.soc_id);
 
-	ath12k_info(ab, "fw_version 0x%x fw_build_timestamp %s fw_build_id %s",
+	ath12k_info(ab, "fw_version 0x%x fw_build_timestamp %s fw_build_id %s\n",
 		    ab->qmi.target.fw_version,
 		    ab->qmi.target.fw_build_timestamp,
 		    ab->qmi.target.fw_build_id);
@@ -3006,7 +3006,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 		if (ret < 0)
 			goto out;
 
-		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi bdf download req fixed addr type %d\n",
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi bdf download req fixed addr type %u\n",
 			   type);
 
 		ret = qmi_send_request(&ab->qmi.handle, NULL, &txn,
@@ -3023,7 +3023,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 			goto out;
 
 		if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-			ath12k_warn(ab, "qmi BDF download failed, result: %d, err: %d\n",
+			ath12k_warn(ab, "qmi BDF download failed, result: %u, err: %u\n",
 				    resp.resp.result, resp.resp.error);
 			ret = -EINVAL;
 			goto out;
@@ -3036,7 +3036,7 @@ static int ath12k_qmi_load_file_target_mem(struct ath12k_base *ab,
 			temp += req->data_len;
 			req->seg_id++;
 			ath12k_dbg(ab, ATH12K_DBG_QMI,
-				   "qmi bdf download request remaining %i\n",
+				   "qmi bdf download request remaining %u\n",
 				   remaining);
 		}
 	}
@@ -3127,7 +3127,7 @@ int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 			release_firmware(fw_entry);
 		return ret;
 	default:
-		ath12k_warn(ab, "unknown file type for load %d", type);
+		ath12k_warn(ab, "unknown file type for load %d\n", type);
 		goto out;
 	}
 
@@ -3239,7 +3239,7 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	if (ab->hw_params->fw.m3_loader == ath12k_m3_fw_loader_driver) {
 		ret = ath12k_qmi_m3_load(ab);
 		if (ret) {
-			ath12k_err(ab, "failed to load m3 firmware: %d", ret);
+			ath12k_err(ab, "failed to load m3 firmware: %d\n", ret);
 			return ret;
 		}
 		req.addr = m3_mem->paddr;
@@ -3269,7 +3269,7 @@ int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "qmi M3 info request failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "qmi M3 info request failed, result: %u, err: %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -3364,7 +3364,7 @@ int ath12k_qmi_wlanfw_aux_uc_info_send(struct ath12k_base *ab)
 
 	ret = ath12k_qmi_aux_uc_load(ab);
 	if (ret) {
-		ath12k_err(ab, "failed to load aux_uc firmware: %d", ret);
+		ath12k_err(ab, "failed to load aux_uc firmware: %d\n", ret);
 		return ret;
 	}
 
@@ -3394,7 +3394,7 @@ int ath12k_qmi_wlanfw_aux_uc_info_send(struct ath12k_base *ab)
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "qmi AUX_UC info request failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "qmi AUX_UC info request failed, result: %u, err: %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -3426,7 +3426,7 @@ static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 			       qmi_wlanfw_wlan_mode_req_msg_v01_ei, &req);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
-		ath12k_warn(ab, "qmi failed to send mode request, mode: %d, err = %d\n",
+		ath12k_warn(ab, "qmi failed to send mode request, mode: %u, err = %d\n",
 			    mode, ret);
 		goto out;
 	}
@@ -3437,13 +3437,13 @@ static int ath12k_qmi_wlanfw_mode_send(struct ath12k_base *ab,
 			ath12k_warn(ab, "WLFW service is dis-connected\n");
 			return 0;
 		}
-		ath12k_warn(ab, "qmi failed set mode request, mode: %d, err = %d\n",
+		ath12k_warn(ab, "qmi failed set mode request, mode: %u, err = %d\n",
 			    mode, ret);
 		goto out;
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "Mode request failed, mode: %d, result: %d err: %d\n",
+		ath12k_warn(ab, "Mode request failed, mode: %u, result: %u err: %u\n",
 			    mode, resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -3536,7 +3536,7 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "qmi wlan config request failed, result: %d, err: %d\n",
+		ath12k_warn(ab, "qmi wlan config request failed, result: %u, err: %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -3580,7 +3580,7 @@ static int ath12k_qmi_wlanfw_wlan_ini_send(struct ath12k_base *ab)
 	}
 
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
-		ath12k_warn(ab, "QMI wlan ini response failure: %d %d\n",
+		ath12k_warn(ab, "QMI wlan ini response failure: %u %u\n",
 			    resp.resp.result, resp.resp.error);
 		ret = -EINVAL;
 		goto out;
@@ -3663,7 +3663,7 @@ void ath12k_qmi_trigger_host_cap(struct ath12k_base *ab)
 
 	spin_unlock(&qmi->event_lock);
 
-	ath12k_dbg(ab, ATH12K_DBG_QMI, "trigger host cap for device id %d\n",
+	ath12k_dbg(ab, ATH12K_DBG_QMI, "trigger host cap for device id %u\n",
 		   ab->device_id);
 
 	ath12k_qmi_driver_event_post(qmi, ATH12K_QMI_EVENT_HOST_CAP, NULL);
@@ -3833,7 +3833,7 @@ static void ath12k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 	for (i = 0; i < qmi->mem_seg_count ; i++) {
 		ab->qmi.target_mem[i].type = msg->mem_seg[i].type;
 		ab->qmi.target_mem[i].size = msg->mem_seg[i].size;
-		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi mem seg type %d size %d\n",
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi mem seg type %d size %u\n",
 			   msg->mem_seg[i].type, msg->mem_seg[i].size);
 	}
 
@@ -3954,7 +3954,7 @@ static int ath12k_qmi_event_host_cap(struct ath12k_qmi *qmi)
 
 	ret = ath12k_qmi_host_cap_send(ab);
 	if (ret < 0) {
-		ath12k_warn(ab, "failed to send qmi host cap for device id %d: %d\n",
+		ath12k_warn(ab, "failed to send qmi host cap for device id %u: %d\n",
 			    ab->device_id, ret);
 		return ret;
 	}
@@ -4024,7 +4024,7 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 				set_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags);
 			break;
 		default:
-			ath12k_warn(ab, "invalid event type: %d", event->type);
+			ath12k_warn(ab, "invalid event type: %d\n", event->type);
 			break;
 		}
 

---
base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
change-id: 20260623-qmi-debug-log-7d07214bf18b


