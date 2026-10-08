Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E123DCA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=xjpaeyph6FFeHc3TSMA/lIfnZ8
	FcxSLEaBpuXGbWYlZtWqFZJT6Us9z39TC/bfV9AEvPhACSlkJWF5pknVy/VPJ94aR+DAU7nQhrLh5
	RPz/2p4EQArF3Ot6+nnvxK4Dbdi2UaV+wd+QYDceYKRzQep+B875uaHmWsa1lQmvmw+2DTQyi6mg5
	BtAu7ZlRsKH5SRBRGWSXei6amKCPyQgxr5NQGb7Qf0IrY0RO5iWq6oUpRB1xAA5phf4Bb297hBFPt
	YsOCK2Ch5IvAoUFJGW4tO3Rc28mPCvuYiKOu/nj7d/BkuLyc2bY2rO7i7sabjn+kwM6rX7DW/VpJt
	4D9rbd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJ7-000000046cx-2GiE;
	Thu, 08 Oct 2026 10:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJ6-000000046ap-0YSd
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=NwdDQF+hBAjqKyw6jfhlS2/Blf
	E54m0YWz7TPaYMIeV2w8qQxRDKvCjlyyKQPkX/57rXpW9qdf8O92rgOKeHC3MyRnYfAO9Jxb6QK50
	b8ClJLNVTQMrrQ34KwIzj1B4s+P9z39dEc7xNynmJOfHwsNaBI8hUjS02NtAtjIRIpxK+EXe/935Z
	vfTtivqtn2R090SQYKOP2AuO6kpkMttvW38DzqDlqcZ9fr8Orw0N+GUub+e/4MdfQjLFWjMILdjf8
	u69pfGHCBBUs1YTqwddZ/jlBfJ/6rGKVI6x+bY+AVRzrUwnDJBrYdtsXEIl4Cmn7qx/LLFwjekaQU
	PAs4cMrQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJ2-0000000AHkQ-0duY
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KEGJ2560191
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=UgVSjH5TIZ5O3VV4
	Cjg7kD9hVCWT8y6IlLtWe71Pgz8ZI0/sHyk+yk29dw00hTzLR4Aye9pX5XGh0dQ5
	LgyWd9txO7fhuWsFGCFnTIu0U9xUGYsU5K9RAIhdfIry5uT3o53RP9sWDVdBRuRV
	0qPdlfcRMr4mY1gsm3wun0pqB5VZ4QvInvo2DYBVcaS5x9AXqjSxoqAxt3U09H9X
	dKBaltTvehieFA0D1XZlTRzWd0SfMjqibl7zA1Kq4s4gdgCDz+jMlIRqLBHqydDH
	kUuow9PYjVvEgiKuvvW4MBVxs2A7ia1XVqmuXPB5AJrPF4UBP1ZBKlgSRhPjWIrM
	O3YK/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82ctq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so41067925ad.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455094; x=1792059894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=DN1HdutANyckaclO53zVEc8lPQHhGCXyUi8aN6/BX3yKDZTrK0TZPGXqQd0JQ4goQt
         eHuf9ZquyxlpD/kQV4tuBE6MyfYW7pGgmIEj9eq6AnSF1b274pVPdK6uT2/QshrGrfcj
         8xYxvVWmnzYgFveK6+vhq+R1412dATftiRuX6vBR7NFO89BaSszv8s6v1JumaRHMJqTC
         ZblqO9X/xvgVN9RROdcjodoZa8PKsCgY6M2jQDywQTuA3cs9V6b4v8efenwCagw3mu0r
         Dt1+2TfMOBq1v4UTpxhN7Qado7URbTUQbKCjVouVJUCnos3GRnUrdvNS0s7NKjSsskrJ
         miKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455094; x=1792059894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=eyz9ZUSdOe1ic1oJkmlp12wEXZOxxIWFlOAWYwOgTDKw1e2Z93OAzfVmfMBZizYbyh
         GMvXtRcgfW05ptwbiGYwCdWgJfyb6IOOkO/+ty2Zf6hobmhVqZEwOHfATHg+31zXOdDX
         Zv9l0os3kvTJleVpx3SAxm1u6opEdNLiIoZoo/dIuXoooNm2V2rwL3AC8bN7/LYrihTE
         5Spxdu5gZes6tegnRswMMG7JAKIBYSr1qUQqsFg8S3WgEmIgV7b9hZymA2JK9m8lOIqX
         tsUR98o+0LL3pquqCmVRg0r+CXV95jJ/p+YJcKX21sytHpVbjUcfR9GEqiutAhiD4W5W
         GSgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh7R+u9FzupRR1PGCSpMdX9i4oHKpDVAEEsvym3imK72Npo+EYEPIliwicd3cam/Rmxug1OHY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKVK+1io0lHF7eMTafaDSvmo6C7ab3BTfrZxxJ6IuCtZNU+0d1Q
	zULfkalmRkw86EGoAXwUe6jLB3s9dC2Ncc+I1nWKFX65H3TWk81g69DbJBHMD8jU/nOOLtgBdh8
	+FbP1ALZVY2iqojhjq3S4m8G1y9nxVLwbjjfsJevq1Z9aMCiWm9TMQU9FqIkGQXjA
