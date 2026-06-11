Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C29BCD98C5
	for <ath12k@archiver.kernel.org>; Thu, 11 Jun 2026 03:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wANYbend8iuqsdCtlChTQdQSao4D8V09xXZgnJmxXi4=; b=ofrzJ9VTeXNp883no1SvsrxqCI
	9n0qCnfb0KufWzTgGPw0tJnfMZY1XYLsaRzBU0qzyAAzYa4m7RLzmWwlzYPkaszzWDOmRlRgFxlS/
	xCslirTG3oUifUfltGtnqazIbUAjP5u8oQZfF7LKRFGKWO+5s80/3OhT/8rC10eBBaChsm7BjMJkL
	w92gnC1Wu8//SiUtCaxowh79k3EX2p9hwnrf7wWzZNVOyMRlaeoM5NFM89KX8s4Y/VSSM/s/heSNt
	5PDXkmb9fuw15tPJ3r04WGiScl7MXCCj0gMXlqyEMAcAwqxUZoNYWidYmOdLgfSp2NS18gYpA2GON
	1uK8veYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAb-00000008cHo-0MiO;
	Thu, 11 Jun 2026 03:33:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAY-00000008cGR-3CBa
	for ath12k@lists.infradead.org;
	Thu, 11 Jun 2026 03:33:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NhxD3092122
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wANYbend8iu
	qsdCtlChTQdQSao4D8V09xXZgnJmxXi4=; b=hEeh2kKhUskne4GhQccTE3yx2x+
	dmJiE+tq+Kr7zRKrvmL8/RsZlj2JaJLrbqF7SRetZfDZU382ky26u5vMqTS1cpGO
	mKB+bteJV7eoHWMntJocn0aI0FFCWtlGGcZ2reQeG5DKypz4pKOVzq1+/jCb99/R
	wb6U/KOZxx/W/3RDECMf0RS4L9ahgS/dPKgFcR7UYAWG//v9sgyl77PBB7gOP1Kx
	cy7k5gNpVsS7fbwM5YVy3UcRrJX91ZsNUOMPv14DR5vnuDc3UEnL7ywUoEvTTckI
	GPLn4XaxvAtBxzH21Mb+cF4ZREVVlKUG0wmF3MFFqJGPg4xK6P4g4dneTDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9d1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso8836724a91.3
        for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 20:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781148806; x=1781753606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wANYbend8iuqsdCtlChTQdQSao4D8V09xXZgnJmxXi4=;
        b=a+Fwk6oFTcBlgyqu9lUswEgvD/AwdiCNuySw/DW0waNWufR5LoQBxCgqNHzwoWbDgu
         xZzlbitlJiHKTKjAgF8olwM+oHJKkUCpfLKGzoQ072OKy3gZ2ov2J1YvjsOdq9qq3C8s
         tG7rtiUFSwa+n1dbXz5XPxvl35dRl7B99p+l7BudkxEM1g3c2r40+LMi60A8NjmyGHPD
         kmQdPsgxLo+KvTf7Hz/eDCf36BIhHrQm0guuuj/G2yJL3EBb/hVqVjxxPB2BNcQ+3EhO
         GupB7dLseiVh1Yy+EpjMe+B2VJYzydD7eQS37QXaSOOz8D99hXNsMNs8uzrhEmJpU5Tk
         H/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781148806; x=1781753606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wANYbend8iuqsdCtlChTQdQSao4D8V09xXZgnJmxXi4=;
        b=PI0GTP0oAEfenkw+IC45o/UPKu9EXWsjw890XWBsyKfA5UyVPUz/WsbcPw3DDXYzmY
         sGCS7zCW3+7IK+tydzYZbztEAm52yi9b2JOjnNmmzSGX2EWG+3AEFhltcWq5DRh+QuU7
         2B+Jno/TDp7vwxjZOULDa3NO/g7YznlkQqnxSVPy46l2O8YvejkWJ8u1wLD94nK1fgRP
         JHX7b8FdGJvaI79F61cdhe0gEdm/5QMBux29nOIiemEUlX2Qz2ux7Gu1Q2O29GwAitAD
         BOskhllsEJHGXBBljZJ2MCyjaJ9zj4wYBuWZflZ71VRmItPIr9AQVMM93qv9UrFyPp8o
         lT6Q==
X-Gm-Message-State: AOJu0YyLVQn7SiLm6Ijy9DtQ2wV1Kq1fI97vRKzChIzcggPqS9/RXLb8
	r4c0cXg5NMYTNUgCYD8mfn1duyR6gc0NEFAiiAmoz+sBuyEasswY9SdqqFRK8ZryUK5UzmjteXh
	QqBVgrmWxTuIgmjxCXng6qHAikuQys7g3R+3hsh6oMiHojgQlU3ttc1hnHwPyPCHITF1glFNs
