Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B14C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVt31jIMf2fqwBNkDuTpsZPmudwtSAvMPRIDpAYFFsY=; b=1bMjMOq2Ux3Jg8zOtfIQwZc2ea
	In7Qc2G79OwLU4FEQJzYEaG5G2onz2/BxA8JiIvYMVw8UhLFQqTBKyHmUwVG/tw+HDihp7Gez8ltv
	V9Z3+1KdvRp4o0cZMkZG6vOrruy4DWe2E4nWFjkj9SaT6jl4MGqFr7GdJpmlLKaS1dcwrQeSW+zu2
	6oKKnynHLxaT7BVrb7w2/EMAozUTpPMWfceu3vw6M6Npoz5TO4KI7Ie+gUcF6u7Vla7wqfGFOJqU0
	55o8BfXlQs96oY/mKwzmljpcPeG4TLVJWonNxT6ov8L4VFOKnYG9sRepL+a69106Jh1Z+IvJi1P6f
	qQdsVerQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPnA-00000006K78-0xi0
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:08:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPmV-00000006JzW-2EqT
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:07:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE5hxj030291
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVt31jIMf2fqwBNkDuTpsZPmudwtSAvMPRIDpAYFFsY=; b=dzY8EGoq/XOKEJn/
	cFS6tMLzC0I9RUqOG3crsyJQIn3W3MHSEQkGhnoct6yp2KP+6eSpFrZlVmXgXiVX
	UoGymJhQUBskIANMWABR8fTJffm6heDraUuKovvzwtDsgqPIBmqJ1a2CgVAabbF/
	hgcU8qTW/nbFbj85yJ9C1oGBm7AxohfDTGK0voB4mHCzFAidWALKu2h6oES+XFnN
	FnXtoGpl18EXU/BzZ0yu9Y98zZrBaJxtEfyS/poL1yZPI0I2p2iDpSv+x2Ne5ZW0
	2U+dELd7020RDMQIwBdWJfIzm1onaKAPqeK4drgJDO2AmmA2dMbz/+fqhZ9PuGVn
	nHhRMw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44549w8qx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:07:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso8180938a91.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795241; x=1737400041;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVt31jIMf2fqwBNkDuTpsZPmudwtSAvMPRIDpAYFFsY=;
        b=iZUcRXyaPpOp0xuukAr+zPvzPnOnLtEn4VkfXczRuut/zFNQBqvmHtJPQBqDPMwZB3
         obW4EcqpR40Xq2lNLpxk++YDaj32HWVYFamHwAowB1kTkSPYC4jvibzKs6KeQhov8PEB
         snKMKA5WnkzllWfxYn7wRrQ9XAmTfZJoSs2xRtkdTq6wpprAn3R5CaO+6LkJWsoB9P3v
         WSao4ZJf6dl5kGCh+bJXHhCB5FSVNPzpQSA/uBVl1Y/wTxhdxZyV5SxoCqfI13kpctJP
         D9Dt0Js7CnqBHSJUJ8sCh8gY1LqnviziSb6vD8gZ3WfMUrVu0ip1uZHEVH+Wj+VMjoNH
         xssQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA+FdvAnjRCVLByDlr952Rr4GjHip5bZz7r2x0e8lSPmQ/VcLdUpPAC/i6PRJqTX5htIAm5bM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtZNDN7oLncr7Q/eew2nxA/mZZBsHYjij9r6d8Ca1Zlb1A/Tq7
	vhDJ0QKJsQAvMM+s/xNoSVZWRiaGcBEhEbGIC0CgCeTJpVaPUAhtmouPYf+j1MaSK2KjKC4p7wl
	zdnw4yZ8eeFgyqOaGJEzP81b90pAXkJarSY7Ev1j6YTAbnPWDMxJB45On89CH
X-Gm-Gg: ASbGncsVS+LjMdJ5smPJupyIS8Egp604wuqzhMw5tM6GLzu6knGRHPFRhVtKECTxALE
	GYuvWWnP8iWSkEpnZvt86BM1GKcg0xjwKD89hsvWJeOF301YWYaof5o+PI0S+QFuNWcvp3BvcR8
	XTAY+0Ydu6BY2gFRT+ZjALhYARPJIQTOoGPM0Gi/LKEaen4JO4U+91GWU7PNDQLOpGD9oVKnJAs
	Juci3hGwAU5WkBBD8spYezr/xQq81fPVAAwLIyA/X35nUpq0fd5ZaHc5VrRbobdm7E5yBwI4+pO
	fi6ggxL2LNDtZTqR41jpVIGsMorZOAiSp23zgte6ZLfJPFR9/Q==
X-Received: by 2002:a17:90b:1f81:b0:2ee:4513:f1d1 with SMTP id 98e67ed59e1d1-2f548f1a2admr26473640a91.23.1736795240946;
        Mon, 13 Jan 2025 11:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfDc/dUlPxqlC/mjZG9JvH84VnYG2P0s0u7Kj0m1pfhKfFGVcrrg4MS9vEMoqII6lPuemp1A==
X-Received: by 2002:a17:90b:1f81:b0:2ee:4513:f1d1 with SMTP id 98e67ed59e1d1-2f548f1a2admr26473614a91.23.1736795240537;
        Mon, 13 Jan 2025 11:07:20 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55946d676sm8185904a91.49.2025.01.13.11.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:07:20 -0800 (PST)
Message-ID: <83086043-d1e2-4a28-9cdc-2a1faf75f011@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:07:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] wifi: ath12k: fix failed to set mhi state error
 during reboot with hardware grouping
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-3-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-3-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rl_q0ObBxBy-PGeczK1F6dsBnxiLtB_5
X-Proofpoint-GUID: rl_q0ObBxBy-PGeczK1F6dsBnxiLtB_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=964 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_110723_696051_681125EF 
X-CRM114-Status: GOOD (  11.47  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> With hardware grouping, during reboot, whenever a device is removed, it
> powers down itself and all its partner devices in the same group. Now this
> is done by all devices and hence there is multiple power down for devices
> and hence the following error messages can be seen:
> 
> ath12k_pci 0002:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
> ath12k_pci 0002:01:00.0: failed to set mhi state: POWER_OFF(3)
> ath12k_pci 0002:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
> ath12k_pci 0002:01:00.0: failed to set mhi state: DEINIT(1)
> ath12k_pci 0003:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
> ath12k_pci 0003:01:00.0: failed to set mhi state: POWER_OFF(3)
> ath12k_pci 0003:01:00.0: failed to set mhi state DEINIT(1) in current mhi state (0x0)
> ath12k_pci 0003:01:00.0: failed to set mhi state: DEINIT(1)
> ath12k_pci 0004:01:00.0: failed to set mhi state POWER_OFF(3) in current mhi state (0x0)
> ath12k_pci 0004:01:00.0: failed to set mhi state: POWER_OFF(3)
> 
> To prevent this, check if the ATH12K_PCI_FLAG_INIT_DONE flag is already
> set before powering down. If it is set, it indicates that another partner
> device has already performed the power down, and this device can skip this
> step.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



