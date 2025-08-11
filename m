Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28115C87FD2
	for <ath12k@archiver.kernel.org>; Mon, 11 Aug 2025 03:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDApZTk2nZE28clF+a8J2J6VpLUbqhxAq5BNgHbqkVQ=; b=dw10qiaixnkE6RIQ/Htl/wgTJL
	BGdew6L4emWNu5eOiT48q/6zUAWQdVurErryjHD8e9utTj31hodInbl9xIeWNPs2DUHwhfNadZ0nz
	B/FNj5gRzf5bps+2HuKoVErTYU9MuwjTzwVi2+UFcgaWbqMcY3KTrhVaoWm9n8z0/WgZl4ou78yM/
	8ozZY0xcUHnDrnM2G9Pp6I4xC5J/yqQ+791w81Aof6ieV+BBRqFWDRd5+sQZbUf+0qavWSP/4TtSM
	giaIP9TbQS/PcoEfDGS7oCyW5mZ5ca1j+VWAIDa8zN6WuesIF8oM4FQydsveSviREGKkL0rtYG3gg
	8KMFNJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulJa4-00000006RvD-3pFl;
	Mon, 11 Aug 2025 03:52:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulJNK-00000006Qph-0oQW
	for ath12k@lists.infradead.org;
	Mon, 11 Aug 2025 03:39:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B0eGSc013097
	for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 03:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDApZTk2nZE28clF+a8J2J6VpLUbqhxAq5BNgHbqkVQ=; b=WC/qE3sm/sFHSjfM
	Eq1frOQdIz3EYmhZ/Rt+FViEcfWEgdAeMTwPSnPbL/VqwNyR5jhuunseF/GN9Huq
	GPy79k0grjX9xI1Cdz7+J2tDjgmVxiPasq5QMmkrKOyrF4XwjKaAterf4BUe9fVF
	VJltC44rz6NCghASUn0WxQHi+uYetcrzDOWwOK0TkVBdfr+dWRy3xy+naMiK67Rd
	XMWPuPS63gAqfTKpagrsDZNt6fCossLsL0I+uZpgYMoNYI9a+NWT7P3522VB3Ljf
	qu5gSVAeVzJmZFQHt01QfkbfzCp9HZzehFQ4+qV57AhlKi1q8SvSy0yruPqnSSMP
	I/LuOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sk3pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 03:39:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31f5f70a07bso6437617a91.3
        for <ath12k@lists.infradead.org>; Sun, 10 Aug 2025 20:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754883544; x=1755488344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDApZTk2nZE28clF+a8J2J6VpLUbqhxAq5BNgHbqkVQ=;
        b=W8UKQWGx8nHrAxeI6nH0PfUBNp0fF8JOYp+J2RA6Ls/ZZ2AzXQ6bLTlewi7DQGgBcv
         4YN8VYci8MVmL4U89eBYbUW/Uck4ofiwV/CvCjn8NNkJSOQmbyCS3Be5Yeq6FabEQfxz
         YutvF/66BMtmPHGHIB4Zm77lrhHqEoULVGwSF9/pTReAQqNXU9vbLNZJbdJL9U4jk2dX
         MAD0h+HhaxyFphsL7E3IMaQ3aHLJMcWRXHCNDbZ4JWNgyLy3d7QVVsXSdn/dc+cq+cR9
         7slrXVC9RMr8jaly78Uq944cH4K7sgptPVfMHnqvggItf2aNa/ssXLWA9lyeFc5LEUsx
         j3dA==
X-Forwarded-Encrypted: i=1; AJvYcCU35GTl5hN2kk+d6+JRtkDUgDj10QXEvOC812NjYxLTxT4Ml7aEyppFXfCUt5JrmlGbCfUm+Rs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxmPA2xIV/PyqgHHov+495gx+0YecWZChx3MWocXkVFxs+W/Wh
	l5+xO98OJmi8N+IZhGKUxkuyIvdQpxn4WgbeNuLk5sMAZFdmI2pRAm/8PpqYPvIojwYUiSFeJE2
	OxyW2TpLVTg/ukL/qhe1+Az4OMZpiHoN8VBjnVnvnrlyfMrvbkzlfVP/fvVHWaVFl
