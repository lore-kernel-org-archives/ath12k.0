Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE72C83F0D
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdPQGpjrY4GgzrnS07a54sSjWQm02bCXVIIpJTlgTgY=; b=kRL2RzJe3kDyaKEcvodw0FVWQT
	zmxcsXCraVndzzOgrosA8+dA6blA8Xqw6t75aay5h9fEC+fz2LXaARDKjQ2QmXvR9HRGxnZPvqX3z
	AIITJjbRjbJx4lJIPG4MJlandC8sqU7xDCzO50k2XIlXchkf1fGFEJttUB63Gh/TIusVOggcCe94l
	MUMVU30dGoT3PSIrjwUSVki1IGpj3EiQyYG9Zp9qK9FGmsrrrhWa9P8Nfj8BkWHFcJu+dAdDOcicH
	SzePQ9ZjD6fugLdpmkfxoD4rfHsKicujvM1B3z6tKMTnoODhYDDwYAawtC2w3COu1MLuLOcobn3Mn
	A2jv8CIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBYA-000000061Lf-3yrH;
	Tue, 08 Jul 2025 16:52:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAsT-00000005vLA-00YJ
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 16:09:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAQW4003516
	for <ath12k@lists.infradead.org>; Tue, 8 Jul 2025 16:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdPQGpjrY4GgzrnS07a54sSjWQm02bCXVIIpJTlgTgY=; b=ZsMvs6gTaosj4sGO
	IrCNi1e0lbPj4ZVCh+XE42Jg1cNH9vUETcPKRtz1VqNAxRmSFwc6IYEPj2PpfuUX
	oFgnebJ6Q51wJNCjfuEtqlZPH6iAakqKf83Rz39UQUXwRlEnPBl9xz3G0AmFH4jQ
	7OFvvc+BHRNvASno6H6e2Kh7qMqB8ikuYOjt+HiEFCiaFHauxHF8YrlJPCU5wA79
	+Ub7QRIFcc8ioW4s7Qr4WQFwoSbOakg7XOuopHOZXV9ucgif2OrVyERC66jZABb8
	KrHIHMUZ1nTsRXoEwBYqAr8ly03njTf95iwem8hrxkVyhS5migBokYKHHae3rMa0
	1iT3Ew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveffumc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 16:09:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso3084608a12.2
        for <ath12k@lists.infradead.org>; Tue, 08 Jul 2025 09:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990943; x=1752595743;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdPQGpjrY4GgzrnS07a54sSjWQm02bCXVIIpJTlgTgY=;
        b=hHMyMqDVfrNJz3Od6mrz8qxxBTMubmq7E3ylK8sb7kCGQ6A3gHc5UYghmo0xUqWRWL
         3F+k+Ecz883XX9nUQIqBjlFpJd+k9rphIbA/d67X6ikqZwdYyqY7XEzGQIvxzc3CrSsA
         E0bgI2TEyhKulPwKI2z9hpIFdjZVfkpx1YTKInCgC+6qPMUfcBpCIavjZFLhqdAqOh2H
         etk95xqZ7CqsV5wTpe0Sr98jljB7rXiE+l7RGc6Fy8JS37cVT6yofc0D1Xr0od6sJbEn
         ezBxSkYxf9fG1LHX8ZJAQrvBF0mrYF517TP5d2pH025rStLeWwMf5SCCardZrPSAM2Tp
         PCFg==
X-Forwarded-Encrypted: i=1; AJvYcCWPteF98vbpkN1fJiX6UlGg3S+fjaghHlhD1Oq4GWdSrmEUfDgYEt90rJ1csLMH/fqwly+vspw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnBdkxMgrZtgLX4vFWvG6IqyDieA3kPDFTTRyVymJFmtSt/SVT
	Rq8+BubbeMfzFuOgE6j46hKhXPwOoO640jbRpgWaEaYs01TkK+cvGflxi/OyXSe2KbCF5/zK3Ph
	YTRzaSXZgcRVq+thE4HuOXEAZ29yGkeaXztuAhp89YSVYZzyM9+tVJvXZ1WPYyn3P
X-Gm-Gg: ASbGncsGuFSZ2MP4fQiKa7ClcIVNV3tfqbJNudkfhw11CsPOWbGoUpkI2/5t9ep+fUa
	OSsmQu8DkQ4ySueDXb0uXWxyLcJaqmEMidg6NHQM2pQDtiJnZ3T/DAu0ScMZWOocWUvBdMTqoRB
	e5BsOmmYvyvHKw9gV9cev5Z0EBytCj0zJOEjYScEKtZkhlII1uj/sImQw+9u+XvtqIWy+qV+i2K
	FAYiprX2LnevZYVuukxqTI7JVuIIib60LR5+HUGnGYFX3YwmUMV6PM4PE2GjeSW8Ws1Qs3Dgs6K
	SdlDJNMJx25JOl4acLHUPidTVlabfhWsWNy2z9K9C+pB04PSk4bKTbp6LId6RgXWhDJa9/S78Yj
	ycA==
