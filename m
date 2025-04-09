Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE31C36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1X6BikGeQC9ltRy8Ygd8U3o4+vQ/nGrtJz0JxdCpMc=; b=1H7VvsrqUhFxeEny2fjGVtFpbq
	eoFxm+VZ0lshPgNCeClHpNUP7giJibZ7IPFSwqlh2J2Kua7j1udsS5RkyEXAVVjmXglS7KYPL2snY
	R2/gxn7QpSUHDb/AeMwfvTPImEY8++1OqTRkrH+7Grqz/Buy/AvZucZ58zKnAFf13eAThPBLqRe08
	kx/kiLzkEZB8AWrne7E5u77YMnH00PYV+e8eTtXgccUlSBFDgiL00n8md2jidjidSdVGiU/N+NYIB
	fuD8iRQYA+xrSi9iC1mh+iqJbgvAds92QmJBVD54/tWwEfBZC+td6vzzwyQ5fOPgMtKxp7y2bpBQC
	+Qp7xE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PGo-00000006KQy-0QYA
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 06:50:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PG2-00000006KLT-1b4b
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 06:49:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZ3DJ023318
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 06:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1X6BikGeQC9ltRy8Ygd8U3o4+vQ/nGrtJz0JxdCpMc=; b=YAUkYrCDA6NhWrHF
	kfZXM3EcUsWbyCH6xBfTA4QSvtpu3vir7HZIAjfCzsZJKuLWaS1FokaT4kMsqkxn
	VEWZJfpN62v8+M5XofIB5BT12d81jCjyf5hgyKrBfQa5s0lfIqBOzkVE+ySjCeJJ
	BrmJ+07bZa/bntxX2hYRfvNFaS6bquGw4EFerJkCUwkL5vFhYhbI2AfiIex5Tnm2
	RWsPI5ncrRknWK7vjWLZRKS+NzVWifjUNSCS02Y4b5I4EwQuAxOC2eWQZCY2YxWe
	Yq1vC3FjBB2kUZlKMs30uJb8qzYZ9rlt/r1vEgxJji+bfL+on6Y31SEJ0W3ghlsc
	KMqCDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd02dja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 06:49:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224192ff68bso59420435ad.1
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 23:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181396; x=1744786196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1X6BikGeQC9ltRy8Ygd8U3o4+vQ/nGrtJz0JxdCpMc=;
        b=qIZiWHVryjVBfnHHrtSW6y6GJJ3c9tATHF1RdmzN+lkveGMsmYdN4eB/bMdX4/0MHA
         3Sh9oJBLF0m9xj6udCurvupFe9tyHpvvOcqupRj3b1qBxdluuGZXacAmSZjgqiLi2yp1
         U2cIAMspJWtmZzk8EDSTzkU/ge990TKzSOEY2GTOfA5tzkcsvNiP68Pmf/PTYd9qqAPx
         pbz6yealPOlJ6Cfc3ehImw3XNTPrlCMvXk3ZDxaSZPr7kuSKbPEMBp2qKRxIWXDFHYC7
         Z4KcM/QZ7dM/QeR2kZfqBrf96JYidmgcm70I19e7ArlpRKvsGE4aruGaq0w9Go2vUPWP
         suew==
X-Forwarded-Encrypted: i=1; AJvYcCU6zVCvyUKYsf0c2kEeqPjOZKn4ft+FTlhx8acfPC1ELziFjE61tCISbPIUwufALUvwlV+jKH8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm+BJ4uhzB/2ODow4nTr78ECM7BKpgNUxJXaLn2bU9RyQwxbLP
	ARNlNS11MRC/ajY070uZQrAIWVbYUChgK/aP77aA1a8KQ/coztA8PZlJCc2U65bysnSPATENeKC
	gAD9ayXO2aMV3nZr0cJkeo1eF7hUZRboegQnifTSmgdMGzkYGwhWbvJesgO1c
X-Gm-Gg: ASbGncsarBRgevkhC2LSPghAAd9lFsDvw9j38UvydI6kZpRAhwNmtrxovqKMM78BeQH
	sarMn0m0Da0SgX2sqKRVZDVCCDOMFNak44aIJvZodJX/WHSj2TFaUJ3n49jlxRZ9c+rsskszAeT
	u38atnsfi8O6oMZZ3g2jYxHrkFKCqJrMgYh+TQa7/Mq+4HPW3g3ibcsWyEvmuv/QxjJF4TtK/Z6
	qVDCfQ2tbpkpXf0lxMJ7o7REE3uUFU2Fm0y8G5uFVFyjrkLeQ5gFsqFKTsq3Ob3iJzsSiwbz2Vo
	cJpayDfGFBu93DwgC9WO9+0YF+i+htmgzQbDf73Q0mF6mGNOkM0OpQ==
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr23569895ad.45.1744181396005;
        Tue, 08 Apr 2025 23:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHFwN1/kCHRF5sXa5SM37WwiipqMAdARvPFhd5rtpSdJKbrCoft3tNyz1ggfv85MoIGpUZSA==
X-Received: by 2002:a17:902:d4c9:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22ac2c266bfmr23569495ad.45.1744181395147;
        Tue, 08 Apr 2025 23:49:55 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c99f23sm4308925ad.154.2025.04.08.23.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 23:49:54 -0700 (PDT)
Message-ID: <b9b89ff9-aa34-aeb6-53f5-153c87f8ef4a@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:19:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: avoid multiple skb_cb fetch in
 ath12k_mac_mgmt_tx_wmi()
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
 <20250406092214.3602182-3-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250406092214.3602182-3-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YTuCs71fzNIdHXqtQ1usG2D09Qf6KLF2
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f61895 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WCOpYE3sKWxYynmXVT0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: YTuCs71fzNIdHXqtQ1usG2D09Qf6KLF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=752 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234958_562177_871F2484 
X-CRM114-Status: UNSURE (   8.54  )
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



On 4/6/2025 2:52 PM, Rameshkumar Sundaram wrote:
> ath12k_mac_mgmt_tx_wmi() fetches ath12k's skb_cb space multiple times from
> TX skb which is redundant operation. Save the skb_cb in a local pointer
> and use the same instead.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

