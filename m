Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B474CCA476
	for <ath12k@archiver.kernel.org>; Fri, 10 Oct 2025 03:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjnRP2v3BiYbEeMbTq/UCfeFdb8g+UuGKL4qxyxvlr0=; b=Unfau5OR7tjbe9TiRVcsCC3acU
	3V+w/AilWgzQGirGAJwmbE54AKdSXPa9AYEIvML2pXxZGAWLXbBhuCRZwsjpSD9cnMwma1r1u8qMY
	NXdWDGb4iH6xdh+eS1WvV8mAZDf20gSIQQw6GBcrXmKdtoRuyvFctCY+T6wlV0xxz+JHaLFy0uqy3
	NzZfAX//Jj3BaTGtzxlr6sB8AxzPHRKJnfCyajBu3dX7YiSqPuefpXDv8KXgfbl6NjnRQk7RU3imd
	UQn5k9nsjyu5VSVS0D/BgDzpB5q2a59IOGiTWhqqh5uYzLghCzDKhpSlKAC0JzXZ8U2DxIf7+SPD1
	r9VilgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73kv-00000007Yt1-3UP1;
	Fri, 10 Oct 2025 03:25:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73ks-00000007Ysg-440Y
	for ath12k@lists.infradead.org;
	Fri, 10 Oct 2025 03:25:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A3MjLT028598
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 03:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjnRP2v3BiYbEeMbTq/UCfeFdb8g+UuGKL4qxyxvlr0=; b=gOiTOJVvBz9E+VQh
	RjvoI5amfeAo9W2+5ADyipDs+LQ/AOBS/ZdUtL4swuc5JqKohc2fRamop1EyjDuS
	Gk1pneGczxCDhYLFvmYOwJjU1RIbKm3utKOJ5np+sxwLXhTr+20Br0PSjPCQOVkv
	JoG9B0uZJCdeo7EB3u5UTECiNvd3XIHzoAmr3LZzmTNP9Z1AahSem/sVYKL8c3S0
	/qMXmTt5mNqssmsClzq87pAWqzv/vCBMv3Nn+mjGx6fiqQnlYtbNX+jG7AVgjzr1
	83oWoDk2F4WSgPuuzmoJMsq0ZSt8RKGRSP862yBhijjzM5kHvFYRCWGs8nURhshM
	poLqSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kvybb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 03:25:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6fc6so62567645ad.2
        for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 20:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760066717; x=1760671517;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjnRP2v3BiYbEeMbTq/UCfeFdb8g+UuGKL4qxyxvlr0=;
        b=l+hXto5+kB0eQ8AISEQv7+Fer97NeoFMJ/qUnp4r7I7mqtA/5pdNB+PeBiBo1RDArr
         DXY5ScqOknqXCgam0HPTF0LER3tPJjtD5BFczzvMw5ndxKZ1/R/59awKkNEXl3qw4Q5W
         hY0cgAACH4FUU4JFuwmxrJaEhX3Z+6XdU1qq2Ao2kSksZ0LYglkSxhhqwYFP7IonKQLD
         EVaFdIl2eaBW+SEdm4R406OTEC5avzp9oXE+s9mA2oc8NzUmRIvcXsLKTvWFSSnPsPuS
         64tPm050VJQKpsdltvjSo/ZWKntl0+ZNAKrOQ5yVViTib+TMz3khylYwH4Qnoro+OiNP
         YI3g==
X-Forwarded-Encrypted: i=1; AJvYcCUZccEPNKjR82b5ApEgExTFAWuYHcbeqliqMIFhuxll+zioeIuZpXalPY/DI0VmoNvH9DonXbM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8DgDtWUKj274W9Os9xQoDBmLGnxgvFuSDtRoD9YATOoNPhO1S
	JHg7Cnrsl/Q/wabx7brrv7YHreHHKYMI3cmpEz9oAcXvDL21fc3Q8iIjXmWvwxgH7m8z24XMorR
	ptmuHF3c3k2E7HpjPb/8Cw5Gtojg2oumX0pWjnpbBBnD6aWmO/S53HaBZpDkW4PWhiJJTOugD
