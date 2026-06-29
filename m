Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA08C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 04:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjJcQOjeRczqv1vibZWVoMW2p5r1ZyS91QzfI45NUJ4=; b=Ho8aCV3RlhhSjTDRExUEWHv+47
	ZA/79rkRjr+ImeZ+m47West4nz6+NgDOo7PPKFRpicNcypeGwgJFm0kRMfSmCg1vWVW19iri4aIyT
	v2yI6GFdN583fvWhaPJkTQMtRzAMTJc04SrBBmfS5RvqKjIl503wLNO8KHFkKREOj3wbNG00dYoUD
	cAyske8bwsAmjZBYqE4IjPqvHmeSqHK19DWxnboieHN0/qwC0TSAE/lAAEC/JO8la5QYg+pn85r9z
	+7qcdhVg2tO2lMZtdkS1obwUblQhK4DUNHG1XdsfIz4xtqOklKiHEVQ1P0XeFOb60s3/crkgh6cT7
	0yBdjEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3Rq-0000000Dfgf-0YeP;
	Mon, 29 Jun 2026 04:18:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we3Rn-0000000DfgJ-43De
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 04:18:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T2cmVn1514036
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 04:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjJcQOjeRczqv1vibZWVoMW2p5r1ZyS91QzfI45NUJ4=; b=l4ctPr/PVGYB9SwD
	hhUOpZsAuPhwgQls4xg6pS2nlAPEShLClrcXZJEKGPRqKAxcxagBbPBr8Dxh94x/
	5EXGpFDJdguJ3ab/rpkmF9MPu4sGwhgEBVrlSYcjzfeFkFZys6yE2CbUJnPCWuxe
	f+i28rmEZ+gEdm9oiVqaaLeL9NaPkX3JFOeDcfApNf1qZ3r+CnUKrmWi5neN/A0C
	jMLnmeZDx/ySLvKBgaRvFbCxZZ39xDzx/winjue4DU+rQz0835wTyMFyoe2wkNYE
	sb2q0g3/N2Xa6GMpGHfK3PKiF3X0fiXc+ApADOWd65hIPbZFIRhvZzhYNB7B+NbS
	qH9Qdw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmafg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 04:18:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30e85f5bc9eso5299841eec.1
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 21:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782706694; x=1783311494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjJcQOjeRczqv1vibZWVoMW2p5r1ZyS91QzfI45NUJ4=;
        b=VKlF5mdh8cme+Staas+zWA3alUAaBfuh7fy6GS+jAT7rSHrZlQ5GNcXlljNM3a6Hr9
         8+7TSQHs4MBrtTiAdMf8DgPCX3h+CSM6HMrqlqzv3LOeei8oTnfRfW1RUz3KR7o/8H88
         xw1ARgEc+i4e3VKqpadOCaRtL4IZW4hmeoGAdP26WQfTD2FrRbt76/moYUOPuoiCagG8
         P+ezTNtEHBTe6KE59EBb3bx+dKrzjDiUvUnaLWxjXdSuisdOUz8SPffqfxjcONTVZHy4
         jO7OmU3h/aq3CsAvy3Lk1g31cPyrbQeVYJEw+0ekTpyj+tznsw6fgMpZiHTpDor/CBvu
         fEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782706694; x=1783311494;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjJcQOjeRczqv1vibZWVoMW2p5r1ZyS91QzfI45NUJ4=;
        b=sZd002aF1mMR3U+87ITJQ+kkMOrxqw60GrOq2sxaa9JEeibLWHNvbfdT57J4ZdwMFC
         mBusBH5K9JBiDvcd4xU+7Xmm+KWEneXa/jrILtqbshOUiXdXOS9xHk+Utz420+zqCBoR
         sqop7jbrEz1EyzfA9j6dHLzW98j+Ar/2Kc79yUudyqFosbfnP2OUaOclDXlTXHTy0/88
         aPrF1QdPpZOv+tgXtyph83eLNdaWTxeF31j1A94iKe/ys4qaVBILrZmv7ax1p5QFzBZs
         EnAcjlWv/PybJIfjBu6bEvhL7Nk6sepdACd9tevd6ds0LA09hdFozPzb9E91WEh3zeAy
         WWBA==
X-Forwarded-Encrypted: i=1; AHgh+RpPv9nu3iGyBX77hh9saQby0jOoDaHY4UCA25IcjfO+QDg7m7Dks514KWTzU+HU53wD9UydPFQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmZCe2XhhHZJO2sKpCTln75Jcpfio7t+zGjjjAe/zhimSJJfkU
	rTr74Svl9n9ujVaAnEu9CsvQgj6UBZe8Gkfa9flu+WKeKdMQLDtgdiXMy+EL80aDalciablu0oE
	VtK3snH1dUn7I3wWHoyeOua4142RCVYMi9vQ0EMFvwNoLuw3KBC8VobN5CBQM8Wwu
