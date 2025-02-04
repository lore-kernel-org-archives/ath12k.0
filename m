Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D94C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xljIf5LIELKjNsgQouAtJzQ958nVy1Um3h1N0CSDuKI=; b=pd8LV94zE+YcVA75h1nC7gXsGZ
	6ENfLuzu1OTtK67qTXL5SEmOjjdkX2kSOJyTWBkOX3oTdR3R1xzZs/+ePGfBR/piQv/9Qt6Blma2F
	cB7Pwj5z0zH2Z6N8Bq9EbT9/27mrjNsQNR9/uKs9YLm6YhD7/YVIb3fe2qD5CmEPlnESjECqCIs8R
	QZli4yE/jIYwuVO21FWA1NNbiE8KTPE2kSmvUa1eJVEQsf3V4N+/FBnrTM49/VKwk0SGs4KdjcxF5
	1RtP5mBrIMpBGcosiBgjfYURqYi9mnhkBeZOeYI+I0WYcvJ07h9XmoFprc7ZYVbLrmn3QGuR9rv76
	YTe2hLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf9yb-0000000HC7K-0NHg
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:51:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf9yY-0000000HC6z-3js9
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:51:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GElks010565
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 03:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xljIf5LIELKjNsgQouAtJzQ958nVy1Um3h1N0CSDuKI=; b=irpHrLOmcpx9YFiX
	PquvN/0mnU3BCpB11oc4Qv9UfNvOYAyNoaXDzJZJDALhDZXKoIa3sZ9FhuOZBuDG
	xkbr8jogPZU/KvbVJdnK5hOkQEVa2arpbjLJghDHxSYUUHuRIGdKJRsA6/VBB/5R
	45DBzFyTILyAiWf61J2zxesNKIS41d0NvzSXPr2+/LWpSqHVtx5QgEW85IWTCWYP
	bPDfiThDrsxTv0/JO3mCfBh/jXYbnIcvDWbekDlaFicUv6F4gUV6LumZSrt1sOVn
	0zM06S+OOsVefZ9W8AGMrHySXAe4JKrkXo59gSDT3Yl74bh81DlEmoA+Glcr09kT
	qqED4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k159havw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 03:51:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2163a2a1ec2so180869835ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 19:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738641108; x=1739245908;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xljIf5LIELKjNsgQouAtJzQ958nVy1Um3h1N0CSDuKI=;
        b=Lg47giKE4KpcW7S/xxdgg/zeFHE8FZtfEFgHzet6x/6bliFzkwXs10whAKscSnosZm
         ucKGqxaG8EzuWbrEQdq6XD0yB077hPF5rbcJVINPA+5meiZHyv22HmNEVT/4/dUN0DLG
         M+hfHrdfeMnZQixDcPgW7ecQ4ycXIvTbnQcYggsPQejZBwGktN24yl9vN40ByD7K9Pc+
         Nql7r8ONpsUhXiD6lrHPK/cMCpKvgqA9HGafqX7lNXsrMgU7GV7cGcTf7hlDU5O6GRWu
         t3xGTSGArxp9NeTp3dYVjKh1RSjCgno2fnBtbjHVfICEwQ/OtY4smrQ0+dO/Ra520fWP
         wIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsQlok55sAH4EpusEBC1XqwBaUc1LSsJ7dXOTAjEfl2oElcVWYZElY0QG/1E2KME1eJ95iKYQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiBnm+rizvi9xKbRnCm/fvRvcgoCxABZf7OTOvM666TeFfJFXy
	ID2RxaztR8J8a7HRh/RwPBRj9p8NFnRshNMwE+C7XI+MxuE0i+L8lil4mh3PiB6t2lX5p0rYAQ/
	NmCZySKM02i7MieZr1ap+QUns+ORFxxLoxUm6H3t23C4Zsv5Bl761NJDQdfhCHl0sT/Xq
X-Gm-Gg: ASbGnctxcZVtZz1bO2Hr19RSpsiAetlevC/5QcoK1rdBjUhEU+Y430eCYNsxmTcfinc
	0y1wAf+2q+rshOEU+8N3fb9GkZgvwmCeeit/fCmqhWUUdLkHL11Qgn2Xa0ComldwINtnnaXxLlp
	Q+gl9B1kBtnLRQXv+x0PEZhOtcv5WStrlNIEIXqICWuzAyB5LVHA9VcIi9h7RKKzyxzNTotHD3b
	oj88qshdQnyfm7DBQCerUC/8tSVwIK1lhgP6N5vTyV9rYnkGuqVOp0qdEsdCw7qgjmCSRtbVfoW
	Sj6fsJa6SqrBbEmkZwsIwGh8W+pnapkeLr8q4NM=
X-Received: by 2002:a05:6a20:9f45:b0:1e0:c50c:9842 with SMTP id adf61e73a8af0-1ed7a5d5389mr43603947637.31.1738641107985;
        Mon, 03 Feb 2025 19:51:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmdUVc0Wi9jxdVfRoEIvYyBtsi3glQt2raK360OuJpu7LbCgU1t2XAzalkIAtO1g7U9xNGjg==
X-Received: by 2002:a05:6a20:9f45:b0:1e0:c50c:9842 with SMTP id adf61e73a8af0-1ed7a5d5389mr43603893637.31.1738641107331;
        Mon, 03 Feb 2025 19:51:47 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bed4sm9658304b3a.10.2025.02.03.19.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 19:51:47 -0800 (PST)
Message-ID: <f38c5c60-0e00-4b2d-bb47-1a86297fceb5@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Update HTT_TCL_METADATA version and
 bit mask definitions
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203212647.2694566-1-quic_bmahalin@quicinc.com>
 <20250203212647.2694566-2-quic_bmahalin@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203212647.2694566-2-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9G5OPh7MsspgZjQSSaPbK-dSojsdmIqP
X-Proofpoint-ORIG-GUID: 9G5OPh7MsspgZjQSSaPbK-dSojsdmIqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195151_066038_FE486C51 
X-CRM114-Status: GOOD (  11.48  )
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

On 2/4/25 02:56, Balamurugan Mahalingam wrote:
> Update the HTT_TCL_METADATA version to the latest version (2)
> as the bit definitions have changed a little to support more
> features. This new version allows the host to submit a packet with
> more information to the firmware. Firmware uses this additional
> information to do special processing for certain frames.
> 
> All the firmware binaries available in upstream/public are compatible with
> this HTT version update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam<quic_bmahalin@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

