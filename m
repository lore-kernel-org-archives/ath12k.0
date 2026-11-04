Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B5606D80C
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIDUyWO4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OD2NxHmX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLIOq9qT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=; b=HIDUyWO4FGn760
	FEcY1nX1f7JFsugnH9x94lBC3UPecj2sBFhpSTAdriHveQOXHPOQbCOhynSExiAUXiEjeuruLSc0G
	tzmnJ+ccna9+0moHXLCpYbpDzGBP1k6GyK+FSz3C6/3A4AsOWVgBHtWlBYArAWcVYsvZDP1Pj73pK
	/uKxaCh7I0UN1d/9+CZtLv4THW0hKJbBBJsrYedKsaxA5+9yR7xnUI/5A27GUNxVTeXFikiXHw7fR
	+rsEnuB29ZTH8qMmkbDNzCKV1cwcXGgNaAl8x7xlUsvkMiYaVLWAOLzyrU/70DiO0dfrr8MYJ4TKd
	RqI2JlcmP2cZmo+EnokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWl-000000042z4-4AHZ;
	Wed, 04 Nov 2026 01:11:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWi-000000042sV-0kyU
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40REHg3335342
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=; b=OD2NxHmXppY4J5T2
	pgBa6YaPRWsHESBxxDfHJxPlqHq9bn+ujulj0tHxJqJTSWlRHlhcxzytI6WCPoLv
	kG+HeToYntjasRh7yeEovTsBas8lmTfCJ186Y2Ly8apiUj4Kq9KstS3Scedrc6T4
	naMuWRY/qthwcuH3U1WwIqTRGq+CgRDwSMEPFcytV/FNYcL+CjSozVy2zf1bPwmc
	im4TGkK0aqOqBe5TsKb6CTxPKRm22e7REg/IoD3jlQc92F2QxV1vqPRZ28xFsEox
	llacpS9piLmn5nwYmzL3tX5snjpJZPvn7FHYGCGT3RtAo+jqbunuLw0G4EfRof1n
	mCfRKA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsf9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso711961eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754654; x=1794359454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=;
        b=ZLIOq9qTD7kP14Q+AHGst29rzrFCOqJ+jqOYu1+76jA9VE4RaO1Rx3o31AyfS78RZw
         S6Q6Tz91joAbRc7xkvBQUhCliQKsxPEN7cWY3P0ZkDIqlWLZ41dpzr9e8HwAzRiURTIC
         ttTwMVW3lqSLG9GSGp0R1cUv8Z/KSreKPh+gC0ycXqifdW46FH1UVA8WfATpU/lo1e/U
         6kvOGTqXqB9cpI2QZxNVeJi6+eMPwoAZ1zKlrd/6zhCdtypEVRCjUNR0FWpoZoD2bxcn
         ODU5OKcFhByH3/0AB+5QvHIC7QSc+63m0H0dC0d+MLfdyWSFQ8w87Q/kDo4R9rmKuJSZ
         w8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754654; x=1794359454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=;
        b=m9DckYHprfyaO12XVEgt7uMScVI52SU+Iu8ZBIZqTvRqEIXeLb2Iki2KlOZ3T0GCYK
         u/M9mDRZn6NjeO0uRiP0aF7CNRTu+SpJ1ULWMxvKEvWUKzXvqObiygYShvBIVKRGLalV
         C1zVC01XVetIPLhwXJy2FTtUlSo7HwpawVhB3lz9P6uphV8UIAzGY85MtTJxeYVAomlW
         hi6Piu++JXrpa8a9qzf23BPXdzXiAZ3WPbrrviLk7/35HaYTkAGh8NnxoFC/AD0By01m
         spPgB+fuB4ag5PAXTsZ2eaYvt706yAS7PUeZ6TmshK7BdVKx0X0+36oQ5S4JRERbPa8M
         x1aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv/qehhLh/+ISCAx6WsCAwVrh8OjRNAIsJ9LDgGY9CrW1GIFsF9c0N1LXEPdAj+0AjA31Dzlw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+kdhS2P5/99oJCQSNtC8KSJm4vlVMhC1SlkZGSSJRW3F2g8g5e
	Q/+GkrJNSb1vN6+YTCcLk3gc7h0LDKdslSfk0SGQT+uJrXH6A7IiYC8n4Hu/u5tBwsbIBTup8ls
	iBp6+LRUt8/S7TduTgVayRe+RKx8fHZ0HAs9vLDFmhnd+mt13ZuKi53tMDrwcol11QKfJyiS/
