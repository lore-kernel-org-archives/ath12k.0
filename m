Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0EFC98314
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaIKrQHZiqFFd9rA8t4qGOJUScvKNGixCmmrdQXDnG0=; b=oW0VGp5TkC0x4jhrW8WqZi6zax
	VKBWkYHuonsD47n9KqeEEgnAiP7j6UweCNOj8nHNJXQnp8EK64BrD+6KVXzj0x67I2MlCit8Wd6fY
	sAKvqOPkke0dGxAfQUa8iHhQ/bPPapcKB397Ej8ZVrpIOIrJAVKjgn1pHQXNSvQCH5XeiU76pvdyB
	WYqwYo/kOYlpmMeeyTUnj3WlZmqPXnpmhVjk2vUo6+I7P9lsTiM4pEM1W1xdxm0MMrTFTosxepFqW
	WbInPkNHgB2/b/NNWMBnWQnwMNUDpfbRbo9MCIdugF/2XOAgGDawwOm/wbSu6t/gA6gHRbofmHLI9
	jsa3aIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eC3-0000000AKun-1dKN;
	Thu, 24 Sep 2026 07:48:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eC0-0000000AKtx-1yhs
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 07:48:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eKYL582475
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaIKrQHZiqFFd9rA8t4qGOJUScvKNGixCmmrdQXDnG0=; b=PeZKLpD67JjgLuyP
	ezx+uHI/TOvIE0hoQ1tCdyQAWpJLjN0y9YJk2R/GBNvDLt87wnkVOSvnpmoTYO83
	S/U3QUPUsKvyZyV1m/CyJT++uTxISIo+cg3aZ7nhESOhsrZEOyF+/U0DnGxuAYwk
	O9YoCFbRG4qNFNplj869qZWGjjSXR4OvhQ9C39WuknIksTTEGBURHBoyJdQyNh1S
	OJn5VdpWKb9U66AUPT5yEmNyLqlD4C0QdaHO99qq8G163TUJkDDG1LAiTkqn5Ad4
	xQPewaK338cavzZG7QcqedGGn6DofieOZYR7RZcFheXVpO9IKXrZuNp5jjMVevAJ
	TbiSMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkxx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:48:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so1910424a91.0
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790236110; x=1790840910; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaIKrQHZiqFFd9rA8t4qGOJUScvKNGixCmmrdQXDnG0=;
        b=i1z8Z7nRWuz/qSJfxPoa5c13R/donbrTIHkCPU1GnG8CAGuRhsGGe+PoDYcnbs7+0x
         ZWrkqBRZ7v8L9xaHsuybAOnMOwT70si2MuaVgozMKmRcebMMCrGXGn34dIJjLJsl6G4Y
         NMk4bAL4+pqUUCD8i8E7/MjfWLU+a01OfrY9qalN1XVtWYs+n4YAC+5Oq4okNjC7j/X1
         LNDr0MNBme7XVcwpRmT/jNjCpPyxoU/7b2F1h9GuI6YaR+RbnhzdIXGiguk5UfbIhQrP
         oehbDahxFXVWk9jNrFfMqhgX1zuRtaY29BB8D8VDfi5eLuBANEteXtt0euaBfQoPk7Lt
         NqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236110; x=1790840910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaIKrQHZiqFFd9rA8t4qGOJUScvKNGixCmmrdQXDnG0=;
        b=z+Zj/Fo5ECjKq61LtXyDsC9HCxOi5YNK6yn+uHx1HWDuNh3XxlaOSuuTVf/0AmyiMO
         mVck8diXR5imWmf8SEEACl7IT0XOi/N/5uChiw5NK+tOfvaRktZ5oAXQZXrui0P1Fejj
         Gd2f+gObJu1MCUqlcDyWDXd1FRwuBa6FTHY5jAf7EYUBv0+DbKX5px4vGj5uUEMPq0fP
         4vOPLu92HBrwjL8DZhFhY9NPiqezNS/EMlzx0yOVzprktHwyHLJMwdgM0r2EF50H+q7f
         JOzN15I05O6GHZNcg7wq4YTUFOEeMaWAbGeHO7rhK/HPRf4mt2hJgtyV2vc8yn06wXc8
         Nvyw==
X-Gm-Message-State: AFuF++lBnKc+f7Ig9zXX+YGpnqOFQ7gZlEnqvJKxhllXuFPx/wcF5NBH
	gzWZbniBCssFT4ii/pFi+7EUjkojy9gIMQ4BCp4AK0XJSPX9RFoPDTclrIwDVZhL/khfPtZtoEy
	KOsFMwQ0d0B4K50vsgZ/F/IRBmK5zW1zKEannMZJzT2KymxQEg+cY4eRH1ka6zswxuRrEXKug
