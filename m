Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF49CAC5A8
	for <ath12k@archiver.kernel.org>; Mon, 22 Sep 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV5JuK1sD/lvBGjG3DhYlCxsRUd3KN7L4n0TphxwgvQ=; b=vjjFt+dhZlDk8tLxuPDe+Sna4D
	oPLFCU7TD+wn2VOwcug+epOkskEVDIrKIYReowQbAbnpim7QkVnABxlhE7CFw8Xlg9X0UIPsaTPH7
	3W6h/cLkSG3blAvuOz1///0PnbO+ShMd6uoxwyOv5ltIhFTp5R0zWdmxoUmQ0ZrOKkUkhvB0t3MF8
	mo5Cwa59aJnBTA/uB1ekGl7BAIzcFA7s7v6iiRatmBOh7XIG220k3tywYw5xJRigqdID+RPP6+MpM
	+ly8Z1q5jPrXhh+PCFCPgObioI2/2qmdkh6QNOSlRnZlX+NOnW5Bzy1I0+R188QiEbSXwdWz79fTX
	+ZX7B/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hVu-0000000AfLZ-1M5U;
	Mon, 22 Sep 2025 14:27:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hVr-0000000AfK0-1HJD
	for ath12k@lists.infradead.org;
	Mon, 22 Sep 2025 14:27:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90U8r022397
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 14:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fV5JuK1sD/lvBGjG3DhYlCxsRUd3KN7L4n0TphxwgvQ=; b=EEqJ3DlJuMsljbE1
	YLXjX47wCX+El+d/HSKQxOLSkPOYRuaqpzvOuVz8mRWZ+RLpgJZQJFOqlBuPfU2X
	5dRIrbwPztFlDC0cJJblgahYbpL5n4g4mCF7xOKmSTafjbUf55ZSCM7yCzvqJYan
	FweKwrJv1fUeiKmebEfrV5lw9jqcuYG97xIASa3qqJPv9AxzvFPbOr+8WbWCg8C/
	Pvyg5ctx7HPBexcWxI7BAeVzWVUZHDOucn31MtUvylLAfeRGK8pfDkuKJAdVjsfC
	ptudtJD4/oXnGG+V3WAd0HBrrIFqfMI9KXU6LOj78RwbYhnJeo7xXmrx4zFRqz23
	/ea1WQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0w1jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 14:27:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24457ef983fso99257385ad.0
        for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 07:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551247; x=1759156047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fV5JuK1sD/lvBGjG3DhYlCxsRUd3KN7L4n0TphxwgvQ=;
        b=jfM/KAaUIA9DvTeSSVtcD7rv9EToVbE5qV0Apkipy26gPWc6RSZFuzNKmt8MfldzxX
         vOzf6USWOiI6e2L9LTZK98jRCe9bI2d78QHKqehJobru3n6KhBVFvctjPShRnPC5l8nt
         nwoflDTmsU3Kw9OsD+cIlfh/EpCpKpS5Yb3Ic0ae38cjows9nSVOcfXqMyQ0C4Vh+XyZ
         cSHaVeqLV4a8Pyk+Vb+2RE5u/YswpxxQXyGIIaguLyn8Jsj6V03UO1tODDsvTgPF371+
         K+AP/IzL4zDO42lA+lREjnrZIOsJJa3BFMjGfyf01rqgCX0Asi1wrU1nOL3YxcGAuphg
         M9nA==
X-Forwarded-Encrypted: i=1; AJvYcCXsy36xp5hXDxU/vJLuOUg2HnDTIMQ6sXVRlmc9RYrmddMc+qnmoTk9if5J5j2haw8sfa566FA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZb3/h+B5MGFadb5SKbcxMGh4X02AH5jRBtltVvFMSNfpkXS6
	3kLpHrVBHT/OWctI00e1sZMY2JSS9u8Nv9Tf/CFNsWwqKH49R71U69kJyPk2j+QrkQ4sjhaq6o7
	M5K15MIwRrP/MIsYOPXBSbadR5T6NogxgFTwjxwlKiNF6iMHxKF40iKDkVrkCSr9H
