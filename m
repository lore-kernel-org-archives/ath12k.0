Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C95D116E3
	for <ath12k@archiver.kernel.org>; Thu, 27 Nov 2025 02:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxYwLRqmN7KIfn9UeEw8WfGGjDSac5cTCY5zVzU1VWs=; b=X/X/ud3dFA9UcshZ0VpDBrxpzL
	vVi8D70f+qjey1C5e60SHmQoWmBNXuHfPg/CGPJKXDFLslALvAdHlXqtmvZTkbu8oBJ/QSpgmKdO8
	NCWXgnotf3d2sSQZZal8i1DlJ3zW3b/YJ+Nfo5q8B9x+NGMwbo9XhZue03RlTkEr4luQ798NI0zl2
	UHwtzqK4dOFguHm5d/cUWJ6EZXSc5PtO5PKp6vHNyyHhhRNR10L7VPvmGyBHxOQYnR7MVIbcDaIU3
	ilyqyY268AZ/V5SqcdmSBaJUwaAefhsLdmS2RU08T0Vvn8wihHdRSgikG05KRr12b6q3QcC5135BP
	FF4v14AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORIl-0000000Fru0-2HX4;
	Thu, 27 Nov 2025 02:00:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORIj-0000000Frtf-1lta
	for ath12k@lists.infradead.org;
	Thu, 27 Nov 2025 02:00:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQLFq032122073
	for <ath12k@lists.infradead.org>; Thu, 27 Nov 2025 02:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxYwLRqmN7KIfn9UeEw8WfGGjDSac5cTCY5zVzU1VWs=; b=Z/F4y/kxjieppySW
	H5RS2geP4Oby64JviJKQg0z6hljbj/LnhB5M4/TKrYt7ujyQGmw5eRQBtiy/llOI
	LLqUQ3U/Ez8FrqvJD9Mk3TSd82hRh++wkRAQdbDzaLijJJxtkTeWyzKAGnPFQbst
	YwoQ/Pd9W9RPPaCXB03fc3jRCdrDwhZpY81cn06We4DcGK9sizVPPkx0dT8osF5T
	DqIloxAvKUBUMm6p5GWOqSM/kCFT1O8v4KQG505WW9ifzWTFKVxYuJ8kStzIODXY
	4LTuQrUZ4dzSpxMCIRZBhJ18/T2syEiGfNxePN6d/N3CiWMH8ZAH0ypWBff6zZHx
	koBDjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b3241f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 27 Nov 2025 02:00:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a432101881so472406b3a.0
        for <ath12k@lists.infradead.org>; Wed, 26 Nov 2025 18:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764208803; x=1764813603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxYwLRqmN7KIfn9UeEw8WfGGjDSac5cTCY5zVzU1VWs=;
        b=Ne/AfL4kQ6E8FbdDA0mjeydbC/VuE9SzWWghAO8Dr3UAFotXyafzd3V0dPs5JHB+XR
         h1BR1YBtKrRtS4CgbLbvxcGiaiTPVaQt4TtzC9l2bOltD4Zr28AtqfppFY4ZqXT1WwsQ
         HtHyojKskbf0bN5zHRP31Ip5M4g8m1xR+RyOiYGB/8a3REJCVudDCxhZ/bPJX6/C5OiF
         AUgsJmMb0ywoVWjeljtj1ufmWg7yRuZJR5C+a8KS08U1SlyLMTmgDPWZdw5Bb46QpPoo
         Ibjos/Fv44dY/Ar8hgme5zEvZ713lEyTcblZlSKUCfmoEyXQ9Iegkknbp9pZ7sIi1dcL
         qpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764208803; x=1764813603;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxYwLRqmN7KIfn9UeEw8WfGGjDSac5cTCY5zVzU1VWs=;
        b=ImHcdeF0mQRsmZd/z8qt3pHSCR07rekjEpZqsJeY274KHcaNbdNjE03SD6WMAGgezv
         tltI6oh+gI6yXxDRMaTo+G4CMpWlrZd7Sc05sqFF7bhGYY57d8K2U0LWBBUiE1bdam0X
         9MfBoOjW8Hcx4tfvj/GBonlrY48yqfKeew3DrhKfFG28nmsZMcJndlLib4bvkoKwLW2a
         pUX6KLelsK4ZaMv3yrggfbkAzO38oaxbf4Rith+n69nE0jcZdWDunzv2VY4yT5jUk0zT
         +/riksxprPmYVlKH7DfF7aR29u0XhlKGsSAfRnjFFNRFlPBY4FY/MExf3NmEtLZ7WFLg
         0QqA==
X-Forwarded-Encrypted: i=1; AJvYcCWatWhOpc4yugSKRLNk7ovEn9V2ghzloCqc1Jh/vjylosKVAbn5OCefLcHb+my1v4uncLSogC4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzQW41V7TOx8E3ag6sL5OgoTSCbwMjKXCwk5qSLZ/I5/DvQU5M
	ECRmvqa7bqxnRjk8QvuBcUKNwEEkExu+d/Jcq9p3nMmaAT4hvBaveZsH+Zg7fAo013/D7SLQwFZ
	IRPfO3I7f7Vw5B5eynVVzgSoOUW9FMsgTYeQZo9Wk3DldHzdawQH3tmE05zg8luwZ
