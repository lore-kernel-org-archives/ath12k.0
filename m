Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE8C0218A
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 04:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R8c0E36huanx8aWAZWdvl0frejm+gHbdcLPUBmJBBg=; b=mc4JAVRCBWDlFHrfRXb/7AeYBB
	CNr7PTjnu9zoBgPbmdC1zsWxC30nC4VBrJaQRBW+A05kJ94MPFzhAy/rqg/ALdhfZTlTdr9bUbBKW
	jZM/XvRY0RldduK4w10hQoDX39YFJpjgRQVyi0WZtYgrHSvvWKJANKa4Pr1gMInzsiVqvcdbu4r7u
	VRdwRN8gxeGtvfSSMWgGS7lHcNKBr6yUPhoz8wtqXmu9dqJcCCLmpDWvTL/SQ+zHDaH3UBYBfbvh0
	/XKmluXm/X+q3CoLgybJzqOaW/GMSq/JLxXHm71lXGD9MWDBgO0XAdu5Ir6x3Qu5ZN4kr8QmsKk5W
	exlfvmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teoLt-0000000EYG8-0c7a
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 04:46:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teoLq-0000000EYFI-2nKv
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 04:46:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512JtJAB006304
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 04:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/R8c0E36huanx8aWAZWdvl0frejm+gHbdcLPUBmJBBg=; b=WmIiZqg05lIjmb0y
	2klMDFG9dHExs/lOX/hz2O4SxvpqUJGhxRY/NemRpSqBXoFT43V0gcFCq1Wtr+eL
	jTPz3r5IzSkpKnw1gqY0Pbw3gJeBdjy6xLRVPfvQRGG8E7/n60ZAC2lTFVlu4rXr
	DyzAGfXk2z5A3/sV8uZCmq0r7Ycbh+acCflJUbBceIgG8ttWlvpgYcSeTgFN5chD
	qXQKJAVPrdxthKCg2F3YT/VMejYC2JXeFa7FsA4a7XjLJCrsrXAvVxHSQRQ1pD84
	8/cYGb5TiWbcQh6PH4h9TlobOqaPzvkqofOOwOh5hdL/suuvghDFn516624gDL66
	OgrFbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8rb6p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 04:46:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216717543b7so34401185ad.0
        for <ath12k@lists.infradead.org>; Sun, 02 Feb 2025 20:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738557985; x=1739162785;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R8c0E36huanx8aWAZWdvl0frejm+gHbdcLPUBmJBBg=;
        b=AcBcJSu0X0it0+vOtfziwDP8d+HxLUuRMS9hWswUZl1z6ZYE4D+TuH+rJdrxOSuFqw
         qq+AldJN/3o451F/JJo0uQAmqCf0I/4/nhznJvCzPs2kSpfPIUaWmuBic5BiZH6on3jw
         D3MxG5VvBfWtAf8/wKib+kRRlshK8e//bayqrumg+bp1fTzqvO03UuhMS0xL1J1md4Mn
         4WpMfKhqL9cG7Zk2oYxItwaSxwVdafBzB0iN1wChpYn2XakQ38cwpp/hkqaXdn2qIAqK
         dEXfLhgT+DuBp4DcSiA7IVn2Ha3fbsrZy+MMJKYw2h8eqPK8jUZZ0uueX2kcXYU9zzQZ
         u5PA==
X-Forwarded-Encrypted: i=1; AJvYcCWICUZlrlXthnceSpfS5YNombi7dN6DXPPiDSBR1FVpAd6kDra0TMOnPpARgfjpmO1vWCD3RVw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFn3Kr3J34XZDz9lNIRHR4nw/yolHa14ewPQB35y6biAWVlGeT
	OgByMEmQvsMHGCaapUT74wCB9MgEQOU8bHv+2BJubvae/2V0xDW/AHTVWKFrGnjTlXGzqLUwOeQ
	YidXSxMPJO2GbziGEO+k7WbThnRpoCcW5rj6cCJCUbaSH665FgXTwwWIePSF+tzli1f7N
X-Gm-Gg: ASbGncsO1AM0nHShkOfNRPZbBbEmbyBt0vSrrLO+xe4vfZed9xFGc9SYucokIJE9+IY
	0+kn0FRP5GUYguAe12L81k/zqTTgS6AB5KKRTQ/gw1sn02LyCyjVdCytyoHTeFNLckkJl+y9UOw
	U23GywKQc1zw/ECBZGPGWkmPhx699VQtn+XRi2OA1Ze7ZnE2Z6GYDljdYKnSV8ilnItkpJPlYdO
	Gz4zMXvrYt+83zpNkQlW2US0ZFC+oU7NonNWiVpb/uif2zH2jUJiI9HC9/mvV91kEuGHEfl3uKE
	TLgOlnyKTTOlh1ecVBruV47/PQp9SYBIq438v9k=
X-Received: by 2002:a17:902:e80e:b0:215:30d1:36fa with SMTP id d9443c01a7336-21dd7dcb183mr299466745ad.39.1738557984827;
        Sun, 02 Feb 2025 20:46:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwpfI/y0iuDNby60PhxDzhLpsb6ON6HlI2m9WQtsMnRHLbdVCvSzI0ttBHdZfnWhaNM29vpQ==
X-Received: by 2002:a17:902:e80e:b0:215:30d1:36fa with SMTP id d9443c01a7336-21dd7dcb183mr299466485ad.39.1738557984447;
        Sun, 02 Feb 2025 20:46:24 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3205a17sm66914855ad.106.2025.02.02.20.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 20:46:24 -0800 (PST)
Message-ID: <770548c9-b3e3-4748-a67e-f3c9bfd2838e@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 10:16:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Update HTT_TCL_METADATA version and
 bit mask definitions
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203025016.3851279-1-quic_bmahalin@quicinc.com>
 <20250203025016.3851279-2-quic_bmahalin@quicinc.com>
 <e0cfabf5-a858-4069-928b-ba4dc86f307d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0cfabf5-a858-4069-928b-ba4dc86f307d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2OFsKhyBsUTS1xkxEojzp-13CdGwAFo1
X-Proofpoint-ORIG-GUID: 2OFsKhyBsUTS1xkxEojzp-13CdGwAFo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_204626_729706_0F708593 
X-CRM114-Status: GOOD (  11.26  )
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

On 2/3/25 09:38, Aditya Kumar Singh wrote:
> On 2/3/25 08:20, Balamurugan Mahalingam wrote:
>> Update the HTT_TCL_METADATA version to the latest version (2)
>> as the bit definitions have changed a little to support more
>> features. This new version allows the host to submit a packet with
>> more information to the firmware. Firmware uses this additional
>> information to do special processing for certain frames.
>>
>> All the firmware binaries available in upstream/public are compatible 
>> with
>> this HTT version update.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Balamurugan Mahalingam<quic_bmahalin@quicinc.com>
>> ---
> 
> Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 

Removing my reviewed by tag -

- Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

