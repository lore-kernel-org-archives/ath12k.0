Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CC7C02182
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 05:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KxAlIlTN5tW2PBBCeWxdNPXxY7BHWSF4JL49sTdJkQ=; b=dp2T0hYmS8228lJz5oFAcXyGAd
	NNhBRpD+b3k+S7W5XzlsQ9YuN6tw/c0uuNS5hTfzKtWK0gCEpQaWYurQDfVWZK0bU5ws/HuKqvMLA
	Li07XQKkAxQahHHeAN8V87ByoFNkgdMv6VsjtH9PRjpgC8SndJO/UhZrodJ0f1xk1p5QdXrxhjAak
	bRLGVrDDPzBh5/k+zH2DkTjDWzFj2sm8Tu82uxjGvX8WvZJqFLi0Hi4TeQiIHqqQWkiJsxq5ZMoE+
	ZdeVh0DXSGeRGnhwAoABbDn1wt5afqGXjAb/0DfShUm8EYIrN4rD1rjPmP8YPmk5EI9F7yIT+ptVr
	gFsIiZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYhf-0000000G27v-1Se0
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 05:27:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYhc-0000000G27c-1o2d
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 05:27:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P4aSPW010731
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 05:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KxAlIlTN5tW2PBBCeWxdNPXxY7BHWSF4JL49sTdJkQ=; b=FPI7eKjS+tjk7v9V
	+GETgnNJLtECBAT0O1DJHhAdUXtWTgDf8nCt1AnQhXTVMi1whbDnoyzR74NmmQw6
	TjGQYgNRsXE1wzhj79gQoHauK98lRohOjFOprjnLpmiM7zzmU5X3lbJAgqZP9+P6
	P04RYmKuIbO636kDlG/0osvQGvSl3b+ToY6q8YB0BfTBxJ/CTXfGTBt5DF629pEm
	P4xnyDZNVcxGUEq+Z7ZVblGYR7fIrEF18dVwcszOj7A9f3rVgRWikis7bji90Wfa
	ZBV9nqp4nTkMxchtpXiRqktKOCaM9lmVKeGgn2bXvYtPu0j8Qsc7GVO1qP5x9V5o
	dQSdKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs2v81sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 05:27:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2163dc0f5dbso55478965ad.2
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 21:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737782846; x=1738387646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KxAlIlTN5tW2PBBCeWxdNPXxY7BHWSF4JL49sTdJkQ=;
        b=xBAf5iSPztXX/IBDbxdeRhden7GVSW+JPaRh08Fj4DzA+RwOGUC6ziwD65mg6EJgUh
         6wTj00vLQlJLP5mYIf2Ee6CoSXxeQlcBccQwEk+ZrLHLD0s9g5yg5FT0lnRTe5cjSfx4
         5pG1NNqVML2k6lppHOOFNFRATTn7kvVNI04iSQMs5YaPLHgaBjQ6D1+mL43BrhvoWg3Q
         U25KgNoq+zxNGLqHDjptqT4fGqu3J0LP6+H8oiUxcx9cJYptaO6KXXj9nu/EOu411oCQ
         XFxT+HDSRwRoADrsIdSEIo6WozoJKoBS9lYqukG/Ny2X4p9GYLdaDupVb9a9F9Tv1y6s
         eRYA==
X-Forwarded-Encrypted: i=1; AJvYcCVuAlb/Vfuh0Wl1CejZbnD4uVRgemvv/ecNK1wm/KUaBTNl06RGbTtpdYbVN8ZxXKqL5VZ34Qc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVi6vX65Jmao/Bhg2fAkigDSVXLnsgBw91KmPPeV+8kU9WYMEq
	noGsBBK7nh2402DWWKa/qRm715uWDAmJJX5+EpzK3xgNYGbSH2yNxESLYOjgUYDLBrR61CECXgu
	vfgaz7lIG+3DXenGjUOONgVPc4cEuHLl8+HWy3MdQ4EbJxx4bL+jKaxbxvuCN
