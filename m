Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99625CCD184
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBAux5X4fkA96suYJ0PQrNGIPpxKGaJvqeSwCv7vx/g=; b=Pr8nmDt90BzzXOdkgO11Ue45tf
	e7Ow9WqGsTs5JSPsqLGMfo+4bbkkE4XWJKtn5BA8JzOqGgAMn7Er4RWgnYQu7FZJRExAbS86g6FgJ
	TujCajG4713CyjHb5dip5cSpQsL1Op4M7MaFqujkI9UzRm8kES/3sl7nXyWVI1CeAV37WDb+scsxu
	Z2IdEFuqTlXcbO94lDuxNt8jsypwy3qdvdWGEuVuvW2gj4RsfdWrjvurI/NtgX0+VYZuXXQbNlUuc
	jxZzDLFpDqC1fQN+cNCthNY1NSPbEsJlRw+3KmCDXkKWtLSWW1A5/1UGGge+05EhPzwLq4cana7a8
	siQ7ulGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6uXt-00000006p8X-12zF;
	Thu, 09 Oct 2025 17:35:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6uXq-00000006p7w-1dv2
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 17:35:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599ETsw7022360
	for <ath12k@lists.infradead.org>; Thu, 9 Oct 2025 17:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBAux5X4fkA96suYJ0PQrNGIPpxKGaJvqeSwCv7vx/g=; b=dzUprbe44YLM3F7B
	3n2ZSOxxi/7fK2PY/XnGQYUO0yuF6kQjQ5ZBedrxnjBXKOUyC9ps7qMmC3mAKxKj
	QJ1U3uL4hjUomwome+tiKZ0W5AULU2l1jnZQaefHoEDphKsHfw0reUseOpVZjDLO
	GNvlJPhQgf94rd8jbUDVx5BpAOX+csa3xYoVfFiIQjEiqJyQXajjG244c7b/hdVq
	yn9jOjAcnnk3LeMCi1u+iAswSZYYzpr1RAOQIaOKesQv4WDAdFqSSxxU8W+W0q3T
	NUF2cqma/jKiEy5PIGQ7jkA8NnHfKL12Fke5xXUHlBg5FS1wiY1Wbjf3ldnf54p8
	NNhC+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sks5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 17:35:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eeb9730d9so16639755ad.0
        for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 10:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031306; x=1760636106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBAux5X4fkA96suYJ0PQrNGIPpxKGaJvqeSwCv7vx/g=;
        b=rvomRQuKImsftO2VgG6tK/FQ3mTb9AIPxBWFDz9EwZWyOaX2wsdtjBpKBqD/+pQ79D
         cf+b55ma6Jw0leY2vitbss4Q5O1O5WrP0w6ElZJ0rMMyejmqzkGAImxYd4dccauSDgzP
         CaE2swOOYASqVXLLR31c9+DSRNeUb7mXdZlH3NFTE9ruHk1VeIcn8Dsr1ApYmpS46I0V
         bKuJUpVzpekr3HlC0Q8D85QVnUYN1VCpATnDIoXjUJ0QxdT7X0/TYeSVPQ3iqh2oSnM2
         aly3iSeB5AnX3qZDAsIRNdOVq7ZVudW7K5WRMGOfveMpXMNTkmUn+4xkUd6cMH5C4Ggb
         6xZA==
X-Forwarded-Encrypted: i=1; AJvYcCVurW6AXLxIL7CEpsDhGXd14zo6XZu5FzKz0XQ71NIXzJgTxPi3UgfskTFz5aV/hC3ARyYeODI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZvE01dV37uL2XohUvIoQ7+q8jscsoomy6SgSMaY3fhyV6E/8t
	p5Y5gkr7bAH5cHGhJ/VbRo3SyRvmWLDB9h/a6YPwyHwTze+TPEJ9ZXTACFGlSAOrGl0pJl9vjFM
	l7zhiR9ap3eE2m3oUSJzob4cGpPi2tbSRlfhevIAqU6MxVCUbTsSNdlSyyY27B1Eu
X-Gm-Gg: ASbGnct/z88Q/U7rtecBrd6vw9vvNls+OHGejVgc6+dbZ9FHJ8wMKMSfj7DGZbuN6kL
	ZrKPVJnCi5bw68pq5xSuQIEHPGkPbQfX4IQxnz5iViRBUPi6GDJAH3TX/+TZcHnlI8QE/O1/3gk
	42exzK3I/yWK844bqYtZyRYRG60PtEjxse/KRie45Yaq4VHNxS7CogVVOQdnFqYG5zCIGjPdUx1
	3oD79qFdfPGJ0VXUabHoHTRy1EK+6Z7KFLTicPjQXBtXLdxsDMTr1I96YPhJMuh3mymdrCYNVEV
	AhUXyFG0sTYk7v9cvuZA8B0H5v0zORT2bVIisblUfbyeRRxxlUJ5SbJ+fDjDAlX0/Z1+EPjgdd1
	pDvR8aLrDUWGkBqiyG4XuMQ==
X-Received: by 2002:a17:902:ce87:b0:250:6d0e:1e40 with SMTP id d9443c01a7336-29027356a6emr125134415ad.7.1760031306130;
        Thu, 09 Oct 2025 10:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOklSdtzdWVahhEQPwg9PEI1hPEMFk1lp6XBWWPg+HZBSs8b0nz9hA++Dd+lkTXAx+miyBGw==
