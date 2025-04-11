Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7343EC369A8
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiiequRrKcm+lo+qIl2btPR525geysQq/gH0qcu5+2I=; b=qyTd9SwFXtiGinWc8f3nv9HSiR
	FRPUwKus5sGuuoBOFKjRLgjtaBkNzqxQvgzEw+y9xhg3vdxYkkWvZmcdTJdbQHzhffzmrxpfTBZ90
	4hT9ae4y+0n868CM7HxdidSaubaajLw0NInNZNwOBFFQbLF1jrGO9qx8n2oQ2+E/d6BM2sRUC+zVT
	UnzKiDG50AX9ztHhPGg2K2ZEb/AMSyye36BMmBFeKeyGKubQlIPTIs6YeWkORtY2vIkxaKhH6RAx1
	L3/f/aZzmJLahMfx/9s0Dpmlzl9RMGG6h/HcEvYWHvjkYuhvw3X9TSabx3mU5yaeR1dR3Wk3DlwMH
	8ZEm/PSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qE-0000000CrxW-0pv7
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 07:30:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38J9-0000000Cncn-3yP3
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:56:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5pqtU017273
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CiiequRrKcm+lo+qIl2btPR525geysQq/gH0qcu5+2I=; b=YuAFOCv8L7iVDDEm
	6oB2oUXzQltKca/AdA7udmr5DhpFpu6Z9qYILyxc6ZAbRNCalSRpJiOYye/LNP/8
	wxPIE2xV9Ux63hXR59J2N/noklMyj0XJK9H5Ym77gVWImacf9ejWAQFeutATWElh
	g4JRM7aLbobKTgKVp+eGXyn/KV/WtvL7DSF9qhJTOh+I4cLSV/N+oS5qlLjY3+4r
	+rYMXZ3+pqrMOQEBEv2aU/D4WnKEIh4gs9XoiaNNUp6l16SdfyRPDf4ZxAssaltN
	LOlLh4UzO56j83/CldIZKylQSQ1Lwn+v/UNIHHVS0iFQs0EP8VIt2jfmYtuHm09p
	6bxjdA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1s9u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:56:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff62f96b10so2319260a91.0
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354569; x=1744959369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CiiequRrKcm+lo+qIl2btPR525geysQq/gH0qcu5+2I=;
        b=F6vnuwclIZxEBYPAcGSaD0qGbn42/2PUWcB0HjbYvUA8ix/91S2deh9zc3Kw/sQpLW
         ARTo+dylyoazLftgT/daf9bj5raqLV5Zf0g11yayevKAb0ATBAJODWnmXk/EU+Y3zDQD
         sXYuCn5Tt+2DNHIzSJCA1znlMlin/kZxQenLJBudodr1/ot4fV0s94SGFp7wJjx9KsRe
         CvFQz9HnVtKH0oGinNBcM/HbKEZV3r9yvBvoTycKE0bsJ36h/uhfPvPstopYvlXDHInv
         IxeDrxM0wVj16M3dTyBBc3yiY5fJUDXFNGetbMm9JMAd1Ik4dPGXtDWHHc9toq3jinei
         Y1Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWtevfxFGC6+8EKHqECPxYW0m5QYoo/l8Y+qFtfFTWuwUFazQKd2kSFcNKnussiyhmPUslPbs4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdWqXC3txflcCvVY5TvrFXa6AJ3STP8tpZ7qxNBICqyK17THtr
	ESRA2glomXSCN/shmTXpeTs91vSNf01rau9m3nwY0SXoraOojvJ6ZQyt4aXxYCB7YpFHkNVabWQ
	jp/u0ybWWf6fJ3E2bVEf5qOfGMqAS2H1lHZCIN9erDRp6DgpXMsRkfe5Q0MEs
X-Gm-Gg: ASbGncsNU7RCOAiFg4QI7AHK5z6FQXc2ih5HPNuXbNjx16wvuoYFWZjJI7o4tbTUFYL
	ZHdwWR28VviRjnlONE3wyipUSQ6GMQObKkZJXS0yGNCKmtZ4jkyf/KwJRfmLrZ64ydN9FfpAOb9
	9MBvbvKBm6+pJ0p/9M+7Ri9+b4SdnsA2ZTbB+03sZv7qlaXpeY0T0vWFJpFR7zNfs039I3t66V1
	+7poj3EpaWOFCrenaJeSwj6dsGx+E+/OIEzxvaOxjfIIvG8Zx2XzsAL85HdgJP8nd5a8WNOl9Ew
	OrqzvL2S9TqyL3z1vL6sBHz8dCg1B2n6Q8sjWMhioJG/i6NIGbpCZQ==
X-Received: by 2002:a17:90b:270d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-30823642a6bmr2614623a91.10.1744354569150;
        Thu, 10 Apr 2025 23:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpzI1X/jSBvldR6lCh+yFWg82aMisBzy3PEVWIcLBVGeaKXJVbXpIhAAcQZ1Q5KR0dTZP3lQ==
X-Received: by 2002:a17:90b:270d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-30823642a6bmr2614585a91.10.1744354568694;
        Thu, 10 Apr 2025 23:56:08 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7caf86csm41951135ad.164.2025.04.10.23.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:56:08 -0700 (PDT)
Message-ID: <c94a03e4-ac96-4598-faeb-49a07f6011ce@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:26:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3 2/4] wifi: ath12k: Refactor tx descriptor
 handling in tx completion handler
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
 <20250411060154.1388159-3-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411060154.1388159-3-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TUxaTxZ4ZtXL47ElPL3w6Z_DhG6euie6
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f8bd0a cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=oqcirPVkTUn42Gpn5_sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TUxaTxZ4ZtXL47ElPL3w6Z_DhG6euie6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=765 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_235612_174145_83D68384 
X-CRM114-Status: GOOD (  10.17  )
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



On 4/11/2025 11:31 AM, P Praneesh wrote:
> Current code uses mac_id and msdu parameters in ath12k_dp_tx_free_txbuf()
> and ath12k_dp_tx_process_htt_tx_complete(). Since these parameters are
> already encapsulated by struct ath12k_dp_tx_desc, passing them individually
> results in redundant arguments.
> 
> Introduce struct ath12k_tx_desc_params to capture the skb, mac_id, and pass
> it to the corresponding functions. Refactor these functions to use struct
> ath12k_tx_desc_params instead, reducing the number of arguments and improving
> function argument handling efficiency. Additionally, use struct
> ath12k_tx_desc_params in ath12k_dp_tx_htt_tx_complete_buf() and
> ath12k_dp_tx_complete_msdu(), which will be utilized for fetching extended skb
> in a future patch.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

