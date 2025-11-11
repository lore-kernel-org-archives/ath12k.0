Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D2BCCFA1A
	for <ath12k@archiver.kernel.org>; Tue, 11 Nov 2025 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccMn/uxx/7Gnd3fRnQtGKZrpth+oZobA2BDssVkaPAs=; b=BL+xSjsSrTpcgoh/uHrhHoA/2/
	6KBcOVSPM2i6ArWYriljZrwroD6BicWSQxHyLVR923sj3a+fTG2bkacl21VgJI1sCg8WBATfS8ZoX
	vmYhDcxJH4h3VYu8ikPoRg5mDCLHS2CY2Cu+v/b1tO4mDo/xkfvDN0C1WTm8dsZn5VTzY84O0a34g
	/vl5IobSM/bg3/4xH8Q1Z7uduvjRKCXup2Mq/ijwwveGlrZjtvvf/uGXn4wYs8nEXy0tpaBLR1nvH
	5Agg9LGwu6xqA6v7lBWTeVEiUSkAsyT/OfvjzUCKWyhy7jrFXiabl5K8xlDsSmnVK00QIxlTF0EVg
	xR6+sqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqR5-00000007OOo-207p;
	Tue, 11 Nov 2025 15:37:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqR3-00000007OOS-0pZ8
	for ath12k@lists.infradead.org;
	Tue, 11 Nov 2025 15:37:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGvul2301342
	for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 15:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccMn/uxx/7Gnd3fRnQtGKZrpth+oZobA2BDssVkaPAs=; b=Dywgi1abHKbVlgS1
	hwV7g78eJRd3rwtw7bZr9EmCypYFj3FMWbT5t7rydYBqHG488s+VjnRu6O0n1E6T
	8hKk1foeREzz/iA1ZYZqU3GZD2F2zvJnFVVlx9BjCsx5pTfdDh49Q6X7CJB8hAK9
	u/zHfhAC7M0MlxncPI3fXw/g3v1vvICA5oYDe+TID/L6rMl/bx0ySAT7B+sqXhdF
	NxcYohjebzMsVMsmoA3wtR6upn/duWrBYfG0KB58wlKUZ/k+39nLEgd0PUN9UMXF
	D0vHRIw1SC3rJd/52FO8RozYU4zKTY/eqqJv9etoPZ/UyNFPYihQNkuK1FsFifKW
	TI/oxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjxqkr4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 15:37:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29846a9efa5so11102635ad.0
        for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 07:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762875451; x=1763480251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccMn/uxx/7Gnd3fRnQtGKZrpth+oZobA2BDssVkaPAs=;
        b=g448CikSPCTfoJ9lhsW47BfTyIHzfujAi3kDkzN+DPtBudNuSEjmJZfz0G3qrvDuND
         JlO06E9ZumrBG5kSAYDVLhBSNWgA/HW0I6d3K3pO65qMxWMB22SWZ0PwiP1RGq26ZuJp
         hGjZ07jTXXCaRam8DDVuPsur1L8oEQyqZsRgMKBC5dFRJXv1zAZ+bA1E6z2PCoFzPKIX
         FJ3rSaaCgtGnodPA+ZoJhP4DjS09zDGCyEzWRiNpAPseCjhTV0ErtZNFCbdBBAPmVyoj
         gf1Wqi7yuKIfVxxZpOKEPhNIP+bjcBPHKKI+O2sx+dno4KzWvlHnkffqhUC8XltdknyY
         Kk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762875451; x=1763480251;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccMn/uxx/7Gnd3fRnQtGKZrpth+oZobA2BDssVkaPAs=;
        b=OThbinLV4hvdG/3hhFYd6yUfGPYxziCz8FKvChP5AxOquzRs3fHiuY19Ru8LjzRfZK
         R3HGHZqmoReA8qBJgdwjIVw4+BALA46RxJN3axpIOcTA+FmGzxyK9o2rrvrBcjuHXW6W
         hG50xZnML7i+ZzlEEjDK5hW+4xZdcTPNa3X4PGWJGgt9XAFjGdc/ZFGG5vN2S9YhmpBI
         bmoCztEiCXALbp74SFkUpcdPSGSBB/9My6wl3v8vJqaKsu1xJCaj681qVGyZC8kR5OEE
         Y3uqiS3EbOX0khOsW1WFWA27CbH2Ch0ShHGpVUzKi+xAQhKuZC/RH7d+zAChPcNGH4E1
         hF+w==
X-Gm-Message-State: AOJu0YzNTxcSRvar21k6Dq/INlnkpXig3AqTqbCrCT1w4WDtriMSe7rO
	skxeqmxea3uR4KRVyATDHmfecYGCS6VRZkrWb862HsXy48n2UJhrl50NkCEPRjt8WG/KL6b+uJS
	kmpo83pdpVkM7gyxP83DHp2pq1tYqB3csppaaWx1QfWFEp8NS9hf/nkRUDQ72LYr1
X-Gm-Gg: ASbGncvIsPBcLlqzfvh1UKWHW739UGh+4gl7BnrPvU22VoSFlClZbHPgKzb4THcCikl
	cpw3Ex666yCq9waiNET/hRWO+ewWOWpt3MK+NKSVDXsxCF2odq7a3myq/HK1tjx0XdMWTHbN9XG
	+C1J12WnQKru/xjT+Db9Pp5NUSZcr1fsYpoK8V3VIwhWuApnDwaleQnqC+qctbfV6scaL38EikZ
	9KfHq4wjQzTh+MhatjRJUFe01+wzfNIxZ43CxCgZO+dpi+k+Q0nlmO25Fpl1erHdXrWfchxTYo9
	BAol65VphV/ZUhRPiKs4/CZfvJe2yZH8Z2dp17jkC5TLuma0J055YZdlKeJe2T5v9DLJN7TMBMu
	jiHdVJAFI7yU+7ankJF9OqWd94v8wGpLAk+4=
