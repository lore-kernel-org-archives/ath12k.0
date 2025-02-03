Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD6EC02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=960Pc7C6/z2kp86Pu3/RiBBRIL3TdKpE7pdMs2K6Q50=; b=04yENs1naVkgVwZh0hGr4SWW3z
	NhypaGp4vgReWn3yCo8y3A/G/++BNF4PQmagia6C6sWuwTWszipJTURxMSuQYGgICFWKPQvy99/P4
	eyZm/FRnK69u5N7x/CJJiOUXqoHketYiTH17G/nZIJlQUg2+49Pq7s8i7QRTZBtJro81AsE4gRSAw
	0ZalLHlVcKPcwBwySd9sCdbRte0weE2YC2PVO/0WCaViR/TOovxvCQASoLzoe36SWn97Y7dQASpXC
	p4efQSitrJswEInnfBIyiVlas9SBHB25uhGp/oeqVFwZC/pdH7kjC6NoV8SnQrTQFDfPdenFDhH+L
	+V5RBF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyEO-0000000FqhP-0CQB
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 15:19:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyDh-0000000FqYD-2Mij
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 15:18:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Ef4X5008189
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 15:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	960Pc7C6/z2kp86Pu3/RiBBRIL3TdKpE7pdMs2K6Q50=; b=VAluHkvc3D5jN174
	5XETurrxkeTeqWHEfez76lRY22KTBbSmNPnRlRxOXGowKuVbU+31Mq7uPLUDEvZZ
	RGYWbgybvNYIMVnZQGj1PUrkw0izBpsLMTuucvp4Fi7VAduvOfs95+2nV7Lygjj3
	RP+OFVDaQr9dq85iLJlhoS86BhRUUoYzGGtzNkTFgqgbrimSUCHf8klNRRo5syUN
	Qm83g3Cu0VtWdyuk1Md9KWBrJus+ilIcf3zpJCfWbvx5KHGOkvXjh9GzbpCqf3wI
	pKRYX/FQFVFOpF+YkjN7tp+Ei0IL4DAVafxXud7yLdDDIhHU6kimWrtl/vlogawK
	bP+vUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw1fxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 15:18:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21655569152so99468925ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 07:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595919; x=1739200719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=960Pc7C6/z2kp86Pu3/RiBBRIL3TdKpE7pdMs2K6Q50=;
        b=DMH9oDVHYhwOUSwLWNfH0qB4UEfNVWDFde7ySHGCXqHpwDrgd4ItPBPq+2BVbeIOma
         TdyPfPuYfwOeBSDit3QLdZvuDki7IdsIVuONl5PeZD8yK/PKbj0fGgY/3QRLkw0h/JJ1
         b6b2xEauBOi/aA+GRnY/jUqQL/T9EAItEEFKMBBk1J4+MAc+LecKycL8XuSTBxdF7O2k
         BXgl4bfvKxlgUa89tDrtIwucvQefBtC21/KWgUU/yaEEDM5x1onygo8/49/QOtt6TdkC
         gJwjrWeLRiSmROZeyxm9UmJpcboly+/F7uYPb101yqNHbsqmTrTWALAQRy1FrmAA4cJM
         OkvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKsB9z0LXj185hj9MqMntqNid7BlJvLjJPEjXq640Olj+cFul1jEL3HPPfhQvuzvwcikGxjUg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo3T+dsRfYitgHpKRlUTL1PeK4CiukEsR2Fo24UtjkVzE465HP
	AaThiFF3YC+HUzeZnDECiyMP05obPQJ3iCaUjMP3optTXev2Xn6mvMn2AqXTyR8Wgj/sfZV7Zm2
	Aa1BpSkc9MNeKo+JY6iwVy6EWP0MEOBRIUHHEydk918baJKoTzKmNgg3dqvCoAhPJRttU
