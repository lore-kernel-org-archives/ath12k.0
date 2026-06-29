Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B85C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM8lP8cbt6M1lCvcZau12YSvlKEd24uCMkhWjkkX3l4=; b=mUcH+vIrXvlekwEQJQmax81KRu
	vSRO0fF1/luyIPsVBLsEkBb6CluEs5P7n79BBz6dKXUDyL1x4GFQTjK/UVQYeZZVW6eqT/jTMrEqp
	wfB3maT+dI+RDvbMfe2J1eEkmCzpatMk7eCx8Twqy2NALAvWGXUXtULSpe+skhxOtufXFhngUsRhN
	ti8JFN+DuH9wAXxjcBduHwn2/oHD0OzFjS4nNjZJbZE+jqtgZ08Gj1D825QfvbWZQydY0CznsOyaS
	6t/RMe6eJavUn6bBACl3JhtlCnO4ZHciK/1dxTWVBmHU9zY4gt5//J/tyc9geLBTVNrqt5RS2EawN
	iU7h5C7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5cl-0000000Dlhp-1kpR;
	Mon, 29 Jun 2026 06:37:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5cj-0000000DlWj-0j1d
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 06:37:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIKL1737524
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HM8lP8cbt6M1lCvcZau12YSvlKEd24uCMkhWjkkX3l4=; b=J98OyT5C8ZOPMBDy
	y2Ev4mX505ZUot/zWoWdOoi3fn1uQqOZQXpw88o3wlDf2WRf5qWG3G0/l+6/dD10
	nFQ4YAJCBKQVqrsBwMnZjCNDclYa8VEwtm/L9byu659LlfE2x8Qepki4niVv7KO3
	UdhrNsLLqp0eLfZaZ3kacc2Mw4Ny0x0kcbm9px5OkitNVR2ud1cesKX7csw3FVs8
	y/tOx65AvDRJWEc2ldAovJdDktKWqG9NUbMh6q7fqtePDDMw+lbIhFGfta8ih/8K
	dDkMY+Vzdcc2hcGWThpZehSIZS7PrwP6eFmTMYOL8IC319fzabaC5Hw5GvgLbdXv
	m8EAgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmv7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:36:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845c733743eso2154741b3a.3
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782714993; x=1783319793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM8lP8cbt6M1lCvcZau12YSvlKEd24uCMkhWjkkX3l4=;
        b=gngUHntK8HC6E698CWMn1kEKnZjhBaAufzchqNZC73A8JAxSCuFl5cflSLuwvAfwmV
         QiHQ8ArMwnJ2RHGh4fUtCS0yM5s1xVOabae7mbkfsD2nHi1d6ds/j/+Q0Gmebo0FVYkP
         osFVAXtgHc3N79czd3M/I5ZrgulG6VQJ9aem9YCEjvuwDP7eXqQ29pHIbwsppKAPJ0kv
         gJlwdI87lfrDW+LoQx61dF63WubyJ82I06zst3vsIVh8pCvtavA16/IX7R8Fhw4e62rf
         QSpLfzBhFX251qdzVvc0NUZ3TiB1xIEZWzCDqiJcXInkZyYmfzNoBwe4wBSg1xZ3LFKK
         oPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782714993; x=1783319793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HM8lP8cbt6M1lCvcZau12YSvlKEd24uCMkhWjkkX3l4=;
        b=Te/Ps+4GLPRdYUisa2jin1vQu2l2G0KR5YUnfIjtGQ3HbjRwOtgxiKw8863W1nFZ2o
         GBwKtbMJXM/Kue8+0tdVMvG8WtHSCmS90veZfGV5lLoLuRxinKohlGmPfr2LlNaKYpa5
         W3kh9pBj22vIJSlnQFf2yFPCXxqFKS94JPtLWtFPuePoFEA9BdruD+tuJvt3J0jITygx
         fd4s6FNHFBLzUie+RDHEiHaTFgiyNyRzENkKJIMzbd5NFluNVBBxu+zHpYgZEVfPLH3k
         atl0z/8Jpvy2bXYGssNNPJrJetB9HDGKys8Y3RAOhqh2qryqrA7XOcRL5g4VvNCvRbhZ
         toeA==
X-Forwarded-Encrypted: i=1; AHgh+RpHdgDVdB77RJxWQpL5jXhNM9ENNFny+/3JdEZZW55XCrewLrYiUtf1nB2o4AthqctkQjutD1c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEIIl3eDyc1O8AJtvji5EHjyuG6xWFt8pNmvTuO49gMZZvqqF/
	hSSTNCdZxMQsrpXHlqWPHWkmo7CWEywAGvCNfmlDKwqEzTV3RPPBRIBL5HpgG05Dt6SsczATfxK
	VbpW9pv+7t6Lad2auTeIq4+gqNbYrhCTVfCpF+C0UYBp62U5YavzjNXhcFDhZHTqZ24BIZI6j
