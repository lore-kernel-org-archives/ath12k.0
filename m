Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53E9CD6E56
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywLulI4ZuoOc549odCPLhYxm1aLERQDAha6vmGGnqaQ=; b=eUbhv2xzIIb05Zy4Xj20SnzUIs
	5Ca6mvHYbN7FcJOU06c5Trt1pCbi1unCx5/2yMSPYsZzmbwAKtTYhlPX2MJaFeHB8abJEbmOZ/h0d
	VFHuIWJ8YLhSDNPfH5IyPOZH9wykg9Zae69AT4cQyUChlSp3z2oPU0ShbdjBCKPleiZKvDpO7c1ZZ
	gWvmS5cUX1IJnyPRzlOkguGaJzC3ywrQ0x9C4jGZsq5NduupZkphyb1ZGHiRru5ft8Q/A1Oqq0aWZ
	XaNHCahM60MRd5l+LlqI+pn3nNfOSgIaA8KUZTi05iN92cqDoHJqRccDcj+UdIPLBRmeP7IvVIg7o
	PCIgl6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1x4-0000000B9k4-247I;
	Mon, 01 Jun 2026 12:41:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1x2-0000000B9je-2AOW
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 12:41:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BB54k3127892
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 12:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywLulI4ZuoOc549odCPLhYxm1aLERQDAha6vmGGnqaQ=; b=Mzihi2qd4CSvy010
	AbEmX4rqRjUy8UHqF3Je889kQhS0e3l8nnp1/ay0JyRdWu0G7x/tiQqPWkp9Y0M9
	CgyUYkhyZzjHAUFSMHxy7tCAHtGKmTIauNkYShYjWGNC5nsfBondvjbGsEkB4mQl
	EDbPpTMP1KwGPzEdx6jL0904NK4WXa4OcNnR4hzm7Sw6p/rNYRwgiqvDro/geWn9
	wxEHKOytppp9sM2amda5vLWD/hPuHeX5KNg4+beGrvfsY6PMSjWEVNnoA9cbeR2u
	i+FuVAKFTFRlI53mJ7SWwC9C+/9woWe+PP8SDu70A3FBb21DOxVxQPdbzSYB/VlM
	5LGKAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9010bcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 12:41:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842308adb3bso2431425b3a.0
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780317662; x=1780922462; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywLulI4ZuoOc549odCPLhYxm1aLERQDAha6vmGGnqaQ=;
        b=jvo6zicfPko87Ntm7kEy8kLdwegqTBrJx8vBKN4i2ZfjVmbPmIJNCJ64CkxZkQOXnL
         vs3Q1h0zYdvCJbWm97niDynVWgSvSyNa88LghgtaanGQj1GFlWDNgbcSyQB+9exsQPwI
         0zvkCpGvXa30SQECDeSQlgGm+YtbVQ/DEqykw5imlwShn+okb+eiHRBnyVF5hH7hv581
         5kh7GaqlWCNpHVooPb/6EZEKSwpryqVX3vSLyQ590hilsNF5+K0XVJCBY/mABiUBNDPJ
         W2/u3H/0UdFmCp5IoE/pwYzvZ5pQE4xP2otFiSBp7vG6+IH/hI71Da9dMyGylQ/XkH15
         9rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317662; x=1780922462;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywLulI4ZuoOc549odCPLhYxm1aLERQDAha6vmGGnqaQ=;
        b=M2fehBOvjyonfut2jQIvASnxJ5qynrrUqi6ZKMxirVrQqks3wF+9E2Olyep4ooGjFt
         x1NG29JC/9wgF0sBaqGPCgGk+eFL9EVNSMnPHWdDchjJ6o6xpK3Qg8T2txSYvQK35kFj
         kWwRQsVD6qEcUO6KU5sVRwdCbjxKNLOm9mhmRpvsSUHa6E/QLyDiXcGQ5G7MviCmLDz/
         rTw82UqfID9tJTuyt/T8uXTPM3UNntIPVqeDIBGXgki29Q3CZvNPy8oQbMkq0gMmqHQ0
         KgjYPqNr2awCTRAS7ZqH8542eOfiLOi+qvrbhcnlXXx0wDJo0Gg8NI45Ksic6sCogLe8
         qUYw==
X-Forwarded-Encrypted: i=1; AFNElJ/g/n8LBM/fjRcUn4x/hxLUtYuOf7NgwjrnbcX/yRQ5l9lTwRv29KbuMvSKCqpCXVg6R7tdhUI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv0CPqJjohXvLaHEESP2X4AteRLeHenY0mjQjpRgsSsn0qap8q
	4tLumoB7gfbXzs2mur0+UnV2cqhuI0IKY/bR4rBAznjl3UYcHdT4uQm4d/lpWSdC1KfgwzyN0R7
	E2y/90ZXs0QffRJzoj+laaxPs3WInJymxIdpP49qROF/aEooAXRhv0qA1ucPbomTI
