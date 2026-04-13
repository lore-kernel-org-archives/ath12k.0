Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB43F34C62
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTZe5zfbQKenBOvcXLaRuSgtBUm3MTFg5vbLv0R2nqU=; b=kWpc6kD+hhpMLzdM4lKqchh/y/
	r779JC0pnrkNFS+w5qCx//UjwFIaYYcOrtyQVKip1mwEEyJ1/uQfqkuoFmrOsG6DDflrwLBXNWj13
	T15G5OjQzmAPPMqo35inVu3JHs3lgKhzx0VKqGEKU7LNN40WiOj3h5RKME3DsAnNXC6SQ//qFCjsQ
	M36/UGJH+DK+mgzg5EC7j5ulvYpDfWrR9tbf301jDUBV7G9bF+yO5AI8Dau0yS0/bjQnbizQAOWOQ
	Pz/0n5iAPmwozINM4qmlMKlpm6KAHt6SH/X4Kdk7W8j3NQ10w2IJUf2ER3od4cOtPGrN61Rk5zxMr
	bRyyoH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO5-0000000Fz1h-1cKg;
	Mon, 13 Apr 2026 15:39:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJO2-0000000Fz0d-2rAE
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 15:39:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZEFU3989219
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LTZe5zfbQKe
	nBOvcXLaRuSgtBUm3MTFg5vbLv0R2nqU=; b=EaCkhGesgGef8kyIUUstghePAzx
	YD96o8arVhF33UkPpuFcujK5LbzW5oqT6njJmcXWlpcdaBbVtPkhMsMK/dZI53YF
	i0wlGgvHf4zSMC4uTahbiiwgm2E8wrARBBEJ5IU8E+UoV8fMpezVX68gAyP/Vi2u
	FKxp7NVkjDPoLtD7Z+OOO7Utx0yVirOvPAAgN66rvqA8FhltxGPx+U2LaB2hMh0I
	uT/8eeHsGP+qmMgDB657RpAytu30rnBHd35ygls87mcNqbpzIQhVddIFXzvSuCCW
	G82go0141v023Uwg2wEnP8TxDgHxFKRZz53XghHo5VnNbLEgq5hHXPN7Msg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfrqdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso4661612a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776094780; x=1776699580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTZe5zfbQKenBOvcXLaRuSgtBUm3MTFg5vbLv0R2nqU=;
        b=d+ngz6yJlYZ4fPWIL606IDcKhQb2WGEcgK/OqUF1xoyZNF442MRNDFkvFZiAWTfscH
         eB/M2VM9BSyWS0tNGSrpyae+w/iXm97KYMpyW/ABWBuF4EBFtQDox7nqKg9cuHyqcOKk
         1KVMrUJ/85AdWwpVKhQybQ19caqRHCfoti9s4K8abdQT4LtLkcdNOUNQveqW6sQlC0fB
         N7WjlEOkh0S4QThNRQH6ZghUPk0w5QeW4FiqiADZ3VMSGX4XTcC+8tnqNnjg1QXixoJZ
         jckicip+OO1/XTCQ6phh1+x+Fu3O1zStYOsxlp5fivHQjb5l49VwuTEMyDOw4kxGgEUW
         uvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094780; x=1776699580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LTZe5zfbQKenBOvcXLaRuSgtBUm3MTFg5vbLv0R2nqU=;
        b=I7Rb+l86dwfSlupqIXN1DtMEGFJWgohc4V9AApJKg9L63IxpqKBNIdA983mSqSEnqg
         NreuurpSipiyV+unuSgnOSiIjTWNFCjcd4DdHy/9b4KuNxyciebgIzOAfeVa/LodiCyA
         SnQmrz6+NTidOswTtofz5pkivRju6huiJj2bwwt/sy4rMTXb567OE1qbKut1NFaNVeuo
         ckIhbj1Mv5qr4Ixw7qng6NPKKFovFyonz3tDcWjHNCWi+6KKEWYLDQvgCLE/5kg9xf4J
         +4toW+JAXDElFYZhu+i352E4UHRGZ7zdR6Xevg92kpdSVsYJyU4dVs0RsfPB7NC2y34b
         Z/KA==
X-Gm-Message-State: AOJu0YyjJEU+g41iKz0UsNCL/EJd7VjmA7kBxFtMiElVVIEQQDMB49x/
	YKRGIt/x21p3KgGmjuV4YO+mtpAsljpCjyI3zgfUZXGGSpKYoCoxTbCo//E23NgwiRcdxwAZkx4
	fbLTaNoVJfdR4M6+0jPQE7Z+BcOpevguKmP6NAimQYgEm0bC1xjbxKVC/pyO3pDVQgKYMT+Dv
X-Gm-Gg: AeBDiescE5OcVr1c7w9IRGWKVKHGxMpOwrCsRuKB/YFKg7t2KVCgUVfcHp/yFjSPjcq
	EazUMtshqm37plFwiGYeomGEqML5NodvPMeIDDapyki8GrPcyENFfT/i5da8Kc7pSdsv/Cg11kA
	+sU2lcU+/yFxLPUhClwCWE3XeywEPU5tgeCmRY+3Gu5N1rksgGQdUFrvvUz/Uk+TH0xiyPtoE7T
	64sNJypP6j8EBg+2xND/16qDpTpVkyqbdNmTxPczBLgcrebH8HM0Q4rZDOPvKcDRIs4LIMoYNQA
	DBpx92RUK86LHWolCiwkr8WOgYi9hToULPUpMXo0H2+Y60B2/yxs8Fi726qfYYBTi0lSf3eeSE8
	C2XbZKaiDsLYdmy+Yt7BxIBzxhtLQ0L4TOrqGIVELaVHwdbAmsAWSSUnUN+f2D3KPoYai8HwbWW
	akPidPeKk4oaCIGJeC6jyWmLX2nx7hynhTV6K6pzmX6w3YruJ9MtM=