X-Gm-Gg: ASbGncud7rnjfQOz0qksBK5g63W+hU0sTS51QXo5PNgmPTY/7X9EJ2GmVaOeYH9MpBj
	UoBYjNOAZP50grrwd1EB+jqyY5Z3xmDwknke0l9ytq3O/+eBAiySpwyI8NDQBC4gdu3HbaimQ5m
	XkXLqU1IFA0aRjG7qhM7ys6wRqiyXLSrFaka5LVeFz/6pCDDWbIcEY9vTQXQoGUab8J+sx4QWdi
	osevO7bjIfUZOk4LHRfLuuu65iB5hdb/2QcCM9dp6BGrfU2xhCIdG3w6FTEdJGXQCRi7a0BwojT
	C9+6C0Cj4UwLk8bF21qe/yCaUe9n6bwDEUovtkyzdrQz4WumB/eclcm0NGxWn+hFYghk0mvFkfK
	QLs/TFsqcrmeJErx1eRLGElP14rPeEDw=
X-Received: by 2002:a17:90b:3846:b0:321:a2cf:9da9 with SMTP id 98e67ed59e1d1-321a2cf9f2emr7030253a91.15.1754883544151;
        Sun, 10 Aug 2025 20:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzovdnuZMOGoG7rJstD57pdUxuFXM7ZTxP1dKosD3H+FktIX9xerVzG52tcd1z3eHsTxfakA==
X-Received: by 2002:a17:90b:3846:b0:321:a2cf:9da9 with SMTP id 98e67ed59e1d1-321a2cf9f2emr7030228a91.15.1754883543728;
        Sun, 10 Aug 2025 20:39:03 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b43c54fbce4sm3786625a12.55.2025.08.10.20.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Aug 2025 20:39:03 -0700 (PDT)
Message-ID: <d52c8078-7416-45c9-8b5e-e3a80ef6ed1d@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 11:38:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix 2 instances of Smatch
 warnings
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
 <81440d36-9729-4eb5-aa30-d94d0f85b7a1@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <81440d36-9729-4eb5-aa30-d94d0f85b7a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689965d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4rEXVySGOu1P5TZAaAMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VZ4FEcNSFM_Y_7v60z3nggHgNh2uB0PQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX6J2fCtB4OyqX
 KZUbPb9qLkGo07sM6NqMebMV3C9E4kOhWqrgKU4wyimguuB1XFZApUArqiZNIzjG5f1UZPrG6go
 SWETavprtKib+Af+02Gz55stfdAgCMHJ/1zylK5ZR2f+szTqKHSPNj8u8+CFUaEKO3rzzx8PY43
 UMN+R0hugDf2LByYQFI8lag29igPU+zbJCy11+/iEdOtkAV6jnD4iPLgj4cyKB2/wnuQhBOCI1+
 4y+zUvS3PnNdNq4fPUn5HwIHGalls2rpxY4ZYCsz2HAhPfZ7pr/QHZnNbsADqrbMsU6f/RVC2U0
 kvK668uP1FA8fSjhij/SDWwIZ2ohkC5T2mCvwl2Ny2phLmEB1mWCZfI+8HirLuwNT1OuNj6bZQP
 9PfGBOz1
X-Proofpoint-GUID: VZ4FEcNSFM_Y_7v60z3nggHgNh2uB0PQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-10_06,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_203906_238543_BDCF18C5 
X-CRM114-Status: GOOD (  11.68  )
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



On 8/6/2025 10:10 PM, Jeff Johnson wrote:
> On 8/3/2025 8:03 PM, Baochen Qiang wrote:
>> Fix below two Smatch warnings:
>>
>> 1#
>> drivers/net/wireless/ath/ath12k/mac.c:10069
>> ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
>>
>> 2#
>> drivers/net/wireless/ath/ath12k/mac.c:9812
>> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
>> drivers/net/wireless/ath/ath12k/mac.c:9812
>> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
>>
>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> ---
>> Baochen Qiang (2):
>>       wifi: ath12k: initialize eirp_power before use
>>       wifi: ath12k: fix overflow warning on num_pwr_levels
>>
>>  drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> Since this is fixing smatch issues I plan on taking this through ath-current
> instead of ath-next.

Sure, fine with me.

> 
> /jeff