X-Gm-Gg: Acq92OEsHEvweBn0qL9Bs1GvoZdFzJd1CKEGNPyPPh1CAvRZoky3dJKK9OSlsdV1lbn
	iN7Tsh8fG48CJvnghBOlFxFq0rOfjvYkr8oNtUNHoK7prWqDqa6StsccbEA6hZXL0q6/h/5N1ix
	o/KvLN17NtCHp8KSktwFc05mm2lB7E2xCbWq19UOwdpv9SiKpSnDJfikkCgtRljAFTyqlNgXtdP
	DU5qN3NbeuHrSmlfxzSlYGkEVAHefJ0i017IIJHF6SV/5NqR7aQuEZYDDIlsQf05h78LTYC9XXS
	B367fCijQEUWc+bB6srM5vo54Ws0zyrnzm1iykzrYK1Waoqpgw8+9yTjwOQR1dLCG1On/ky6O5h
	fpg4alK4ngudIOaQHB3jIiiVsqP2WnoF6pH7L3pZU2nfJTnBsT0K1H75gzpAPDgLNFORGpSi+uc
	lp8PByusJekz8sYnDaZr8KETWCTPwlpEHFLBnSgzV4u5awzyd79pe09CY=
X-Received: by 2002:a17:90b:3f8f:b0:372:94b9:76d8 with SMTP id 98e67ed59e1d1-3779dd65b9amr1186312a91.6.1781148805574;
        Wed, 10 Jun 2026 20:33:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8f:b0:372:94b9:76d8 with SMTP id 98e67ed59e1d1-3779dd65b9amr1186286a91.6.1781148805125;
        Wed, 10 Jun 2026 20:33:25 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775287186dsm896041a91.6.2026.06.10.20.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:33:24 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 3/3] wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
Date: Thu, 11 Jun 2026 09:03:14 +0530
Message-Id: <20260611033314.2330-4-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VoBX-m7Vf9sLjc40AkIVxssnfimGj2yB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfX0zXUUx/FnNFO
 IVxMqfQC7cD9QNkRGNwfJP90tes4qHBTCQ5aCP1GjJv/8TxzMfpsczomoMJ7UWhH6Vcq/uYedgL
 g+7+lOstB3u83ZYfUoMRqtaXSNaohzA=
X-Proofpoint-GUID: VoBX-m7Vf9sLjc40AkIVxssnfimGj2yB
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a2c86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nT0BbeqX0ttObqoriowA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfX17hZ4qZr6E8J
 8zuz8b3GtcdIjhLtePRsI+l2v54M5BwaCsOeA1zRveaYlFdsPfpPFVgDWNCAbnogiFuOr04cgNI
 w7iWpgjO4RLs6+QcUDQfk02z/Yja59zmIzcL0GGLNQWLDg29hSBflKJE6pfvN2Pi4HhKaY3B2u0
 tMOYA67S9EPmSToGGCDnVNc839BCeWqOXwfp3R/XxaoWa4et0VLl102I7fpEUn8dxJVOnD/NASu
 F1/3rVNgZTmjkYGpzQb8gk4rxeSiAxj0hxXyRO/B41U9NMyBhsT9ReSuHMrwl/n1rh2sWNvHhKJ
 yVKGWdbwGzRURhce9046g6rAMvSXPHbKUozZgmDUES/0vDjp5x3ePcz86YxE/AYoHUu4i98134E
 NJrXbER4RtzwDg4LskVXHaReV728STTdX6R56PBXwWMY0p790Z66jGURd6vJsLu9+UlsHt4uAoh
 Na8vLm9NSS92d+ipK5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203326_804125_C51C7B73 
X-CRM114-Status: GOOD (  16.33  )
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

Currently, the Q6 region contains a read-only firmware region along with
the BDF_MEM_REGION_TYPE and HOST_DDR_REGION_TYPE memory areas. The firmware
expects these writable memory regions to be assigned after the Q6 read-only
section.

However, the ath12k driver currently allocates the HOST_DDR_REGION_TYPE
starting from the base of the Q6 region, which includes the read-only
firmware area. As a result, the allocated memory regions overlap with the
read-only section, causing the firmware to assert during QMI memory
allocation. The Q6 memory region layout is as follows:

		Q6 Reserved Memory
	+--------------------------------------+
	|                                      |
	|  Read-only Firmware Region           |
	|  (Q6 RO Region)                      |
	|                                      |
	+--------------------------------------+ <--- bdf_addr_offset
	|  Writable Memory Region              |
	|  (BDF + HOST_DDR allocations)        |
	|                                      |
	+--------------------------------------+

Fix this by allocating the required memory regions only after the end of
the read-only region in the Q6 address space. The bdf_addr_offset parameter
indicates where the writable region starts. Both HOST_DDR and BDF regions
are allocated sequentially after this offset, with each region placed
immediately after the previous one to avoid gaps and overlaps.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6757079c5890 ("wifi: ath12k: add support for fixed QMI firmware memory")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5bf045971c94..11f57b0755ea 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2746,8 +2746,8 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
+	size_t avail_rmem_size, offset = 0;
 	struct target_mem_chunk *chunk;
-	size_t avail_rmem_size;
 	struct resource res;
 	const char *rname;
 	int i, idx, ret;
@@ -2781,9 +2781,12 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 
 		avail_rmem_size = resource_size(&res);
-		if (chunk->type == BDF_MEM_REGION_TYPE) {
+		if (chunk->type == BDF_MEM_REGION_TYPE ||
+		    chunk->type == HOST_DDR_REGION_TYPE) {
 			avail_rmem_size -= ab->hw_params->bdf_addr_offset;
-			res.start += ab->hw_params->bdf_addr_offset;
+			avail_rmem_size -= offset;
+			res.start += ab->hw_params->bdf_addr_offset + offset;
+			offset += chunk->size;
 		}
 
 		if (avail_rmem_size < chunk->size) {
-- 
2.34.1


