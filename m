Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0846CC53200
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuAdqiDdNFYWjWTfl7xgWrhkU3MoDExevluyPmjhHwA=; b=IYMvoEdI8w/QQsXW1yaJf2H5IH
	57jN76SgS//vPsPLf4S2MSDWCyKrkNwrAsiYZm+n1F2zyMBWfRIZECwFGSAkZdZfz+R05pzotUMa9
	hfqczUD0Iqzfv/q2jYpakSlDJFe7PPB4TqCNyShi1nPvJSP7aM7kcvSxiHUDiMFaD11e8i64daDFN
	0lQAJDy8aSjFgx0rK0j0y8Tt1TcUtcOrcZpoLKsV7aKWJ0uxh4e1s1YQTqPHWXjh9IAAi1V3bsgvN
	Qh01oSOR0nt+7rADXrTzUbHBpiteWDX7MSmgzn+7HY8FdIePF2KT1iwyoWYtBkUSTqr5vh61sjqUP
	ihmXFj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIGD-0000000Glj1-2mfl;
	Fri, 24 Jul 2026 15:56:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIGB-0000000GlgU-2MZd
	for ath12k@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HuAdqiDdNFYWjWTfl7xgWrhkU3MoDExevluyPmjhHwA=; b=GtuMtjSf9XvPAV5IpnOyOuro4K
	nolFD/ciNp1gkKweVDGFQ7OAgguQJHvHty3tccfwqZAxfuqbyzx0XDly+72kPHG+XE8lWx+HAVEkM
	8tE3hcTE8zL9RgHhXvxO/O/ux0/utVbdZwFFPxDMvTuTfHQC4gBGTXUZwcWlZqZdWfTC9TkSZkY+f
	2eNwfi2kPxehIsGz09mx+TPI0YnIR2NMT5klm9mRNfm0ZtSqn1DdZgXveurWp5nCbfHtDbXo1Fc8T
	7W8Ps9EXiKOJhv2iB7Q0DT0dLoz83r+qxzPj1dXwHtOi5AeQgYSPDEgjUEdd9mNSWfVvQ2SVljjrY
	9eAwT9zA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnIG6-00000002jYJ-43tB
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 15:56:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBKg3344429
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuAdqiDdNFYWjWTfl7xgWrhkU3MoDExevluyPmjhHwA=; b=K9Bn8QG3GNGyrn5D
	qqhySAoYk5JI4AAsV8PmSA3CDXjq71Kr2sSuqeEW4E2u3YHvmskmpfjM0EpAxtl5
	+QSpzviVNhHNBV+RQL/gXmmSvwGyQY+g78FrDdosvZsh3hKMGygEmFXdbDJopQPj
	jwtR8GztxZVJqNUrmgQ66SgNt46u2en4KA/xV/aLyO4cTMQjDip/OUQ3RIUBn37i
	ygzV4ctW0/Gwro7trq4IOnAf0kbTlkqCN8EmCbFosW9Dj6sgIrcrtTyMUr7vyUcR
	aILy8/VY5hLm6SolVlpjR+8KVW/b464DtvdQeBFTP7iJE74ZyxZztz7VtTU5Gxw8
	Dwrd7Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0qc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ee1e335245so326103a34.1
        for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908578; x=1785513378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuAdqiDdNFYWjWTfl7xgWrhkU3MoDExevluyPmjhHwA=;
        b=JqOKqVHcKAPcHqPPualoFJ6BQCxRL+pfoFItYlClWU/WfrkPx2KNTcYgUaW4Jmekd8
         LcmV4wkynWv2qRr6EbLswbjsJkRD/rtlr1QU5XbvoR8s9oUJ4xCU6d/7cwQ/qHVEZPjN
         992135GcU4egBb+66TPFpMCkXS4joNZ3A7pEUHsK+gJzGjUoAAEeAyj7YrnElvPGd1Xw
         U3FiQac4o71me0cr78UcyBCBrU8k4F4yGME3ZD5IjxDhpQsmgrBTsY13I5AWq69Jp4ba
         Wn8lJWXLEI0jijLSuNgNvE0QWiyc+3I4vzNwU0rVf+fMwW2s92cGFpmOWHHQVA0A11zC
         Jcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908578; x=1785513378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuAdqiDdNFYWjWTfl7xgWrhkU3MoDExevluyPmjhHwA=;
        b=T10eUv/iTwyVWFT5QX4AnVSgWlZero3P3F0UoUnbiJQJpTd4miIb3Y6ayOdDIbu8eh
         jaJAkv0gx2lE2CGvLeEF+M067CeIbK5SnmrtwUovTIcQdCjzWhcE9b5XdP0ZTpG9whKL
         9hNbdGt4zgQwhunuf2Ku7RAmBe6bL7yrgMAsq/ZBCxA2yjT6x9GyyTy0EjaX3weErT7l
         AinBVJRMR5rt086PnOKixXkb1X2RnQKald0YbFYtqoss+dZDMxKs79QyzJqQof9OOKVx
         x2C2mFPg+UiER6hlPHDhU3vPYEMncgJmoTlQM3p24Uk9ywM+x3LaGj5P8MOLtp7yCAaG
         0CXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4WtdaOti5AOK3IqEb25Uz1aZc2+ZdS+Dh+tQu91EtwpeyY4NUjI2ElLm9Dh0tdMLNqRa5OIo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp3XLrb4YB+QyXJ+GjONbvqq+tzmZGyr2SSIINf+CGLWGOiN5F
	bzMib7q5g2tdxfBnS99tTGuTm9f65SfqvVeLBG/Bt7CEbaK6yRv/UlIoiP8LGmVRylXCIssNHG3
	pNf551FaCRPfs+PIyGF0sSEFdUtKsBvBWynufzG7iAljWs5HDFlUqPfZSKrHlQ/jfvzT83wsA