X-Gm-Gg: AfdE7cnTFWy0eC8POP2y1GXqJJm7QEt0r6o/x0k/TI8qUHyZB3YOC8cA/CMGBZRw2vI
	X/PQCuFq9acgc7wr0WJVd5xrcn8qkwMKiB9c/ZNKkSg9ULhuAEwsKwXt0anaA87hPwtNl1ZZD/T
	IPDza7Qs48BlkAasQ5f492P4cQRBF+CvAumvzYKwtn2YfO/SVkrZaPo2/iJwEf663qkCZsyc79a
	U4qs4C/FXUDDtxQLlJliF557jqxXWgJf4PZ08XNIDgk6IagTvxHuW/UqjitEcJrFozDxKDfIt/i
	sU5M6xvzLp+v/nlWk+8YBwPl8sF/TdZn1ba7roB5d8CFsd95Z0l7iKYh1wf5LxWbsLbP4+WlTgT
	W8QR3VBrDBrcOGdNR2pmhuJT682ACxYl96lkeVuU=
X-Received: by 2002:a05:6a00:2291:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-845eb8863d4mr4183885b3a.29.1782714993433;
        Sun, 28 Jun 2026 23:36:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:2291:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-845eb8863d4mr4183861b3a.29.1782714992971;
        Sun, 28 Jun 2026 23:36:32 -0700 (PDT)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847849c842bsm1244667b3a.33.2026.06.28.23.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:36:32 -0700 (PDT)
Message-ID: <07dfdba3-d769-4102-a19f-55086a19cd30@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:06:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Improve dp stats
To: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a421273 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=w1hz04t2yJB1brSwPtAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NCBTYWx0ZWRfX0EoWaTCawHg8
 XgJFQRLrSkFWW3PvTj6HksE6WsZlhMUPOpIuQYfL7VNKdWkI22cMdf91R6wI6HikI6aaDgFeVPF
 07ypwGpIc1qx/SZ2uQLSWfYQm1m59Po=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NCBTYWx0ZWRfX9UH7muV1CCpp
 qwj14Y1Elky8EI23ENNVXNN6Gy9uPTwZx1duMfZ4c/Wf3UMK4AstkOp/q6EZ+5Tk1eN1cLfSrRs
 dgrrH7byq+RldwftqGqwXMe5CWIAa0Tfey/9sVF7/wDemqFT8MgQxgzwWL9j00SRKWOPZBZyXk1
 saUHYU3olQWa2fL23dGkrIpgWsxFIw3NxLWrfH3jnAqiMb+ICTtJqfWaymCkwc0jzZowv7l/tX2
 iUj9bl0IlAEXLARDLtRMnFSelAnH/4xOPuk2Gh3rqb16Ksr2Dx4JSctdwgL6LQX2YC691WgZ4Ch
 16iVn7K7v5GjycFztjJdtdulYtqU1tw3YreFbc8M5P/T6nZW1ZB0MQbPBr4PGy0m9NntE2K/AvW
 5QGHFN0QeUuYsbMucwkkEkhMNSieqcgU/4g28EO4GTaXL6Lmzg7jvSRVG/4Y6trZ97hb0nPydEG
 9h0/VrNOMViGZBaD6vA==
X-Proofpoint-GUID: aOS1QYjtMHBFuKQekCncaCJ8yN0OIoui
X-Proofpoint-ORIG-GUID: aOS1QYjtMHBFuKQekCncaCJ8yN0OIoui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_233741_234592_8F98F908 
X-CRM114-Status: GOOD (  16.61  )
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



On 6/26/2026 2:22 PM, Sreeramya Soratkal wrote:
> This short series improves the device_dp_stats debugfs interface in
> ath12k to produce more useful and accurate diagnostic output in MLO
> configurations.
> 
> Patch 1 fixes a latent correctness issue where the REO Rx and WBM
> release error tables were unconditionally printed for
> ATH12K_MAX_DEVICES columns showing zero-filled entries for device
> slots that have no hardware. Replacing the compile-time constant
> with the runtime device count keeps the output compact and correct.
> 
> Patch 2 prepends a ktime-based millisecond timestamp to the top of
> the dump. In MLO setups the per-device file is to be read
> independently for each ath12k instance, so without a common timestamp
> it is difficult to verify whether two snapshots are contemporaneous,
> making cross-device counter comparisons unreliable.
> 
> Patch 3 extends the existing per-radio section to report the center
> frequency on which each radio is currently operating.  This allows
> the reader to correlate throughput and error counters with the channel
> without having to cross-reference iw/nl80211 output separately.
> 
> ---
> Changes in v2:
> - Rebased the patch series on the latest tip of ath-next
> ---
> 
> Sreeramya Soratkal (3):
>    wifi: ath12k: Use runtime device count in dp stats display
>    wifi: ath12k: Add timestamp to dp stats display
>    wifi: ath12k: Show per-radio center freq in dp stats
> 
>   drivers/net/wireless/ath/ath12k/debugfs.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba

Reviewed-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>


