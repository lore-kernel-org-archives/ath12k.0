Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D239606EE8E
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DL/jgezU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SJgNINCo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGXZGKYM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=; b=DL/jgezUpII+jO
	Kq0uoxCMLqfV7v3gELEsrNns3juUslIcflz42HV7XrhB3a9jMfcFbkpY1ig3gdHQir6bp5ZRSFxI8
	HCExzTOs+1ZAeDPlIz014wIzdi1i3WCT3h8JEZM4bDYFdxXxzBpGTl+aW6bQi9FOSrXudaH6Juw06
	JT1Qi5iR7x9RekMRaSeGaTzcRN+TufKDSm+6ZEFACPBfo+3kjmb2aRnIPEaWiJLsKM1QWqzA4Kkey
	orC9UFvif527dZAIyYDS020YIN032vWOSK4QtDT1GqozH8Q+XW5sF79E0ngrWWJXiQqHylcwsV0E9
	rJ7XwC+ZGb6C2unfNuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWl-000000042yY-3EaK;
	Wed, 04 Nov 2026 01:10:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWg-000000042rv-3r70
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQvv809416
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=; b=SJgNINCozTDPpQNL
	a9SOujbC0xWVYYR2PXU1t/In1wFnzAu/LXIciLYTVh+kUhpZhq3aQalEjM6pYQCM
	GwD5P5qOwzocTpA6FVey5meSWz58SrQefh8vuh0jBOBxDDdUwNVqY6xIkLlWborv
	1ww1NF4GmyJZbc2qZqBunAGErS1PrGFomcV3KvtmCIDk55/n4aQcpiJNbJbz5GiD
	sPyV3v3jJIZq3Xi9A16vf4e3M7WMmPS1kIS9odnIKx7WqVhe0LUmKga2DQg42Jqj
	ndkNSUhRWi6vN7aO8Rba9MTqMqcfAtQKc90GrDm6ZuSYs/1dATVrgZ2YTKlnnP8E
	HvhDWA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp9vr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso261766eec.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754653; x=1794359453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=;
        b=jGXZGKYMZxPoRBAkTG2OuI34bP5zrQDeWEo21v0K+LB35FT6Hcb/WjUAyP2rXEDbWv
         im9KSHCEqheHjmzvDgl5xEX9uUz/CWzwUB1jdtdYlesKSEIquUV+e8gxLzTZfIC2wOOF
         ZMQnULGkCMoqmLKEsnneV3OJBxF9AW7iHWUY1TY9l6nkaSV88gkTTTE3AvaKuDmDExfH
         DaRJq7CRcXExs8p4NgewL16IwpWh1DOxt7uqKfX267HGVbRLsErwGHy+ig+2PiVU5KS2
         CJA2nK7VDKuZNLL7cPcTglGnXWQwrh1inDN76ZWzfzRlXPkSaSrIL6ZzSb/+7qtJPqCx
         i5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754653; x=1794359453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mL14LNWehxCuNae9DlFtHdzgIir7uUJx/MZpih9Df48=;
        b=EdxKjckQjSZ7xMXitV8gZU5gTjqZs9SrAp8vj58nqd6ff1r1O7ANabP8EJuhCom9+9
         gU4pkUrMBA2Qha15my4HDtSU5d+uiXerQRZ3DT8izrwFs9+avFHAQZX2WfBrRDrGbK9s
         h9JPEXo5iLErslPeqlDkCrj2p807IyzP9SufvF12cCzxwNBghwTq27bhvnQJOtep10op
         Fq3lfB+WxCWOSw80J6y1Jl7lLHRlDByOF3HHQ9l+/kKPUNC6ua32M6Uf4tZSZ7F3VStR
         UJaORp9NN6JLagpPlMLCIrWJZgY/dWEQE3mygur0JSMI4uD4mkpAxx4zPV3RgF98YaRg
         pXCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyBDlljC5AvFKQLqBjB/5N3fi8+n/M0UQxdpS5qpjEkInb5Tfyb+pLcS/nq1AgDgujdYhe7IM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9XkGwiIYWPf3WsKiPqeYBFbgWYdg6gr6y5n7xgyWKsogbW9b3K
	81fCGJsrTMclQ58LTq7La8DJPAO6TAOaTF/tTed8/bFoHJwvZcnVved3b27rKOM9MG1866m7kUs
	qJFuRW8fskVEeoCXzh4asmfdtUQF8SYv4hSkeQQfnyJAnoTq/5RsxB5gNciiVaUZx
