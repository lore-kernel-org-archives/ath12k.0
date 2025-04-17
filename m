Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF0FC369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFlHoIzjupgDoxTjH+cWDayJFNrjdRDpixbHZDBCe4k=; b=MYrG1F9J9tsZyhn0zbjT6rocZD
	VYs+CqINKMEr174hhzHDMHKGuHiU8ENr/+G0tCqABiaqLcc+KrUTXiBUUwP+4nVN0SZWtQW9CbMIF
	pAOZ5Z31xDGlkGb0y6rtrOAAgd32Q9MKdiWsPC/bg2g5VYWsi+szZQEaM7jSVudd0cut0NAZUm8hC
	bsMqUJjtwnrC/OTRE41oYV05Oj7+dE2EgOEVZStA+47xGM4l595peuH8BaPr1S8UU9iPrF2HI1Jo3
	p8Pb2eJEZ4FmmP9nh0pcCElDDP+YcgWJBKA4QqaMjqVCvl35AQFyuFcvYNYvJQIkDME0on1Kh1ECY
	2YYYIIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5H9c-0000000Bhrq-29UA;
	Thu, 17 Apr 2025 04:47:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5H9a-0000000BhrR-2KNt
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:47:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GM2ggY007118
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFlHoIzjupgDoxTjH+cWDayJFNrjdRDpixbHZDBCe4k=; b=LNWy3jej/zVVTSdT
	WeG89fV/k9+B7FcwIVzAtC+MAy6HhoCOj8FiuPMWEV33JZkpGGKeBgcqeGu6vnIa
	QiTkDDdmfDvzwnAD/VDxrVw5lVjnKU+0cy7npGbvq6R7LWOif9qdfULozMIk0WDJ
	iU6NI1fvJ1a8cjWq9uUyW4oSt8ZKhKyOesrnn7Q/8r68pRb5BaBBtTO2qBpqj4v9
	Zh5IcaNxQ1djGl69QsHkmKb332nUqp6u77OKmw9Cg5CBrBBilpFaWNTXINcRJzAJ
	6JlNKghYNcgXWl8bagtQi1J7ZgQ35kTJ1onEItssAIKTKHUo/nsQ74i5vFhr+c+8
	hpPfVg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjnkjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:47:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff68033070so316741a91.2
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744865228; x=1745470028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFlHoIzjupgDoxTjH+cWDayJFNrjdRDpixbHZDBCe4k=;
        b=ZSh+H836Peam+oRdUdP4rrLxveB60A6ONtD2iistcCLmpzuWewYu3lg2yw8p4TIJk6
         nVFue/7ftCK+zKkQrkNXrw/YfmwZg41sI6T1a6L7EOjWt3aaPSEYdZniCvg3FlX5NXAm
         w7MYQjXDY/+muE0fD3uh8XhNpTRsiAAcfe4vkG5akEer5JOQcL2qjSC7tp/9qmkJXa4W
         Q78Ixb2CjbrJKje+wKgUXDNTW1ONL/GchKBrvyuRWlp1uH4+xyf86FWcjRXcROUePr0P
         G/NiFxf48eaCJqqg1pS8zMO7dbW8OyHGh/PTtdP2/vbo60/P0tziVmsACxSWMWm4Vn+R
         xMCw==
X-Forwarded-Encrypted: i=1; AJvYcCWRmz/iM/Ad7ZoJpRFKw4EMvgVJZKllLq0G/2JiUYAppf10GEFmH0Zqwtks/ifCcx4PBts58Yo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzO/2n6HuWqgPcZgFu1eXWhMyulvewxdxOslN6CaK3WgvOTvbN1
	s9R/C3zDZekE8JlVBjlybaeuUltWXv457FzFjSbxRVgjQbi1dliNVOunwKUFLZUKsVYJzEkkI9M
	lNU1XtKV2m4/iSoolf6SfWKM74bj8+luht1v8SAZnkoeWXFeWf+gYRnLQeVp7
X-Gm-Gg: ASbGnctA+J4NAFLNDt4069TzRCkDvUcRTtjtG4JCpTCV7Dk7l9kO1CgEdW7BFZjGtbc
	d2QEojE56bDzbk3447bxoQUAFXa48DEV/eSNvYR5fQqCU9bl67IyY0iy2IKZ4+SLkc1RAKFgYz0
	ZjHs/4YsFiJ+I3Mc6dQWy7Jy4J1RBda6UCg059xB8YKmHLX+yXE4d3NuMa9HNi72Gwzlk8FMidK
	gOXDIo288MsfcqnbevLuigTs9MJ1B23nhlr+qzfkxL1w3hXVYXDuLizHbGjjfWefj1yeRF5jcPi
	B9vaOaivGZC5w+2YqwoN6loxeNqBVtn0Erji1WLGzhQmyq61j0bP7w==
X-Received: by 2002:a17:90b:520a:b0:2fe:b907:3b05 with SMTP id 98e67ed59e1d1-3086416f4dbmr6641868a91.29.1744865228265;
        Wed, 16 Apr 2025 21:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS8HqQgRJJ+ClcJyzwKwU9DqAukD1WSTXYMhVy8bq7bnit/LMG8kH73H2ihwINMxe0cy69Zw==
X-Received: by 2002:a17:90b:520a:b0:2fe:b907:3b05 with SMTP id 98e67ed59e1d1-3086416f4dbmr6641853a91.29.1744865227955;
        Wed, 16 Apr 2025 21:47:07 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861365f2asm2590782a91.45.2025.04.16.21.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:47:07 -0700 (PDT)
Message-ID: <e9db4da3-136b-3c70-0ff9-feeea08d409d@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:17:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix the QoS control field offset
 to build QoS header
Content-Language: en-US
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
References: <20250415184102.2707300-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250415184102.2707300-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -K-Dx5pfshn496PXpZ1BQlFsYoMZPEGf
X-Proofpoint-ORIG-GUID: -K-Dx5pfshn496PXpZ1BQlFsYoMZPEGf
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=680087cd cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=a1qPrsHmoJbHl_s4WroA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=485 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_214710_718962_790FF6DE 
X-CRM114-Status: GOOD (  10.02  )
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



On 4/16/2025 12:11 AM, Nithyanantham Paramasivam wrote:
> From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> 
> Currently, in the mac80211 layer, received EAPOL packets are dropped
> when the HT control field is present in the QoS header. This issue
> arises due to an incorrect QoS control field offset used to build
> the QoS header in the MSDU data, leading to a corrupted header in the
> mac80211 layer. This issue also applies to other frames that contain
> the QoS control field, such as QoS data or Null frames. To resolve
> this, use ieee80211_get_qos_ctl() to obtain the correct QoS control
> offset from the MSDU data. Additionally, ensure the QoS control header
> is copied in little-endian format within the MSDU data.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