X-Gm-Gg: ASbGncs08FEiYxHQas2qRDr/Aazg2LvSRnF3vJP92SvMMRPlo4GHz15bNFA5CQlegK7
	bKRGKKfHxXMx5R97W1qJcsDo/1g5QatZkhyV1255tYzsZYCEH1mKbTMD9VIZWzpoGbgfdbTVPnO
	ncyiuta+Mf+jJ72NgQCUzlWrVMH5cFVudHhSyrSgPba5mj/7SM8tNIScOiH6lEGu5tXh2qXhM2e
	z2mQUAHH1PK9XeUcz6Vyz/FtZODIsyDFZ5q5hYcVS1IK+brFkrqvoxwtUshu/uEmmjkArK9va+q
	SYGYjwuNVweUIo0X5DhyVxA50qVpnw6slMSHys5PzkBoAQ/c1Su8wMg+oPw91NCBtHFd0lXz++B
	sj5IOk5WjllDMewg61D0b4hiwfyZDyqw8Idp3J5bLJt4NDz+SphVPGCsPuVE8cgX3MvXQzC5j+Q
	goAWcLMh0=
X-Received: by 2002:a05:6a00:13a4:b0:7ab:fc99:d856 with SMTP id d2e1a72fcca58-7c58db2cccdmr23634224b3a.18.1764208802896;
        Wed, 26 Nov 2025 18:00:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENfADCaProux62pOe0aziLvWIBPRLROMPBABGopdZq7iAzgdg4tnabsaVC0rKt6Joy0GaX7w==
X-Received: by 2002:a05:6a00:13a4:b0:7ab:fc99:d856 with SMTP id d2e1a72fcca58-7c58db2cccdmr23634194b3a.18.1764208802438;
        Wed, 26 Nov 2025 18:00:02 -0800 (PST)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed37ab3fsm23137458b3a.22.2025.11.26.18.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 18:00:02 -0800 (PST)
Message-ID: <aedb4f4b-fbb6-4a09-83a2-9dc80307b5cb@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 09:59:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove redundant pci_set_drvdata() call
To: Alexander Minchev <adminchev@proton.me>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251126170213.27959-1-adminchev@proton.me>
 <20251126170213.27959-2-adminchev@proton.me>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251126170213.27959-2-adminchev@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=6927b0a4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8RFSuhLZcfpH7MuG1VkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAxNCBTYWx0ZWRfX3h5DuBsEtti8
 iRsxTSvShENuC4GNPz8gH1Xqh2Gd2/ciHVRmQ+No72GmBlX9hKgAx/LPnmlSPopoazz/bwlZyNt
 HfyAyqVyF0XSp16C4WZGxFJx5tU9epCWYw9hgLQ5f0Q2QsA9z90tiqAj4U8QD4xc2XizztYtT96
 iinKNdcdr/ukPwnvCzEX1YEtFslNlY3Cx/3Uppr85Qb44EBKAmE2I6zicqseNEqqIXn/4jIh/t5
 JSs2DbTouUb+w+NdNj0MxkDG4a+eEuF8437+/bkktiPYLsvgnQ+CV4oXSEtxj19VyHFR1GeLvJm
 E2iLajvH1h+Qfiida5tUUQj33MXEXwIBO6GeCI92Kht4aHPBhYyUvx7qmFD1biJZ8A8wX9lKCSu
 CqCsyFkUz++HMDruFaQzDhL2Z3Uh+w==
X-Proofpoint-ORIG-GUID: QT1IX6ctJp3s_n8rp--3vMA_MSeFy6HR
X-Proofpoint-GUID: QT1IX6ctJp3s_n8rp--3vMA_MSeFy6HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_180005_598942_A9EFB111 
X-CRM114-Status: GOOD (  19.13  )
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



On 11/27/2025 1:03 AM, Alexander Minchev wrote:
> pci_set_drvdata() is called twice in ath12k_pci_probe() with the
> same pointer. Remove the earlier call so drvdata is set after
> ath12k_base and ath12k_pci initialization is complete.
> 
> Having two calls might suggest that drvdata needs to be set early for
> some reason, even though it is not used until after the 'ab' struct
> ath12k_base is fully populated. even though exact placement is

nit: s/even/Even/

> not critical, keeping a single pci_set_drvdata() at the end of
> the initialization makes it clearer that drvdata points to a
> fully initialized structure and avoids confusion for future changes.
> 

==>

> Tested on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

<==

nit: this has to be on the same line

> 
> Signed-off-by: Alexander Minchev <adminchev@proton.me>
> ---
>  drivers/net/wireless/ath/ath12k/pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index a12c8379cb46..7bf98618ac1e 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -1580,7 +1580,6 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
>  	}
>  
>  	ab->dev = &pdev->dev;
> -	pci_set_drvdata(pdev, ab);
>  	ab_pci = ath12k_pci_priv(ab);
>  	ab_pci->dev_id = pci_dev->device;
>  	ab_pci->ab = ab;

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

