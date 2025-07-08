Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5C0C83F0A
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZKxO51alpyn1NlycCB3zxkX7gnbPUeF4Q0Nj0s0YVk=; b=rxWjt/ahsLGJAyi3a7O9NIR7a0
	13KolxtDdoef+prNMRfHGX72pq1G+sVedj1C9Bq/E3saAoCw0wtnl96D7uXVFbjCtYPGin53LC1BY
	87T5WKnnTIbQf/+hv7Y58Q08hErB0SSGKMyxGh3qSwGYpKyECFCGLrT1WWcY8psvoC2eOgWV0yV87
	2gztYbsDk7N7psLSEpGu9uKtgg6OjRXNenw3eWlwRnxEDx6c+9uGNHBgM+SRpMAm6UmU+jLNQf2O1
	MkUtSdqmb7es09b6btYH0WGtWdKidDUDUOapX8TJd66LY7MQxBGYgBme4ME3XzJAqDSXp8V57tV3e
	BtriPS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBYA-000000061LD-15X9;
	Tue, 08 Jul 2025 16:52:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAqf-00000005v00-1VEX
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 16:07:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568EbIdY017268
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 16:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZKxO51alpyn1NlycCB3zxkX7gnbPUeF4Q0Nj0s0YVk=; b=RbVvFPDMOPE9ksPr
	sjOU/ugL0hVAMuLwuyzK8OyXK3UJZ0kdvkNhuS6dJW2ASPGNc54C2Lq+/6hd1Mi7
	1uPPPZfeecwcQqJ7RFPP/hJwCnQnIvbWKjcK1D9a115sgwsKJIxMyjO2GEnWsDAE
	r23BnedSWpXvP1uB7TPfjNNr1DQB2Gv3dhlgxM4iTYQsvjbnLwzS7x3w/rgsKIpJ
	5ZWXmI4e3ur5bLvlZYPBZqCo5r5jgw6uhdpTsDQTqmSOHkZLHHMUtawnG+OXKxad
	O+yHV28u4wADOzezrjkqU15dAoln9eXS3P2/5DTZfpj2ym3NoH2GEjnKE6u3kwTO
	SyarcQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveffu01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 16:07:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so3170907a12.1
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 09:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990830; x=1752595630;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZKxO51alpyn1NlycCB3zxkX7gnbPUeF4Q0Nj0s0YVk=;
        b=SdX5Z4q+s/IrW1Gjz8D7+ajbw66QuaRI0AqziK+fX2rxSLRLZ4FSSYDW/1mj1pQXde
         0BL55603Mb6T7SNrVswDSYihc3hXqlCNiys2d2Fdj/GBYhGyRepkCqDpDeV4nxUZx45b
         DD598k9rzEvcy8bMjw7INujxLemwJru+Pi5LviwEJ02M4h8Bo2Omhxr02vVDUyDzbPD+
         t+Z4vgxDPemwqDRqNHaxVSDvvV0H/VtnwvB/eKXrKvcd8B0pazN/Ka4m4QF+luHnl+mW
         VpldrH94PhMKxkgj5ICHbj2bExpqk+QkmR/9UHNqFFu6Bmi6Fa6GLGTNyT0VyWF9W5tW
         AuYA==
X-Forwarded-Encrypted: i=1; AJvYcCWAjT2R5p6jknSGrGSBdjfoa721h3VwT100WKJlAvGEFxq0WUXovcDJOskOE+TjDhpTFYQ3H3Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4TN3Zlq5+l3vnXwLzgVEW4z0T8dfX8OhgnvBYET87HMxC7bs5
	QFrQv0QtVLc15TjK/CpVA15KEjg1Fd3fFIEyHY3c8hZW9YYHE7efeXzwxFs96Y9rowx1dJLX9hD
	31Cp+QrOgtdS6ITvP6G/rZR/STv3d2MFFHWy7AvaGs+Sg5a8DDeXN8W0d5PZ5JRU+qb4SBkcK
X-Gm-Gg: ASbGncutzAwiw8KPhyDpynkFLAFMOfJkr8RU23s7XDmQMce/eGTrU5ehGNTiNL1TEhB
	Dyhz5OstVnuw5r6qmVUwXW78tWoeVkahjiC2kgmdPYo7oJ2J18UvdHDpJeipiZN/v7kROBKH26F
	AgG3ctmB39/UmAObYrL6H5V6pELQM+x1pfuwUDcjQoXbkWAVU4yBq47zx4+4u+/+gJNE7yd9xzi
	Qxg/Id3Oi9h8BljYFSuYXEnHLelZEo33Fsz1WT+iVW1dUN+lFKL5KMUplCugBhiSN9so/0/GnTB
	nQWFKVSqZwA9jlij1lATY0KIFf2zKFs7xMV2a3RCvE6kJaQ9smvOa/Ju0Ip45oxVhmJY07T5SzE
	6Lw==