X-Gm-Gg: ASbGncvoxFixglgNB+x6s3CQnFilTMQNSLvIAlLWGyscg6hS0JpvFpez1SWiYxBmj3m
	ebVhmktSOCBVVA75w49f+E4H2xmdAXvJKtgoDuEhsey6t8VlXAh1tiguOhkA7btwnP3PzBf6DWK
	JAzacKIvBoYPDvzlpaWP9LEssGTOBh+CPYbFijs47vxTxxJfVm+EG/cUniK5l6FzIpoJob4TvIG
	GHIqshGHAL0iqvVd5Qogy6V99sY7LmkPvHWYNWjeK+yYoi/evcyLTZ0HmaR2hrL9goh548xl9/y
	EeN9MnFPaG4Igv+xQu+qm8r7ea1Tt7Qbt9zmRdlcA0oNcVylL7UokbommEF1qX8aq9FSshw8MIP
	KEQNHO/rmvpUPeyRWtgP4HcnGAawENOz0y6Jzqg==
X-Received: by 2002:a17:902:e943:b0:267:a230:c657 with SMTP id d9443c01a7336-2902739a8fdmr139668635ad.24.1760066716958;
        Thu, 09 Oct 2025 20:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi0k/lBjaJ7gf3tNWOmXPObyFYvcCE86FFZuXJTMOyvqHgOjBPYCnSbsc1NeqhNdlW8QzGEw==
X-Received: by 2002:a17:902:e943:b0:267:a230:c657 with SMTP id d9443c01a7336-2902739a8fdmr139668325ad.24.1760066716415;
        Thu, 09 Oct 2025 20:25:16 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626e94aasm1050256a91.24.2025.10.09.20.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 20:25:15 -0700 (PDT)
Message-ID: <036bcbb0-49d2-48b7-a1d4-1b23f823c276@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 11:25:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/18] wifi: ath12k: HAL changes for Next
 Generation Driver
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxcrLbxMvEUaC
 6MvVhWr67Eqtxb3He4wLzUKxvZ7aO5E/xQtedQX/z25oc+R5legFZHbgEXNwXpxXcB+JyigZm95
 MH7h57A43f/AVlhj9bNZxYrT9XJr5os3zlObzH/nJSVbCOeJMh+lBPeV4NcCW/453YwmK+6sFSU
 4xQhXPrJcYiZOpOk17kfEfTnkoAZnkJ1+UBTbhTeXSYRM9WmVTIRx8h/Bom71G3VQQHI3+/q6US
 98TXkKJbNpbDxy4L7jSYSVhPgbf89PdMZ4GMGmFxkS69WXi61RFpsbqPWXWF8rzzBkpNM7lWJMD
 s6JUe0TfjnwYS0BCLv/8L2+wUQkot0pdd8qLQotvxzyIupph2JFvOT+sXOajbMllNeDK1xCKKJG
 zBME3aeqN+TGCmk0yt7rnQBM0+/v1w==
X-Proofpoint-GUID: 50tPDtXVFc9rAoSgRjKFE4pM0qFlHS78
X-Proofpoint-ORIG-GUID: 50tPDtXVFc9rAoSgRjKFE4pM0qFlHS78
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e87c9e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=wDS-lHI4qrE1dolQj4MA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_202519_041249_2B32580D 
X-CRM114-Status: GOOD (  16.23  )
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



