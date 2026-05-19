Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0451CD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUYrIrQZ26u2sDJnVp8nlyt3Y89Q1ocf3D+sqdUX+3o=; b=sleEdAWuwWL78+gTpY6GvmT7tF
	+8jd+vwmrc4xJwZxPAxo3msK3H874USUyUbQOLbPLI64Rmul5CFsMrFwO+389eCENCjMn02VRB0C9
	NdFqi/G6SHsyo6CgvIHPdXQeySPQ793vBsnmreqKTrsgJwb89xGL0D6M78PW5ChzgofxlXkujiiuv
	EcYrEwk2JQKbGkuVt5q+IVgS7mcyh/SIDsPIjKJOAvME/2TFabxlDfd2DUjUw1hLWE26b/OMxot/Y
	l9si4xQLKMWedWjVNS6GpBy9Yh+ys8dBr7tBU0jztIJOvSq8usMdFNOUBwWg0tDu4oejmFf//woim
	ixc2ufmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9A4-0000000HLwp-1aU4;
	Tue, 19 May 2026 01:22:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9A1-0000000HLvY-1fCB
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:22:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J00Jp3353033
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUYrIrQZ26u2sDJnVp8nlyt3Y89Q1ocf3D+sqdUX+3o=; b=o3DAl7RntEwSSlD7
	UHOQJ2VDjCbd6nPjiJHQRMOz0BM9sz+9taNF0BCRaqFMxxZ1QBmcbimx1uvd5y4r
	UTE9FC+sFw1h3BkJch+Rz0r9AeQHW4pWfY0BZGzjVAZ4n6RRC+ifCdaZbuZoo8NQ
	/eiPRYK4dab1XPp+wqEXIk7F2D5sYlL32IBV89/KWExKV6v6jMNTPJcUqRDMWDIc
	e0QQ1qRpym0Rko2zdiF9hLByLzSBwz0nE5MC7lzHLK2c3TWfz64+4WJzb1HEprmU
	Fz6Ny8SJRCY8vTZvpyOBHRDSOo6jtOPaZ8kNnB0R14zpGxWO0eHAIsnJC1aay42D
	YN72zA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjakq3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:22:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so5796814eec.1
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779153735; x=1779758535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUYrIrQZ26u2sDJnVp8nlyt3Y89Q1ocf3D+sqdUX+3o=;
        b=X7fe01IvoUFOGB7HgNjYFc6OZ/UteKjU//2NdWlibr2TiJETDHDG3ucq4cFcoEoJDQ
         dzk//deDY3v0ysNpw8nAeS/B+ik1Pf/S0Eb+kD9I/WU8NxmLDqXIHyik9jIcMzvQSueP
         6WkgIZdeqDuBpFzGOPtCazhdJ5VFHpDY4g1Rc+BYM6ooeuGSdc3+zta6BehreeqW+P+b
         uwaorEDW32hQljynt3QxN/66lAhRgBi0SGob4qgIxcHflJLyAuyXprmhOoNbXu01Jxh/
         VG9Uvk7CHVP8KBOuEjZS2kJry1pRfLEX6nKVMEujB6YUXw8/Lp17XMug1bmYJ0fdt+ZY
         jeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153735; x=1779758535;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUYrIrQZ26u2sDJnVp8nlyt3Y89Q1ocf3D+sqdUX+3o=;
        b=WbKOx7W1CgcytO26fDr2Ib/ArYeghiU6BJtLOBPFEn/P19u3zLUehHk+8bKqeONqpA
         h3/gJ69nk2AXZPr8+NnAClr16QjJKyyovImqkTJpWpd+l8qK1+9kOjGXIo/wWHurt+mU
         Y4kkQIhvDnqEAuiJ70MnnC9ibZCE7HmZgNE+8lrIlbac7WTrVxFigIXK83MgHOmoKH4a
         XMI+2JyZrUDczcMhl4CgD5YICe52eXLHIt8HkdYFbksbuqn7Q6jhDtiDtlnZggVEM/t1
         yQAg+eGKJwdBG1hGsGaGyedzOz45b9W3Fg5WpiXQ7HAN5AaMMwLRS4ZV+YoQ4s2KC1wH
         xajw==
X-Forwarded-Encrypted: i=1; AFNElJ9eo95e6X6g1XmwDwDGMP4leqKIL1Vkfa0LxRTv7oYI1e3g0MUXGD0blHgaGZebirIGcbmKQFI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgw0Z/orGNOo80eRavjHmMk72dd1BFnRsSNJQNgZF9O+WZykX
	U0X6pUpLsK+/25uxTFhWSPGh58GLCW/ON3SBnyra68J8j1ezVvo9xBIx6txI0Sw9Z3jwZ+XVz81
	02o/xUZZmfEJfakMxcn0X0MEythwne4OPdMS1GiUu7veqq8VgFY2Z1lpemfbgmm4r
