Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E898C5B56A
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzME1hBKyGBvUEI4XmEOk/d4ajVZXCMyMBXyGj3QNWk=; b=swA6zuDB3jEfMJZgnsvN69jovr
	bxda50YtV1V4De+HT55nkp/bN0Zx+bg099n/a8viAWAq1t0eOqzk2anBzcIjPisKHODT1b1oQpOvb
	uqNp+LB+dR3P8vUQKCIIGGXIxY/hQgn4BZ+67RVHfejsu69rI59CExidIUgqvMd6gmacrXe/7Jyq5
	30fC9Bi+/8doh+apda37+Dcd1h1WJm3fUPi3FFrltS6lpDt1SCRHM4eFwUB+UrrPpyTe/4c3LlWRR
	4odRhBS4wOmaqF8w1doMZmdDk9BNMFfmxh5M2tx283Z4sOpQzmx8BmEUa1CsHEA9O4zBN3yd+Pknb
	V2sbH/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFJ-0000000C3Gs-0pho;
	Mon, 10 Aug 2026 14:44:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFH-0000000C3Fm-0TYP
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:44:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwGK1650218
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JzME1hBKyGB
	vUEI4XmEOk/d4ajVZXCMyMBXyGj3QNWk=; b=Gfq9TM3xJYaBV+WxzJC3V+TVUgK
	jYnci2D6rE1xBKwrOmLR+rrW+PcPVU7k7+HBrH+sPsRtO70FwGp0ZL73zLGM89b8
	+s3Aju5J7zpUPratv/crc3RlaFaFaoa0pS1e1H8LXh0054KZvuRJjW9wet1/ZRG8
	3hUHPDDbaa9Dkxe60oO0FSDu2LFjafG9T2iSH6/L/kZw1TFcCMEP/M69WHJ7maaE
	Wj87IczNDNKwlu4gmcerIcfcVVMbkuIsma3BenjLRS8A+SclkeFG0eJXjhnBWzDW
	ZDYzNx2eW0pQ1lCFcJOttX4VMWg3KeWNoHIsMtL4VXCA6VJOytVgoLvX7LQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhj1ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:44:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso1875747a91.2
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373093; x=1786977893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzME1hBKyGBvUEI4XmEOk/d4ajVZXCMyMBXyGj3QNWk=;
        b=Iq4wSbA7fwu44Jjy/CUmkOIhkptwIoze32LLHMWTBAb0yvkcNDQAlm4xok3cWFpUmQ
         khOPTR6sdfqyLzBP8dxqKn4XsnaQAsZhpJ1pPQuZlbsV/iDPxysWvCg7Er7ZvNg7VZTc
         nQOTvpVzcgzV81Jnw6UECzsTTaRfZ5oudkn2tp+PpUDNNiYtEPbqm0u4xoztAMltm+8j
         u/fQNByBCYNS29OWGO7Bx0dqGHwGqQgEk9VRs/UkU61K5GKa0xktgFPGumI+0IPlwZwY
         6QTtSGyH/BuXa/Z8xmA8tP1QYMabhZ29M94Rs4UbY/RC9OFjNs2LiqNKcC4P0r0z78Y8
         JhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373093; x=1786977893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzME1hBKyGBvUEI4XmEOk/d4ajVZXCMyMBXyGj3QNWk=;
        b=h5Fy/BgmFKV1IzG8/MrSemh9dtHc1J4WhW7xebquuoFv9RXUfaS/lMNSpCRQNoQNqf
         agOzkpk0SYCFFLEA4A6hJV3qPCadvWZrVC5B7OGE4p3V/+FsDp5GE1NvWBUYg1Ib2dZe
         yLq/2x3QXWo2aH8yWNvFZp2L5PnaVpMpqdsK5LNXCX4sp+cdhuxXSkFG0puIO/4d/d0U
         09fF8GaTEb+civTtKnTF7btw8JbWKnv4J4MXns3AaIHilvclGcNe7tPvk1Lr6UCKgXFN
         9aThCGSNVKG9VdhWgY532zbaCM8oMbrO7KSX46sj4dw5urTTWerNlafQ+s7b3798wJkH
         fU+w==
X-Gm-Message-State: AOJu0Yz8oOaNeRGpYHfRyTpLMcxuK6O9u0KRSpWYYt+q6iwhM/TrFJNQ
	vSjjZ9WDcizeVuzJuMarAU+oJtwZlJknOtDD6K19NziaZjOBRBkoyrNB8rHqH2h2jjkTwvclexi
	+6u0ULSlA/6zcArsmScVMmPJyJqELt110tdainONqTQpd65guSMse4yOqgJCL6D5HKUkCViQH
