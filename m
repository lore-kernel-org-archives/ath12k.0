Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523C3FB5190
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 04:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=; b=gvaT3fEvkb0tju+cWPktRjIvdA
	7JCc8QG8pzr5sowHoWbZ3qQ5/Vti8zdvr+e4MLMrPnMsgkgz7vv4ZUXgcx7dfXinva0eNNvmg8f6c
	7FCmFHrfxJkDUl/C4r1D33EcRmroKnP/0ynZjxn3N0Oa4FybIyACrhOa0HXi3b7+QC5XQQfdV5+x/
	rVsFL+LkwM9wbTZ4vWi62m4xTzPD0dK/2VfiH6MnrQU9c1oElEhoYaBjC1oLtbU4aUwPzvtumn2l3
	zMtHJK4eLm9nD81D8TUYQ8WdpK8wSfOZGvJMdRz2L3dCL06y9zLqraLE2YVSu+cL1LNyWjRzYV1Es
	3lvDPEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xiS-00000005rir-009y;
	Tue, 07 Apr 2026 04:07:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xiP-00000005riY-2Cl6
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 04:07:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQHef493201
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 04:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=; b=NMVrl8AgoCNV5rTW
	sHdkBslP0f3lNzkrbFcRcpeTpcg51I5aBbQbtnWuMj4nIJfi2jifSFja+qHxgOaW
	DHIuZsIbsu8ARY7snOG2xGXGer2xWLbI89K+aU0krpy935k0ToEWDGCNGC+iNZEv
	1T92hZhmFJMz7NAu4fEwFdgJCfh774IVxAKBfhpsG3Vb4q9fPRGO3eWSe9ZazTsr
	kzbNIKhnFtY/CJejE/SoPCOrvKIieyUrEYIAVCbm2m2gkRGoxlAucz/X6++o9D3o
	ddt9HWnWQn8KBGkVVwblaVgkqJ74qzT354G+9q/WikrrHakHvKBZ0hJbguLGKXxk
	bEvJJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8rx7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 04:07:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82d02942266so5795877b3a.1
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 21:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775534819; x=1776139619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=;
        b=UrVfj1cNdSoXnZxoECmxOWoCHzcrUwNjlO+zbNqZj/b1IzrW5rB7zJ5YOehzQWreNh
         rB9648tzeHEdkBVQUg1jRw+wXqIYD6Hh+ScRieypU6PY81n6+gIdSqpp7qIzRzXbkjKf
         PLQ87Thzd8j5LpfNV7epJ6kgr2BUrUtgoZE3MN4H+st1enHkE3o/O0Ktiq/5fso9naxE
         AsDlyQCXqmhz8A3Sm8wfurzPCk4BkhLtQxVHJ+984d7zijB3VpOORhiiQU007qseNFXH
         aNpYdtyT9HLqu2/HW6o4Jev8cjj2omdj7QyawErOycWLcT8uds2As9XF2uABhBCL1QDb
         t/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775534819; x=1776139619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5OG6lICsmuX05QyL4RIPqB/8SW9MLBfBau3CiAnvoY=;
        b=VSN84NALXzLIwjGXCSR+zQ5i9d73YMqG45XRuBXRfnKEjY8oEwhx5YCanzJnN5J1zE
         T9tVUpAIAbsElhE0a7BxbmSmoNc/Fy9FlHQ2Vs6Bn3XDmytYpHbAqmoVqqlXNYm9Dked
         S+K8IKQbhdiMwD1TURFP61Uduk/VzrmfNb0HP2kbKaRdEHNVtt99oBlfrM2e01noeKRm
         x1gQ95/HgX8MmwgHaOyv8UQKI/fCvHm17LJ/qsHTp8Td3NMmwdmX0mZ0bG8biZQwxeo2
         ChS9SULlLXZC9lzTWo+ntoKMLLsHeG5OVAdGc79R2LBf7qzk32D2sLKM0PVR6KtApy1N
         65mg==
X-Forwarded-Encrypted: i=1; AJvYcCWJZspwj+DvpQGzmSYByuW3nYYjb/rMhh/N2u4YF4cbn44U+NiY5DvMvrsqAWkbzVjbN+Zkf/8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9DZctVJ0ZU2/GzpHnEpYYyhW7nFjrvKDjlA5UPkrEsP9YUB1Z
	2kNX2oevh1MQjP5IMkEhzGH44pDr8g5AwrJ2Y5hFYtPVBFse9Wm4i/B32v91pzbWRNCEZLO7i+t
	yFwvPxaZVJv56Z+wxigfXW0AKNU36TxVzVInbttnIdRqrT7tf/CVjUDqazOJ9w232
X-Gm-Gg: AeBDieuQXyvsyhOBGvttrkLG5RQwdvVnbeR1UJ0hOUqdGjjNcNpHrrSmqMQB7pzJJvc
	RTdQluSbGS3tBpYr+he1lMx2NBlKpa0xLv+OAKmy7ZdHW95ksBqqq8Fm6NSEgGFzoSotJ7tXbMz
	/GFR9Djtmv2MkCEheL9AQUrkwpikJJ6EWv4PwwKNsdaIx6D8EURAdG6LVpA6gCvDb9gyDh7A+IG
	z4RNuflnAe2/hXpkdjk1PheiXzx3umRHIp0Uo/h1fg3lWCzHffMnITcHUvQFurgSxTXlBPtoAQd
	skdPaEXGW8gjh6VahTU7kSagnxyY94voYK4NMD4tXE322ySXaYv/SEYi51vUyiUvXODfX+tdxIa
	Pjo1QAZk9n5mFuLvNKBXgUxINxjCLk8/PaGdPDrZaEnFwK8BaZQ==