X-Gm-Gg: AR+sD11tzZztKN8R5j8hVJUyYsWyBdVnMJ6am0TUZGHilHGdqeaIjtHiz24kJYXvKf0
	Y06zvt7+BjoWW3FF6yoCfAa6Mmr9/O7XtpdJbQLtYUWYRfVz+cs9zUqKVDXRvJ/jpailXNSFf74
	Gn1P8o6278xOXvflmwRwuHmIbr77z7V+qrqoYVEuhf/6WZCoROQ/Q3YVghdcuoggoUZzgs3CG8F
	pg72ie3+wpmYqKAT7IC4gZd8bI2fy6EVQZSj1qZEQepGeYRIBrPJgUeWu90/lz4MWr4yONGVIjD
	gFVGjYeJMG4lliQ33OK0pq2ZTuKMmjSI+a9xvpYJeAAPhfmSAAk3sSt4s5iUq8SEcgxt0S6NZWc
	yam8jZCQsdx/xX2d1HxY3vEkGe1/2i7cC2IJq9pZHO/Fq57rIRpFVBYM=
X-Received: by 2002:a05:6820:f02c:b0:6a1:7181:6da1 with SMTP id 006d021491bc7-6aad3faa27bmr4236258eaf.18.1784908577742;
        Fri, 24 Jul 2026 08:56:17 -0700 (PDT)
X-Received: by 2002:a05:6820:f02c:b0:6a1:7181:6da1 with SMTP id 006d021491bc7-6aad3faa27bmr4236237eaf.18.1784908577332;
        Fri, 24 Jul 2026 08:56:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm134591eaf.7.2026.07.24.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:56:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:56:13 -0700
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: fix overreads in
 ath12k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-1-02a45d7246c0@oss.qualcomm.com>
References: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
In-Reply-To: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX3vVva2xPnMpn
 ZOcRj/LqBEPAKRVbZYtLwfbTt/bfu6LCn/DTVaq72HvGqX0uK+/i1m7F37/WUsB4KO21G1dpV4E
 l0Y/4yIN0UKM774eQ87Mthhs/UbvgK0=
X-Proofpoint-GUID: V7JcYgybXEuKO9FrUpuPVQIE1NvFHQqM
X-Proofpoint-ORIG-GUID: V7JcYgybXEuKO9FrUpuPVQIE1NvFHQqM
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a638b22 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G0XfPlja2fIICZ3D3WwA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX5boetyi+1gOF
 NS7FV6cD1THMlg5IdKU+uQBdAPCswo9pDAMjHkHGbZbjI92DEHirl3TUXDguDnpriZ2xFFST2WG
 3VOmwAqJMzJetgUhD2SAyiNqOWhcCSts/ht1sbM0DlHL0lv5WhUmhQ6sCeof1Ef32qVuS+co5ey
 i8SMs57jx8CHPVQJeJVV0lDCDjKhOZ8rUsYMfUNjfst8yyyIDD3w+n6JiX8lukaPbpWRPR/LCbY
 RWmtKlSCWg0iJd+zH9mqKEzJVqU/DzKTMfnNLGjmXLKUw0R8CWBL96SXwetEzWioAxJ/TFms+an
 rjH1qFcE7eKu7B7FXMw3FK7afGjoK00mxb81IDba3RuJNgEyn1MueRg19qonfVFCc4hfTxdCfmq
 RicmPtgcR+XUGwrUf/Fbss+1T1bsB4tC32+a36wR2Wu6jWsVMe/NUAju5S74xMszkmBFuH8T9W7
 SboIcex/BeLGdenw3UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_165623_383965_BD0047DD 
X-CRM114-Status: GOOD (  15.27  )
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

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-sonnet-4-6
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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