X-Gm-Gg: AfdE7cnOgWvgcIcpfzlUQMXay+QmOfP1+p0upwOKtzpKJSmLlEd8fz/meaMB6fa+j3k
	bcBcyne0LTsxTPMCm3uo+hjGEmeHwdYlCOSuDd+sPlQ4Bgr7/zHhW2fQny7pDzTJXbzCKSkJ1kp
	IXGheUxTvLHhmMvPl4ViA6zoS+Teq+oyz/MsDE14lf6rfBfzB8OkaFt22MDTWNM5tMid13ewdyD
	VnAiKI9Ttt03vXD0hWawJGwjkWpOQguzBkZtM9OqOgZab5rNQJlyhPdUlQmCkPF98XL3DvV+zk8
	JAjJ/LxK+4iwiy0tbiCsA3ZkUfPIpJcsUn/v6HwMxuqflHXkwKTG3kIwyWzQd56dAavRHvOdsOy
	0lkbAW+H7Ov2rV1nDUDuGnZZCC7sqmDFNsK7MFNfrw0BrxQ47ySo=
X-Received: by 2002:a05:693c:2281:b0:30c:689b:c59d with SMTP id 5a478bee46e88-30caae2f3a6mr9483382eec.5.1782706694534;
        Sun, 28 Jun 2026 21:18:14 -0700 (PDT)
X-Received: by 2002:a05:693c:2281:b0:30c:689b:c59d with SMTP id 5a478bee46e88-30caae2f3a6mr9483351eec.5.1782706694004;
        Sun, 28 Jun 2026 21:18:14 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm45388026eec.8.2026.06.28.21.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:18:13 -0700 (PDT)
Message-ID: <1b3608c0-9a1d-4c16-86bf-f625844c5889@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 09:48:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: correct monitor destination
 ring size
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a41f207 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vof7ml1Sp1nGWk4UEeMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNCBTYWx0ZWRfX6K1eoT8HF408
 hlUKnmW3PggAsPRlHYxsAk6i6bHT6bAFcvUVSLLsso2HbcfHILL3J6cenRy0sVHtMU6XiRs1OQp
 NUzPNd5pWJyhEV5RD7aUF+ybXZGZQrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNCBTYWx0ZWRfXzFzHE0dZVSO5
 +SmuqA/N7ciSV0dGY8a63+n8uS6IbyGK+Mq1pTUlzPtA9rjZxyJl+ZTp5bAb6QBRFvVApsZ/yVk
 e3fvho6ToUUv2x3fuLL8nwPHGxlnrY1vozftHETTobLPgdw3lxFaR+8H/yuSeuWWfY6aph61x5C
 DVpcbI/KFnBeuFNkkQJjoZNxV153mvYqhTFukmBBWHCVyrobOtfEcfIi7fOp6zU0G8hg7u+EDu/
 UIlRgvqDWbwvXQz4+XW2dUElXB2iNZB3+zuZElmFKyyZSj+HHhu+vmgIhQQEU8q+GT8sQtVe/ut
 CgeCxoH8+9LYLL7QdyYGnwjqnuiCy+Qfjp4ij6loknLs5X/5ZF+gJA/CI9pfHDCJbfsvqfHslBi
 oVqWdftqoG4hL5PuK4X0YS5ztVQmlcEqMqvTftLCwdnOS5hgw90NUISp3eF6mO6MPzdwpGYplOe
 CXxIYriPIopGbhUqexA==
X-Proofpoint-GUID: vL5WQprdH3qk13p9KAu2c47iHJnY1HVZ
X-Proofpoint-ORIG-GUID: vL5WQprdH3qk13p9KAu2c47iHJnY1HVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_211816_039836_8FA1FCA7 
X-CRM114-Status: GOOD (  15.49  )
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

On 6/16/2026 11:53 AM, Aaradhana Sahu wrote:
> The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
> which is a typo. The intended value is 8192, consistent with all other ring
> sizes in the table being powers of two.
> 
> Correct the monitor destination ring size to 8192.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: defae535dd63 ("wifi: ath12k: Add a table of parameters entries impacting memory consumption")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
> v2:
>    -Added fixes tag.
> ---
>   drivers/net/wireless/ath/ath12k/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 742d4fd1b598..b488bd8fea9a 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -49,7 +49,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   		.dp_params = {
>   			.tx_comp_ring_size = 32768,
>   			.rxdma_monitor_buf_ring_size = 4096,
> -			.rxdma_monitor_dst_ring_size = 8092,
> +			.rxdma_monitor_dst_ring_size = 8192,
>   			.num_pool_tx_desc = 32768,
>   			.rx_desc_count = 12288,
>   		},
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

