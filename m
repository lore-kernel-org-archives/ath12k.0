Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C74FC02198
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 03:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc+kij6+pE0t14MlY+EJRZoja7UejFCIx+FgUfhcgkU=; b=ND0PB0yZ487QzgoCRTFw5rXQBS
	oj9g+5u676E18hXBtquejxb7jtvYe4JfMwZNDjTKw+214iXdzfNYLozvqvdBt/iURaIPe1QNMMMNU
	ZY9X/FVj/sKczVUEMpN43yvpg56f0Vj1GShw/Oy4TO9PSEM4wmxCAjRgkOxqOWt3HkTBielO1TLzx
	+uDm94nY8/3+cAQGK0LYty/M+SlCu/zpfpgWh43Pu53izYcNQ1VKJETFaIh2qs/iVZZsP5FgC4M5u
	2y+wJdy8459EPfYScE2PK9eIzPi7KycHNvo7MGchWo5nQHEmiLU0PePRyDMHSHMTsIs9937pwO5h5
	9Lr0QO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thKYK-0000000G55d-09dd
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 03:33:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thKYH-0000000G55H-0nkx
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 03:33:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A2Lsdj011113
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 03:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tc+kij6+pE0t14MlY+EJRZoja7UejFCIx+FgUfhcgkU=; b=GiV1ooQYZi7qVDXH
	dxrqq/YhdQO0zUYJwfSucenCrfpBpLq/r5SUrFpQCtXEZquyrJNsb03bYi2Dsna7
	CrBu7TEtCPidBBXMQ/QnwyqNRMvJSk8zcWsM+LUhFkZplsSzPDSkQyE1u1zrr6Jz
	2gOQiKqa3wREQASg0sEOD6gTGATDdegCshvhIrjbIhZj5jRvsgKyA9NGaG/Eo7qB
	elAhtra2uyvi25hRd22cRPgkkmafZVWkclp6kBzaAhCRXzr4Qh3WO1yay//7Xm5/
	3vlVgq10lweBWCuuIM4G4lnEwZFEnk9tTSR9/19mAHtyy167frKTLHS0IcUXumtI
	1Dw8HA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44q8ky8472-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 03:33:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa34df4995so7060027a91.0
        for <ath12k@lists.infradead.org>; Sun, 09 Feb 2025 19:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158419; x=1739763219;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc+kij6+pE0t14MlY+EJRZoja7UejFCIx+FgUfhcgkU=;
        b=aRWM3JMlPtEQudV1DAYrHGkmuGf44Cw/9l11OeEVQARkxnlw3U6HgoFQlgEVQtIio8
         LY2DIIrR4S/YiYXrpSTLMmApf5Z5Yex9tohmkAuD9+REdGl/xkDqhDsubmn0toegBJMA
         Dx6ZfN0w2Lg1E3NVO4tOIr6baYxKI93ECJE0eEp1Izdb55ORkIE1CnRks006+ZsUUGb7
         OA0+Mwn+vH7QOLKUFHts3ptTg6SmMikdS9qcBvPcl4owphfDSi8R8oOu80iv/YuUcU+r
         SvrPxblThd/2oPPo6q56IwnRbBw8iVgnIP8tfHzHwoj1b0xixEnDoLLt/8jXtlyu7HDQ
         qjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAs67tpsTq+rbVWDKpS7UK5UBQWbIAyUR7b1ynUvYLyxcBrTPGwBE1EU7dH04lH0Mf+LZRlh0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHmGKeg3/832pcCDyu0SykOuCEfyK9yFjzk7cDaTcK4GU3RsVi
	/usUAk7eKbd/MikkOMa+94UdRjf7fveTOjmqvDxUj2NG08uWHOV6jQtlOJg7vLBnua2rqJvzbO+
	Oh9RbgpaF1qsGiABVvVZgq5emN7Ztf9V1r/9+GxkCtGUji2emBU4roF5X2orB
X-Gm-Gg: ASbGncs8aPWxo3np11TO+LAQOrRavuj5cvM3HQtwCQePnv8uFMzuyfrbddOfbv7Bnyc
	4t/ZAjD6LfLVBPPfVn3ntxgT37cLwWXRhoOGfvws8F+oNTboUBSdCizThqgrO/F+c8kDpAulBjb
	Nr+O9okMW0/1Ohq7+59O0LUqXyvqXrCCavMo3SDAjH8D5W9LPiqGCnzVQgFm/v5O3P9Kgh3fizL
	2AMDhkLq7OZGAcSEq6En7Tum5Amd0WvkIVGXsF/kWd2RgTiuc/faLIDBY8irl1VKYTgEJ5COSVi
	BNjBSSUsr3ypO523Xu+I5cmRsyJ1Zlmuy8ULmhU=
X-Received: by 2002:a05:6a00:3016:b0:725:e499:5b86 with SMTP id d2e1a72fcca58-7305d546034mr20917160b3a.20.1739158418678;
        Sun, 09 Feb 2025 19:33:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNWKz69WA1iDoZIkm4CPxi7iVaekbu8x2lRv9HMX2DcslnSjt1KSl9w6DbAHKm61c/erwkVQ==
X-Received: by 2002:a05:6a00:3016:b0:725:e499:5b86 with SMTP id d2e1a72fcca58-7305d546034mr20917126b3a.20.1739158418324;
        Sun, 09 Feb 2025 19:33:38 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f84sm6511273b3a.80.2025.02.09.19.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 19:33:38 -0800 (PST)
Message-ID: <5eede3cc-1b60-41ff-9ced-8a75107748e3@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 09:03:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix locking in error paths
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bart Van Assche <bvanassche@acm.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20250206221317.3845663-1-bvanassche@acm.org>
 <c9765212-bfb1-4b8d-80f2-7219bb4a7372@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c9765212-bfb1-4b8d-80f2-7219bb4a7372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eMme3HjOyVohzFNZXSWtuHRzkCGnBD2g
X-Proofpoint-ORIG-GUID: eMme3HjOyVohzFNZXSWtuHRzkCGnBD2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_193341_239692_19C392AF 
X-CRM114-Status: GOOD (  14.70  )
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

On 2/7/25 20:40, Jeff Johnson wrote:
> On 2/6/2025 2:13 PM, Bart Van Assche wrote:
>> If ag->mutex has been locked, unlock it before returning. If it has not
>> been locked, do not unlock it before returning. These bugs have been
>> detected by the Clang thread-safety analyzer.
>>
>> Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
>> Fixes: ee146e11b4d9 ("wifi: ath12k: refactor core start based on hardware group")
>> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> index 0606116d6b9c..212cd935e60a 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -1122,16 +1122,18 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
>>   		ath12k_core_stop(ab);
>>   		mutex_unlock(&ab->core_lock);
>>   	}
>> +	mutex_unlock(&ag->mutex);
>>   	goto exit;
>>   
>>   err_dp_free:
>>   	ath12k_dp_free(ab);
>>   	mutex_unlock(&ab->core_lock);
>> +	mutex_unlock(&ag->mutex);
>> +
>>   err_firmware_stop:
>>   	ath12k_qmi_firmware_stop(ab);
>>   
>>   exit:
>> -	mutex_unlock(&ag->mutex);
>>   	return ret;
>>   }
>>   
> 
> I made the subject a bit more descriptive in the pending branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=09a2421b6e5f617cfbeab906fa8037dda4aa95b8

Better now, thanks.


-- 
Aditya

