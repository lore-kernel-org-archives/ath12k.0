Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A63CC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7s+FWz2YK/JFLm10dvgPWqrRER52k+FY3kHb80jN8uY=; b=Nt/7IIWh0N8ENXIqdad6OQ7iwg
	aVS/rivbOkqAHLku60MZwcMghX+ZUMTRu3BGKc2uFPKd36HX6CF2ojuIICr1lqHDrIbmi9tRhe6zw
	me4tohyDiX4hYkhJQH/H4II6zvnd5zpanGzVV1BaXHWn4/eK5dFGo5LJEGKomrjqSCATNOYUOli6Q
	3jrrJhljHBnMALXRIXQooe0T021wdfAd042GP5u+BNhxSpTFgPzeqaeXY6nvqkQ+hAatT1zqG4sh2
	WbYRRE2kA+y+rs2KQzkjESxsrfMc7H7bWkdGD5tqcfJg9xq4P27ZsebeBjjkcGkVWPip0BUqBWa75
	ITT9BWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5WD-0000000DlHs-14tS;
	Mon, 29 Jun 2026 06:30:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5WA-0000000DlHR-1Xan
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 06:30:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHHV1737513
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7s+FWz2YK/JFLm10dvgPWqrRER52k+FY3kHb80jN8uY=; b=KDwSB9LTZm2rajdA
	JN8r70i24O5IHE6KZUwQrHYLizm/vnz5tHIkwbO+2ZBdsarFWqWmeUr0RQFPiwXl
	lQqTHE8yWKraIXcK6P9NuY8ZtvF8fwKrBHXgvz+5zE7ucNpIBBO3E0R2aEbTR2it
	IOw6ONWeVeDJpzk3tRxAMRPHoFlCXrESdKdSbiLZ/B0Hj05nDf45/6rQhcI0RtFR
	ei/zViVa8do3rldy5sbvf7sNjxN4yN5RBvXsXMCVIFjpGD2ecx6la5GENFf7yhZv
	I36hu0dK8+Ng2SdlwN4UoZsH2/8Kh3JElSY+kRY5Hhwdr8R/D0n3OllYrgHLPsmh
	zMe1vw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmu73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:30:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso9027957c88.0
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782714653; x=1783319453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7s+FWz2YK/JFLm10dvgPWqrRER52k+FY3kHb80jN8uY=;
        b=Zaeqh3SMUbEQin8JGMC8a4TUP7P40UQoDEwZJIHE/CZ4QSclLckhDZTxLVRM7iMSmN
         TpDzn+pE2mpNPGEU5bKqjRDW7bcLBrCnM6+hKJWPnPdKhW8fsWsH6lAtivrl9+dx9suh
         HzdugQf9fnHkEcLVibkftWBsyoeI+rM0VwIyichazEhmN/nOSh2v2jo5/1pCphJ18zE5
         U3TlI81hMvCwJtCPEczDHiyKyP8D7G0FxzmsUjgv9UQguLA3ZspQWDoykSGeTaNdtyJ/
         lHyCE8XyumpAFAW1+6Sd6WogG1Mj9dfahESjPWSPPQvz+k/MPWz69Nhkc8gfLKqwYlD/
         5GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782714653; x=1783319453;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s+FWz2YK/JFLm10dvgPWqrRER52k+FY3kHb80jN8uY=;
        b=pLvUyE/bEZ1DwxrqwfSRMjeBDDm21u/N526cGnkDPQaNypaIHEqSpM5nX9jioB+xLz
         hfTWtT/d08Y07punp7Rt4p+yPfFcgejkaGlCTu/OyvXKbQpfmlg0GmD5FN8YJh43XvkO
         3S0GklPjiHmT7s2aO89B1mNDxOcUZn3VJlSKjOI6BZ32LNTdPO+qmr3iXwp1xA7HMMpq
         09PUNLPspZ2pbO8+psKkgMM5kn9pd95+qprjrQvVltLtQz6zx/zPr/plNdZ86TtRTPqx
         OBwiTQTz2or5b9r5TxFq8if1ZmPCKU+y17aMO3hx8OxMQ+coII7tXpfE9TjV+48c6mBh
         lFIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EKw6ziiQYeFJQmYrN6eil4HsH/4mxjNW6l/+6Ds9Tb2eRkE4ueYa1x5hI9uVszqwsX5DwVMM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjXz0Kz4wDoAcE39HRpeOByBCRsxABhI0TlN8ErB1ZwdxDYoFJ
	cNfHbE+Xt/HVk2r4zL5jwH4WCOPVjjApJC4pboEfZn3kFvj/Rftka7leDsKDAs+8mPIiyEcqSwi
	qjM5hGLIE4wcoKBZc/2C76rRfnyD+lWTNm9SYrI4J28frD6hAZyCZKlpJLzZL9R1sej3r3G4E