X-Gm-Gg: ASbGncsI5TjCGBd4xqn04lbaiYaTVp2lIbwysNdAloCGriAz4UYnb23hWTIv1FN1Q0D
	RKpAPxGFCrbqyIbloqxQ7rmkubjATahVB1M/Rdx+7dgctj6OZbbHrxIQ1fHafVlL4ocFMLnU0TT
	ZrFn+G7N0MgVXWOg+4/KDmr4yom2nBrpFvtwsykEcoJBL9B1iG8Hno/WqFIpSW5oPnEO1zKQCi2
	xN/ZbSD5sO+Et3pqkIeXZe6AT6JsQ6MbQ/c84uDIEcMKal1gr4VldbAEvae6UHAIWYEm6aZc+N2
	Tis/MStsbj9LUP22/O016Pm7lcqkj3U/0W0L5Pih3A==
X-Received: by 2002:a05:6a20:9190:b0:1e1:afa9:d39b with SMTP id adf61e73a8af0-1eb2144d760mr58569289637.7.1737782846121;
        Fri, 24 Jan 2025 21:27:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaSY+UeSNQL5fnUwi85JsWps1wE3/+J9w411GaYp0W0+wqoHuvsswwyv/6i/D/p8PqiRhYZg==
X-Received: by 2002:a05:6a20:9190:b0:1e1:afa9:d39b with SMTP id adf61e73a8af0-1eb2144d760mr58569264637.7.1737782845732;
        Fri, 24 Jan 2025 21:27:25 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d234fsm2871300b3a.77.2025.01.24.21.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 21:27:25 -0800 (PST)
Message-ID: <b64b7d12-67ab-4424-aefa-f1c95b32040f@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 10:57:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: Request pdev stats from firmware
To: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124185330.1244585-1-ramya.gnanasekar@oss.qualcomm.com>
 <20250124185330.1244585-4-ramya.gnanasekar@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250124185330.1244585-4-ramya.gnanasekar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rpGfQxlcQtz6Z8RMAOy4vEXe3Pt9938L
X-Proofpoint-GUID: rpGfQxlcQtz6Z8RMAOy4vEXe3Pt9938L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501250035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_212728_602011_DB5FDB05 
X-CRM114-Status: UNSURE (   9.73  )
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

On 1/25/25 00:23, Ramya Gnanasekar wrote:
> Add support to request pdev stats from firmware through WMI and
> print the information
> 
> Sample Output:
> -------------
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/fw_stats/pdev_stats
> 
>               ath12k PDEV stats
>               =================
> 
>             Channel noise floor        -85
>                Channel TX power        126
>                  TX frame count          0
>                  RX frame count       8637
>                  RX clear count      37424
>                     Cycle count    4372024
>                 PHY error count          0
>                  soc drop count          0
> 
>            ath12k PDEV TX stats
>            ====================
> 
>              HTT cookies queued          0
>               HTT cookies disp.          0
>                     MSDU queued          0
>                     MPDU queued          0
>                   MSDUs dropped          0
>                    Local enqued          0
>                     Local freed          0
>                       HW queued          0
>                    PPDUs reaped          0
>                   Num underruns          0
>                   PPDUs cleaned          0
>                  MPDUs requeued          0
>               Excessive retries          0
>                         HW rate          0
>             Sched self triggers          0
>       Dropped due to SW retries          0
>         Illegal rate phy errors          0
>          PDEV continuous xretry          0
>                      TX timeout          9
>                     PDEV resets          0
>   Stateless TIDs alloc failures          0
>                    PHY underrun          0
>    MPDU is more than txop limit          0
> 
>            ath12k PDEV RX stats
>            ====================
> 
>           Mid PPDU route change          0
>         Tot. number of statuses          0
>          Extra frags on rings 0          0
>          Extra frags on rings 1          0
>          Extra frags on rings 2          0
>          Extra frags on rings 3          0
>          MSDUs delivered to HTT          0
>          MPDUs delivered to HTT          0
>        MSDUs delivered to stack          0
>        MPDUs delivered to stack          0
>                 Oversized AMSUs          0
>                      PHY errors          0
>                PHY errors drops          0
>     MPDU errors (FCS, MIC, ENC)          0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ramya Gnanasekar<ramya.gnanasekar@oss.qualcomm.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