On 10/9/2025 7:10 PM, Ripan Deuri wrote:
> The primary objective of this set is to modify the HAL layer
> to suit the multi-KO model. The HAL APIs will be implemented
> differently as required by different chipsets and these
> implementations will be abstracted using an ops mechanism
> (by registering function pointer callbacks). The hw specific
> implementations will be registered as callbacks in the hal_ops.
> 
> 			common hal API
> 				|
> 				|
> 				|
> 				|
> 	=============================================
> 			     hal_ops
> 	=============================================
> 	 _______________              _______________
> 	|       |       |            |       |       |
> 	|       |       |            |       |       |
> 	| qcn   | wcn   |            | qcn   | wcn   |
> 	| device| device|            | device| device|
> 	|_______|_______|            |_______|_______|
> 
> 	  ath12k_wifi7.ko             ath12k_wifi8.ko
> 
> Also, the hal structures that are specific to HW (wifi7) are
> kept within hal headers in wifi7 directory and the structures
> that are common are placed in the headers present in the ath12k
> directory.
> ---
> Pavankumar Nandeshwar (16):
>   wifi: ath12k: Move srng config and hal_ops to hw specific hal files
>   wifi: ath12k: Initialize desc_size through hal_init
>   wifi: ath12k: Initialize hal_ops through hal_init
>   wifi: ath12k: Move wbm_rbm_map to hw specific hal files
>   wifi: ath12k: Move hal_params and regs to hal from hw
>   wifi: ath12k: Add direct HAL pointer in ath12k_dp
>   wifi: ath12k: Use hal handle instead of ab handle
>   wifi: ath12k: Move HAL CE setup and SRNG related APIs to wifi7
>     directory
>   wifi: ath12k: Move HAL SRNG shadow config and get ring id APIs to
>     wifi7 directory
>   wifi: ath12k: Move HAL CE desc related APIs to wifi7 directory
>   wifi: ath12k: Move HAL CE status and set link desc addr APIs to wifi7
>     directory
>   wifi: ath12k: Move HAL Tx, REO and link idle setup related APIs to
>     wifi7 directory
>   wifi: ath12k: Move HAL REO and Rx buf related APIs to wifi7 directory
>   wifi: ath12k: Move HAL Cookie Conversion and RBM related APIs to wifi7
>     directory
>   wifi: ath12k: Segregate the common and wifi7 specific structures
>   wifi: ath12k: Remove the unused ring inits in wcn
> 
> Ripan Deuri (2):
>   wifi: ath12k: Rename hal_ops to ops
>   wifi: ath12k: Drop hal_ prefix from hardware register names
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |    1 +
>  drivers/net/wireless/ath/ath12k/ahb.c         |    4 +-
>  drivers/net/wireless/ath/ath12k/ce.c          |   25 +-
>  drivers/net/wireless/ath/ath12k/cmn_defs.h    |    1 +
>  drivers/net/wireless/ath/ath12k/core.c        |    4 +-
>  drivers/net/wireless/ath/ath12k/core.h        |    2 +-
>  drivers/net/wireless/ath/ath12k/dbring.c      |    5 +-
>  drivers/net/wireless/ath/ath12k/debugfs.c     |    2 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |  178 +--
>  drivers/net/wireless/ath/ath12k/dp.h          |   17 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c      |    6 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.h      |    1 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |    7 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |   17 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.h       |    1 -
>  drivers/net/wireless/ath/ath12k/hal.c         | 1114 ++---------------
>  drivers/net/wireless/ath/ath12k/hal.h         |  804 ++++--------
>  drivers/net/wireless/ath/ath12k/hw.h          |   92 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |    2 +-
>  drivers/net/wireless/ath/ath12k/pci.h         |   10 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c    |    3 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |    2 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |    5 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |   54 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |    2 +
>  drivers/net/wireless/ath/ath12k/wifi7/hal.c   |  705 +++++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/hal.h   |  563 +++++++++
>  .../net/wireless/ath/ath12k/wifi7/hal_desc.h  |   80 --
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  661 ++++++++++
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.h   |   10 +
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |   22 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   10 +
>  .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   10 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |    7 +-
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  439 +++++++
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.h   |    7 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  404 +-----
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c   |    1 +
>  38 files changed, 2949 insertions(+), 2329 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal.h
> 
> 
> base-commit: c57176c0dad91a00bd20feb5f6dc4e8d575f4628

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


