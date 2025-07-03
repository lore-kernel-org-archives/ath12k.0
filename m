Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3B4C77B7C
	for <ath12k@archiver.kernel.org>; Thu,  3 Jul 2025 02:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SgoQMCb+yk35vcEdpnooOFtFCFlzwJMMzcRzUpYFpU=; b=EVRaWGeRIY9FGAqOnZYW50SToy
	u+rLq1jWsh1+OytVJhVm6rH0A+t6eaZh1TwVIjxcbq1MWKi4Ei55OjHSR/0oJJxN6b3bL9QF6r84w
	5aukPQnpVcoCHJ5zrKjZEeoP1ft0qoeqXt0xF4y4Zv2p90plKXgi+qRz6p6x5c4PVuGesngnLu/vP
	8wIo0WqSTswDLdWSk2BS2MwdyAyiZKhov2ARLAYIcH8U2LxPCKzKru6K8p79xUMh/o5oIwgtd1Ol8
	eqpjCH5D3Czr7bKhyj5yWJF+sKpiTA5UQ8VgjVFYK5gtE/LARslJvFcdqEzUjS0FA/J1gmeul9uz6
	bnTFLBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9YP-0000000A147-2cC1;
	Thu, 03 Jul 2025 02:20:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9YN-0000000A134-0OHY
	for ath12k@lists.infradead.org;
	Thu, 03 Jul 2025 02:20:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562MQvBf000415
	for <ath12k@lists.infradead.org>; Thu, 3 Jul 2025 02:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SgoQMCb+yk35vcEdpnooOFtFCFlzwJMMzcRzUpYFpU=; b=DuHUAMO0wJJ826x9
	2hFz2U8l84fCq0lDxIDdk7LI/JRjI5ffzrJ3OtmkS6dvTo/u/vfAFgw+lSYsNYGj
	lLWb0WgecX2zpCu/9Xie9g/KS5Kh0zuS4QC0ScXvU8EQX+USdX++NI1qvLJxWdkO
	fPQlRDIA5sPgLw27bg0GQJO1jd/gi/J4TjxZOXYZU4bJhj1IG4NS72aE+dz3NryL
	Z58KsHBiGbO15jmX6kMGiElLhEaV7FcMICq+rECbM6QTJhBlGhQFahu9cjGDhstO
	ol85ejBTl9ixSx4UguVWEFuh6i+LWDOitCm1TZEZmzdGniquEM3oX1LpXw/B10A9
	59poJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmekr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Jul 2025 02:19:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b362d101243so1723489a12.0
        for <ath12k@lists.infradead.org>; Wed, 02 Jul 2025 19:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751509196; x=1752113996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SgoQMCb+yk35vcEdpnooOFtFCFlzwJMMzcRzUpYFpU=;
        b=GLozS/X4povgnNU4044VWYJzHeA5AuUKD72uSrcxdA5YBDcCkwOfD2MnXeIfPKzGaJ
         cfpx1rDNVN7Q5WbKbTKH/W1A3DszLXckTEbqOfxpLfSfqEohyP/1s3qtoAxyZRJiAOIi
         pbBZmTgwkgNIIIRCrQgsyLG0S2mGdmtrHRSr22QpioYDDESdByVCe9q/BIaPSZ+24+EK
         Dp3Vr46j1qY9wvvSJcUy6kIFLk8Kv49EIoiFiL1VIJokU/9DzVSgXBYeir5ybrwSC68B
         XjvwCn5Z/IoMtQ9a5bPqHtCuesys3ahAw4xv2FE/igmS6w+D4cpNXYQon9xOONdqqhnV
         sJEA==
X-Forwarded-Encrypted: i=1; AJvYcCUnrBK/Fnb+Cf0Xplf3V9omKJPapVsTjNUR3sccbHlvFzWS0fbX2pthNJJ4TdfN+A/SBt5D7lo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTH14wY6Dlirp9pNubTVgRtVri8Umz05zX1rqjiVc6tabyXqM4
	tHcR7dfDUspZrbJnDLfz9/Q5dOfxgYNKDVc8fAZGxuEuWspYAVOWFDy/tzNcwm5ajlRbeIMANsd
	sXU7ao4Aa1P6r2mX3ZakBaUZAeFuHeQ6MA6Lr9mkPFCak/rk/37GjArRW3bkBmjxVdnGKeSC4b3
	I=
X-Gm-Gg: ASbGnctTot0YXYJWQQ50n2C7Zxamd3Uynh7BvhS9Dd7/4i7mQ+WTa3+I+ZWstTLwVng
	EI0xoFUJxRv/yT7G+Z1r551bjTM4LNSXpTSbLcB4nLA14uA3M1rjg5qrarJGZh9mpofTzid1qxn
	fwV0q8In0Q9XrjnPsuK3PUhjT/b+86TTSvmCVrh2c7/+5NV+WrK5uzKQZEy9JiknI477Wmq52IQ
	aPK7wy2iSMVhEhE1zpV40SdatPKQbMSe5UdQmgOaHF6qMBs9apTGwhZLBClut7W/jA//Ov5OxIz
	57KvuiPAu0UwYvuv6+xAOS3+nGpzp5xjv1q4kBvlA6ezxTHaG3dru0h4qveziEPoTZo9goeY7Vn
	N5ef3Dg7tF8chFnU=
X-Received: by 2002:a17:903:22cf:b0:234:8c64:7885 with SMTP id d9443c01a7336-23c6e594071mr82029995ad.53.1751509196032;
        Wed, 02 Jul 2025 19:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTss5kyY0B6320sF3R/MAVC1HUnXlJ+1X/RIYQnabOP0u++yoy3pq4btZm9MwuOzM1nPMzMQ==
