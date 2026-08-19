Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EEFC5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Up1DH71ObPvN6KNXio6TFpjBxIEqcMT3urllRxgcTi4=; b=h9r60pkz7luO/mLx7AGCjW1v78
	ullrtDX6R3sXiGvi+Ak1gTvAN9Qt9BKNdejXafu2ltbsE7F14ZDqURzI1c31SfwOY9kkqpeX3y3Ny
	cwqwwH8SyfJMLcgdDigu91fxXAGJ3AukrE/irqWmy5oFkLDMnaPzHoU6YWK7zhcZcdyvBd0ktyScl
	QLPEMgL+OTdYRmoZzk+xHhV1q0PTGaL5fOXIIda1LzwXDDcqfOpVOpZQGS473407kXTWMxHCOTkeM
	hHRqLU3yMoU7zKUVwCmbN5b6f2CqgAPyUMNaeEOw++4iC+E0K7xB4gJnd0Cn9THQP+dZZoN/pc8Xe
	83bC54GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhzH-0000000A3M1-1mRQ;
	Wed, 19 Aug 2026 15:13:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhzE-0000000A3LA-0zTV
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 15:13:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1b8Q963672
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 15:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Up1DH71ObPvN6KNXio6TFpjBxIEqcMT3urllRxgcTi4=; b=V7trA4Ys/FEYHxN1
	EV+p9zegQnb5Lr4chKElUW2QQ8jwQmjJAs3l+k6H9jakgqibaQgrxc702o7KjVN5
	2hyQxoGnTWFCnntyoOq9BM+/22BqaD4NhgnOVj2rJaL/pP4K6DQClB7kr/RfSyvG
	STgO0gyg1A8yv1Td4HRWS5GC/cGEXpr/pUuycgfPR47BNXGuv/Sgt2ILRx8WDFbx
	KmRIH0EsH/SHqwbhS7z3hUAzDo9GXfTn/t48VJczYPWxi6GPxOIOCXj1XYPn5VY5
	AOdFrxyv8UCuLh7V5URaP20a4Pgm6Zt+16YHSsZG8K/A04xPKRv8FwngTFihgfa8
	zx96AQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3g1v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 15:13:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so15638865ad.1
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152430; x=1787757230; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Up1DH71ObPvN6KNXio6TFpjBxIEqcMT3urllRxgcTi4=;
        b=ajb7mqQdEsrI506nk5EKNe0GoncJs9NdbczTg4Lbtbj7xqLpZweB/T5jshs/bA/DT0
         8d0uhqE4kDWdUYY4vsKrZNEqvMWN+X2A4LqNqM9QqQO/zXWACgzUPWzfiPMiNMxK5bDY
         dqVEboi9DULzNW8r3h3oPHaoP4sKpWm8DK8QMzuYTfQjAmIWQo41qrmscpJuKZOSrjmw
         Y4fL0U1UhtgfDTOLwE9zexQ8ZuOL8FXOv0qAmTg6j1lyWW8fNoObsszEn6feY7wHm0aE
         XiGLZUmZfs9QbctEVVgGIOD2/XDwxtkn7X5feBUH245mhoFOVVJGPNdSLZFz/kqsUgBm
         RYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152430; x=1787757230;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up1DH71ObPvN6KNXio6TFpjBxIEqcMT3urllRxgcTi4=;
        b=bqUg1vn8Z+J7Rc27Q2iGQXe4GjkUAbvGW4xKMLBE1PcrKkp6wqBE6mMHuAsX8sP9Pi
         XIBO9nxngcv3cWp/4ztnsLE91QSaFBkVVhvVLQl26Fkt3sxyY/tsyVR0h8L5ImscTdVF
         79ciD+KnXH70btQSnoRSkd8K+J7ZKMexRsqLB1X3FbCChgd5eVG5vs8eC7GJxvp24ghY
         rbL9uR7triJ8h9ZD5ovqq+ScwGSE81Pzih6xm+wtbRFJg+hnu3Z9EfoS4L3EhfZ+b16K
         MahwSzbYpkuwo4bUBTojzh1faexEyH1uleo7knlyqAMVhfL6UGQeLGBX4fEXZkYbP72Q
         ZI2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9vNkek8PlRpWCSwDQSid0/HEvuDwCFySCdUfCrPe7KgMZFROJYDmSpQ89lTiNys2I8GfS4k4=@lists.infradead.org
X-Gm-Message-State: AFuF++lQE23GzVCcV3c96/cq+nPfYP/mRZ/au9Un1P4KCS4L5cj5A0Bq
	bo6tDtZIshigENBYWAlGCk1Xx+TYfN1Gc5W9PzqlYglMs/3k604LcRItw5A8Mg5U38hr3Qd07ck
	srjQHm21HQPtJa49uILcXFXOpzDLBIIIE6n4LnGuRplttgQyybqbbBVouowstFKnY5xYBblRF