X-Gm-Gg: AR+sD11owyRHiXGpPmUi7XHcJq0DREdPMFb4MEgPWUkWDmZVyIC6fQVlBSAGh+w5ugi
	KVA77g1OB24SZHhG3JgVCCvUdOb94BIqzYRdc+lwZu6v0AzaLr5R1pun5vz0l4WJkN1N+pBz3+Q
	LrDUkX0QCANomtxfIsoXHeylmWTnh0FmLuMKlvubxEV1ccyT055PMtM+4BRr5vc330SvUUIzTz9
	aDGQf2CEFZr5l0HVKrdexnqoBRP8xQaJORJThB7LMs1t4mpwRdFkw/Wcx2nAQHc+v4r9hasynBU
	ognWpG5q4SjfE/qwRzIs5e4CEdu4thd/YQOjDRUgWyDDd4YF325tTksUHmnH7dt4qt4N9to03jn
	iPXEtrNeRWUxDKvRuW4ZogK5e6q1Rz6folg3ZfwU7VoeuP9krQOr3
X-Received: by 2002:a17:90b:380e:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3909d89bb6emr28802843a91.12.1786373093141;
        Mon, 10 Aug 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a17:90b:380e:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3909d89bb6emr28802784a91.12.1786373092699;
        Mon, 10 Aug 2026 07:44:52 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:44:52 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 1/8] wifi: ath12k: fix out-of-bounds access on TX stats arrays
Date: Mon, 10 Aug 2026 20:14:37 +0530
Message-Id: <20260810144444.2033607-2-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79e3e6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=l51fLghi-aCFcmm4dtIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: SbYDhd4MKLmYuNh0dcLZvsC7zYrzx9wo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfXxhnQ6IktDw8C
 rrQjDlbJsSe92B57rlN+OXNmy7YbTnMhTKbbP8zTxaj45+KwybuNpwqIsvfDlyzcSlJaWcjUsYF
 ZCOKRgTfRQ4rrzSB+PFctDSDhmuNI/W/62IY5pzyCyhOYcm7xFKOvHzcA1QLyGwces3N4Ocb+/t
 ifRgfuIAhg30Diby9YliyXFnrTYRNlWChfRp2VaeptilfQEzjGBwTHpW8YWGJ8gv4JKqKbIo9Bj
 ITTNRiApoJJqPJ3ji0qNV9iG0pZ4Ex6dsT8bI1vkX03ABVnjWzo7yqgPCBJK1Av3qwEIdiZqnMe
 8sIYtwB54QhSPa8qbSTmU3hNCJYB/J1dauYDMpsySyBBwXXQkZab91Ym7Ay5wok3CAUfvDNfiMG
 Mp2MXY6o2Gb5lwh2YYkZmpMXTa4Zftx/Z1IixISd3XXPm3/h3IVi2D6z+zi3/kAZ/AfuQTNgPa9
 LIzus1jrBPUzxQPvrBA==
X-Proofpoint-GUID: SbYDhd4MKLmYuNh0dcLZvsC7zYrzx9wo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX8ILyB2sSG5uL
 1dgAlEEch8OM7LsrpLnb1JG7se7WKSHPt6suPWHAfhTpDACAM3x0UBVpCI2mvQqb86njI5Yn8k2
 MgRNANO53QWZej8o9eWlXXNL6Ny5srk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074455_271577_A3CB1AF8 
X-CRM114-Status: GOOD (  12.89  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The fw_tx_status[], tx_wbm_rel_source[], and tqm_rel_reason[] arrays
are indexed directly by values read from hardware without bounds checks.
Values at or beyond MAX_FW_TX_STATUS, HAL_WBM_REL_SRC_MODULE_MAX, or
MAX_TQM_RELEASE_REASON respectively would write past the end of the
arrays causing memory corruption.

Add likely() bounds checks before incrementing each counter. For
tx_wbm_rel_source[] and tqm_rel_reason[], add WARN_ON_ONCE() on the
out-of-bounds else branch. For fw_tx_status[], no WARN_ON_ONCE is added
since the switch statement that follows already calls ath12k_warn() in
its default: branch for unknown values, avoiding a double-warn.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Fixes: c5c62287e690 ("wifi: ath12k: Add device dp stats support")
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 587d58eeccfa..3d635cac8f8c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -582,7 +582,8 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_dp *dp, void *desc,
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-	dp->device_stats.fw_tx_status[wbm_status]++;
+	if (likely(wbm_status < MAX_FW_TX_STATUS))
+		dp->device_stats.fw_tx_status[wbm_status]++;
 
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
@@ -984,11 +985,17 @@ void ath12k_wifi7_dp_tx_completion_handler(struct ath12k_dp *dp, int ring_id)
 		/* Find the HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE value */
 		buf_rel_source = le32_get_bits(tx_status->info0,
 					       HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
-		dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		if (likely(buf_rel_source < HAL_WBM_REL_SRC_MODULE_MAX))
+			dp->device_stats.tx_wbm_rel_source[buf_rel_source]++;
+		else
+			WARN_ON_ONCE(1);
 
 		rel_status = le32_get_bits(tx_status->info0,
 					   HAL_WBM_COMPL_TX_INFO0_TQM_RELEASE_REASON);
-		dp->device_stats.tqm_rel_reason[rel_status]++;
+		if (likely(rel_status < MAX_TQM_RELEASE_REASON))
+			dp->device_stats.tqm_rel_reason[rel_status]++;
+		else
+			WARN_ON_ONCE(1);
 
 		/* Release descriptor as soon as extracting necessary info
 		 * to reduce contention
base-commit: 691e5e43b2aa
--
2.34.1


