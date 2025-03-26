Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60208C3600E
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaWfJx73MJITf1MAGS+5QLKh97/YhkXy5JoIZnID5V8=; b=yrHJUYN0InI9xQ1dS40vRPc/OS
	4dq5OHsgtJJ+LPJmaui6wx+1IYlBlign1muZx91cwxBUj1lltcBEYtqHwlYqdd5amf761aITy7Gbh
	0f10NT8RkXnul0tuP7uYMGGrxNxg289jC50aXeoDqZtFhtP6x9W9laNy1EOAyl5SKP6KdBl5Z9DDM
	ohUUXwK7yV8YkQ4afLarb84LaRx9cOZDwKCsTZRPjCRQ39Oh+OcXwwOqXO0bfLmL1lgUXSR3w+FtI
	Hkfm2Mk1PADo3qZOBd4dcWH6wwx9UY4CDCOLBk9Q1vhC4xDbaIv3xJDCyDSkaJp2n95CaYu498I8p
	gYboCZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTDQ-00000008x6I-1yFg
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 16:02:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSsU-00000008tcx-35Od
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 15:41:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFDXbE028964
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 15:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWfJx73MJITf1MAGS+5QLKh97/YhkXy5JoIZnID5V8=; b=Gp7O5FyIP6Gqz6dK
	XVI+I/XaMl9cTBDvfK0wKvYyDmMMIkTtSTeUzl/P3Bl9Qh7L1zj03mkKwcoXFUpD
	NmEVHWYNLJHMYegZxYq6WEDINGJENLMuismtDGr3N63n7P9xXWY+UDX70RzFVIqQ
	+MiwpFYLdCIHPiO7IZMY50Bqi6tudbCWYhz2x4/dfB3hyiKDtUum5S+l+Gi80A3o
	SnZ4ZOFRAnn8BE73B9PhxILIFE87L6VSFebsefNbmNKB5D/5JY/CPR2W6x3S9kcu
	Lgdw2TeGwTVQOWZ40qF2TrMUQKozY/krpsjszkUIplomuimXknS+P94Omak1/q/o
	X+IHGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktencaf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 15:41:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a96112fso196845ad.2
        for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 08:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743003672; x=1743608472;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaWfJx73MJITf1MAGS+5QLKh97/YhkXy5JoIZnID5V8=;
        b=coMN5Cg+T1djgg3NWRbZfwUbq4OOlFdh7UMLHk3p7btapn/F9UdAu3THKoNndG2AZJ
         L+sZtXcw96RqZ7rVXwqrW3/LdUKi+yH7IpLnv4cfVgLJrqjGQyFhRtU4xuDWW2sz8w/w
         LBITmYq5p6b4XPeCHZfEOLydHfN3fQEvgAetu2+E4zYfwjx8lU+ygQmvqZZQELuvhG0y
         fcbkR80ewYlFSORDa2bFYl36yz8b4+8jDCeMHvk7/nYiael2vGKugb6ZoHQ+zFCDi+2R
         o5aVmBucZP2rvKDky+G9Rj4liHBTwK2uD0J25U3Fq+v0hSsteK+3C0tLEouS6QaVceSt
         f1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYdXITy/luq3n01pjuQ/PPM0OChxuT0DEi/Tn3HVtr+OKsF+pmuNoPLbG/UGezisRIOlV1mA4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKuHuBxsRrgmedDOqGHtexqLQuDjSK5KwwQOG7fNGeG0oEHE8I
	P3pgXpQNMQJBDZrN9zitPvdz0W4GFB/Zd604QYvAtD782ikRLQskEWjxuIzVxsa5oul+hoYzTed
	zYoaKVRYOUU63lfSfMsHQfy/g71rgJhWSPiLtRE9ffSuOQHdskV27B4fLIOmb
X-Gm-Gg: ASbGncuitZzoA1Ux/4enSTTPYd9xmWrg5ZHe/dJCZsdUez0W8hzokmBgd+fHteROr6S
	gEcyJ22flbJueqRsztYijSwUR3ZB8SZE0Q3GiP3JM5usVN0xjLdMjW9XYXJxmYDSQiBr3lQK7kI
	zGw7O2v//z1tkQ0ZjAg0Y45KDLNRB4yM2AEv1KOir17F0ITBqszkc3QEWjaWvVTriavQixkGGl4
	tmnZIlv5Cjr3rAX94lYMmPMLLAz8PTVRob00V2wz7MIypDskNMkjob1z99kuvaXAmUIov/8mLjt
	TQTCblIzQ9R3h5aqZJcMvVVT1DHbn8bznGXp+tNskA1DZDPPLYN85vkewTWLz6gif/MhfXE=
X-Received: by 2002:a17:902:f646:b0:21f:6c81:f63 with SMTP id d9443c01a7336-228048551b5mr595395ad.16.1743003671658;
        Wed, 26 Mar 2025 08:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnH5u4MzTNZ2itV/SZImEzCKgZzaGZ6mk6zIodOEC2MvXI64y3FpBAUpsvlQ360/Koa9EetQ==
X-Received: by 2002:a17:902:f646:b0:21f:6c81:f63 with SMTP id d9443c01a7336-228048551b5mr594745ad.16.1743003671066;
        Wed, 26 Mar 2025 08:41:11 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da347sm111163645ad.161.2025.03.26.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 08:41:10 -0700 (PDT)
Message-ID: <f922860a-e4a5-416a-bfe4-e22a8653ad8c@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 08:41:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250321162331.19507-1-johan+linaro@kernel.org>
 <8edf77d9-1afd-402a-b966-d1b3e5b4ba1b@oss.qualcomm.com>
 <Z-QaMwB215vTKSTq@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z-QaMwB215vTKSTq@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e42019 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=wpi7UN2eRMKIAmbdDfcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: nFrakFpTpXrT1sOEts0Etzndsi2BJmpd
X-Proofpoint-ORIG-GUID: nFrakFpTpXrT1sOEts0Etzndsi2BJmpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=681
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_084114_913984_CBD005B4 
X-CRM114-Status: GOOD (  15.67  )
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

On 3/26/2025 8:16 AM, Johan Hovold wrote:
> On Wed, Mar 26, 2025 at 08:11:11AM -0700, Jeff Johnson wrote:
>> On 3/21/2025 9:23 AM, Johan Hovold wrote:
>>> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
>>> without an iommu (under OS control) similar to what was done for ath11k
>>> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
>>> DMA").
>>>
>>> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
>>> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
>>>
>>> Note that the mask could possibly be extended further but unresolved DMA
>>> issues with 64 GiB X Elite machines currently prevents that from being
>>> tested.
>>>
>>> Also note that the driver is limited to 32 bits for coherent
>>> allocations and that there is no need to check for errors when setting
>>> masks larger than 32 bits.
>>>
>>> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> ---
>>
>> Please make sure to include linux-wireless for all ath.git patches so that
>> they are processed by patchwork.kernel.org
> 
> Ok, I'll try to remember that, but it seems you need to update
> MAINTAINERS to include that list:
> 
> 	$ scripts/get_maintainer.pl 0001-wifi-ath12k-extend-dma-mask-to-36-bits.patch 
> 	Jeff Johnson <jjohnson@kernel.org> (supporter:QUALCOMM ATH12K WIRELESS DRIVER)
> 	ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER)
> 	linux-kernel@vger.kernel.org (open list)
> 
> Do you want me to resend?

no need to resend -- I already picked it up in my 'pending' branch

Let me open a separate thread on the MAINTAINERS issue.

/jeff