X-Gm-Gg: AR+sD13Tx5licgjLK375mQI18d4gxbcT8mH9dqPZ/2NXTrBs9fCtjf98wTb0g/9VxOo
	xa1kMdBI1tnH0hKtAjJvhV0RLqzWtPzC6o0cPJEzpe5Rb0JBRIjzLjLNLapJlUvXiYdqIwaer+g
	WxOZ4wW4TSRHHUpVRC0VxlhtjivNk8Zx7ErG8Iqtl2fLqs+Nch0iv5f8okVHmwhwIV+su2KKhWv
	j465pROyqpzhvTDuVkset3KIps6V1Vn0Gtr4om/lmCbAUrXKc+xQgtLh55nJB7TAzJDuok6oECV
	6XuycT0dRQIP9+g35eWYZ6HvQDRd4PzgC0hg+ViRy+H64dqe/eXyMeJr0hQ21b3s4IX/IY3oOr/
	Jf+ut19qMGaW6HIdO9PbSx+WAQ+08HT3+qrb6OyHO4IW1
X-Received: by 2002:a17:902:f64c:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d5fc8fae7dmr70485905ad.6.1787152430228;
        Wed, 19 Aug 2026 08:13:50 -0700 (PDT)
X-Received: by 2002:a17:902:f64c:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d5fc8fae7dmr70485145ad.6.1787152429691;
        Wed, 19 Aug 2026 08:13:49 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77bfcsm7089834eec.9.2026.08.19.08.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:13:49 -0700 (PDT)
Message-ID: <626c5a99-9327-4ea0-a504-9f55b26db7d2@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 20:43:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Fix IRQ cleanup on PCI IRQ
 configuration failure
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85c82f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JJR71pI42961Z5K6J_YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX2uVZl3ClqHx0
 tL4arnYQTlyDemj2InUUcXERurC8cpAxpUwH/UxGgfECLjYx9Zwjllpk4sSt6SfaKSEiTt3wXyQ
 jTNIw2Q9BLXGxgnpToipkrt+cO/+yyPdXzhbNrbaDWxw3NJo4ZCMiu9dCSZ1iefQcVAcsw6UsIJ
 2fwNHNC1zTISlP9tR7SU05Y++urN7MP2FiAmjwOU0VHszMS5a/+1q624J7RnHWBAqqKnbg+4aJs
 K4/3Ow4wFzg437dxYonc2Af6b89ipw5T4QDxlZBoED4E/pKEnQ14RKW7o0dc2/00GZTFBhdp7IX
 O/pqny25ptgImVsgUKqoqxUWhkfPy4xC0TDX8kXfcIYz4q9QJ7K5UhR7GaJNgT/p5U69ZXHwVCm
 ZfV6wPPRyhqXZULP+W+EUe5BXD2wFQSgfHcMl0WGIAQjPwGa74XBSWl6iR6HlRUi7TdEg/12FqH
 dWULg1qIDN3c9tyNnfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXzkC0425i43jx
 udq9AM6TcbR/pwAo12lWJ3DDymi7YCO5Nln26wLCOt2TWYmrxiNniQDGoWtzOueKSch/K25x8dc
 zC9gaxMaxPUgGAmFgj7iFJ75pKenNe4=
X-Proofpoint-ORIG-GUID: t7sIrJmAr4RBHioKYEZa94YjG24dgPiX
X-Proofpoint-GUID: t7sIrJmAr4RBHioKYEZa94YjG24dgPiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_081352_443628_9710391C 
X-CRM114-Status: GOOD (  10.45  )
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

On 8/19/2026 4:32 PM, Aaradhana Sahu wrote:
> Free partially allocated IRQ resources when PCI IRQ configuration fails.
> 
> The first patch frees previously requested CE IRQs if CE IRQ configuration
> fails.
> 
> The second patch frees previously requested external IRQs, stores the IRQ
> number only after request_irq() succeeds, and cleans up allocated
> resources on failure.
> 
> ---
> v2:
>    -Used ath12k_pci_free_ce_irq() in the external IRQ config failure path.
> ---
> 
> Aaradhana Sahu (2):
>    wifi: ath12k: Free allocated CE IRQs on request_irq() failure
>    wifi: ath12k: Free allocated external IRQs on request_irq() failure
> 
>   drivers/net/wireless/ath/ath12k/pci.c | 55 ++++++++++++++++-----------
>   1 file changed, 32 insertions(+), 23 deletions(-)
> 
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