X-Received: by 2002:a05:6a20:7f9e:b0:1ee:8435:6b69 with SMTP id adf61e73a8af0-22608fb2fe0mr26434363637.1.1751990942838;
        Tue, 08 Jul 2025 09:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDdSqZgaeBfrj9PY42wr9+md6gJ/VxFPLSf4fEepx827EldJHgP20CH/ixffq8pRXe/85sAA==
X-Received: by 2002:a05:6a20:7f9e:b0:1ee:8435:6b69 with SMTP id adf61e73a8af0-22608fb2fe0mr26434315637.1.1751990942354;
        Tue, 08 Jul 2025 09:09:02 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm10688855a12.62.2025.07.08.09.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:09:02 -0700 (PDT)
Message-ID: <ab185830-3627-4af2-bcd9-de3a4791b8e9@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 09:09:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: support average ack rssi in
 station dump
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sivashankari Madhavan <quic_sivamadh@quicinc.com>
References: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250612114620.1055840-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzNiBTYWx0ZWRfX9OzvHkONAJmM
 mwqOyD2oBqXFisMS6tmII2HWAV4XNm5tbRliLxRaPXM2SzHMpXDpGfQx6FDXNuiHTNdONua4O8B
 Sv1ymG/9iUMyDmlrX9HT9sQu+aXkrtPJUrvuCPvuOgSKRfCOrx0S3Jm5euTWlkXuGZQR51zmWz2
 ejysnsDDGLyxoEJ9lFUfmf3DNoXxRH9hcVE4znaiKWEAGibiUFHcXj+tfX5x94jWix4LT31DY13
 i+jS0JRd/dW4/CVaac3r2CZJ+1gDy+PI02K2DZmJet2xPJXNO/Sn+OyiNLa21dYyFfGOURdznYM
 ayLlA6ar9/M9zbIPBs7Owv80aqneOcEhyyDtP0oiNjZLr2dsEg55jREhEzu2AmEKVg5COqlqP65
 zNjyxxJXjo+MmMWwQTr4yf6m/NYaUtclbGY2nN3ahwN2ujN+/JyG+Ym4akcfL24dnhGzGkkk
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686d42a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=we9uffyMNb9VkVnrAU4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: L1ClCGXaeU0nBKwS50kiuZ4UF1a5zF-6
X-Proofpoint-ORIG-GUID: L1ClCGXaeU0nBKwS50kiuZ4UF1a5zF-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=991 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_090905_161378_2FC504AC 
X-CRM114-Status: GOOD (  13.38  )
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

On 6/12/2025 4:46 AM, Sowmiya Sree Elavalagan wrote:
> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> 
> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
> management TX completion event from WMI. Update ACK RSSI value obtained
> in management and data frame completion path to ieee80211_tx_info. Also
> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
> register to mac80211 layer so that ACK RSSI is added to station dump
> message.
> 
> Example output :
> Station 00:03:7f:01:5c:4b (on wlp88s0)
>         inactive time:  46584 ms
>         rx bytes:       955
>         rx packets:     10
>         tx bytes:       769
>         tx packets:     6
>         tx retries:     81
>         tx failed:      0
>         rx drop misc:   0
>         signal:         -39 dBm
>         signal avg:     -40 dBm
>         tx bitrate:     6.0 MBit/s
>         tx duration:    1185 us
>         rx bitrate:     309.7 MBit/s 40MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
>         rx duration:    0 us
>         last ack signal:-41 dBm
>         avg ack signal: -40 dBm
>         authorized:     yes
>         authenticated:  yes
> 	.......
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> ---
> v2:- Rebased
> 
> ---
>  drivers/net/wireless/ath/ath12k/dp_tx.c |  3 +++
>  drivers/net/wireless/ath/ath12k/mac.c   |  1 +
>  drivers/net/wireless/ath/ath12k/wmi.c   | 15 +++++++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h   |  3 +++
>  4 files changed, 18 insertions(+), 4 deletions(-)

This no longer applies to ath/main, please rebase

Applying: wifi: ath12k: support average ack rssi in station dump
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/dp_tx.c
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/dp_tx.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: support average ack rssi in station dump


