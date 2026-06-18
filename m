Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF493CD98E2
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5TBI6ak+oywb6BiRNHaDdbfK/WnYTojRZjnp2HlJgM=; b=U6ixFc5n/GPZQXV/GILrjs5L5g
	m1pSjmDL5Zz3rEQpczbHDtfnThfcrzCZzChKEEiEU+OSpiguH2kpvtcBVy4Nhhof/WlfkzjZqRV1d
	fKsRLsW2cADcE2vFNwfEd4wOw8IzF0s8Xnt2ZbbAofBWrkNWE0O81m+4r5MoIh0xR4+G8F1i9xdMU
	PJSvn8hnv0ivPNcP4E/xWZhxwx65qe4U7yQ65EtnDmSXUcJRpNZOFUPOUcRrBPs0XDV2oe39TRp+p
	R0uPQsIDdp8T8jtsfE52c8BvkF5hdHHVHRfEXRe7XnEexw7yHdlYWgTaWuJv3iffNutB4lQLX9+vJ
	X/H4Aipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8ym-00000000wRI-1dPJ;
	Thu, 18 Jun 2026 09:24:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8yj-00000000wQs-12BG
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 09:24:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FR5Y975753
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5TBI6ak+oywb6BiRNHaDdbfK/WnYTojRZjnp2HlJgM=; b=Lc+ma48+uSJn5W5P
	cu6c6JNW9PH+hwFz1tM9byXBKkY6Y+qInaA6FP7b5xzOos+5NDWKyfJ+/HNdG5TQ
	5VS20nVTM87HFhwj3j03EOWt3XIFYEUlzyVr4ddAM4NaJtx/HEsawk+GLer+rXuE
	iV+LalvCWAI686otTiS7PKf2C896IeIkRZ7cvKcNkKtLC+4w/JTYmrqwd7CcoNx6
	wv9GV1n5SOY7Wgik+zOUauaI3IE0ctS995Yg42MaoZ+0Hv/rjwP4XTDkA9zSm6Yc
	sqR+PYba4JBvrG8bk3hEOD+UfAzSyV6ypp4pU/b5Xlhhcw+KAkBhVpy+DwTdgG2m
	pK7xIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2hde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 09:24:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8969083f23so423584a12.1
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774643; x=1782379443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5TBI6ak+oywb6BiRNHaDdbfK/WnYTojRZjnp2HlJgM=;
        b=VE7+fD4Ceq12d7f3OuJyWLB9DBQqOTs8VDfrWZfzhTl7obK/pn7EjCnguypLWARD1G
         4Oo0TNCZbVdzpFjbflTo+FOXGsZeoKYMbNA3K1QdGFSLcwgN9Ml8rUWd8t6h+hvpACfN
         roSvoO+4eM4I+GI7snpeDGQ1FS8qgWnVt5KhREXrJeNE02nrGNj6mvn5qmIFv/E6J4/O
         N/l7+WdE0z/Tp3qb5LgNt2IqjMdLdfJ2RmDg0W1YI5pfnpwPi95+KKgebcaSuR0qfmLW
         1E8JTm6YJuzE7Q0jrf6LZ+MSeN0/S4fnpAhurQWeeI/9hzDhHKE67lWaJKWeTUDH/7cV
         KDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774643; x=1782379443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5TBI6ak+oywb6BiRNHaDdbfK/WnYTojRZjnp2HlJgM=;
        b=pBg4iwWAIlLHsod/xKiwlc+IfIj/WOnYcUHymdZF30PMoFQGYtiDzN658csmltIQRE
         x8vWvKgyMJjZJE0dIzQva/MaHzjJ5Q04VGiMihJNmPBSRCK4ZGFLtLq9t4MdeKeqDTsK
         GJqg6G2cO6W9LiI8lAQg1EzOP7clJjRxCSSEHL3gKmQKIJK90qtV0GoBex+oq2ONeEj0
         cuqMqTS/f4wxwWexMaOJZAE/8rkXCjxIiBNwRTvxBL7H5mky2xvYDtv66yA3TdF8Ff/U
         /k0F3hC1tGLcNY5VWpwNCKRQh7B3TucHwIdb+gHWnnFEPIvsL1wzVgYIDcns2qNUF2W5
         4+xA==
X-Gm-Message-State: AOJu0YyA5Tm4TG3nXRbzKMk0egKOn1bnwi3ndBXNYeshZcuSLpkh7MXz
	2NoLizLEBTm81WQSuTQBiT2kWsQJbovfXnr6GTJx/yEMwkp23iUY0iCXAD1bWUdeEACgA2bwV4v
	aA/uck8gopBeCTpNAEm1vjz5U2yMdJUekFo4kN7fbIfA4nVrIQSZBPW1Yf9oManbh