X-Received: by 2002:a17:903:22cf:b0:234:8c64:7885 with SMTP id d9443c01a7336-23c6e594071mr82029645ad.53.1751509195566;
        Wed, 02 Jul 2025 19:19:55 -0700 (PDT)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b8ec2sm140834865ad.183.2025.07.02.19.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 19:19:55 -0700 (PDT)
Message-ID: <979be2a9-9d0b-4382-8519-2f6fbcac5375@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 10:19:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Matt Mower <mowerm@gmail.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Robin Murphy <robin.murphy@arm.com>,
        Jeff Johnson <jjohnson@kernel.org>, will@kernel.org, joro@8bytes.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        1107521@bugs.debian.org, iommu@lists.linux.dev
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
 <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com>
 <fd3bd8b1-4108-445a-b65f-4769d73e6e63@arm.com>
 <4a13d862-1bbb-4a98-bc1d-219bf78f7c0d@amd.com>
 <CAPDiVH-kVCUY8DKexT9OqAZsvkZ5_CGo8d8nENYA-kD=s_x8wA@mail.gmail.com>
 <e008afed-819d-43eb-8895-2c7aaf24ec13@oss.qualcomm.com>
 <CAPDiVH-xPDmx-KQx7YJY=7+kwJNbGY-rEu-w+cz18p=kjnKFsw@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CAPDiVH-xPDmx-KQx7YJY=7+kwJNbGY-rEu-w+cz18p=kjnKFsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865e8cd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=1xDctz_ZAAAA:8 a=x-Jbw-KjGOrRcKConVEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=1a1P4aADmYxDp9Cj9Seq:22
X-Proofpoint-ORIG-GUID: n--8HzjVKtycfPHW4ESuX5FdKbWzkHzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAxNiBTYWx0ZWRfX26zgI40zb+h7
 JdmwLB4g/Be9+xedeCsb0u7EhmeR6xSNerLRpToyiHnnvf3qiB2kb5zoZsDu2iExH4krk79ZOlH
 aY0pUrC3RHcqGs9YZxjROsP88GM8VPSaU47iueKjOi9Mrj9N/qQ48z1slxJGfncCIX4+4FOGapx
 8w4S43BiKZ83g7d2ftyPQhsc9dhGvBTsjBMnREoe+/9h1UV/b5s3pDDOumjokc+/N9q5XqpmkQ7
 pKRRaGWIOPKi8XYfdrJJYTt3ucRtMIf0YZoCs04j7HO4EM5u29hBEBQmxn0Fo4/S8AcqNE1xnvT
 KTxRyUiSyJpRcFsqMeDdKzsSCT0yTRmlDjDwsJlnbowCX5YZfn2GSVs4ZDp4ylh3SimQiEJT4Eh
 hOtPE3eDVSEmss+hQU3QGi2cgsJg7VABkh/BeL625uqD+8POREGfk+BMFwlescqjVBY7fCEK
X-Proofpoint-GUID: n--8HzjVKtycfPHW4ESuX5FdKbWzkHzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_191959_252813_EA3DE054 
X-CRM114-Status: GOOD (  11.28  )
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



On 7/2/2025 10:53 PM, Matt Mower wrote:
>> Matt, could you help enable verbose ath12k log to verify my guess?
> 
> Here are kernel logs with ath12k debugging enabled:

Thanks Matt.

I see firmware crash before IOMMU fault in both logs, which verifies my guess.

> 1. WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>    https://cmphys.com/ath12k/dmesg-6.12.35-ath12kdebug-fw0x100301e1-20250702.log

[   91.625809] ath12k_pci 0000:c2:00.0: mhi notify status reason MHI_CB_EE_RDDM
[   91.625916] ath12k_pci 0000:c2:00.0: reset starting
[   91.674375] ath12k_pci 0000:c2:00.0: waiting recovery start...
[   91.679445] ath12k_pci 0000:c2:00.0: setting mhi state: POWER_OFF(3)
[   91.680721] ath12k_pci 0000:c2:00.0: qmi wifi fw del server
[   91.680754] ath12k_pci 0000:c2:00.0: setting mhi state: DEINIT(1)
[   91.681842] ath12k_pci 0000:c2:00.0: cookie:0x0
[   91.681858] ath12k_pci 0000:c2:00.0: WLAON_WARM_SW_ENTRY 0x14c4e54
[   91.687109] ath12k_pci 0000:c2:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0010
address=0xfe980000 flags=0x0020]


> 2. WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>    https://cmphys.com/ath12k/dmesg-6.12.35-ath12kdebug-fw0x1108811c-20250702.log
> 

[  113.621429] ath12k_pci 0000:c2:00.0: mhi notify status reason MHI_CB_EE_RDDM
[  113.621794] ath12k_pci 0000:c2:00.0: reset starting
[  113.670134] ath12k_pci 0000:c2:00.0: waiting recovery start...
[  113.675177] ath12k_pci 0000:c2:00.0: setting mhi state: POWER_OFF(3)
[  113.676331] ath12k_pci 0000:c2:00.0: setting mhi state: DEINIT(1)
[  113.676581] ath12k_pci 0000:c2:00.0: qmi wifi fw del server
[  113.676874] ath12k_pci 0000:c2:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0010
address=0xfea50000 flags=0x0020]

> I captured these after setting CONFIG_ATH12K_DEBUG=y and running "echo
> 0xffffffff > /sys/module/ath12k/parameters/debug_mask" during boot
> (using @reboot in crontab).

Unfortunately I can not tell the root cause to the firmware crash from host log.
Internally I will try to repro this issue, in the meanwhile, Matt, could you help do some
more work to narrow down the problematic change?