X-Gm-Gg: AYBFou00VJUHzbeqJO0AbHWKmdXDVKkALVw1qQRsOP/cTu4k9GJy3/nfS0CiqoDRzF8
	9P4SNmKyqgBEkg6QgrhiSPJOL/vqhGEm2mcnFYBVGndxRzIhHjy2mF7ON3OaVaESE1QqMTOm/W/
	/FkFe+uLtHy+keQjQlUnbU/aAU74mRTdB3982dXwCxrxlXh7ixvM2suhsSISP8SWYmhk/3vghTu
	KMQSVSrwCCCZqoCoyWeYAiAgz35IJi2b3q+lIE9RCeJyMjaVCY9YiakZyTjuC1a8V8LrVpqK+tk
	ILasTtRSydqhlNTjHMHn/ZXTM1SANF6c73MdX5jLbKij4OpDMHwbHXpiW5hAhloeD6cIR//TWwv
	lIRhDmZOvU0EQnPcD/DnJnnSp8VKcdcdWH/bJiWvc80RrXIFpMK2J+epsYGP109khswdmiUDuFp
	KAMDTM+Fp9dK9+cAIeDgEe8A==
X-Received: by 2002:a17:902:fd86:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2e600545a2bmr41630415ad.58.1791455093635;
        Thu, 08 Oct 2026 03:24:53 -0700 (PDT)
X-Received: by 2002:a17:902:fd86:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2e600545a2bmr41630255ad.58.1791455093163;
        Thu, 08 Oct 2026 03:24:53 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:52 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:05 +0530
Subject: [PATCH ath-next 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-9-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX1RsczUtky2Nr
 5Rd08NkeIpLVlnoC4sMP6F5vvPYpEXaSlUgfKpoWhOl2qf3SY2wNgkSH5qBiNFsCpOsNTX2swSf
 5fv/H3f+oeXrIeblF4riv7yDr/nBBOSL6DFhGFpIWS5DKXhkgktQugg3YRE8qmtFuXGh9hynwSt
 16zeW1XPzJapXNgkqs7jU2e7pYh02zK/+N+0YNekqVPQmdS9h387oT4HgREWAO8CZN+OAvgsWj/
 XyDsvO/q+d0X4UNlafHRyRUZ2gN8XNe0xoNZ3oLYeAXkDS4gYsnR8iyxka9JoDFX0hi1KnXTpSp
 yzWtWIhRVEVBV0/jbxZ/TYJV1sBzjsjk2uLHpsR5HeA0q1ARquxW0st6fMPFczQ0PRzh515UxP2
 LWuJBurUA1n1nMlmM91+FZsvvL5BXtakGrXYC1VqrPWTmaAPZK2eAyXvqdov2di794G7qiOcKbY
 zWwBw67hk4vtGJNpAaw==
X-Proofpoint-GUID: U08W0sjC18Dm9yUxC4_l6Qt2SNLbrgLp
X-Proofpoint-ORIG-GUID: U08W0sjC18Dm9yUxC4_l6Qt2SNLbrgLp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX2ibNObP5eCAx
 qaS4KHMn3s09wGkGSt2TV6lujXFK0pO5NHHfVVa52rvCBIyPrBNbsUwgF2Emf2EhQkBU+WHtUFb
 WO5ArJWGfd/cGODQSR7XvMEKQ0bIoRg=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac76f76 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112456_878848_C3C1CA3B 
X-CRM114-Status: GOOD (  21.81  )
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

Add support for devices such as QCN6432 that provide the M3 and
calibration memory through a unified data-region reserved-memory
node. The QCN6432 device tree continues to provide separate
q6-region and mlo-global-mem regions, while the memory types
mapped to M3 and calibration memory are allocated sequentially from
data-region.

Track the allocated space using an offset and allocate each required
memory chunk from the unified region.

If the data-region lookup does not return a reserved-memory region,
fall back to the existing per-memory-type allocation scheme using the
named memory regions such as q6-region, m3-dump, and q6-caldb.

Introduce a helper ath12k_qmi_map_target_mem() to initialize and map QMI
target memory chunks.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 83 +++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..cc488cfe2b2f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2842,6 +2842,26 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 	}
 }
 