X-Gm-Gg: Acq92OHUvAJS1lIr/tFCEDCQpaqHATu7faIg++Xv2+cMnBJp1FCZkaXgSBW8Gt+99n2
	w+jZmupY53xsabf+RUw8cNnbG+dbrb3rNPe+FcmN8avZtH62kVH4DvoCCDLZz2BqHGqcDPfkjlK
	A5e+yX2zpRLjUw02d+KirxsBcNB0spZNduh+vC/nsPKzDuXqlFr/oHC+4gfkt7oow8qxlFgWheK
	hVbW7Glgakq3q05thlud8mBsV8OC1EIFEulQ1ozZoJbFAIYeBJr2+V+fPtbJitQDoJB+tQ/0Xpb
	GfFzEbYzddt5nN3FPuXQInQNkKaoMFGCK6uOxEgPpaRGGD2tN4QPzHS2JQMRe+J6dxnuyOu6Sjl
	QxeW/HBxr6D2hP6K5eMcF8Xs/tHWvqki82FbsgIEbcBrNJkpT3q7pWTNeomze1KJpUFYJ1s9prq
	m6
X-Received: by 2002:a05:6a00:3489:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-842251b184cmr10375799b3a.0.1780317662268;
        Mon, 01 Jun 2026 05:41:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:3489:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-842251b184cmr10375771b3a.0.1780317661774;
        Mon, 01 Jun 2026 05:41:01 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84228bd6fadsm7227730b3a.0.2026.06.01.05.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 05:41:01 -0700 (PDT)
Message-ID: <e1c83c9d-50d3-44f2-b5c4-611eb62ef850@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:10:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: Add driver support for WDS
 mode
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d7ddf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sAaGq3ReHQV-J7jMsY4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 8oXs_feQP_N4slYdPyzQIwCwUtiQSWsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyNiBTYWx0ZWRfX8XnC3EjCnKdS
 V1PwLhlk3VZGddSCQSRwlPgqYId3n9/zxtIbwzXFeOEBGP0um7giLHdU2nzl6YZuksGpDCx3wyI
 fse4H/xcizfMSROpELfaXILwO1UHq4i8cGJxxhEFafhNC/+sb9DUdsYGNs4KrRhChOYAUQczS+c
 /pw+z/DSPEFmftXzwp0WL5mT6C5IK9a+XQWljh8u9gchIqza2k1ncUORs6Qi63CpkvjgKd9tl1s
 16Xx96+uaB4msG9X394wzJWIWMSafjGBTrwZHZvGNXTLZvB45WBofQ43v/GFMMbWs+8CxWUzht/
 Kq9UQF94C4CLz5wViUyZUkeis6p4FdcoRIEUBb//y25uSgjnMu/i3nLJOw/NkkiNtueIv/yuSwQ
 1iJqeJcS6WDSBawzEuJkZn8/zjGPX5nCfa6AF38DSrbuXOubNoFcuftmYhkW1g/giePXr5qIIEt
 +lVRMEHNhQqfxyvrVEQ==
X-Proofpoint-GUID: 8oXs_feQP_N4slYdPyzQIwCwUtiQSWsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_054104_678878_148A9184 
X-CRM114-Status: GOOD (  13.01  )
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

On 5/25/2026 4:39 PM, Tamizh Chelvam Raja wrote:
> This patch series introduces support for WDS in the driver by adding
> below changes
> 
> Handling of 4-address frame formats required for WDS operation.
> Proper setting of peer 4-address WMI param to ensure correct transmission
> and reception of multicast and unicast frames in WDS mode.
> Conversion of eth offload Rx frame to 802.11 frame for mac80211 to
> detect 4address frame and initiate AP_VLAN creation.
> 
> Tamizh Chelvam Raja (6):
>    wifi: ath12k: Set WDS vdev parameter for 4-address station interface
>    wifi: ath12k: Add support for 4-address mode
>    wifi: ath12k: Add 4-address mode support for eth offload
>    wifi: ath12k: Add support for 4-address NULL frame handling
>    wifi: ath12k: Add support for 4-address frame notification
>    wifi: ath12k: Handle 4-address EAPOL frames from WBM error path
> 
>   drivers/net/wireless/ath/ath12k/core.h        |   9 ++
>   drivers/net/wireless/ath/ath12k/dp_peer.h     |   2 +
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |   3 +-
>   drivers/net/wireless/ath/ath12k/hal.h         |   4 +-
>   drivers/net/wireless/ath/ath12k/mac.c         | 124 +++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/mac.h         |   3 +
>   drivers/net/wireless/ath/ath12k/peer.c        |  11 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  91 +++++++++++--
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  41 +++++-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   4 +-
>   .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  16 +++
>   .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  16 +++
>   .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   4 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |   1 +
>   .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  16 +++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  18 ++-
>   drivers/net/wireless/ath/ath12k/wmi.c         |  47 ++++++-
>   drivers/net/wireless/ath/ath12k/wmi.h         |  17 +++
>   19 files changed, 409 insertions(+), 28 deletions(-)
> 
> 
> base-commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