X-Gm-Gg: Acq92OFYCaRu/Ubghn1vzZJoykiY5eEEy48eJNn8VJQkUL0hPFg3XMIRGNfuS8j81Yy
	+DHvxDgkeiO2+d3KuAwD1UhGSjH/cU4LylnKjrosgckNIkx6x1/GOrHOlAZO04mqMBWO7TZxUrF
	Be3Vg1OKlZh3vaFkwJPQDhjncr+kfBYFi+Q7Cdr+5nHWVX8/plfJq4nhFhwEA/KszqhcGOxTqKs
	6HHxkkXIoKOafX+559YHCSLnZlkY0lfydeuvZ/dnFwjt3G/7FWcD7YlmjD6Kug/AMv9SnlqckzU
	5OBGnHAxZ+UDOErOM7Y/YyT+WVGIRzYWR8pBncnDzauzl/ExZxeQ8lTAFhviaTJOkg6T7xmMz79
	aRWYvUos36wfiTUtMlZQoNeuqklQbvKt9wQ3k2Gxv7AQkuxNpGyRGUotWIKU5RhCfm0RPQyp5DP
	kl96w=
X-Received: by 2002:a05:7300:d70e:b0:2da:2ec2:64e5 with SMTP id 5a478bee46e88-303986771a4mr7267533eec.18.1779153735177;
        Mon, 18 May 2026 18:22:15 -0700 (PDT)
X-Received: by 2002:a05:7300:d70e:b0:2da:2ec2:64e5 with SMTP id 5a478bee46e88-303986771a4mr7267520eec.18.1779153734616;
        Mon, 18 May 2026 18:22:14 -0700 (PDT)
Received: from [10.110.41.137] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e6a9sm14910656eec.2.2026.05.18.18.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 18:22:14 -0700 (PDT)
Message-ID: <6d7f958b-90e6-4e87-89b1-3cb87cef2c34@oss.qualcomm.com>
Date: Tue, 19 May 2026 09:22:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] genirq/ath12k: fallback to threaded NAPI when IRQ
 affinity is unavailable
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
Content-Language: en-GB
In-Reply-To: <20260519010758.712297-1-hangtian@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxMCBTYWx0ZWRfX6s72EHfNH+A0
 ocpkEeHnbQcjqAWWmeL59JO45C0XdJgnisSG7JilaZjjujZjheLf4eX45jsKNU6f3kV8qa8E8kB
 bbClieKtF3HwQu1jFq5RzMi+/XAbjXSg69XbKMQUggVD51sNeCCe1kTSbq1K7Xr2zEe0+rHR+EC
 7Yk7PEtM6//aiiaXAv4qBGzRI4gGeK74w0CKJZoeOJWrqNQ9HpYYI7lMk5Tng2tXGHYV5UnHARl
 6/I7TUL4PuMzBFRJO/viPKgJW4qxmDlEd1uVHDg6v/KD/uScEEjyXamu+UK7dn4hLiOIeEVNqMm
 33X+cEY/jx19Grm0FUPxss8Q4IvQNpQJOnIrxKbUEBdwxmq3gAUXZ+wQleIYHlS5Gg1dA2Yf8pn
 5AUL0rKxNbOo6L5JQ24XPcAI0XKjqrWGa9mBa/OkPE4wpkovpPU7/5RzUsXnxEAZxpQWinwuReR
 6VIf0G/jNFAjQEI7Agg==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0bbb48 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=saHGBBN5nZt_bAPv2P8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: b9hR333oRXZUwGG4O2hcEQh35tjVeLKp
X-Proofpoint-GUID: b9hR333oRXZUwGG4O2hcEQh35tjVeLKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_182217_572433_E8B3ADD5 
X-CRM114-Status: GOOD (  15.52  )
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



On 5/19/2026 9:07, Hangtian Zhu wrote:
> From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
>
> This series improves ath12k datapath behavior on platforms where the
> effective IRQ path for WLAN MSI interrupts does not support affinity
> setting.
>
> In such setups, DP processing cannot be distributed as intended and can
> become CPU-constrained. The ath12k change switches to threaded NAPI when
> runtime IRQ capability indicates affinity is unavailable.
>
> Patch 1 exports irq_can_set_affinity() for module drivers so they can
> reuse the IRQ core helper instead of open-coding equivalent checks.
>
> Patch 2 uses irq_can_set_affinity() in ath12k PCI to enable threaded NAPI
> for DP interrupt groups only when affinity cannot be set.
>
> On RB3Gen2 with QCC2072, EHT160 UDP downlink throughput improved from
> 802 Mbps to 2.58 Gbps after enabling threaded NAPI.
>
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
>
> Thanks,
> Hangtian Zhu
> ---
> v2: sanity check irq >=0 before irq_can_set_affinity in patch 2
> v1: initial post
>
> Hangtian Zhu (2):
>    genirq: export irq_can_set_affinity() for module drivers
>    wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable
>
>   drivers/net/wireless/ath/ath12k/pci.c | 11 ++++++++++-
>   kernel/irq/manage.c                   |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
>
> base-commit: e12d2d3983acb150fd987d19ec6a2a530da110df
ignore this series as wrong patch version, resend with "[RESEND PATCH 
0/2] genirq/ath12k: fallback to threaded NAPI when IRQ affinity is 
unavailable"