X-Gm-Gg: AYBFou0fV5glv4WWuQStytcIh6HsSkl8ohPSCUqxwkGNVmgmrebNNXV9z2XbeuoSoXb
	fa5pfhUapTlFcz4T3xpcbLMUgm6Qs/ysW2Ar/3JcKpwCOABCmzSfapnB85yEF/QewnSPw6lXsBf
	H4WmLJKK8PkzCFXMbyd4uzZbEG7E0hKTyXFA//aLh0RMFzS0C3qLDWtJN3/wA/6TxuUMAkwIxGx
	7CVf07v1tQleyD4KVXJwvouZcyWx8LaV0Z8QV+ih2jkmJsK0SgUutLaYRhJIMLfMZDzOs4mZc6a
	ve3E0/XtETWzYUnT1PSdOaEzha1MgvqOW/luAbs98jvE0V/y5IFpFSnRT7nCb/hzx8YonlZOoum
	jUfmn6y7dPsipsn8RngLYsD+oePATimtBepXu3259/W6DJ0ZlePQE1khm+DbZ+hAAlxUYz19mbN
	lESCE4XhPTtDGIxchBzc01gcPE8PaB+E3pCiHD
X-Received: by 2002:a05:693c:6316:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-36a4235f4cemr20929506eec.8.1793754653948;
        Tue, 03 Nov 2026 17:10:53 -0800 (PST)
X-Received: by 2002:a05:693c:6316:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-36a4235f4cemr20929465eec.8.1793754653339;
        Tue, 03 Nov 2026 17:10:53 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:52 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:50 -0800
Subject: [PATCH ath-next v3 07/13] wifi: ath12k: ng: process REO status
 ring
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-7-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: xWdPUqhoi2SGHMb4ae1zB03FZThhMCmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX/Dah6UwVlO0k
 C9GlGpZXBtvpghsHLaVBBbcXN9tXiiYPEhYoyJRF8sjNv3wQLwzeApjG+2JsT5NQ8sK+1eP0H/W
 Rnbo8XeH/OEI8A8BWf6HHNYbiXWxITQKuO2UBTmHHTe6Hjk04v29CFDn3WdiR7iovtoYNA/HpN2
 A3oNzahyVARCXJEUChuB1uifTb5OLRv+70C9n1nnQMQkZvRxwV8hbPpjTPtuIA4j232gMa8rWbp
 lcv7onFW8vgIyHHi8gAtdwgvty/3YEdFUKOR0lasZ9j51si56eKG2r9CDHEQSxe66nm9TraFmE+
 VFQDoKHrhqFhFHO++7onXBuSFgh/IRSjN9Zgm2EdvFikpPzErSB2e6CxLAL9AOCLSUw5di7+W5z
 Lo+XM+Bfq9MUc/L+C29Lvu36KQH+6PvorXrxHQhfKlhRZnyagmcpe7RZlmzSg/ZGXH8ZvtlPYpe
 edNMH+ZGp7eei2JIQJQ==
X-Proofpoint-ORIG-GUID: xWdPUqhoi2SGHMb4ae1zB03FZThhMCmw
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea861f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=52ctRNkheENBddPFvzkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX07KiURi4yT8k
 iizDpneoQduAaoosQiPVJdrDhPt2pdjjYz67A0R9HgiCNigqC3OvstFisKob53He5eQUjYx0ZE0
 TgYZ2v0KMQ7xICOTm8JBZDFSRoXf2F8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171056_346679_E001A69D 
