Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B611EC531F9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 01:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=; b=YBpGMyhEL696vlZtUUTZbiaL5T
	h6hBEiMHSFeufoYTeZCygLURwu1cYI6hA/BbA+TZKJKC8lS8T/ImNSMX2m9HpFwWnVYONXtE86RSK
	V1jZ52UQyMRnrURyh8acR9APnRc7ZwBfNwdpKp879s4KXWppSQmzAa7lNMxSUU47nMD1feIOlJi05
	wFIUanFArWw4ox5sDw6s8jsOZCVyomBmi3NgRwPrahUONCPjmhDAvi1XluYnayVDk4csIyNinN11Q
	JOd5FUwzWUGwjmH59r+5kI3lMGilmr8+fGjlBNYRtUjXABY5YNEDXIg3Umd0gkcWwg8OZI8QsbUrz
	G6KR7IBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lF-0000000FLAj-1esa;
	Fri, 24 Jul 2026 01:31:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lB-0000000FL8I-1bgK
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 01:31:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeX931202145
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=; b=XNncgK7vGyN12FIy
	Jfp1Uvjn/a1vIfzZKhxyGZNTDm8wt1OAbouoTB6LjbbOs/G2+zAqteikfF5HSdWQ
	HUkRt3fSpNWIiLrARYserte2y/7hX1/nPwdVSwkTAZ3LmNR1ntPwMK/DlkLQZQjc
	Mv96O4HWFvAuz7Y47MLWfgk91e/gfsgzgfvwXGnnbiy9u5H6gMxks0Ff20D4p4QE
	5sAMEocCCaOJpl1LJzQFutf+Zjuml4IklCiHlgi0s8I7oIcq0wdhyLHhZ2bHKTws
	9ZfZrHwRelldSqbYIr+JqH4U2R1pP66I5gpa43i/92V/BQP83laMATw5lpPfhSHc
	pJ8Qdw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamsg3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1381925a12.1
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784856691; x=1785461491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=;
        b=RayGKkncMtQ3Vc2uzmh5SiqyRx2xAd0n4Mm5A2U8Wr6oX8LdM8CDkDVBMOJI3jHtmB
         FuMaj9GzMBWxxRWOtOEk2gtQXkMuuoMHgZFN8BIuvNVzSndHSSfKDhgkcW5yqLkQ9p2d
         nCXd74vdm386pawdjPmURa2WMKNiGZNKdV0NQ2VOHEzSGJYUdWusl2YRn47QrorgVIsX
         YijhyTur4kDjwcNByaWcwq/r65HCqKcsMVllE589ERHHNZ/5yssYFqkmFT7h/p7SM/z8
         xPAEIQoU4jxnqiwe7v3nrxnVEzSVIcD3N4crgrwSDEGGunIMQNPVvErNDLKje8V01h3r
         j0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856691; x=1785461491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SMXxutj/MIuag2+HC9usTCdJHe0gkRdicMpw/jumME=;
        b=sQgcwcCw1PxoFQC4mIqxjqEHnoNeOkXXtocNthG+0UISBZ88evyTPYaCIKA6f1GA1i
         4ll5FPbK7SZFYR1LCnKWX8gZWL2L+JjsU6jcWjvfUp64OvO6eIvy4sY/3o9Cs4Ne4kyy
         2WvT0ELMHYPBd01dVtvu3e/4ui9qQHILpE0sB6bNPfnc4zhClUhcUaQhNvzdBnkUOVGY
         PQ+Y6K7+CymG5AMQpJ5DTSfjSG253HceKyInqaj6i06rKnU2bOJ0NdupdMzHc7vNvr8o
         lcY4gb4ZHxD1Xj58VsEIqw4StwttSEm5v3xb+/T0uhb7RGS3Kf/0lslSgPmpbjcNvrMa
         6H5g==
X-Forwarded-Encrypted: i=1; AHgh+RqQHgEJXueigZoWP3TtbtptkE/Ptgf8lj0nCVFo/4/Z+40+VNYl9j967VvuLmczEe7Pjtf2tsU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD9QUUGqgGCQ9Uv55FtBkcz+o65E+XKLN0/x7UVpPXkAarAbM/
	fETxZdqNpkTDJiMDr1R7dwLj+eIVALJh+eIK4kmElJkYNdrm8J43OY0LNDlEPYsG+vjYziaqL91
	psGT2o++WXgpia8/4dNsq965P84qcVMRSq+2iwlZiJMmWjc8LJxHyky+pmHfrtlHT
X-Gm-Gg: AR+sD11mwyMNSMFi+ebOZRlYRqZI4+v3u4npH9NB6niGvtgOC1JPEv9wqeEYa6V33U7
	Ht1xMDVE8SosBph/4jF1Tb9VfiC8KCLWPyQQcdY/Fb3rZacD80FT3Nju9l5uvmNadjfLLzTumX6
	gy8QDvBeVZcBDk93itqwgutXHoGO2BA9gy6tHSDZE42W9FFPkbRDQt3K6R1OrcPb4moFf4gVTt6
	Sb2Y5nV8ZtLzoT05smI0ioR3w3++FBOyaZwUqwvHDFSWGwp2M5fBh6ufR7WXEuWqq1uiiJpB4VE
	2taPL9lAzavboYuWUdW/nAFWms4/dDwNXoiy4FrWccdqFOgxhcGXUwY0PZoihI5/0SZWTmzjPj9
	Er72aKHtKiNeWyx0ORjzFOpVlEdcSPAf52x9evSJI6pgNmJQstdaeEYQ=