X-Gm-Gg: AfdE7cnb8egfXDbiRILhzVnSmSsIBaXBS1UxwBOkCbg0NHX+cSPHOqIshQ8tnvS+r0C
	mW7rpm0p5s+KqYi1GjiSEFogRrgeHPlV3Rt8kER45b98afsqUz4Zfobacn/WcUkRqEIDpxY40dA
	X4cHPpxM35eN2jVcCO7KiJOFPzGQk+Rdt7gWxWDOnsL5mtnN94s/nJQyr7ST1cLwCL0IdUIFDEQ
	TZi2M+4Rk2/5xZeAW7OVzRfR7EPVfTZPgQjcDKcCofD4A0ngwo8qVYW+pSW+AiXSmSvUrvO6paw
	M+rBL8Vz7m4xLzYWUzc8YxHK/nqmyF4HfIeOj8DwE/deeJ0zJCI9XF6aJfGk7fzddz4Wmmax7db
	t3Hke4g3NsvrTRJZOuCHMCzn5zgn/+uUmU9AaG7ZSGtgquMgmQdY=
X-Received: by 2002:a05:7023:a86:b0:139:ed5d:3b5 with SMTP id a92af1059eb24-139ed5d0577mr6889817c88.46.1782714652635;
        Sun, 28 Jun 2026 23:30:52 -0700 (PDT)
X-Received: by 2002:a05:7023:a86:b0:139:ed5d:3b5 with SMTP id a92af1059eb24-139ed5d0577mr6889791c88.46.1782714652036;
        Sun, 28 Jun 2026 23:30:52 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fc2ebcc0sm9925728c88.14.2026.06.28.23.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:30:51 -0700 (PDT)
Message-ID: <4c76c950-46ab-43b6-9189-e3ba87729cc0@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:00:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Fix memory allocation and
 improve reserved memory handling
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a42111d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=l9q_n_bfIkH6dLceHHAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1MyBTYWx0ZWRfX5Dmuw6HdA2N7
 4zMLG+pC+8DzzxCoDwmMWzOt7FBxF3Wh+FcR6xtY6GElE8u6KQZFSgHIndaMFHL0FXPsD6lA/Jn
 Q92/Zl1U2GZW+Uqp88LIc4C3WiHDg/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1MyBTYWx0ZWRfX9Bz6G8BTsGn2
 2qg5QiYGCWaK/l0YxzQ3kmphpM1UxuV7YMTSduN2j2CEtgWrvJfXBOFoxZyB2+SHlIuaHO7v3rp
 1QaiaqB7zFboVChcb0af+CflX/TPTuQITxLJKhRE5F0ARSLiiQrIHvMQcETl4yISb/8H+3zigkj
 e6us1dfLQYfHbqJsPVMwr/p/mQaBvXfjpEDmAKo0lXJQKk/pDzuFBtZWVmXCNpDr3SOz4nAE1cp
 +T4BW9bQgcvmPhpgMxOc5QRg+IzeNW7vNTIhoUfZkQY/r3Oj2dwSdC9VVeguSyqs2+8BECcPXYC
 EWxHB3taQqXUBM0hUd4kryj9H5WkNxOo/pwxsPampMQs7Yigk6vK9Xu9VyjArFjK+EyoQGWLm9K
 /y2L2PFgiG8LA879rhgOx90jGYjbLpusuXCaMB1LDqXVfOMiik+gjkwqiqV8cCiRsHZIur8Th0o
 oB3xZoWDqL+4QV75j8g==
X-Proofpoint-GUID: R7pWcJkn2g8Elshukk_mCPJuMSWKeHxi
X-Proofpoint-ORIG-GUID: R7pWcJkn2g8Elshukk_mCPJuMSWKeHxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_233054_422289_A2CBDBE3 
X-CRM114-Status: GOOD (  14.53  )
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

On 6/11/2026 9:03 AM, Aaradhana Sahu wrote:
> The current implementation relies on index-based device tree reserved
> memory lookup. Different platform variants define reserved memory
> regions in different orders and combinations, making the index-based
> lookup fragile across platforms.
> 
> Currently, the driver allocates the HOST_DDR_REGION_TYPE
> starting from the base of the Q6 region, which overlaps the Q6 read-only
> firmware section. This causes firmware assertions during QMI memory
> allocation, as the firmware expects writable regions to be placed after the
> read-only section.
> 
> Address these issues by:
> - switching to name-based reserved memory lookup to remove dependency on
>    device tree node ordering,
> - refactoring QMI memory assignment logic to reduce code duplication and
>    improve maintainability,
> - placing HOST_DDR and BDF regions after the Q6 read-only firmware section
>    using the bdf_addr_offset parameter.
> 
> This series ensure correct reserved memory handling across different
> platform variants, prevent overlapping memory allocations, and maintain
> backward compatibility by reusing existing reserved memory region names
> defined in device tree bindings.
> 
> Overview:
>    - Patch [1/3] switches to name-based reserved memory lookup for platform
>      compatibility.
>    - Patch [2/3] refactors QMI memory assignment to eliminate code
>      duplication.
>    - Patch [3/3] fixes memory allocation to place HOST_DDR and BDF regions
>      after Q6 read-only section.
> 
> Aaradhana Sahu (3):
>    wifi: ath12k: switch to name-based reserved memory lookup
>    wifi: ath12k: refactor QMI memory assignment
>    wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
> 
>   drivers/net/wireless/ath/ath12k/ahb.c  |  18 +--
>   drivers/net/wireless/ath/ath12k/core.c |  25 ----
>   drivers/net/wireless/ath/ath12k/core.h |   2 -
>   drivers/net/wireless/ath/ath12k/qmi.c  | 168 ++++++++++---------------
>   4 files changed, 78 insertions(+), 135 deletions(-)
> 
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

