Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CFFC531C9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 15:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=; b=y4VrGabyOsAt8lHneWFuPghqzo
	whEzt04P+qSbgQz70qYp7QBVI7OqZF1Pr7vFP/14sS7DE1JZsSjos/MQDTyzwDEdMeDdst5nBVyJC
	3RNNM9mEy/GpxzuBTL5g1WAfcxizFwaTsEs3GE+Cp+s6/hR5ZzI1nMxwcy2vkG/WitH85qLohedNZ
	sC30DcX8/IyLQRkH04LcC94VSqFiz5Dzyj5XVMbre41BwkBlNB3VWxI5mkwRKNURFpimxKemn7Qcb
	lBCepnk0MR9T85AosLB+EumcojZfTqiZGfjw28d/8DjZx/mqI2tursLAxmsllsIQK9bjlxj4KRe7t
	LIF3nPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIGB-0000000Glgf-1BtJ;
	Fri, 24 Jul 2026 15:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIGA-0000000Glfa-0BfA
	for ath12k@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=; b=SWMRNUa1Hl23Blrb0OtG8DFO6f
	9dOo0ajljsF5ZUDZG21Z5pQ/ycYEFUgPU2Rsy9w9WB0EO6Sod/xAdXcCrP+z7qBo2dWQUfh9IVDli
	+TwmfCMTnP1sAO1HyhW3uxL5Q+BTXxPs22614/YvSJ8l1w6sA4h5jiLOS69MgGrDCKGwLuiLg7JGA
	jOJiPkJeIS/yX7CKRc3sYujhla6XrPtlLtnRMo9x9970OKVSNfsrHBbLmPXBw6KbpueX/XcOdPrEe
	HdNun3wNwAdzppbYH9qiMcGPma5nmHr3JSuL0FbZvTJOvkJVBhq0kJxc3Jkw5x1JrwGeKZylEbsMP
	xg9e952Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnIG6-00000002jYS-3l8Y
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 15:56:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbPg83178473
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=; b=SVYo7tiAI95+TcoU
	0beyV5ls8kb4o7GBtEC0KiPnW8jRk7R7Qj8/6vKiozh3nRNKcTDGGx9QTZeOC0wU
	at7W8j9pO5gaUmUzyQQ9WcYpLnXb7qLBdPMQIqNZNJ4ONPV4URXFqD5gz19VP7z+
	rCC17lfJ0gP/cE3xE6jzTlKRn+4xNoGgXfeu9M/E7wwM6e4rcvRrU+pfTW8M7TRF
	mb/aPVEcy0sKZEqV0qOf0DNHTCTyegdhs7uLApYPfgeav7iBV8Ms4LGlp1d/f5uK
	cdwFHVcOmcUywRwaSZcn26l3f19WE/qCIyPxWFm8XwzGrIDA/nTrFyR6Q0i9HiSF
	J648CA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah994-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:19 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6aaf235cd25so305774eaf.3
        for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908579; x=1785513379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=;
        b=BnUwFz1/GhDTz4Szsi8+IBbUq1Ez+/mqZK2mT/2Pe3G3WBR3QA9uIXQQ6a5gVSpSb4
         ixtbDn149r8KarQ48Bw0i1Mdw+AtSISrH9jZs6bAnhfL+zKDRwG9Qmn4eOaBew0+bPeG
         zNmJLmTbDq18Fpcu9FomGzkJkIBFNFl/w5Q2jnwD4KsegNZcadKwTi5r9pcFTWVUKDHs
         ODh5/tiiEKDaneHLA38eB4NEUdUiDKdXHgJgtGR6SaMvJvkHUA3ntsXgTIQLBuDdAH4N
         Y6YY25E9WARzsOs+r5UIvEEmOhPGrcV0uRPGboMIJqCI2TL0Abx0HyWBmew6YxKYafeg
         0NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908579; x=1785513379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRwsegGQKk4SAG9Z4lzF8xh53Y8v5nzSjwOE25DwPT4=;
        b=Iq2z1Z/iXnRJv19MleKorRYv+i+NEO2m2jRO+3jgjdGSft1MPeA8L/gZIG4+Hix6YY
         7rh+I+rMQHtn6+/a43yMeM1HLHV96MA1p03knEofvufA3/SyFHmdhEzWHwpMxTQM0R1/
         3nc7BfuuVSv/I7xZ7u6tTU7LnQ4yxhbnd7Q4FN6nSHMoR/u0a4GTbpYsrYSohcTaGqk1
         uj1Y1PmCw7V1iIDSYY0A7DHscKBnLTHQaGQkG6bDKnvHdnwQl/zCnmIBrom4kKvaEUZs
         eDAGoWg80hbobtDtn/s3R1zHesFqzRpObKvX/S8aw7Ke6YfluRKr33nnFUDMAIOEPhAj
         fSDg==
X-Forwarded-Encrypted: i=1; AHgh+RrD6iVHfdkujhAhYg98RMlJmZ4dN0rQ6ENHjoqwOEfT1KW4iPXHejsbn6MjXEAb0DE3JW/HE14=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5xHLTGfq2L7/31quCJgcePd+GDz/RX3tIOYOh41uKNQ6U7ciJ
	G8PCLZYSb+aTd9sJLdqFRrUhTbu6BnG7Egbyu+bNcrvzmUM/T3TbfrynzFBCzzEKwab87NzJQOP
	nSDIFbh6YPT7TxZXZ1okZf4CeOH1JYOHyZdKw4qtYOS+rsLPTndMdbMkRoJBhkfc3