X-Received: by 2002:a17:902:f684:b0:295:9b73:b156 with SMTP id d9443c01a7336-297e56e14a6mr164159325ad.51.1762875450739;
        Tue, 11 Nov 2025 07:37:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRLbT7WM3l5I4OW95pwfUPqD6B7NrLd/aslTSX+CtzBOfFScCDCImSTH1OzHPnRWDmHaTB9g==
X-Received: by 2002:a17:902:f684:b0:295:9b73:b156 with SMTP id d9443c01a7336-297e56e14a6mr164158865ad.51.1762875450112;
        Tue, 11 Nov 2025 07:37:30 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba90307193fsm15950789a12.38.2025.11.11.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:37:29 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Alok Singh <quic_aloksing@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
References: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
Subject: Re: [PATCH ath12k-ng 00/12] wifi: ath12k: Remove the Wi-Fi 7
 header inclusions in common code
Message-Id: <176287544947.356397.15668073680405341294.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 07:37:29 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyNiBTYWx0ZWRfX0E9daWcPQw5i
 H945FQJPHwflVQr66JO0QXa0Y9El+ukHBP+k6gKcMuA7D0wR9r0WwxMZszkDkKKAEVdW8NNlcze
 GidMK3BS/4HRTR7IFXz+M/bvCNXfQJp2ai/Tylz2x3ztE/kOahVniQvd5G1eTeBL68dlAobbG7n
 3tb0bvy/tdo76t2PXl77bSd/UlQM208mRtKq2QI6CYIeLymJBbj3UPss3HX+BhllYLd3F0ahgwl
 bwYOkFpKE6yPhr+6RpVqSZ3C3zxpBsvNxaLCmJXi1kPZIUcqTR5U0Uxhr0Hbfi12eCpLDnTRvaD
 5AIRhveZDLC/aOdU111u6MhFYjKg5lzxTkKT7UcSuPsTrsDJYUxv6nfSsLo2mi6S6b/a9OH9UYZ
 yrIOxR7rHBvWUSRhBmny978PJ3yZoQ==
X-Authority-Analysis: v=2.4 cv=CsKys34D c=1 sm=1 tr=0 ts=6913583b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rApeeKJKgo9SdP4gWbgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0XEbbrZHUyVaOsKO-lxwX45Xg6CO2Qoc
X-Proofpoint-GUID: 0XEbbrZHUyVaOsKO-lxwX45Xg6CO2Qoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_073733_361266_1012B60D 
X-CRM114-Status: GOOD (  10.60  )
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


On Mon, 10 Nov 2025 16:07:01 +0530, Alok Singh wrote:
> Idea here is to Remove the Wi-Fi 7 header inclusions in common code
> As a precursor to the movement of Wi-Fi 7 specific .c files to
> ath12k_wifi7.ko module, Remove all Wi-Fi 7 header inclusions (`wifi7/*.h`)
> from the common `drivers/net/wireless/ath/ath12k/dp_mon.c`.
> The common monitor functions now compile solely against the core
> ath12k headers and remain part of the `ath12k.ko` module.
> Move Wi-Fi 7 specific monitor implementations to a new
> `drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c`.
> This file is built into the `ath12k_wifi7.ko` module.
> 
> [...]

Applied, thanks!

[01/12] wifi: ath12k: Move monitor ring processing to Wi-Fi 7 module
        commit: 24b21a9be2c999b51aaec50ede4b2ca1dffb0ebd
[02/12] wifi: ath12k: Move monitor status processing to Wi-Fi 7 module
        commit: e00164657ce8a347a24d49a4aa4dd96aaf50a580
[03/12] wifi: ath12k: Move MPDU pop functionality to Wi-Fi 7 module
        commit: 906b5ac9c2b5dd2512a515b0c74a6905973fba04
[04/12] wifi: ath12k: Move RX status TLV parsing to Wi-Fi 7 module
        commit: e475119ba2510c66138261d72d797e63c73eea02
[05/12] wifi: ath12k: Move TX monitor functionality to Wi-Fi 7 module
        commit: 52758ff7b50a7d8b06d23c7f2a42ae85b559f682
[06/12] wifi: ath12k: Move HT/VHT SIG processing to Wi-Fi 7 module
        commit: f4bcbaebf4112c8f6320e208b67b2281dad5d5e1
[07/12] wifi: ath12k: Move HE SIG processing to Wi-Fi 7 module
        commit: dde5748c2940b4b47bba9c42e086a90fbe43b5ea
[08/12] wifi: ath12k: Move EHT SIG processing to Wi-Fi 7 module
        commit: 00b67b7c44b47b6ace2291e903d21ea7b6261179
[09/12] wifi: ath12k: Move remaining SIG TLV parsing to Wi-Fi 7 module
        commit: e5419861e4155ae32d739308e713f7bf6663d632
[10/12] wifi: ath12k: Move MU user processing to Wi-Fi 7 module
        commit: 5db19c48841397c5b5732a1aeb81fc6cdcdfc5c2
[11/12] wifi: ath12k: Move MSDU END TLV processing to Wi-Fi 7 module
        commit: 965aea91545a03cc14439ebe57519497925f5ad4
[12/12] wifi: ath12k: Remove Wi-Fi 7 header dependencies from common ath12k module
        commit: 7cd7392a07782b8ad4aa6360e4be1967af2eab04

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


