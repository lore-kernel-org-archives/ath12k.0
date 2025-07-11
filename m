Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F89C83F25
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 05:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNVflDDkNFoihhjGJq8umn74evciGG4j45Wyl6wItrw=; b=pLLte8pPR97cT17/d7P08lTOpI
	vA4Iy0AC8r8ydwf9vzkKTj1jXcvC0iuMy3QBzpMFI+KOP4lQlXj8o++riQ/qUoQAXYXYAW4lGTPbc
	tv3mu8+0424OxDRD6OO4+bg9f3yl6o/I6+1+gTEaesmSr0Cv69payK3UrFPGCkYD9rctn3Dpwh/0M
	ZWcGt1bMkPvWLuZwYB5gnLyyvZ+2FgyZUbYNK1dciEUH0OfN78VF4f+qyq6y+zrCnUnvKFK2A4ar8
	OY1dthQw8gxX1ST1BvQ/2PufnKDnIztpTXg7jSvWvthOZcHkIxq8Qf6MGy7YfQRcMzWsa6BJVsJL8
	QNDkMTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6S7-0000000Dlch-3dU3;
	Fri, 11 Jul 2025 05:37:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Ld-0000000Dkw6-3XV0
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 05:31:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X7Mo029941
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNVflDDkNFoihhjGJq8umn74evciGG4j45Wyl6wItrw=; b=gjnQ3vLV7kPPvTQV
	lv7lcDtYa+Y+T5jUPEk9ycAMNr5eBX/Kvt0fx8nYYvyXuSzdlyrBzidnGLtS8ruC
	uvu3UgN1tnNhj0Z8eq4hKycAFfJOVjgJ1iaFwGFkMSH4nNhaso7DQcau1lodyFtH
	inSpzckV3aFhs4v4MRDDjTgI3F/VBQ6qmcTLhXwkmNfcRwUz3tGC8Z9Q+gA9B5If
	XhUjpQY+4yu+5R3G+ceVAWT9O3Hx2vxE0jnthGyMrA89ew8NCVXaFDWzCsH/oA1U
	AkUFesQdanjIHWyw9uzUQkcEAZDqof0l026WhJPyDTzOhlfm4UrA6r6l1/ESkr9V
	fRVfyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbeqeby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:31:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-749177ad09fso754424b3a.2
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 22:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752211860; x=1752816660;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNVflDDkNFoihhjGJq8umn74evciGG4j45Wyl6wItrw=;
        b=nA96kD5EShH4jMgFOt0nj4PT/W9/nlXgyZmCsBv6lOvV/WIjv4pHVA87pgz1l1DHpM
         0DgrDafh3r304SUuKLPQjwV0jxd5et+sj2ZatAhuLadZw7bFDyormLyom62jDiDjikjo
         fM9cQHCUpyttAfdHVgjtAjGMO4r51JqJTEJoaPZ9vpuADh90+vBnqYWoNn7AfXxO0WfD
         6fhIJRrBw2JEJ8/m+vr0unECvi3kkTysPGle2XbqvBvK/rC/Dd0ARVHbt+nn8JVHNZdS
         52yTa1kJ8JXKEjWiyk3UD4pr7Qhs7jPBUEgtBMCVLkbJRTLNpnktIXXAGPS/DAYlUncr
         Nzlg==
X-Forwarded-Encrypted: i=1; AJvYcCXg/7IKfjVpEOEGkS4L14xhvPeD3HR/wq7i4iCiMzAHRI90dIfuHpxSnRH7xtOhbIF5umtDP2k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6XrLP9tndASxjrbfWs3t9QoEp4tX+dzCJRlQS2sqFifudtNg8
	BX1gsZa1L2Ielcxu39SVt7MI7SYXdt+dL3iYCBd/CEn2BVEYFtTObRqwjiH0VZHyvsHXB3ec+Gh
	wh3ghPBLPyFxmlMtESUtlwN4Fe9Ntm7QwLwqQMjkK33I1F4QQQL2uw20OSkxbRBqm
X-Gm-Gg: ASbGncuegcOXIBjZm6/V/P5e8sS0eyMoPWdDrJR3deIvywSxOzAFfUaE9zPQnT1x2Id
	Hy367I1xVoKc1utG7fBgmbuJ+yo59we7JZ1AFQSZKg0FX6JBzB7w/EsiMaXALRdfZQIbmS8gg6y
	oZBOljVAd+bTUW7JhA9FfLcCuKLF9rolFIVAbOxb/5meU8Oz4G+qkTPbo8Rf7NtBcZTwLM9lX7c
	Y7N4CZgWWfItopWhF0v9KlPbhEdf41m+y3v+SbZbYvKnJ6czGngIOhQGa8kFx8speD36picuFPO
	ot8lwQxtL5eZ1NyFxckxzfTPmNVUau+FtBxYcTKZTLWEmH8qyr9bi+R+qSiqmRfFotMWYeD+jt0
	e9WiwZRG1chs=