X-Received: by 2002:a05:6a00:298e:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82d0db8f8dcmr15118554b3a.42.1775534819423;
        Mon, 06 Apr 2026 21:06:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:298e:b0:82c:e601:3601 with SMTP id d2e1a72fcca58-82d0db8f8dcmr15118528b3a.42.1775534818855;
        Mon, 06 Apr 2026 21:06:58 -0700 (PDT)
Received: from [10.152.196.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm15802821b3a.59.2026.04.06.21.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:06:58 -0700 (PDT)
Message-ID: <ae47256c-053f-474f-b799-24274c68dfd5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 09:36:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <20260402-ath12k-ipq5424-v4-2-cd1e0f0a6c88@oss.qualcomm.com>
 <5fff7189-fee7-4d73-a9a1-728389900678@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <5fff7189-fee7-4d73-a9a1-728389900678@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9lvszZwXfniAbwl7CqU9AkCXg0q_Tic1
X-Proofpoint-ORIG-GUID: 9lvszZwXfniAbwl7CqU9AkCXg0q_Tic1
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d482e4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=tZNLRw8BZbjVNQK_SNEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAzNiBTYWx0ZWRfX+gNaYzFBlkJf
 Fc9W2DsF024HEKeg/E5SkFcjRPqC35wacO3oQy2S62/+dPrf5fgAez7jMFyTLIGtvsvw0DgmLDc
 NnrmslxhvquvY70y6I9T9JPvnuL2vVlr5SaASL7xMAMXi2oZPyG8AaJqo738G7TlQSKdlC458xP
 HWFhcqN5E5UBqOgbIsexGyGW6WDKYz+QTiRG4D4PGvuKpGcGeecDrY8jbiPSMzmq6lv++zqImtv
 x+kWxGQQGjPo7fbYAzR4JReaqBZPHObsccj7SmGtd/CXj2Y+o0mxQkLTi7QhHSqimjts2gzPe6u
 fOAvY06S31+GdcmknSwk0OJyQXkGv/PJxRoKA1xBoBSOqYouJrGGoypj66c3z3GqQaSQzyQvcht
 Y0VSFp5aJtlgHZxk4lo+cGe3SjGd9QtoCNv2qpQnmmBhi9Fgd/ihldn+rDmtoo8V9JE1oMUq2Uq
 OSnBJf1lT6Ua5jC9CVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_210701_603282_793235BC 
X-CRM114-Status: UNSURE (   8.50  )
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

On 03-04-2026 14:31, Baochen Qiang wrote:
>> +	{
>> +		.name = "ipq5424 hw1.0",
>> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
>> +		.fw = {
>> +			.dir = "IPQ5424/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,
>> +			.download_aux_ucode = false,
>> +		},
>> +		.max_radios = 1,
>> +		.single_pdev_only = false,
>> +		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
>> +		.internal_sleep_clock = false,
>> +
>> +		.hw_ops = &qcn9274_ops,
>> +		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
>> +
>> +		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
>> +		.ce_count = 12,
>> +		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
>> +		.target_ce_count = 12,
>> +		.svc_to_ce_map =
>> +			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
>> +		.svc_to_ce_map_len = 18,
>> +
>> +		.rxdma1_enable = true,
>> +		.num_rxdma_per_pdev = 1,
>> +		.num_rxdma_dst_ring = 0,
>> +		.rx_mac_buf_ring = false,
>> +		.vdev_start_delay = false,
>> +
>> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>> +				   BIT(NL80211_IFTYPE_AP) |
>> +				   BIT(NL80211_IFTYPE_MESH_POINT),
>> +		.supports_monitor = true,
>> +
>> +		.idle_ps = false,
>> +		.download_calib = true,
>> +		.supports_suspend = false,
>> +		.tcl_ring_retry = true,
>> +		.reoq_lut_support = false,
>> +		.supports_shadow_regs = false,
>> +
>> +		.num_tcl_banks = 48,
>> +		.max_tx_ring = 4,
>> +
>> +		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
>> +
>> +		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>> +
>> +		.rfkill_pin = 0,
>> +		.rfkill_cfg = 0,
>> +		.rfkill_on_level = 0,
>> +
>> +		.rddm_size = 0,
>> +
>> +		.def_num_link = 0,
>> +		.max_mlo_peer = 256,
>> +
>> +		.otp_board_id_register = 0,
>> +
>> +		.supports_sta_ps = false,
>> +
>> +		.acpi_guid = NULL,
>> +		.supports_dynamic_smps_6ghz = false,
>> +		.iova_mask = 0,
>> +		.supports_aspm = false,
>> +
>> +		.ce_ie_addr = NULL,
>> +		.ce_remap = NULL,
>> +		.bdf_addr_offset = 0x940000,
>> +
>> +		.dp_primary_link_only = true,
>> +	},
>>   };
> mhi_config and current_cc_support are missing, please explicitly set them.

Sure will update in next version.

