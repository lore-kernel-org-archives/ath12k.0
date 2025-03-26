Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202E0C28B30
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 04:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2vV/YNuPMazCXGTha4yHCmP5M+2x7nFoXODhO281M8=; b=hH5HuAz0cpgTc4u1hDPTzg37GN
	ZCiXBYalcWGWlDGfeciGzB5pw9ncl3NkXlkyo32RG7l1/gwiY44XiRMBcdDNaO+Utt6wfguqq7WFX
	Qf1BmVLrYPuYfbP5KtW8QCp46YzvdDkt8vBXwH7e7uVa53ulso29Y/LnVt+r/itN75pTnPLlZebkl
	fxC29lx5CUC/Ph6hzKiuhz00ldB7t8qtE0Zp0G0lWs/yQB3X3HAbZNExtUMWVcAK+QChv9l43MOLe
	R1XeEsZPWpBja3/gvsw1e5/c2bTbeK4qLhuYBmc+XZJOH6spWcX9qeZNCmojLnFNGBzq1fO9/1Rg/
	J/9K7KXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txIOZ-00000007Xws-3fNa
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 04:29:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txIOX-00000007XwV-2VK1
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 04:29:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q18FQc007471
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 04:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2vV/YNuPMazCXGTha4yHCmP5M+2x7nFoXODhO281M8=; b=bd/j6VUhLR411mxX
	q8XGlOLfd2Mb1Tr3MG2bbIoK6/uJ4ozK2xvOIJA6Ft9FeWcVEqw8sH6v9xV1F1D8
	Oh8VKET3Vr4K1/zdESRPGi09MJZJxjv4xvIjnGAFYs4xT5PmEYaCubcV6OZOpVVz
	TkhtQgdfOnHD5lr8Brg5pVqc/IsO5ZMNlBJWk4WeXIzyJ1CoOZPOi/Hprfse+GP9
	BBt6PSKpFmheilAvotPaVhEODutKqE1KRSErVX8s0BefgWHh1pMV5R9M0jM5c/7O
	KdhwWd8gs8oMvbnBSHQh+8Bs66GX5HHE6cugbem8PpNABtxRWEjAawGXruEIFk9L
	o5LusQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf0cgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 04:29:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227ed471999so10863305ad.3
        for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 21:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742963375; x=1743568175;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2vV/YNuPMazCXGTha4yHCmP5M+2x7nFoXODhO281M8=;
        b=w21Lqn94+wfW+MtpzSswjmrJzxeuC2keN4uNfXB6egVZOnnkl3RlK4Lx8BsgVmrvvf
         +xnO7AVKdZkgkJHpn7DZKSTI5ondbpWNZxw1bPKeIUbmNkv2NgQUrv5BjX5MVDs9GSYZ
         WcxGnxRAC95VWPIR128U8YAdAy0hA8gZIkzbWCM29CIhKfa30aN8nkF0t3ZB0c5umfdb
         I9pacuwa/oOSsQtat0xraKMRjKmQ37PMUxF35lN/0OIwWpCTYugiMRNPZkQ67TrRnIWd
         5vVKTM/MbZoEKYKjnW/4Q1Wi/uQ0PhDeEw/1vAM4rDByMea7TPkFJ+slUYqQ8M/GDN3M
         SfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWgTVK6ueg8T3hIzD5UDo89gZzJurvKfkZbvLGn6Vo8j2SjCQ4ApTy+j4HCib/GhoOxaPJ+jOI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM7tAReKNNHu8lSZ0WoYBdUUysbuGcuD98bMCvSQAleFFt+vjs
	DpLRt7pxA/67bS7imbU7DDIDLr2uBJ6VK/2v+Cm21UwKGzExo9qKzOL0dmI0+4rw2gCHETEi7i6
	V6pTkWUuPo8GEaYqalpwJL6MA+VAmsbS7s2aBihriAB1UJhBJZj2UAE1jZQVC
X-Gm-Gg: ASbGncuNtJAgVJiyKrc8m9KFh2AvT9tt0fSoSjd8DhJNcvPLWJ1vg/8Ag5+USg5b3s9
	EKwq8F9r92vN/HbdQYACuUWETXu27W6bV6p0OiNNRd9H3pOIlSNhViOpY3+ROLsZQ+dWAiD8yk1
	jQ16QdHMSeGl8lrolD9IpdI7775bme4MomuqkOwtOjmFPkvbG6bl15ikk2mdICY7phMI0WJ9Eg6
	0stPYU5O6oBRnrD+tBAs/e/D79hM8eySfcOe+/FD+b7cNIK8W1/k/m/cZJxyV8E+abJhev6coTH
	bNjUdrDQzQPnZ1wDBhuQLppETv5hGz5+pNGjvrMQfGhEPTnjU0Mn94jujNf2Vv+h
X-Received: by 2002:a17:902:d4ca:b0:223:4537:65b1 with SMTP id d9443c01a7336-22780e10a22mr293314205ad.36.1742963375312;
        Tue, 25 Mar 2025 21:29:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu9uKVox+HgHgxuBVealSCpl1kM6cDkzy79Gz9VEoiNRLHgTsPn59JlgKifX6/ISeyS9dHLw==
X-Received: by 2002:a17:902:d4ca:b0:223:4537:65b1 with SMTP id d9443c01a7336-22780e10a22mr293313975ad.36.1742963374987;
        Tue, 25 Mar 2025 21:29:34 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.123.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5b7823sm11343675a91.10.2025.03.25.21.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 21:29:34 -0700 (PDT)
Message-ID: <50395ba6-8954-66fc-9d94-a58d22606a85@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 09:59:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <b1e44988-a80c-4e60-a093-434e0834aa1a@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <b1e44988-a80c-4e60-a093-434e0834aa1a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U1CuhaV4O8Ku0khKYtX3Lu5wHNIftvnK
X-Proofpoint-GUID: U1CuhaV4O8Ku0khKYtX3Lu5wHNIftvnK
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e382b0 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fyovRE7uNSHUze5DQk8o8A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=BeArKKMxub_AxtE4Z8IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=859 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_212937_658391_2E11F085 
X-CRM114-Status: GOOD (  11.79  )
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

Adding original to and cc list back.

When replying please keep all the email addresses as in the original mail.

On 3/25/2025 12:34 PM, Raj Kumar Bhagat wrote:
> On 3/21/2025 9:53 PM, Johan Hovold wrote:
>> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
>> without an iommu (under OS control) similar to what was done for ath11k
>> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
>> DMA").
>>
>> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
>> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
>>
>> Note that the mask could possibly be extended further but unresolved DMA
>> issues with 64 GiB X Elite machines currently prevents that from being
>> tested.
>>
>> Also note that the driver is limited to 32 bits for coherent
>> allocations and that there is no need to check for errors when setting
>> masks larger than 32 bits.
>>
>> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Tested-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> 
> Validated iperf traffic on QCN9274 with FW version -
> WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 

