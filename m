Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471A8C53219
	for <ath12k@archiver.kernel.org>; Tue, 28 Jul 2026 19:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPvePTDHKcOsP9LlpMw4Cj7J+B5jRL4roPsl2f0SPTg=; b=wgPn4R+bKRsnJU4IIgbFLb5dzQ
	hZ+r1uKaaQ0dAIFuFdDDgNaX09631Lsa6qrkfJ1z91JY0CTe+7XOuMnugfO9Qv9zLmU75ptZPdjqx
	q5+sn4SM0o0YOSHzraTBE2hFGNEoM8lD11y0F3wTHFScQ+B6EdtMqanDS0KwavehWwN0p8XayJjpS
	OHX2VGpCp1DF9seVK1Q5+qnbEd0uIQnzuG8m3B8plQ61I4tM00MifTwrDWCWRVkoOcBLnDFgSYlt+
	I0NR7iEJvQja13IXjvp41tetux9+NkdEmzV7MDwAdHZ9CadSXS8/nekllHbIti6Shoad8RF19KhWp
	i3imVF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonj1-00000006BFH-42FY;
	Tue, 28 Jul 2026 19:44:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woniz-00000006BEw-2kSt
	for ath12k@lists.infradead.org;
	Tue, 28 Jul 2026 19:44:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SIBj0j3751532
	for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 19:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPvePTDHKcOsP9LlpMw4Cj7J+B5jRL4roPsl2f0SPTg=; b=D5dSFC9yGUnYSSEi
	rJ8Hj+SyIq5ogItCOaW0zhYrcdgAejSPP3cnX3KYgO36oIA3Id9Vr+WDlm/MJSov
	v0SvjVIsRQYiIi9ZMAvn++yMsJVYn5jLGCvpLLs4wXH5AgEz86N4eB4LDIKdUErp
	XpmSUC4OSOXtER5oKwSsnByTdmD76WdrmnzrnjsX1fDktkK9NsrQYTGSjEDB/WQC
	LK/cXVZY1xBzCwmAMVCzeNr3QDkQc/iFCo6KCScEXtUjoMykdwa4nYF5VPZFqkbp
	dfVO3aTUGXm4MCbriN2wpbZhEQmpFM+If3kPN2pwOnqTr8ujIhc+6roZPgwdVDXF
	4pDnng==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6rjwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 19:44:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so141925a12.1
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785267864; x=1785872664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XPvePTDHKcOsP9LlpMw4Cj7J+B5jRL4roPsl2f0SPTg=;
        b=K7gZa/WRD6G73f4jlHk1htYUvLaOXWxt7FfNPdi8yijDOrBl/NzQxj4HHdAhywIOC0
         uHlXwd+4YvVk9fbhDqPTfHBO+gg1NMMBwCma48PF+G0l9j+8TwIeoEFoVpLnKTRnxaP8
         q6oBW9kx1HRSRwA+H38+J+km89jVv1fhKHSwXhcF0cqYKLkMlDFjweQPCiGPLAnIKT+k
         JgT0ts6sGPRffnY2jBWq9J2nc6KD6eAuZCiMZ5g7Dz2UAo6yqXp+5M/xbEEWrzFE9MEo
         eIqVZWy9xTXsXdQ4WUfUbQKsiicNgB704q8BDBziCzPGJ3hvzPYVui+PUDwz2Xk3LnRU
         ho0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267864; x=1785872664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPvePTDHKcOsP9LlpMw4Cj7J+B5jRL4roPsl2f0SPTg=;
        b=gensJMxdW8nFJG3feZkgnvllRAf6uf9GjNffW90cufYg0+HVRMyKEhwgCoSXb/YZge
         dp6L+k+NNEBRrGqj/wL3snsqNoptJNF+inBc8mHEDs3XIxSmMwx+NtD7nhVcULJmXwDc
         qwmMWa1iaY5LbcLtGjF6a/Fb1bIhbmQ1jlPn2fTfW+tFpTnm1lulFkSooObvWdsSyFTQ
         RGXp2JGOi28p6PNlOs06loV1c2mevyPjAbrQmwgbM6pPFeNcIaqof9w8xSxq4uXksS65
         GXC33ZtFjO1ZvttvZh9tb2ORmnoQuTaSuCKdPVlweMvQCuR5XyhFHqUHuLeUMOYnQ2oY
         cKmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOW+riPc8R7kv4xH8wwk2QbuQI2jsP3owEnj6X3koq8NTMVN1tO+rT+HH/DnQjlJ/JlHwuAD0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0wNIliOxD57JsjlnK8AMmHYc5BrxhqCMISzTXrFxdDJG520ZQ
	a4evZLJxRhRVr532uyWfgTE6TKY2pXuwDo90HAzIBImVXtFLCCoV/QvWvtByTWUKSs+uV7B89Iy
	DvFzcX2ireQzKJBvGBah6VPhaM+SAXNcTjGG1olU7IGOV07b9KUmC0SB81b+nR4mWpaZ++FXO