X-Received: by 2002:a05:6a00:3a1b:b0:748:e1e4:71e7 with SMTP id d2e1a72fcca58-74ee362a3b5mr2276149b3a.23.1752211860118;
        Thu, 10 Jul 2025 22:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqPmCFcasTUJx8zqmpSWnL9OX8BO5+kq4ZO2xZy7Xkljbdq+VjE2ym8EXbi+lGbr8rixsMXg==
X-Received: by 2002:a05:6a00:3a1b:b0:748:e1e4:71e7 with SMTP id d2e1a72fcca58-74ee362a3b5mr2276118b3a.23.1752211859649;
        Thu, 10 Jul 2025 22:30:59 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.235.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4a023sm3806898b3a.121.2025.07.10.22.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 22:30:59 -0700 (PDT)
Message-ID: <6e8eb4b3-2112-3536-cf2f-e68dec7323c7@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 11:00:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/4] wifi: ath12k: Add low-memory profile support
 for QCN9274
Content-Language: en-US
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAzNiBTYWx0ZWRfX7bDvzYA5Pggx
 BVIvRziEN1+9SbsgjwCatAjnmKzzzzkwtPxnOq1Sujv09S1xWVgMi2GSZxneqUSfdptsI5N07Qw
 8ngBL1fFboeuwGVWtuZhNR+W8ZDklydliGuriofQO/eo0AXeLgOs0km+zmB9eEIeZJKW5caTjeo
 YilmutIH/w51trQhFcFr/Pf3H5AhIph0ZFsahNXuUi+VJP042aTmibeUZgrAtrE8Qebn6p8agf1
 y3+h5dr6M4bktB08zMs5ez3tmZToIN8l+brRwtbTOur3muW6sqjCUjtATPW3+Bd4Ixw19Fuarpy
 0Kfbc32Rj3exhrHVWPYyaAzfDel3Rmty0Hiik5G2Qd/JXF125BfimOV4ugtXZIcIwHNh/jyuw3H
 AtqCpqdnwWaoJowutL5BsBtPZwyrTSbaGXVhWKE+iFrPggdQF/32keFExiyX6RrIAkczldSK
X-Proofpoint-GUID: AZKoDyI9cJpHjm2xZG1jmTzIDqDzP23H
X-Proofpoint-ORIG-GUID: AZKoDyI9cJpHjm2xZG1jmTzIDqDzP23H
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6870a195 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=qj7j/dCbgmX8y5u3oU6Y8g==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=2j2roQ-58BhgqnNodNMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=815 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_223101_890122_8D1BAD3B 
X-CRM114-Status: GOOD (  13.44  )
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



On 7/8/2025 11:40 PM, Aaradhana Sahu wrote:
> The ath12k driver currently assumes availability of ample DDR memory
> and configures internal buffers and descriptors accordingly.
> 
> Introduce support for a low-memory profile to optimize memory usage in
> constrained environments. This mode is useful in scenarios where
> memory constraints are a concern.
> 
> To add support for low-memory profile make below changes:
> - Introduce module load time memory profile selection based on
>    meminfo.
> - Add logic to configures internal buffers and descriptors according
>    to memory profile.
> 
> Aaradhana Sahu (4):
>    wifi: ath12k: Add a table of parameters entries impacting memory
>      consumption
>    wifi: ath12k: Remove redundant TID calculation for QCN9274
>    wifi: ath12k: Refactor macros to use memory profile-based values
>    wifi: ath12k: Enable memory profile selection for QCN9274
> 
>   drivers/net/wireless/ath/ath12k/ahb.c   |   1 +
>   drivers/net/wireless/ath/ath12k/core.c  |  76 ++++++++++----
>   drivers/net/wireless/ath/ath12k/core.h  |  20 +++-
>   drivers/net/wireless/ath/ath12k/dp.c    | 129 +++++++++++++++---------
>   drivers/net/wireless/ath/ath12k/dp.h    |  37 ++++---
>   drivers/net/wireless/ath/ath12k/dp_rx.c |   4 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.c |  13 ++-
>   drivers/net/wireless/ath/ath12k/hw.h    |  30 ++----
>   drivers/net/wireless/ath/ath12k/mac.c   |  11 +-
>   drivers/net/wireless/ath/ath12k/pci.c   |   2 +
>   drivers/net/wireless/ath/ath12k/qmi.c   |   2 +-
>   drivers/net/wireless/ath/ath12k/qmi.h   |   6 +-
>   drivers/net/wireless/ath/ath12k/wmi.c   |   3 +-
>   13 files changed, 211 insertions(+), 123 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