X-Gm-Gg: ASbGncvRdmmM4V2QFyWn7L151zbDqvaUXl5+GxVbYAMvRk1AOXP7bE8A6A9n9Y4bSie
	1VscSRVgmeJ6sYQ/8JkENNzBSoXc1FRRHkUsDSmiB1jo0o86htXWT+Alxthsj/UbCqek5c7Kf9s
	F3gN/PogHSpsfN90AnXJSFXEkDKBwJDGreODKtVjnUIKh5tWgJvdfkoAiUAGLToHcXufQU1lp+P
	q+oVNQ58/kgTZVD5bi3NNVenq5qKlol7v7L+OB2RMPznPoAYnsgK70UASMu/q++iiYg/6i5AtJC
	kew+6t4JOdqV1f4vnPStAQQw5rDB84DpgknfNrsRnQ==
X-Received: by 2002:a17:902:e546:b0:216:485f:bf90 with SMTP id d9443c01a7336-21dd7d7f85cmr297001425ad.27.1738595918879;
        Mon, 03 Feb 2025 07:18:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE71/YCq0vhxjrNAqWGNtyl9CIs/2eGQA5lKiB7X8kCPwWGf2XVShhMC/W+fgZISaTCW25uRA==
X-Received: by 2002:a17:902:e546:b0:216:485f:bf90 with SMTP id d9443c01a7336-21dd7d7f85cmr297001105ad.27.1738595918475;
        Mon, 03 Feb 2025 07:18:38 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee0a7sm78689475ad.18.2025.02.03.07.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:18:38 -0800 (PST)
Message-ID: <14f4fcc5-b39e-495e-bdee-ef37fcca2d32@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 20:48:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] wifi: ath12k: Add Support to Calculate and Display
 TPC Values
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20250130061104.962124-1-quic_rdevanat@quicinc.com>
 <20250130061104.962124-3-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250130061104.962124-3-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z6k6930_xEe4YqUmqfTw5-vu3_9VmSt2
X-Proofpoint-GUID: Z6k6930_xEe4YqUmqfTw5-vu3_9VmSt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_071841_728641_5E7E0B01 
X-CRM114-Status: GOOD (  12.24  )
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

On 1/30/25 11:41, Roopni Devanathan wrote:
> From: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> 
> Transmit Power Control(TPC) stats should display per chain TPC value per
> radio. Add debugfs support to read and display TPC stats type and TPC
> stats. Take power values for each preamble type, rate and NSS combination
> from a particular index from each power arrays based on number of chains,
> NSS, modes, MCS and tx beamforming enabled/disabled parameters. Minimum
> of the values taken from reg power table, rates and Conformance Test
> Limit(CTL) array table should give the TPC which is in 0.25 dBm steps.
> 
> Sample Output:
> -------------
> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats
> 
> *************** TPC config **************
> * powers are in 0.25 dBm steps
> reg domain-22           chan freq-5955
> power limit-126         max reg-domain Power-252
> No.of tx chain-4        No.of rates-1164
> **************** SU WITH TXBF ****************
>                                  TPC values for Active chains
> Rate idx Preamble Rate code     1-Chain 2-Chain 3-Chain 4-Chain
> 4        OFDM    0x000          39      15      1       -9
> 5        OFDM    0x001          39      15      1       -9
> .....
> 12       HT20    0x200          40      16      2       -8
> 13       HT20    0x201          40      16      2       -8
> .....
> 44       HT40    0x200          88      88      88      88
> 45       HT40    0x201          88      88      88      88
> .....
> 76       VHT20   0x300          40      16      2       -8
> 77       VHT20   0x301          40      16      2       -8
> .....
> 172      VHT40   0x300          88      88      88      88
> 173      VHT40   0x301          88      88      88      88
> .....
> 412      HE20    0x400          88      88      88      88
> 413      HE20    0x401          88      88      88      88
> .....
> 508      HE40    0x400          76      76      76      76
> 509      HE40    0x401          76      76      76      76
> .....
> 748      EHT20   0x50e          88      88      88      88
> 749      EHT20   0x50f          88      88      88      88
> .....
> 812      EHT40   0x50e          88      88      88      88
> 813      EHT40   0x50f          88      88      88      88
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> Co-developed-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Co-developed-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> Signed-off-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