X-CRM114-Status: GOOD (  18.02  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wi-Fi 8 can submit REO commands with completion callbacks, but its NAPI
service path does not drain the REO status ring. Commands that request a
status therefore cannot deliver their decoded response to the pending
command context.

Service the REO status ring from the Wi-Fi 8 datapath, decode each
supported status TLV, match it to the pending command number, and pass the
complete status payload to the registered callback. Keep a queue-stats
command pending when a 1K bitmap page follows, then release its context
after processing the second page.

This commit only connects the generic command and status framework. It
does not add a command client or change Wi-Fi 7 status processing.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/dp.c    |  8 +++
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c | 93 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h |  1 +
 3 files changed, 102 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.c b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
index dee73473cea9..e89826f33206 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
@@ -498,6 +498,14 @@ static int ath12k_wifi8_dp_service_srng(struct ath12k_dp *dp,
 			goto done;
 	}
 
+	if (dp->hw_params->ring_mask->reo_status[grp_id]) {
+		work_done = ath12k_wifi8_dp_rx_process_reo_status(dp, budget);
+		budget -= work_done;
+		tot_work_done += work_done;
+		if (budget <= 0)
+			goto done;
+	}
+
 done:
 	return tot_work_done;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index b75e65091995..632ce30fe459 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -2210,3 +2210,96 @@ int ath12k_wifi8_dp_rx_process_err(struct ath12k_dp *dp,
 
 	return total_msdu_reaped;
 }
+
+int ath12k_wifi8_dp_rx_process_reo_status(struct ath12k_dp *dp, int budget)
+{
+	struct ath12k_base *ab = dp->ab;
+	struct hal_tlv_64_hdr *hdr;
+	struct hal_srng *srng;
+	struct ath12k_dp_rx_reo_cmd *cmd, *tmp;
+	struct hal_reo_status reo_status;
+	int work_done = 0;
+	u16 tag;
+	bool found;
+	bool done;
+
+	srng = &ab->hal.srng_list[dp->reo_status_ring.ring_id];
+
+	spin_lock_bh(&srng->lock);
+	ath12k_hal_srng_access_begin(ab, srng);
+
+	while (work_done < budget &&
+	       (hdr = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
+		work_done++;
+		tag = le64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
+		memset(&reo_status, 0, sizeof(reo_status));
+
+		reo_status.tag = tag;
+		switch (tag) {
+		case HAL_REO_GET_QUEUE_STATS_STATUS:
+			ath12k_wifi8_hal_reo_status_queue_stats(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_GET_QUEUE_1K_STATS_STATUS:
+			ath12k_wifi8_hal_reo_status_queue_1k_stats(ab, hdr,
+								   &reo_status);
+			break;
+		case HAL_REO_FLUSH_QUEUE_STATUS:
+			ath12k_wifi8_hal_reo_flush_queue_status(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_FLUSH_CACHE_STATUS:
+			ath12k_wifi8_hal_reo_flush_cache_status(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_UNBLOCK_CACHE_STATUS:
+			ath12k_wifi8_hal_reo_unblk_cache_status(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_FLUSH_TIMEOUT_LIST_STATUS:
+			ath12k_wifi8_hal_reo_flush_timeout_list_status(ab, hdr,
+								       &reo_status);
+			break;
+		case HAL_REO_DESCRIPTOR_THRESHOLD_REACHED_STATUS:
+			ath12k_wifi8_hal_reo_desc_thresh_reached_status(ab, hdr,
+									&reo_status);
+			break;
+		case HAL_REO_UPDATE_RX_REO_QUEUE_STATUS:
+			ath12k_wifi8_hal_reo_update_rx_reo_queue_status(ab, hdr,
+									&reo_status);
+			break;
+		default:
+			ath12k_warn(ab, "Unknown reo status type %d\n", tag);
+			continue;
+		}
+
+		found = false;
+		done = true;
+
+		spin_lock_bh(&dp->reo_cmd_lock);
+		list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
+			if (reo_status.uniform_hdr.cmd_num != cmd->cmd_num)
+				continue;
+
+			found = true;
+			if (tag == HAL_REO_GET_QUEUE_STATS_STATUS &&
+			    reo_status.u.queue_stats.to_follow_1k)
+				done = false;
+
+			if (done)
+				list_del(&cmd->list);
+
+			break;
+		}
+		spin_unlock_bh(&dp->reo_cmd_lock);
+
+		if (found) {
+			if (cmd->handler)
+				cmd->handler(dp, &cmd->u, &reo_status);
+
+			if (done)
+				kfree(cmd);
+		}
+	}
+
+	ath12k_hal_srng_access_end(ab, srng);
+	spin_unlock_bh(&srng->lock);
+
+	return work_done;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index a05ab2f4495c..10940dd92a62 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -191,4 +191,5 @@ void ath12k_hal_extract_rx_spd_data_qcn9625(struct hal_rx_spd *rx_info,
 					    struct hal_rx_desc *rx_desc);
 int ath12k_wifi8_dp_rx_process_err(struct ath12k_dp *dp,
 				   struct napi_struct *napi, int budget);
+int ath12k_wifi8_dp_rx_process_reo_status(struct ath12k_dp *dp, int budget);
 #endif /* ATH12K_DP_RX_WIFI8_H */

-- 
2.43.0


