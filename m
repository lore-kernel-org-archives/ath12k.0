Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1DBCCD194
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER6YjiFcA/feKYSmRBazTonHCxX76/YneCj8QGblsHY=; b=27ZOFbqgsB8T3Z+hGpWssBiuAP
	MjciW6W6pWS6b79B1XTSnKvxyQms3KjxmU4YSy9yk6J512EPnakmYECL9vrzXFPQrY4xGDzFCxkJT
	10BY3vuKUp4oQlBGPSYOurZIQJyI/U7hP06de8a0hV3kfd7rk39cXeke3ZSWZBvUAfHPDJik7kN6s
	vrQHExzR3VdZcx8fAHvo2GLNzjsXIQeQRKgzKF1RNXGKAIAuBnsr1cI8T6tr9D1+5JOWbGtvZrCjP
	QRlyBpy+sWCstaP7JrCUwPmALdOghCU68znit544+2VAMfBJ2+7PfKe33zLFuK8WYmyHiNX2ot3xw
	JJiSAjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94yR-00000002Ooj-33G5;
	Wed, 15 Oct 2025 17:07:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94yP-00000002OoO-0Yan
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 17:07:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAbA9W003992
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 17:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ER6YjiFcA/feKYSmRBazTonHCxX76/YneCj8QGblsHY=; b=URUdFlNdJxsZyKXc
	UWhSzSq2sisC4t4NDpbZjt+g2VWWdn873bD3T0sfaE6sMy3M6IRARO+aRMwJF21a
	6eFdUbbt+4XW8D6CKDPFWqxzSD6HscBP+MWfEALRlddaPcnCmgOBpT5lTDGx9o3n
	yGZIj14eWf8iaUnYD1c+KqgCt4YEw+I+H2dtO7am33Ze1BDSYoXEiZDLQVgouht3
	bI8i8Sf3pCflaX+J/3QPvvasl3nJXSrL8m4oE610VKw41q518G1KfEyzYqgfUdn9
	HFw9hEZGHHyex5/mBnN2x7Fic8Yd9PkK2zl7TJr1toVNlogTo3Rlmr7MCTXYxY5Y
	R8qbKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwqm0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 17:07:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2908ce6ae6fso8320725ad.2
        for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 10:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760548055; x=1761152855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ER6YjiFcA/feKYSmRBazTonHCxX76/YneCj8QGblsHY=;
        b=vVQq6nkfN9EKO3s3Ed8Vmaqddl+ZXwfgoYEP7OkLRTfHVyOvx0JuwDhZTQRc3OTWFQ
         SxbGl3AkQpE5UTo5/rEKfi5YtrpwPD7+OlJdsew31PKsdkoHxDxthUqGCJO7lRxr2kKN
         EDJLRvvNnRiup8rtg9nWnZx+tgvHHTNm6FUKOGUkG3dCqAT7RVeSwPSwNIowMbeA7nSP
         q7d3C1C5M6E+m2KNgvnu/mh55UGou9Fi9V3FeWHYKMsmChP3bqVh57kzcFZHb9x7KZQp
         Uo+Q1DM2gpwys6OuWMC+0YadpOt2tN/NUQZz0KLOXuKQObADkfZ6AtP3S5XBsNIOGC3K
         reaA==
X-Forwarded-Encrypted: i=1; AJvYcCUEHWpVWzF5l/ZeS4oj/t0OD07590qaXhif3UO3+qypCYKBP628LzHWAuiwXYjLYm6iEP16iiE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIYqfQ43iSHk82PKBi2YVf3GIM8YxD81o6h6k5LufOMJI+7MMO
	HktcKUuS7b5E0cW99CU2zUrSNiHV4BsSptss9RwHkZ/muOh+7yxbUCMiBFOcez1VGe3fo/fpmeD
	nPycSE5tki6i3JLP6Ven0E7NCH0akJPJ4M0V5GaNCu453v8q9osYecEn53RY97dQ9oVb/lEBF