X-Received: by 2002:a17:902:ce87:b0:250:6d0e:1e40 with SMTP id d9443c01a7336-29027356a6emr125133995ad.7.1760031305634;
        Thu, 09 Oct 2025 10:35:05 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.106.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05c2dsm34277215ad.73.2025.10.09.10.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 10:35:05 -0700 (PDT)
Message-ID: <82c7d1b4-bd92-db46-358a-8d3e86ff571a@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 23:05:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath12k-ng 00/18] wifi: ath12k: HAL changes for Next
 Generation Driver
Content-Language: en-US
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ND00k3WAb1fb35dfc-c04wpdRo4nRec2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXy39lid6afvR/
 CCAQXunyodve8qhizk7balRsdOM3+YenSliTgfAUnGcCrg4qMHpxier1EbcVvJWi0hteYYVImhA
 NNctN9USE6RoYIF8slmZDYDmR2VnfODowU1a/G4nR2E5kFZWzP9jEUrYKOXlIxqSRdqBwL3Lx8/
 QzVwBe5yn+PQslVGejv1wzmXCptUxQiY29Ajn6Qwaw3bl84EE+p7/7qEaXHVeVhqNcO88UwsjXf
 /7L7MswhbXWTn5fsLkFpdbtONEsVC5DErJZrfAWSxobOvTzS0mZ7qrGFasirtxsqcG9npF80TSf
 RYZtqDU+6wlWASQ0aOnDrktjcBSwjhSBZdP6yQT97/OgxuU+HoKgAcH3/jtYEKWgSeH8zXbWcxk
 /UjTfjU1Ai7WNHU5Dlh4+Jg9D6AiFg==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7f24b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=z6xreaRxtU16OQ9bEhv1vw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=frQrzQ4E-2FGA6FtmloA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ND00k3WAb1fb35dfc-c04wpdRo4nRec2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_103514_608987_5E15C738 
X-CRM114-Status: GOOD (  15.47  )
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



On 10/9/2025 4:40 PM, Ripan Deuri wrote:
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
>    wifi: ath12k: Move srng config and hal_ops to hw specific hal files
>    wifi: ath12k: Initialize desc_size through hal_init
>    wifi: ath12k: Initialize hal_ops through hal_init
>    wifi: ath12k: Move wbm_rbm_map to hw specific hal files
>    wifi: ath12k: Move hal_params and regs to hal from hw
>    wifi: ath12k: Add direct HAL pointer in ath12k_dp
>    wifi: ath12k: Use hal handle instead of ab handle
>    wifi: ath12k: Move HAL CE setup and SRNG related APIs to wifi7
>      directory
>    wifi: ath12k: Move HAL SRNG shadow config and get ring id APIs to
>      wifi7 directory
>    wifi: ath12k: Move HAL CE desc related APIs to wifi7 directory
>    wifi: ath12k: Move HAL CE status and set link desc addr APIs to wifi7
>      directory
>    wifi: ath12k: Move HAL Tx, REO and link idle setup related APIs to
>      wifi7 directory
>    wifi: ath12k: Move HAL REO and Rx buf related APIs to wifi7 directory
>    wifi: ath12k: Move HAL Cookie Conversion and RBM related APIs to wifi7
>      directory
>    wifi: ath12k: Segregate the common and wifi7 specific structures
>    wifi: ath12k: Remove the unused ring inits in wcn
> 
> Ripan Deuri (2):
>    wifi: ath12k: Rename hal_ops to ops
>    wifi: ath12k: Drop hal_ prefix from hardware register names
> 
>   drivers/net/wireless/ath/ath12k/Makefile      |    1 +
>   drivers/net/wireless/ath/ath12k/ahb.c         |    4 +-
>   drivers/net/wireless/ath/ath12k/ce.c          |   25 +-
>   drivers/net/wireless/ath/ath12k/cmn_defs.h    |    1 +
>   drivers/net/wireless/ath/ath12k/core.c        |    4 +-
>   drivers/net/wireless/ath/ath12k/core.h        |    2 +-
>   drivers/net/wireless/ath/ath12k/dbring.c      |    5 +-
>   drivers/net/wireless/ath/ath12k/debugfs.c     |    2 +-
>   drivers/net/wireless/ath/ath12k/dp.c          |  178 +--
>   drivers/net/wireless/ath/ath12k/dp.h          |   17 +-
>   drivers/net/wireless/ath/ath12k/dp_mon.c      |    6 +-
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |    1 +
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |    7 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |   17 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.h       |    1 -
>   drivers/net/wireless/ath/ath12k/hal.c         | 1114 ++---------------
>   drivers/net/wireless/ath/ath12k/hal.h         |  804 ++++--------
>   drivers/net/wireless/ath/ath12k/hw.h          |   92 +-
>   drivers/net/wireless/ath/ath12k/pci.c         |    2 +-
>   drivers/net/wireless/ath/ath12k/pci.h         |   10 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.c    |    3 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |    2 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |    5 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |   54 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |    2 +
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c   |  705 +++++++++++
>   drivers/net/wireless/ath/ath12k/wifi7/hal.h   |  563 +++++++++
>   .../net/wireless/ath/ath12k/wifi7/hal_desc.h  |   80 --
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  661 ++++++++++
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.h   |   10 +
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |   22 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   10 +
>   .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   10 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |    7 +-
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  439 +++++++
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.h   |    7 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  404 +-----
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c   |    1 +
>   38 files changed, 2949 insertions(+), 2329 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal.h

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