X-Received: by 2002:a17:90b:3dce:b0:35f:b313:84ca with SMTP id 98e67ed59e1d1-35fb31388cfmr5562149a91.27.1776094780224;
        Mon, 13 Apr 2026 08:39:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3dce:b0:35f:b313:84ca with SMTP id 98e67ed59e1d1-35fb31388cfmr5562127a91.27.1776094779705;
        Mon, 13 Apr 2026 08:39:39 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e411ff4e1sm13000123a91.3.2026.04.13.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:39:39 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/5] wifi: ath12k: handle thermal throttle stats WMI event
Date: Mon, 13 Apr 2026 21:08:36 +0530
Message-Id: <20260413153840.1969931-2-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HWljPBU57Vz7eLL6GQ2yQ9QiWq1ieJPW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MyBTYWx0ZWRfXx7cEDYa+wB1l
 ieYkdymB2dX7yF0BfAd6gZ6taUsRpYGPtQsKk4EKAfrib+tzJa2R+OvHoIqF8yQW7zv86hIUmmy
 3opehQDKNSrpnIndBxU29GuUth5wm4QoclKhIYsDN8QDleVBc0ewoQ/5GjbjhNfiZnA+3A6+JLF
 yQVWyS5Aa9RWfvLp+dLxyJkCgeyCOkw5jHmURW6/vlQ3yxt8SvRgDrQGYJidp7ojd41AAP7cuxo
 Mn8meiwrxr0Wgy19z6eVyflKEUEubpOSXfqXh+GVgBKpYO1qtzxO89vGf1S+kiDBtCWeJyndK8z
 g6X8DfEndezmierO3MbbkntLw5RKkzSw2WESxmuWSguxhqzGszToYUNEjR7JoH22m2X29+6fz7q
 Eozuxi7AH5vL7x+408CGbzk7I/8616FTe89N2TqPp3FdHcB5npsITC4h2iqu1cgTdJ/f2x3pert
 gbPxHVFMEwZdyhxjQ9A==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dd0e3d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=E37thjIwhXKEW9KdV9kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: HWljPBU57Vz7eLL6GQ2yQ9QiWq1ieJPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083942_834188_CE3E10CB 
X-CRM114-Status: GOOD (  13.12  )
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

Add handling for WMI_THERM_THROT_STATS_EVENTID by defining the
wmi_therm_throt_stats_event TLV and parsing pdev_id, temperature and
throttle level.

The firmware can emit this event periodically, including when the
throttle level is 0.

Log the received thermal throttle stats to get the current temperature level,
temperature and thermal throttling levels.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 39 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  8 ++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 484fdd3b1b7f..6b24911bdb7c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8762,6 +8762,42 @@ ath12k_wmi_pdev_temperature_event(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static void ath12k_wmi_thermal_throt_stats_event(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	const struct wmi_therm_throt_stats_event *ev;
+	struct ath12k *ar;
+	const void **tb;
+
+	tb = ath12k_wmi_tlv_parse(ab, skb);
+	if (IS_ERR(tb)) {
+		ath12k_err(ab, "failed to parse thermal throttling stats tlv: %ld\n",
+			   PTR_ERR(tb));
+		return;
+	}
+
+	ev = tb[WMI_TAG_THERM_THROT_STATS_EVENT];
+	if (!ev) {
+		ath12k_err(ab, "failed to fetch thermal throt stats ev\n");
+		return;
+	}
+
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
+	if (!ar) {
+		ath12k_warn(ab, "received thermal_throt_stats in invalid pdev %u\n",
+			    le32_to_cpu(ev->pdev_id));
+		rcu_read_unlock();
+		return;
+	}
+	rcu_read_unlock();
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "thermal stats ev level %u pdev_id %u temp %u throt_levels %u\n",
+		   le32_to_cpu(ev->level), le32_to_cpu(ev->pdev_id),
+		   le32_to_cpu(ev->temp), le32_to_cpu(ev->therm_throt_levels));
+}
+
 static void ath12k_fils_discovery_event(struct ath12k_base *ab,
 					struct sk_buff *skb)
 {
@@ -9811,6 +9847,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_PDEV_TEMPERATURE_EVENTID:
 		ath12k_wmi_pdev_temperature_event(ab, skb);
 		break;
+	case WMI_THERM_THROT_STATS_EVENTID:
+		ath12k_wmi_thermal_throt_stats_event(ab, skb);
+		break;
 	case WMI_PDEV_DMA_RING_BUF_RELEASE_EVENTID:
 		ath12k_wmi_pdev_dma_ring_buf_release_event(ab, skb);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 4a34b2ca99ea..1853a6f9cf27 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -870,6 +870,7 @@ enum wmi_tlv_event_id {
 	WMI_READ_DATA_FROM_FLASH_EVENTID,
 	WMI_REPORT_RX_AGGR_FAILURE_EVENTID,
 	WMI_PKGID_EVENTID,
+	WMI_THERM_THROT_STATS_EVENTID,
 	WMI_GPIO_INPUT_EVENTID = WMI_TLV_CMD(WMI_GRP_GPIO),
 	WMI_UPLOADH_EVENTID,
 	WMI_CAPTUREH_EVENTID,
@@ -4120,6 +4121,13 @@ enum set_init_cc_flags {
 	ALPHA_IS_SET,
 };
 
+struct wmi_therm_throt_stats_event {
+	__le32 pdev_id;
+	__le32 temp;
+	__le32 level;
+	__le32 therm_throt_levels;
+} __packed;
+
 struct ath12k_wmi_init_country_arg {
 	union {
 		u16 country_code;
-- 
2.34.1