X-Gm-Gg: AYBFou14BiX0dSxpiCDpbp8mKDUB361C+8b3Bta1CdyHCE/I80LZvbXFhUGbibCga4Q
	KWxpWO5T6ajvcxNtWyTmTrgOWvXfjHJrqBMcMBabHoDy/x/yBlM+lC8NgbLnjbk9MsDFbxqjvX/
	7xhw2SEkJeCMjTadzz7KXYlSn50aPrVTCQE6F2/b0jkwnZ8Fs+s9m9V6VlxyBHqSlNcbCfUkjTX
	cll+d3VOaR68G9vio7lOSzTCPKwkMhyDSjbNSLULjHd3y3VnZYhif/wqu9rx5I3vyQeLXpAcwXG
	VjCmTt1xdxsIIovy/ZJbFQbNTcGeIVAI4yvuJEp4PikcbKMxk5icEmJ5EQXYacmzrDS1FpOtyvd
	tr7nteC9FIkZQ0mhH1iTFyJ5/O+sxUNGcbhrBU13ohRT/YDpqT9SLAdsfbSKN+ZJ5bHtThISDHf
	X3635tQGoFxwJmVMDUMcQ/o6LGhtzpi3QS4ASV
X-Received: by 2002:a05:7300:4719:b0:368:6f29:f26c with SMTP id 5a478bee46e88-36a4221aa0dmr20176237eec.4.1793754652822;
        Tue, 03 Nov 2026 17:10:52 -0800 (PST)
X-Received: by 2002:a05:7300:4719:b0:368:6f29:f26c with SMTP id 5a478bee46e88-36a4221aa0dmr20176178eec.4.1793754652061;
        Tue, 03 Nov 2026 17:10:52 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:51 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:49 -0800
Subject: [PATCH ath-next v3 06/13] wifi: ath12k: ng: parse 1K REO queue
 statistics
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-6-861adf04b516@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX+sV3T8GQJ5vr
 gXGsB0Ax44RHfepJS5j3/0NDT1PWsBRFMJfveOy3iCGmK7dnsnxVNZBQsIdpChA2CXRkA5NJ6H3
 KlivwFLcAW7uRUZfHjoZoWj8NyYC3asGjA8Bg92bRonxDY7AOV0+Mu9pdUBx8Gh1LAJ7Y4ocJvn
 bhUNR/obPYfVo0ia02ndIl6J9iwWtTGBwBxO2pbv8frkhB9E15b8+NLNRJSb3ADSFDcqtpgYUU5
 Q3oPV9NLs7qPQoRPoBb8LB5j39JqTEgywLaC3Rxzw6kEaqIybV/r5bfYMaZwEpWcOOetr1icxpS
 2kaaa0A6dywJ5PqMZlMTiRc/4uOm6MbL9XzYdswVKdT1q/6fg35wLI/+m8ARwaWKtj9JkR/x9C4
 KfRHUixbEkuXYhziLLv2ioa9ZBNGuRx9Q+7UJoVcMaUY2EaG7c8rgr6muqAOaNkeXYuP81L4zjP
 Rg42Y3PCFng7dVWpUvA==