X-Received: by 2002:a05:6300:95:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c44b00675emr6588599637.23.1784856691317;
        Thu, 23 Jul 2026 18:31:31 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:a1ed:3c23 with SMTP id adf61e73a8af0-3c44b00675emr6588558637.23.1784856690772;
        Thu, 23 Jul 2026 18:31:30 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm22655306eec.18.2026.07.23.18.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:31:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:31:24 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix overreads in
 ath12k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-1-c01ef10bc6a3@oss.qualcomm.com>
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfXyIzCX9W9P2Z3
 6R3VWprv713ePK0Ri0l4/0dDzIgzmz0Td97nHkk56QEh+OyOXEdtKDJDYHjzWeRByc5Ornl7Jn/
 H4zAtsyLdB7rNUFt/vtTbgff+gozBZjIl4iHzNLP0veD02k4i6Dd8iK+Hrp45LFjHta2DxxTrTs
 CMPzF74YWWpDqzh8bu0Aplwg9+bYYWfFz5xxl0EiA8Dd416eauS2Cn0TaQw7Pa+gO/wRD6U3tdQ
 SJ9lj4wVJIY5ZlNTl60v1OEklRspk8Kl75oFcok/PnFV3oIGJdTac3V/fD4gJKFzdngdxWEcb5v
 0uKFQmUImfqq3cwpMNNRgpoK0Cm8Ev8kghEndjNPfVl/P+VatuZhtvg7ytzaEZZ9YzImUUhQ5Q6
 bho8ynr5PJ2mIjQS3p+mH0SCzYFryJmYajdJCCUWfbjJLVJ/O7jkeYpERIe1MJk3SmSCvdUi+Xi
 GYxtjp3YLMX/a4CQa9A==
X-Proofpoint-GUID: C1WdfOwhqt5ZgT1740I5YRrOVMeWoHS4
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a62c074 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=G0XfPlja2fIICZ3D3WwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX9aW+FT7rxn4B
 TpL3WC3vKi+ufOPujPBUfLmG+8ps+rukVicDM0nF8CzocyWTQxutOux2eIN/RQXGzeP/dZE3/Af
 +8pvFLJxPE3uhpFS+7gOpWclsp0PM40=
X-Proofpoint-ORIG-GUID: C1WdfOwhqt5ZgT1740I5YRrOVMeWoHS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_183133_540181_8FC513D6 
X-CRM114-Status: GOOD (  15.07  )
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

There is no policy entry for WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT, so
the parse infrastructure does not enforce a minimum length for the event
struct. Additionally, the num_vdevs field is taken directly from firmware
and used as a loop bound over the vdev_ids array without checking that it
fits within the TLV payload. Either condition can cause an out-of-bounds
read.

Add a TLV policy entry for WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT so
the parse infrastructure enforces a minimum length for the fixed-size event
struct. Add a helper ath12k_wmi_tlv_data_len() to recover the payload
length of a parsed TLV from the header preceding its data pointer. Use it
in ath12k_wmi_process_csa_switch_count_event() to bound num_vdevs before
the loop.

Compile tested only.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ad739bffcf88..62a86f2069f3 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -207,6 +207,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_per_chain_rssi_stat_params) },
 	[WMI_TAG_OBSS_COLOR_COLLISION_EVT] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
+	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
+		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -374,6 +376,13 @@ ath12k_wmi_tlv_parse(struct ath12k_base *ab, struct sk_buff *skb)
 	return tb;
 }
 
+static u32 ath12k_wmi_tlv_data_len(const void *data)
+{
+	const struct wmi_tlv *tlv = (const struct wmi_tlv *)data - 1;
+
+	return le32_get_bits(tlv->header, WMI_TLV_LEN);
+}
+
 static int ath12k_wmi_cmd_send_nowait(struct ath12k_wmi_pdev *wmi, struct sk_buff *skb,
 				      u32 cmd_id)
 {
@@ -9057,12 +9066,19 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 					  const u32 *vdev_ids)
 {
 	u32 current_switch_count = le32_to_cpu(ev->current_switch_count);
+	u32 vdev_ids_len = ath12k_wmi_tlv_data_len(vdev_ids);
 	u32 num_vdevs = le32_to_cpu(ev->num_vdevs);
 	struct ieee80211_bss_conf *conf;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_vif *ahvif;
 	int i;
 
+	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
+		ath12k_warn(ab, "csa switch count num_vdevs %u exceeds tlv array length %u\n",
+			    num_vdevs, vdev_ids_len);
+		return;
+	}
+
 	rcu_read_lock();
 	for (i = 0; i < num_vdevs; i++) {
 		arvif = ath12k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);

-- 
2.43.0