X-Gm-Gg: ASbGncvumflp5PDZny1UQiRddfKwGwPeMGPWYerLUTxJRpK4uwL9p0YfFW1T/0sXBHG
	Ai4rGlZavrRosngEtKk8z8j1EvnMc2q0DO4uJNfKzgG44zjkPdyg6toBnMuN6Xc18Fgi31ZuT7h
	lHzdOBFbCbc9VffwLvhq1+/gOwO9gh4Cw4W4Jwerj9xIcMQaUBbRSEBl0IafgXrEQWS8R2dNHQr
	0euYqtCy94y/xhL+SsQfeYGpaWR2tUYPmd4A8NM/vNn1amM4vXuhYGSH6IMwY0cmEhF7VxmPdNm
	61OKO14Nb75eD53DkcLkYpxzqk+oghCLlBLCH1qRObTvBuy+SfB5Cm1PIUdNKcWkWxaET+SCR4V
	SBFUlFLBYSMluCMY2
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id d9443c01a7336-290272dfbb7mr394959265ad.49.1760548054912;
        Wed, 15 Oct 2025 10:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgGw0sx4mATQvCFsp3O8qgC1svgO52zfnOuDR7jXODkOc9aPTnPuCr2kjWyVg7AaI2zq9rxA==
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id d9443c01a7336-290272dfbb7mr394958955ad.49.1760548054273;
        Wed, 15 Oct 2025 10:07:34 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.230.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909934fde5sm1903185ad.41.2025.10.15.10.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 10:07:33 -0700 (PDT)
Message-ID: <0d600a3a-4c7a-3637-380a-e23db8fe74d3@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 22:37:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NSS value update in
 ext_rx_stats
Content-Language: en-US
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251007133332.1092178-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251007133332.1092178-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX4etfxiYRLpnO
 pQ0rxOkQLhUyHSxmmalMafRcmuKOP2bdC8u07MfCFc27p/8zXCUnxFwLN2yovyNNa/eP9FB0A3z
 ncBDoZX8tFyEn+7dfHSwfQZaT9IMpgE0L7sdGJkum+G+UC30h7aFMEtLjLKWnpQ2OkGLmrYOskZ
 /Ze8RcGfhAT0X6oyyTLjerayGQ3phG4IhcV5+97CkNPmagAbt3+GLjPxK7k72Natqq5M95SulW/
 9Hnd9uI/rx3gX//JMhgfgNlsOsCuNw89PVAjiFacpU8JHVYsbmG7rjbS2dkCZVPO/S9ZIraS7P+
 kyZxGFu2kEvxOuPtO2iFxDV1eGXlGxFHSuMPTBRFxmwkk9qqo93sXCjgTa6k/VkLuex3RG5DTtV
 u3w6mlrLWPCiKUqyBPkYt9eelOSB3g==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68efd4d8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ywaSrutoL1r6B8MZccleLQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Zs9DEkr-8YzyMXDGHikA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BmR1m0pH74h7qUGwAR1nd_m051bOSQgA
X-Proofpoint-ORIG-GUID: BmR1m0pH74h7qUGwAR1nd_m051bOSQgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_100737_203388_0FEC23A5 
X-CRM114-Status: UNSURE (   9.91  )
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



On 10/7/2025 7:03 PM, Thiraviyam Mariyappan wrote:
> Currently, in ext_rx_stats, the NSS value is taken directly from
> the firmware, which results in incorrect mapping:
>          4x4, 3x3, 2x2, 1x1 SS are incorrectly updated as 3x3, 2x2,
> 1x1, 0x0 SS respectively.
> 
> Fix the issue by incrementing the NSS value by 1 while updating
> the PPDU info to ensure accurate spatial stream statistics.
> 
> Remove the redundant +1 increment in the radiotap header when monitor
> mode is enabled to prevent double counting.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