X-Gm-Gg: AR+sD12MvdyZSXHFDM3RAP/4HcQKaB79k2S5gOzqoBQvx9F+2GKGLd78UVXUV1TtuWE
	56eOlfZxOVGwcvo1dlpJXnitVYqoQyeZx/+g/fRD7YcBlPU5EpKEpy8bRAelXT3gRqzSnybPvQL
	VtHGX4CKAtTU06hgibbVPZV/N/NUnNRus97m5C/DB5E2QMHVpSntpEgg9hasGXwrMCHkfhid/4R
	58yOxGDCtTZwokckeLMmJwTJfCaTAM8lHzGXjEJRFxZrffperP6hHhqRYyZ26Ki+2rbt/Z1HB6G
	4UXYjWOZi5HqggRkpkYbK4Av+fH5wLs/0oqObK2TP3K0EyHxuVDzORjZudhU8SyMJfvlHVb2ny0
	O3jSQXi9O+d/rq9hwS0th7U+/s8wOxY9NBHrpvlq9Agtq
X-Received: by 2002:a05:6a20:20c3:b0:3c3:6c34:f9ea with SMTP id adf61e73a8af0-3c8ba641f19mr4413711637.39.1785267863741;
        Tue, 28 Jul 2026 12:44:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:20c3:b0:3c3:6c34:f9ea with SMTP id adf61e73a8af0-3c8ba641f19mr4413687637.39.1785267863352;
        Tue, 28 Jul 2026 12:44:23 -0700 (PDT)
Received: from [192.168.11.107] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm1596288c88.6.2026.07.28.12.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 12:44:22 -0700 (PDT)
Message-ID: <103fa619-0164-4600-bb2d-3339540a61ae@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 01:14:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add MultiPD support for AHB
 platforms
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CpXN5snoNb_c1D_7xUZ61gh5ZNALNORx
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a690698 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1E4GKdcwGqwKInFrMcEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: CpXN5snoNb_c1D_7xUZ61gh5ZNALNORx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE2OSBTYWx0ZWRfX0OnNZ8ZKbdwe
 5bLgjBhnBOzwTvkrJ4hwvqRD81ykfoKHWu9Dvth1RIGEnRtcte4jp6RfYT3yATDIpC0ediduGDS
 OO2RwSVtKXm3/+IioEiURQ1vAP37rj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE2OSBTYWx0ZWRfXz42uFv1Z40Fe
 Idyi935gTCC8nWYDDWwEyt3FXmNx1E3yrv/qxOmgg9sWwZabgkxYrs+FODoqYzLKd7xGhlhdT4g
 i9/JJPBSG834VKhoaMjLx546C5U/Dy2M8bWX14VT3lvTD0HTIf2ceFndliXQDFho/01vLK+oQWM
 L+3EaTPQufwUquTuP9XgvRiJES7DV4JbquiItz90V+khQdZ4dD1ZBlmO4kGNUXBswdARPLR/V4l
 v8KWHoANDtK4bWViOaOy23oV5TpCmx8QHndSazcXhkoQrZK/SVLzJZ3YeJE/QtbvSk7vyt/X3ZO
 g1Ehpp74zlWBf45y/nCki4e1QWxtJ78V+qUD2L8gJlnDmGrX/u017OmNIqUbXBQHpULihCevl/v
 3FK9q5y0YOA585D9rnldDFV6BNMG6A27TqdH+6W8yJ3tSXI83HdS7VQutxTCuhrzENRMPPl5I+X
 /IF4bFFPz0faS2Jcu6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_124425_705687_C63BA743 
X-CRM114-Status: GOOD (  13.10  )
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

On 7/21/2026 12:20 PM, Aaradhana Sahu wrote:
> On AHB-based MultiPD platforms, multiple UserPDs can share a common
> RootPD. Each UserPD requires its own firmware image and PASID, while
> RootPD resources and services are shared across all UserPDs.
> Add the required infrastructure in ath12k AHB to support MultiPD
> platforms.
> 
> The first patch introduces a platform descriptor to keep
> platform-specific configuration in one place and provide userPD
> mapping support.
> 
> The second patch moves RootPD-related information into a shared
> structure so RootPD operations such as boot and notifier registration
> are performed only once and remain active while any UserPD is still
> running.
> 
> Aaradhana Sahu (2):
>    wifi: ath12k: add AHB platform descriptor support
>    wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate
>      operations
> 
>   drivers/net/wireless/ath/ath12k/ahb.c       | 209 ++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/ahb.h       |  34 +++-
>   drivers/net/wireless/ath/ath12k/hw.h        |   1 -
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  90 +++++++--
>   4 files changed, 271 insertions(+), 63 deletions(-)
> 
> 
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