X-Gm-Gg: AR+sD10ioUnCyCE6O2ZSHf/T+1kpF3SpBrAHZgo3A2EqbmJs1nvDSu7QZUpw63TBo62
	sEl7yOjNH6n/ZIRlKgOgys0gdkVYdle1UaCK+vowX3zPnCBIMWviolKxYMpvp6t++HqUKt4aspT
	qjYq+sqEgJrC3szvO/l2/jHY+3LQ6j01EqnHCipQaKwhivG8MLZWtlSDJwI3w7F/w2AZZFEWSgX
	aSj6r1lyd3+esf5Rfj59ysTBo1e1ZXJh/JUVQIFZKBY1Orzllv66nD49IkF0xnH5MT4kHFYKaqr
	3EQ6L45onNBXm/+8fc+r7vs8wMZp6vIJj7eEneks/6zsUdpBgjgUa9HiwsQ0gMC3lmWXJc/GEPF
	Qsl/Ep//hZszy0g57s8ag9UdqlvtkVUBZT+5ciwzF5QdmWZ+C3+3sjGo=
X-Received: by 2002:a05:6820:a05:b0:6aa:2fbf:bf4f with SMTP id 006d021491bc7-6aad4148874mr3737950eaf.44.1784908579255;
        Fri, 24 Jul 2026 08:56:19 -0700 (PDT)
X-Received: by 2002:a05:6820:a05:b0:6aa:2fbf:bf4f with SMTP id 006d021491bc7-6aad4148874mr3737914eaf.44.1784908578674;
        Fri, 24 Jul 2026 08:56:18 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm134591eaf.7.2026.07.24.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:56:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:56:14 -0700
Subject: [PATCH ath-next v2 2/2] wifi: ath11k: fix overreads in
 ath11k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-2-02a45d7246c0@oss.qualcomm.com>
References: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
In-Reply-To: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX4PYKlMtjsPvu
 w3RHUnoC0aDQiYniykmAL1diU3zEJr1dgV66+ffkKcBnV04E5i5FINk/dNmfXB5JEhj123KzfAr
 c5INOGbZkQzyQyAFVPlz0mCGu31hjyo=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a638b23 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hOGj4-57aE1FpqoUBq4A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: IptlxIco54ENY3HzBTdr9gyEoTIzJ39D
X-Proofpoint-ORIG-GUID: IptlxIco54ENY3HzBTdr9gyEoTIzJ39D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX3XiGJmtUFpKY
 b5JQFlXvALnC4S5WgDJ1WDmEoiYnD+yOt9JOQd65AOmuyJMPVFxRXPx+zNrQgq9G4dg1//thnYR
 Cu9fpLPogWny7m3JIPLn3BLH8FwUPGpRltZlsYbg5im3RyQuVH5qWlyTH1sIMt+r0m+SNsroV8u
 MbAsq3yae62PBb1MaCBD84F/YskCkst1xzq1KfYL3vhUF0F0L6ImzXn+KN8XXiWoW47He1PkTC4
 fDucs4JAWlgFMvmOY6aoEp53TDhi8o5ixO56v1f/6xH5CBACXprAusNuiWA7bZ6DW6T+cAUoZkF
 +1mCEWBXwztx/i54sM+l8SV3AE72GpoJeL++sB1qWKUM5CmQkrAxFI/xa7FlPSJGHKyyp73SFtg
 L71rRPEInZPZiHRfpZGn5a5q6Zj6TpjMgxD1k99g/G0qLFiq18oHG0qytIlOCp4xhIMX25v5XE/
 F5nwwixt5WF2XJM1C/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_165623_261107_E0BA01DA 
X-CRM114-Status: GOOD (  17.29  )
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
struct. Add a helper ath11k_wmi_tlv_data_len() to recover the payload
length of a parsed TLV from the header preceding its data pointer. Use it
in ath11k_wmi_process_csa_switch_count_event() to bound num_vdevs before
the loop.

Compile tested only.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-sonnet-4-6
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index dca6e011cc40..feb0a0b29c81 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -159,6 +159,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct ath11k_wmi_p2p_noa_info) },
 	[WMI_TAG_P2P_NOA_EVENT] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
+	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
+		.min_len = sizeof(struct wmi_pdev_csa_switch_ev) },
 };
 
 #define PRIMAP(_hw_mode_) \
@@ -262,6 +264,13 @@ const void **ath11k_wmi_tlv_parse_alloc(struct ath11k_base *ab,
 	return tb;
 }
 
+static u32 ath11k_wmi_tlv_data_len(const void *data)
+{
+	const struct wmi_tlv *tlv = (const struct wmi_tlv *)data - 1;
+
+	return FIELD_GET(WMI_TLV_LEN, tlv->header);
+}
+
 static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 				      u32 cmd_id)
 {
@@ -8353,15 +8362,23 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 					  const struct wmi_pdev_csa_switch_ev *ev,
 					  const u32 *vdev_ids)
 {
-	int i;
+	u32 vdev_ids_len = ath11k_wmi_tlv_data_len(vdev_ids);
+	u32 num_vdevs = ev->num_vdevs;
 	struct ath11k_vif *arvif;
+	int i;
 
 	/* Finish CSA once the switch count becomes NULL */
 	if (ev->current_switch_count)
 		return;
 
+	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
+		ath11k_warn(ab, "csa switch count num_vdevs %u exceeds tlv array length %u\n",
+			    num_vdevs, vdev_ids_len);
+		return;
+	}
+
 	rcu_read_lock();
-	for (i = 0; i < ev->num_vdevs; i++) {
+	for (i = 0; i < num_vdevs; i++) {
 		arvif = ath11k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);
 
 		if (!arvif) {

-- 
2.43.0