X-Gm-Gg: Acq92OFZE9RnXcf4Y1PFWYN/92AKP6EEMOHs0HnOI77OYamhWhoae2Lko2Zt5Q/HuKM
	xZZWHqAWG0v3eiDVjuNJ/6I3ki8MZlVxbLlIM0ibP0bLOIBBsHkbs9eki0rffLQtcEpvhj7Mv2I
	cBKAiAXHDFPjz1cENYpzEOxLX2Y9rkj9Qnyj9TkWcINHIB6VfcKw4rAGbpWLOKPWuouMZo1wDQC
	jH9Y9hFtSXR1JNktbDdoi0sIBlQM4wKEE7G/yJ8A7XFrmYpmQPly79OqdvFH79BEGX6xlbRfvfJ
	v830optQSipQhFc+IJ3AzslwJJ+dCzKYBD6SLeXUa+lL6on2QWOGJG528G5d9nfhV5sBrfm3oLj
	//SCjye/jqc3XjEVJXU9aqqbM2mJRhaEujR0qMTG7rk1+csUXn5W4P3WNeBg=
X-Received: by 2002:a05:6a20:1581:b0:3b4:6dee:a427 with SMTP id adf61e73a8af0-3b9e8965e90mr3929890637.44.1781774643163;
        Thu, 18 Jun 2026 02:24:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:1581:b0:3b4:6dee:a427 with SMTP id adf61e73a8af0-3b9e8965e90mr3929849637.44.1781774642710;
        Thu, 18 Jun 2026 02:24:02 -0700 (PDT)
Received: from [10.137.71.130] ([106.197.93.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm15446851a12.31.2026.06.18.02.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:24:02 -0700 (PDT)
Message-ID: <c6f69f67-5dd8-43be-8419-50d69b12a80b@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:53:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/5] wifi: ath12k: fix dp_mon RX parsing for
 32-bit TLV
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33b934 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=wlpA7Av3g41Jdys7FXR3eg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lYQuDnyKufBgxpUz7bMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: OJFCUC0kw2Y66KyU12ZiWcxjcIjmxZLo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX3qabXDu5CZPz
 +UyaYlyNPF1WHi/FNV2O4EQc0Q13wnB43M6bedT6yPSB70k16OnZKGhXy8nSj33mnwgjpBxQaOy
 2fiQgzM4IAB0D58ehAxmbET3JE6ael4=
X-Proofpoint-ORIG-GUID: OJFCUC0kw2Y66KyU12ZiWcxjcIjmxZLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX5nPbni9v5OxQ
 ac0q6C4ziGZuRk2Bas7fSr0OY1mTWvM8D2+gm/esfW8UTkwwSdcozlBC/RFpYYU2LahbYWDmJnb
 Ug9FU9/AP5yhUDXWPPgPHUSjw3ZRUkq1YDE2gyUVrbH64sseBP8oqAI43+6e15AhU8Bnkwf3xMn
 J2SZFC0iGsX1ojodiMRD4hkcBh1wXKOgFqFCHiIsmCkXqXiVS5ceWThyisUd9tNgrq8eA3fJDUm
 Cf+h0pQAaK1wHjorDDdRqhik94fN8covW4NCNd52ExnM8oiBU6XF90XCEvpAW2eFNR5DUrLUNuK
 c00yc4lbaIwiNGmr9BwmHeR0cec7UWr3T0rVkSyWwjBTXXmIb/FP/DBt8/tNqUMbqy+u9dF7rC+
 j2rhessFkklQfFFGPGJYk4gr2umBM/5Xc37Lzo4V9hSGoGqp/XgrLBXG+ZGzlNvPNtBpsdoCQfD
 F9rLIgIdYFlp665MLeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022405_408971_0A5CF7C1 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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



On 5/9/2026 8:28 AM, Miaoqing Pan wrote:
> This series fixes RX monitor status parsing issues on platforms using
> 32-bit TLV headers (e.g. QCC2072), and tightens TLV decoding robustness
> in ath12k datapath monitor handling.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
> 
> Miaoqing Pan (5):
>    wifi: ath12k: fix TLV32 length mask
>    wifi: ath12k: refactor HAL TLV32/64 decode helpers
>    wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
>    wifi: ath12k: add dp_mon support 32-bit TLV headers
>    wifi: ath12k: tighten RX monitor TLV bounds check
> 
>   drivers/net/wireless/ath/ath12k/hal.c         | 42 +++++++++----
>   drivers/net/wireless/ath/ath12k/hal.h         | 13 ++--
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 59 ++++++++++---------
>   .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  4 +-
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   | 13 +++-
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   | 13 +++-
>   6 files changed, 94 insertions(+), 50 deletions(-)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

