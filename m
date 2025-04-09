Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B15C36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGopHc8M8UiNAurUBT8tbmUjbBdi9nDkUm7yBzqMldo=; b=xNpI2cUHoIIpc4y/M4FKrvC9B0
	CtZ21RskgWZ2LWeJT1aps8woCrjB22B3ozHY4juFp90uct2hEJp9JzX93ynlzkGTMy2AGqO6xs1l5
	dffRXf6I6NBf6EK0xtj4Q3Sa+xSebyQxqa4t8Q/8U4dEW+goqhVL7yEpkxosPM+V2bjc4bJfBnMdn
	COK3rGVTE074iPGOA9DbwnfGEc9bPeiwjCA3M2MX3ufQy8OzLene6tAV4Esk7ed1HcSFob9fhnRf9
	OlYBAr3+QgqzTMBrrWyTySi6JOzaQxg0IhfYs1HwC0vpbVddRwOHxXHD8K4Rpajh38zGP8JBsYqnF
	DspKZ+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PmZ-00000006Pup-47KP
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 07:23:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PmW-00000006PuN-27L4
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 07:23:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZLU1024169
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 07:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGopHc8M8UiNAurUBT8tbmUjbBdi9nDkUm7yBzqMldo=; b=mdIUS0XTGKVtMDDZ
	H3rvzGmwgrXrm0T+Ydx0KIFg4NI2TDT+27Tbt9YZPKsjs9KVZefnbr+ncxFBDT8v
	FYtXZhJst6HFgzfiA2ivQcYdB1j/kmdwU8ddd/nB9kqqhZCvCWTYT4rOajx1rSAc
	engn+O6tC1NNQN8/fFVjvIWWQtmgaFPfIjdUmpkp/MNAvyC2PgdwsgMKL2tr/GzS
	VZ04VabI3LwSQkl7TwFovkANnzI+50ONEVzBgLrd+lgV5/QiObXdjeCMvFB9DTeL
	lbTZdkCKvCDGCm8IG9WgMBPZODiNe0YZIOYhpSBEEAT8c7WNGKbbLRBBQHJHeVxP
	uyLWFw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkjb4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 07:23:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739764217ecso461738b3a.0
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 00:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183410; x=1744788210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGopHc8M8UiNAurUBT8tbmUjbBdi9nDkUm7yBzqMldo=;
        b=GAya6mE1D48IOouoVdTgENb69BmjBpSiwhEpFs0qe445xLmVaVwARuSDrgzi+GhlmM
         5PS9SkYGmfOGy6I85YcZ7N3drjtrRGIfpwSJ1+8IKdrSh1sx1rjLdBPHCZIjRpTY1mmD
         oyx6Q8Eo5oag7X4vPGMUzItyuTb0G4eYGpuhXXOFUqC2eFssYqNsek1ypLg0WwyfEinm
         j9/7iiIE6IC79Cw9DNCuUic1q7BoCQieb9ceWWhrpcupoU7d/fKr/d/53VtcQ3/cV9BU
         aDM5OQRynKWybAwfLIbTG6gGtCooUdmL4iOilY6Qj/gaAyFZab6nEVeE82xQgqpyYQNx
         80AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqFiYoiWAh3hDg/z3gspqpFuHyikIRu7LA0RRrq+oXi/kdYib8Q5oQsuD0RwPB4+PE+wmqd68=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6DBQixzk69zEMrtwcBc/UrwgMFqTN1ijLTDraY31l/jNlLmy0
	9lE7+X6+bM214UjShzKGMD4/GNb+m/w3Puha/dLBP9LveS3f9bPOI6M7OhmUjidwNkV//3Q2kOl
	OJf5VqHBsnMY4qahw7eeJyVhk900cQUwAe14AGWGdQNov+Wbzetrmt3wmXAWy
X-Gm-Gg: ASbGncvIKNY5f8L5xK1b02B/SArZPvCA3zM2wHzGAVQjuKUFBWJCpZauiT3k0X0UIkE
	nqnknQync9m3BGNws2n043MEZBzEsY65ED5ay7CWqHlXZYFRp/Z+WxTtYV+mhRk3WE5hJEORSn0
	MeL/cn7FTQsaTNExDWMGGHmzIevCSsrQSCQNmi7Y1C2tQmp0FRJcE7vTBVy7Ya9H4E0nBB5+8uG
	RYryIZuXTYYEdEadc0pRh0/V/RWup8GE3NN8hyMq6i43rQDQr/gDT4XZyYzxzQ2U4BF4xOOlKU2
	kubxJXE4vIuQH8oJ+fvGEwFsicsE4ELvot7kAKh428u1s086Ed63tw==
X-Received: by 2002:a05:6a00:18a5:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73bae3ff744mr3170245b3a.2.1744183410025;
        Wed, 09 Apr 2025 00:23:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPtgVisc7CCOafLf1M/gX+5QZW2iaobdlIZE4fEYvLA2WNor2YEuBrLxps+jQ8y/aA3Q6YcQ==
X-Received: by 2002:a05:6a00:18a5:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73bae3ff744mr3170201b3a.2.1744183409441;
        Wed, 09 Apr 2025 00:23:29 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2afefsm619328b3a.16.2025.04.09.00.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:23:29 -0700 (PDT)
Message-ID: <7378fa5d-5495-ec0e-9f15-6aa7e63d204e@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:53:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix cleanup path after mhi init
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uTmghz316EGNJjcs0by4Hlz_UJ0gk1iD
X-Proofpoint-ORIG-GUID: uTmghz316EGNJjcs0by4Hlz_UJ0gk1iD
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f62073 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QRlmjJKdkydlmUMDs2wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_002333_153870_CDFBA03A 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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



On 4/3/2025 3:34 PM, Raj Kumar Bhagat wrote:
> Currently, the 'err_pci_msi_free' label is misplaced, causing the cleanup
> sequence to be incorrect. Fix this by moving the 'err_pci_msi_free' label
> to the correct position after 'err_irq_affinity_cleanup'.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a3012f206d07 ("wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector")
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

