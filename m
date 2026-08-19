Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75733C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0BkrDQRvYNkd85vnAOabUT6kq+vJI+njfJTS3E1pmM=; b=RAMZ5so7BdrKiyE2EfWyB+6ZFa
	Y2rhypEPtYEdWLrns/mXieL6J66+t+daXBv2/MAnD3g1yUP/2AhO79c3KGRuT3hzRZSUkMeLNL9C+
	gpS7be1dInf5/S9JXXWGdG/PpW2qEKutCjm2U/bzcQDhZTyQ4r0OeMGnQPZmN3UkU4mglqH7AvkwX
	YMKKuI715JEvdXQXZgD1yhSo5dyvhj1xur2ZpzvUNbzwSIWUZ2pM4Qh7qKoqAJTeDLBZWICPFSU5Y
	6+qDUqZk64z1Sbv2cRmABT8PzvbT086VaMiM1qRc8qEUBZseK26VmI4pNpELRiuNXDoM3mHDfpgvz
	miyIqwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaU4-00000009AP2-3RAN;
	Wed, 19 Aug 2026 07:13:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaU2-00000009AOd-40LG
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 07:13:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZLFC2457014
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/0BkrDQRvYNkd85vnAOabUT6kq+vJI+njfJTS3E1pmM=; b=IviZOpR9mz+FNMkK
	WW351BavAkzm99G+ja8jp9H+WIKbtAnhtQswwqRBn648gho91WNWGWkaHcLxzNl2
	szCyT/BpmPCrqS97XYF4Ka3G91QcZlRqatNnhxF1ApuzsAKXN5QJRkQDqxqm4Wp4
	G3nH0u0JrY3p3M2zIybOt5HUpIJMm9O7pjEhgDxhKv1qhffyF/j0golHrwO5A+MW
	Ay3/w43Q+49gJQPc2n09EP2ha1Jqgol15pzE/zy2kzS7DlYzomrle5FKSQT2O9DE
	WWFPkAocUdQqDwjWeQI+Z1J8aC+0k9CI7458JSCce22WI3G9u52FHbf3BXjMtjCx
	PXzdYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9uyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:13:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacf17c7e0so12079135ad.0
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787123588; x=1787728388; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0BkrDQRvYNkd85vnAOabUT6kq+vJI+njfJTS3E1pmM=;
        b=frjsoFqrFKo5ur3zN0W5jd+EaLD0wTZ+e7BBPV6UGj3DWG1ln9I1bYw+GIiNd9H1nQ
         A3ov4NO01rtj59hcmR/NxSWlZKHIwZvd95z2WDd1B7qwPZNYew159CGm1hGAISike7Wc
         idVecEn59kqJKsoYsq/2WlzZs62fx4a2He0NEImekpiILsH0ntC8woz8kY+Ow3genfDO
         jq/yloygmIJfEZ++0xV40enb03fvqni2Xsv58Kr2iRMnEDyB3IQQORVvVXv7WKsaHQSo
         QSzUFN5yM9hknC/PgOORslh+i8aO1ymyUmYHTOUZdDWiP23+a7FTT7NV/idwHqx1oR6q
         LKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123588; x=1787728388;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0BkrDQRvYNkd85vnAOabUT6kq+vJI+njfJTS3E1pmM=;
        b=YrnoxigvXHxMRd4PNfXaeW8fyHMn7Jt2phHrUdIRXU1HmS6YTLCpkC7SWR9lwdP1gs
         AR8ov215oo7EGrb6pEkaPb1+mRlFp6dHw1utV9Db5g7/+aOCMZdlKnBRhKMgc00B3Tg7
         tLa/iXX7Sb9vt9ckLpBBTcb8U5uHUkwl6u6VeNbpnQWItwlF5JGcMDLTSwARTsOSxOWp
         Ht+Bi7utHd/Yk/lVYseT/pweOImKcfyMY4JiO90uMpAB8JRNCOt5LQOo+GhzqjCw6wzf
         zvXCDAOm8l40Lo5SvLgQ4/uc8L+6ywR1XzAa0gCvoHh1NtSGdnkNtWB8k6+P/eIftPx1
         D68Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq2PjK8n+IB7oh+XD7CAsBSEytyjJfYHSKQTIA1etvVPmA+bIsmD5EzPSlLxeryiB5LEeNoPi8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUb+EqaJE8t+y3zouKnLOSBOpF9ipteyx+yJmP1ghjBOlbtjZN
	qvrNxVaInb4jNFiQAjt+WbzyEcNMVUKHg0KjjwVJXHavKCxo903vUCxjZSADp2mIAzyu9ItdqSR
	5mI0BsKswg0xr9T+aqZpOZxtAHdH14AOnehEfbUu0B6U4gVIAe/uSUyb9uF4y7Dix