X-Gm-Gg: AYBFou1e8BACiM4/wo0o86GTvhH7CBJgYy2PhkeBO/L9xSASac4Y3vqG0B8rBxqJ7CY
	Yb29tcB8+S2spMyAF5dEtnjFZ5k+uc6YeJnCXglMs5Anwi22Jfx/L43VL1A6uC1Yn/ymfK8iODq
	DrtCVfUlnEAuJxIssgaBnEc2MA4vN6rDLCtqAl+qzIOeipC3dAjbH9lKdja3Gg6sFxXHXod6px1
	Aw9HRfc+87E5EzGnxKMKHNLYxa1XCM3kqD5Tqe478GXP8pYJPYzPt5oEvoZHevOQs6XJLdw0VTt
	9Z0LejpYY03kpUm3I97Eoiuah4uLC2TcDmHDFy0Tea68lX7CTZwmIWIIjzEfihpAlGWVuSY5SWC
	dVNP609lLeoqAakLM+6F0UEuUOmUpGkUfw90NdLIPzum9lcM268VBAdjU/buOR+Z1+7o=
X-Received: by 2002:a17:90a:e7ca:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-3a09872e6c5mr1430406a91.20.1790236110082;
        Thu, 24 Sep 2026 00:48:30 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-3a09872e6c5mr1430376a91.20.1790236109532;
        Thu, 24 Sep 2026 00:48:29 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm3627575a91.4.2026.09.24.00.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:48:29 -0700 (PDT)
Message-ID: <c55d15c7-cbdd-4301-95c1-650db2a8bc05@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:48:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: fix monitor RX buffer
 lifecycle issues
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX9yesiFSRJkCN
 7VJTQ0wSgXO8/aqbS7rIVBnyHJJaUGUt5Py5+69EcMdnlwP9uKznWRchZ9ytI8UQOaw/dP8/MLA
 tSbP/MDzUWr7bHksl7thwBT+zN84DMv/kRaBpHdKDJpPzNAbd7Dql+mT/S+sbprN3ozADMvn+bd
 cMFQHJh6sjlbxthNuepp7t4GuT7ofdv87OVXvmRRamTiIMr95kSYg5ogi0AG/nayHKc9HqJ/u6C
 iC1T3oiSBE8iiDEG5WE/+71BeAac5CfMQ1YvUKibR2sBU79INH3kh0KWDx3v9ex2pKdUw/VG1EG
 8C176B80EqTg83j1wGjPyTsIk7Ll8Y93tBxDRtiuRpy/YQo4rKwg2Kxzj8d62/DKABW6g98WmxP
 audxdUPR0rzTwqG+pb4ffkul9IUWxrp+r+1sxPcHPmWy7O6exP19Rg1wqIjjjf5fekBjARY+PXj
 jfcb5B0JRmVG49GR4Ow==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4d5cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jeZ2dEGWif2cJ8v1hNMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXxMMuUPg4uRHD
 jCKdLNSV3jhjG53XB3I7u48LHkWRY02dS4a5Yal/q5tXvMVBXK13xLBsHNjzOAWS4IgmsYkkCW/
 SFloc1LlG9X0NgekhGluwwMGguPiITA=
X-Proofpoint-ORIG-GUID: Xno-NYidCiQfMtxfD35nlhAkWALXs0RO
X-Proofpoint-GUID: Xno-NYidCiQfMtxfD35nlhAkWALXs0RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_004832_632963_011FFB14 
X-CRM114-Status: GOOD (  11.02  )
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



On 9/16/2026 2:03 PM, Kang Yang wrote:
> This series fixes several monitor RX buffer management bugs in the
> monitor destination path.
> 
> The fixes address leaked skb buffers, stale monitor descriptor state,
> object lifetime issues, and incorrect DMA unmap handling observed in
> various error and corner cases.
> 
> Kang Yang (6):
>    wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
>    wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
>    wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
>    wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
>    wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
>    wifi: ath12k: avoid double DMA unmap of held monitor RX buffers
> 
>   drivers/net/wireless/ath/ath12k/dp.c          |  9 +++----
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 15 ++++++------
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |  2 +-
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 24 +++++++++----------
>   4 files changed, 24 insertions(+), 26 deletions(-)
> 
> 
> base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c



Hi，jeff, do you have any comments? 😀