X-Gm-Gg: ASbGncttld1JAcs86eyIzj6oev8F3ggZvtnF7dtgtHFpxeO4I08Vk97F4JNMhQsh5be
	o2GjipeU6f9v4OHk8pcPlbtkWwwjvFyoqC1yypuXeg9vg4bO3Ap3gHNRKJfQ6hWdVAbM5qNSZvH
	cY50YnjcE9EmWepyXytbBWTmA0gvPowaHFFSg4G7rsreh/ZOAkiVqAB9NEZxul8dylKy6e26ZKp
	/KT4gsVfkTYIoQ/T4NTU2dd5IEM0aJFgoyTZrYSGTD0DmIcwvmRv5hvL+MCdotfleHksGo1wxU2
	i5mZuElC28+mQZa92kF4tSoet2DrfhK1dHjvkYbIphl3p5Rsr1FnRmIiQI27pJXePeEItjG3xEZ
	7Rrai++06kxvyDQE=
X-Received: by 2002:a17:902:e550:b0:272:2bf1:6a21 with SMTP id d9443c01a7336-2722bf16e99mr115069825ad.14.1758551247070;
        Mon, 22 Sep 2025 07:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnurI6wavqww/i4EDVMJujj3eWajrXl8/5g/qerXs7rQNtYufXniembA5tMmTfhGRq5eJXgg==
X-Received: by 2002:a17:902:e550:b0:272:2bf1:6a21 with SMTP id d9443c01a7336-2722bf16e99mr115069495ad.14.1758551246652;
        Mon, 22 Sep 2025 07:27:26 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053248sm135186355ad.15.2025.09.22.07.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 07:27:26 -0700 (PDT)
Message-ID: <2b16c982-90b5-0eb5-df93-465a8c2f4d60@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:57:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: enforce CPU endian format for all QMI data
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250922061607.11543-1-alexander.wilhelm@westermo.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250922061607.11543-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RoC6a_tckuz7CI-75kP-wvPMv2AoXfJ2
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d15cd0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=jURWspusQOjhl1xubyy6/g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=iy7eNMHqqS-0pUZEvd4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXzK6YZelY1a9x
 fpHp0x+Y8wKWFIU/nndWbcZ+1dS0xTA0FB1Nvl78wVDeQgQMvS62mPJwoTICFjgxY7ENIQxbQjm
 jQK15kd56GNyStN989btAgecAVDo+eTCG8/pcfiOWTQVAME1gewggkhR1pTE8L9WxrukW1IUp0s
 vDdu7f/nNbRM0dtX8ERN6/abjZmsOKHEpY48s7XuqJYAGRHMf43Htr530OIyk7L4zuD1ryYtzGo
 MuV3WKtUHdr1JO4LyM2752Fm1nBUnqaG52C3NeQjiQbQaQKjnBKvOIX+qNJWKg3W6UqLJ83nQpA
 L50rPvYzqM9YlLOkhHIRTie7eH/Y/DsK2iyDpW7GNss8wZm0DN8KqsdosXgiwTMYpWAKAKUboSk
 v6KtWrop
X-Proofpoint-ORIG-GUID: RoC6a_tckuz7CI-75kP-wvPMv2AoXfJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_072731_541920_7910A824 
X-CRM114-Status: GOOD (  12.12  )
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



On 9/22/2025 11:46 AM, Alexander Wilhelm wrote:
> Currently, the QMI interface only works on little endian systems due to how
> it encodes and decodes data. Most QMI related data structures do not use
> endian specific types and are already defined in CPU native order. The
> ath12k specific QMI structs are an exception: they use partially endian
> specific types, which prevents the QMI interface from being extended to
> support big endian systems.
> 
> Update the two affected ath12k QMI structs to use CPU order types instead.
> This is required because the QMI interface is being extended to support big
> endian system, and that support depends on QMI data structures being
> defined in CPU native order.
> 
> This change:
> * preserves compatibility with existing kernels, which only support little
>    endian system
> * enables future support for big endian systems
> * aligns ath12k QMI handling with the general QMI design
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