X-Gm-Gg: AR+sD10EZ7ctzIvei8JwYMb81K8apxAAcL/cXHvS43tH9EQ2IzUCZTno/QOrJdDbJZU
	GQ9mx7ie/cDsCgefWM3jXn7mreolCSj08J12czadT9EHkWyZqWoptGgCh32nOVGgt0ELAcyy8SI
	lAeOnUJsnHqJd+YYHgcrxU/1rIyM1YEEjDMTtnF2hrnfQV7UPWYDy8YrQ04Hczwg0PVP+Rv/flM
	KMAAo22rr8Yza9UNxOTxlfrcQrmdAOMjseif5hKhp99AtnAM4GKLAMEMgWWd676oDeI8m5GNPuu
	eEmXyo6Q3JIe8AjETybvDt7Q+auhIu6VWdpr3IoabMT1gpvcQF6zOU1Wzlx7ABDR75AUEdBPG0C
	MiEX4Pmr4/AAJ5EzHjiyacFGlO2LPlTFP11kllJix
X-Received: by 2002:a05:6a21:9182:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3cd00df4c1emr6056726637.5.1787123588575;
        Wed, 19 Aug 2026 00:13:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:9182:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3cd00df4c1emr6056662637.5.1787123588141;
        Wed, 19 Aug 2026 00:13:08 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf143775sm4277493eec.23.2026.08.19.00.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 00:13:07 -0700 (PDT)
Message-ID: <b2d7dfcd-e66e-467e-a4ee-fcf7bb8ce27d@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:43:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix stale skb pointers after
 aligned TX payload shift
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260818-ath12k-uaf-for-aligned-tx-v1-1-d6ae195b15e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a855785 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pkw8S468fx6YIQHryOEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MyBTYWx0ZWRfX2ADFCsypxzBB
 4m4uB6qtOH3d1vp164cRZPpk3P1/zYwm3INMqiYzar+3Dd76Vq+AZqFb1nxlvzKrwSdveHsRCbd
 aSbT0IETSMgK5Zjn7es7WXrIPx+k/33P5Wjj3jApQdqklRZrJsvTW8NmF4hnxAuBZgYNWFuDc7k
 h0X8Lpe1nnLSfoifFsy4JANWuSKNpLHHZnLpDdD6SDiu5s2Z9zIgX+yiLcWzwrKij+swIfiVoBf
 RdSX5XsD3FDD/Ssj80u5H3z2CsaCQvSw56fGT64lAtmGFmOhsWl2Q+fGff0OLoHx+444m4UKZ3Y
 oqXRi2x1oBR1XwHNPVKNt1yzCkgdBjyu9DMti3oizJDMkvHNo+gwjn3mzD9sDpQixXRS/cmWsn+
 I6xPYSqWJ2Oy7CgsT0ctgi4RcOuNausd8K5sYfvc7NQ4G6+MYotjthzqwmJ9sXPo3wiEPFjpk4X
 XCRB/29lRSIUyBOkZrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MyBTYWx0ZWRfXznAZJvUtouSx
 X+lR0MKaS65XLPkgBJY8ZfeVEVZsst5sEdG+IzjMCwgIvtrNVCF7aG9bndXkOOBg2Y3YizCAdXf
 0aoAp/ZgRAR1Dt0EKUH9N2KeWbmKxno=
X-Proofpoint-GUID: GenYncCDER6HB0xLUp71rtW6wURChPd8
X-Proofpoint-ORIG-GUID: GenYncCDER6HB0xLUp71rtW6wURChPd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_001311_141686_4D429038 
X-CRM114-Status: GOOD (  10.74  )
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

On 8/18/2026 7:14 AM, Baochen Qiang wrote:
> ath12k_wifi7_dp_tx() caches hdr, eth, and skb_cb from the skb before
> calling ath12k_dp_tx_align_payload(). That function may shift skb->data
> in place (when headroom or tailroom is sufficient) or reallocate the
> buffer entirely via skb_realloc_headroom(), freeing the original skb.
> In either case hdr, eth, and skb_cb are left pointing into stale memory.
> 
> After alignment, only hdr is refreshed, leaving eth and skb_cb stale.
> skb_cb is written immediately after (storing DMA addresses), and eth is
> re-read on every TCL ring retry via the tcl_ring_sel goto, so both
> accesses are use-after-free or stale-pointer bugs depending on which
> alignment path was taken.
> 
> Refresh eth (conditionally, to preserve the encap-mode distinction) and
> skb_cb alongside hdr after ath12k_dp_tx_align_payload() returns, so all
> three point into the live skb for all subsequent accesses.
> 
> Issue found during code review, compile tested only.
> 
> Fixes: 38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