X-Proofpoint-GUID: SCXWrOKXFSc6qmlm7Qglpfm1Z43uD46a
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea861d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jlw-gz1d5bKLCbeaqcMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX3IZmqRvUJdCa
 aQake+A1a63h5ociGh356EqqMDwYgb/22FUGVQpz7VaS57TBB7KVG9s8s5V4OP0r1Rv8oKztFTU
 mSwt6pgJAdboXgH946EUiQicJ/CtE5s=
X-Proofpoint-ORIG-GUID: SCXWrOKXFSc6qmlm7Qglpfm1Z43uD46a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171055_092665_C341DA5C 
X-CRM114-Status: GOOD (  17.34  )
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

A normal REO queue-statistics status contains the first 288 bits of the
reorder bitmap. For a receive queue with a larger BlockAck window, the
hardware sets a follow-up flag and returns bits 288 through 1023 in a
second status TLV.

Define the 1K queue-statistics status descriptor and decode its 23
additional bitmap words. Extend the common queue status with the PN
encoding, follow-up indication, and wider counters, and store the TLV tag
so a follow-on datapath patch can distinguish both responses for one
command number.

This commit only extends Wi-Fi 8 status representation and parsing. It
does not submit commands or change the Wi-Fi 7 descriptor path.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal.h            | 15 +++++++++---
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h | 10 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c   | 30 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h   |  3 +++
 4 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 9c0d1dfac8d3..6534e11a3378 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -1173,6 +1173,9 @@ struct hal_reo_status_queue_stats {
 	u16 ssn;
 	u16 curr_idx;
 	u32 pn[4];
+	u8 pn_len;
+	u8 pn_127_48_info;
+	bool to_follow_1k;
 	u32 last_rx_queue_ts;
 	u32 last_rx_dequeue_ts;
 	u32 rx_bitmap[9];
@@ -1186,9 +1189,13 @@ struct hal_reo_status_queue_stats {
 	u32 total_num_processed_byte_cnt;
 	u32 late_rx_mpdu_cnt;
 	u32 reorder_hole_cnt;
-	u8 timeout_cnt;
-	u8 bar_rx_cnt;
-	u8 num_window_2k_jump_cnt;
+	u32 timeout_cnt;
+	u32 bar_rx_cnt;
+	u32 num_window_2k_jump_cnt;
+};
+
+struct hal_reo_status_queue_1k_stats {
+	u32 rx_bitmap[23];
 };
 
 struct hal_reo_status_flush_queue {
@@ -1246,8 +1253,10 @@ struct hal_reo_status_desc_thresh_reached {
 struct hal_reo_status {
 	struct hal_reo_status_header uniform_hdr;
 	u8 loop_cnt;
+	u16 tag;
 	union {
 		struct hal_reo_status_queue_stats queue_stats;
+		struct hal_reo_status_queue_1k_stats queue_1k_stats;
 		struct hal_reo_status_flush_queue flush_queue;
 		struct hal_reo_status_flush_cache flush_cache;
 		struct hal_reo_status_unblock_cache unblock_cache;
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
index 691c9866522f..e2947dd112ce 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h
@@ -536,6 +536,15 @@ struct hal_reo_get_queue_stats_status {
 	__le16 info6;
 } __packed;
 
+#define HAL_REO_GET_Q_1K_STATS_STATUS_INFO0_LOOPING_COUNT	GENMASK(15, 12)
+
+struct hal_reo_get_queue_1k_stats_status {
+	struct hal_reo_status_hdr hdr;
+	__le32 rx_bitmap1023_288[23];
+	__le16 rsvd0;
+	__le16 info0;
+} __packed;
+
 /* REO command TLV tags */
 #define HAL_REO_GET_QUEUE_STATS			313
 #define HAL_REO_FLUSH_QUEUE			314
@@ -549,6 +558,7 @@ struct hal_reo_get_queue_stats_status {
 #define HAL_REO_FLUSH_TIMEOUT_LIST_STATUS	338
 #define HAL_REO_DESCRIPTOR_THRESHOLD_REACHED_STATUS	339
 #define HAL_REO_UPDATE_RX_REO_QUEUE		371
+#define HAL_REO_GET_QUEUE_1K_STATS_STATUS	451
 #define HAL_REO_UPDATE_RX_REO_QUEUE_STATUS	204
 
 #define HAL_REO_FLUSH_QUEUE_INFO0_DESC_ADDR_HI		GENMASK(7, 0)
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index 80c2f1202233..d78c178cc70d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -470,6 +470,29 @@ ath12k_wifi8_hal_reo_cmd_update_rx_queue(struct hal_tlv_64_hdr *tlv,
 	return le16_to_cpu(desc->cmd.reo_cmd_number);
 }
 
+void ath12k_wifi8_hal_reo_status_queue_1k_stats(struct ath12k_base *ab,
+						struct hal_tlv_64_hdr *tlv,
+						struct hal_reo_status *status)
+{
+	struct hal_reo_get_queue_1k_stats_status *desc =
+		(struct hal_reo_get_queue_1k_stats_status *)tlv->value;
+	u32 *dst = status->u.queue_1k_stats.rx_bitmap;
+	int i;
+
+	status->uniform_hdr.cmd_num = le16_to_cpu(desc->hdr.reo_status_number);
+	status->uniform_hdr.cmd_status =
+		le16_get_bits(desc->hdr.info0,
+			      HAL_REO_STATUS_HDR_INFO0_EXEC_STATUS);
+	status->uniform_hdr.timestamp = le32_to_cpu(desc->hdr.timestamp);
+
+	for (i = 0; i < ARRAY_SIZE(desc->rx_bitmap1023_288); i++)
+		dst[i] = le32_to_cpu(desc->rx_bitmap1023_288[i]);
+
+	status->loop_cnt =
+		le16_get_bits(desc->info0,
+			      HAL_REO_GET_Q_1K_STATS_STATUS_INFO0_LOOPING_COUNT);
+}
+
 static int ath12k_hal_reo_cmd_flush_queue(struct hal_tlv_64_hdr *tlv,
 					  struct ath12k_hal_reo_cmd *cmd)
 {
@@ -596,6 +619,13 @@ void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 		le32_get_bits(desc->info0, HAL_REO_GET_Q_STATS_STATUS_INFO0_CURRENT_INDEX);
 	status->u.queue_stats.pn[0] = le32_to_cpu(desc->pn_31_0);
 	status->u.queue_stats.pn[1] = le16_to_cpu(desc->pn_47_32);
+	status->u.queue_stats.pn_127_48_info =
+		le16_get_bits(desc->info1, HAL_REO_GET_Q_STATS_STATUS_INFO1_PN_127_48_INFO);
+	status->u.queue_stats.to_follow_1k =
+		le32_get_bits(desc->info5,
+			      HAL_REO_GET_Q_STATS_STATUS_INFO5_GET_Q_1K_SSTAT_FOLLOW);
+	status->u.queue_stats.pn_len =
+		(status->u.queue_stats.pn_127_48_info == 0) ? 6 : 16;
 	status->u.queue_stats.last_rx_queue_ts =
 		le32_to_cpu(desc->last_rx_enqueue_timestamp);
 	status->u.queue_stats.last_rx_dequeue_ts =
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index d61ca0823b5f..357839c7d9e3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -112,6 +112,9 @@ void ath12k_wifi8_hal_reo_hw_setup(struct ath12k_base *ab);
 void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,
 					     struct hal_reo_status *status);
+void ath12k_wifi8_hal_reo_status_queue_1k_stats(struct ath12k_base *ab,
+						struct hal_tlv_64_hdr *tlv,
+						struct hal_reo_status *status);
 void ath12k_wifi8_hal_reo_flush_queue_status(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,
 					     struct hal_reo_status *status);

-- 
2.43.0