X-Received: by 2002:a05:6a20:7291:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-225b754f67dmr25160037637.9.1751990830413;
        Tue, 08 Jul 2025 09:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx8uJvopcy0UStb0Kr7E+6JdjWAJz8Kx7laF5QwbNdq+bZKU1Tnx3KcDIOgUChw13iwetHww==
X-Received: by 2002:a05:6a20:7291:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-225b754f67dmr25159987637.9.1751990829852;
        Tue, 08 Jul 2025 09:07:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f413fsm11432792a12.41.2025.07.08.09.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:07:09 -0700 (PDT)
Message-ID: <d2d8778d-a39f-445c-8d08-8759c1aee07f@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 09:07:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Add support to enqueue management
 frame at MLD level
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
References: <20250703051711.2839934-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250703051711.2839934-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzNiBTYWx0ZWRfX6HFnkpYDAo6j
 AKm7rGBgtr1i+3fbNEEn0wksEWXrNtGQGJWGogZ7qTY5M2Jdia1tT1ughXatpwSH13GOgsd4SC3
 SO7tudD08xPx0tPWwctfUfPOUDdGK77OjrQSGhlk9rchdZKpAeUN+VAYf11fzD03iYV6HHkYY2d
 T9a3DSjFxocfpnMOm+BBt4ZleDBivTb1uvASbK+C+mhn7F9r7/LI4asfv2WMApAoK1fCh2dzS2C
 w2n3J/yJ/lO5zUE4J9XR911QWi/a3fidu7PONdyNjYidvx9AVqt3b5ChzLuOGWzDGARyt95s8w4
 fwcRa7te6kaiYfja42vYwY64HfTl6faRv8tD29fAQFRRV1i8JsSfBzNRS+Q5aMPnuCVw4emLbMP
 +FYiLfsavGxOetFET8siddPXDxU6xCtJFx1WQZHSNnG3oVLotR/gzaWzO+kWz+3hNu6u7iZ+
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686d422f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=51ZbUgjbVmGj9eICDkcA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RWgvxOaNo4wWzjuhxe-t5AzAiBQCIAvz
X-Proofpoint-ORIG-GUID: RWgvxOaNo4wWzjuhxe-t5AzAiBQCIAvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_090713_523700_853C6B46 
X-CRM114-Status: GOOD (  20.33  )
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

On 7/2/2025 10:17 PM, Roopni Devanathan wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> A multi-link client can use any link for transmissions. It can decide to
> put one link in power save mode for longer periods while listening on the
> other links as per MLD listen interval. Unicast management frames sent to
> that link station might get dropped if that link station is in power save
> mode or inactive. In such cases, firmware can take decision on which link
> to use.
> 
> Allow the firmware to decide on which link management frame should be
> sent on, by filling the hardware link with maximum value of u32, so that
> the firmware will not have a specific link to transmit data on and so
> the management frames will be link agnostic. For QCN devices, all action
> frames are marked as link agnostic. For WCN devices, if the device is
> configured as an AP, then all frames other than probe response frames,
> authentication frames, association response frames, re-association response
> frames and ADDBA request frames are marked as link agnostic and if the
> device is configured as a station, then all frames other than probe request
> frames, authentication frames and ADDBA request frames are marked as link
> agnostic.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.h |  1 +
>  drivers/net/wireless/ath/ath12k/hw.c   | 55 +++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/hw.h   |  2 +
>  drivers/net/wireless/ath/ath12k/mac.c  |  5 ++-
>  drivers/net/wireless/ath/ath12k/peer.c |  2 +-
>  drivers/net/wireless/ath/ath12k/peer.h |  1 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 56 ++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/wmi.h  | 16 +++++++-
>  8 files changed, 130 insertions(+), 8 deletions(-)

This no longer applies cleanly to ath/main, please rebase

Applying: wifi: ath12k: Add support to enqueue management frame at MLD level
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/peer.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/peer.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/peer.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/peer.h'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: Add support to enqueue management frame at MLD level