+static int ath12k_qmi_map_target_mem(struct ath12k_base *ab, int idx,
+				     phys_addr_t paddr, u32 size, u32 type)
+{
+	ab->qmi.target_mem[idx].paddr = paddr;
+
+	if (paddr) {
+		ab->qmi.target_mem[idx].v.ioaddr =
+			ioremap(ab->qmi.target_mem[idx].paddr, size);
+		if (!ab->qmi.target_mem[idx].v.ioaddr)
+			return -EIO;
+	} else {
+		ab->qmi.target_mem[idx].v.ioaddr = NULL;
+	}
+
+	ab->qmi.target_mem[idx].size = size;
+	ab->qmi.target_mem[idx].type = type;
+
+	return 0;
+}
+
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
@@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 	const char *rname;
 	int i, idx, ret;
 
+	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
+	if (ret && ret != -ENODATA)
+		return ret;
+
+	if (!ret) {
+		avail_rmem_size = resource_size(&res);
+		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
+			chunk = &ab->qmi.target_mem[i];
+
+			if (chunk->type == CALDB_MEM_REGION_TYPE) {
+				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+								chunk->type);
+				if (ret)
+					goto out;
+
+				idx++;
+				continue;
+			}
+
+			if (offset > avail_rmem_size ||
+			    avail_rmem_size - offset < chunk->size) {
+				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
+					   chunk->type, chunk->size,
+					   offset > avail_rmem_size ? 0 :
+					   avail_rmem_size - offset);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
+							chunk->size, chunk->type);
+			if (ret)
+				goto out;
+
+			offset += chunk->size;
+			idx++;
+		}
+
+		ab->qmi.mem_seg_count = idx;
+		return 0;
+	}
+
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		if (chunk->type == CALDB_MEM_REGION_TYPE) {
@@ -2860,10 +2922,11 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			 * Once cold boot calibration is enabled add support to
 			 * assign reserved memory from DT.
 			 */
-			ab->qmi.target_mem[idx].paddr = 0;
-			ab->qmi.target_mem[idx].v.ioaddr = NULL;
-			ab->qmi.target_mem[idx].size = chunk->size;
-			ab->qmi.target_mem[idx].type = chunk->type;
+			ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+							chunk->type);
+			if (ret)
+				goto out;
+
 			idx++;
 			continue;
 		}
@@ -2904,16 +2967,10 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 		}
 
-		ab->qmi.target_mem[idx].paddr = res.start;
-		ab->qmi.target_mem[idx].v.ioaddr = ioremap(ab->qmi.target_mem[idx].paddr,
-							   chunk->size);
-		if (!ab->qmi.target_mem[idx].v.ioaddr) {
-			ret = -EIO;
+		ret = ath12k_qmi_map_target_mem(ab, idx, res.start, chunk->size,
+						chunk->type);
+		if (ret)
 			goto out;
-		}
-
-		ab->qmi.target_mem[idx].size = chunk->size;
-		ab->qmi.target_mem[idx].type = chunk->type;
 		idx++;
 	}
 	ab->qmi.mem_seg_count = idx;

-- 
2.34.1


