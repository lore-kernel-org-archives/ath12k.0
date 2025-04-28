Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953ABC369D5
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnYeSE/q+Y6YrD0IVK9UjbuuteBPD5AdeP67yGNbmUU=; b=PuLadIXcPORYkV8hv3Y1Gf0fGS
	7j3SkhOC6+lRraJaia3CeFWhhn33ISRZ29xl2VID2BN4Ki+Z7p5nJVjQQczVet+cepGkzvlAeKlYh
	Ge3UccroCf3fCsu4ViiXYBxY8ycuXGDKa+u7FIZBnUMb+2U9vx0lpIop7rQzz7ZSQ86/jqJLNIrZp
	Dw6eo6HWvQhxjx7Y7pPrJ0PfeXdbTndxTLSLk1KuenOWyJWUmo9HQ/7PwnrPWZlt5VMeiyez37xa0
	HjM1YjBW2axAMD1G2dqeq99mnXXlBKkaKUgNbPnEQ7FMIdQ+WOZEO+7SdMqT/pLElcy+oBUQJFJ1v
	x2hX2pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RE6-00000006tw5-1TOy;
	Mon, 28 Apr 2025 16:21:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RE3-00000006tvN-3cMb
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 16:21:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACbGY025881
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnYeSE/q+Y6YrD0IVK9UjbuuteBPD5AdeP67yGNbmUU=; b=IIC/b9VT5sC+RdCA
	V1myzr6p2AddK2ejJF36vB123B7lbienbEdzASOSAnMiqRVlnSPLCjga3gjHZmdE
	4EoE1VFM+GDYG6zTVVAy1Y/bimIuHNPsv5l97P/gJWUwOiIxtIaAnJsa6Cry5wCR
	Ul1H/YXKkcMrKzHws5mhS/P2GODOE1xJ/xrsZQ4n9/DWGId2YCAd9kTZubKat6MQ
	dDr3N//sxD5I/jJTlBAvdicZHcfyDEwED8VH0DSjtv9JmTzgzCLktAck25R4zdjK
	R0Dp9BcH5kDqNKBShNasctxgNfGBfW4fO3uuzo84jBTuvdYFENNTBPT0C2TuvkCV
	N55VAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q321qyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:20:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so2867750a12.1
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 09:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857257; x=1746462057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnYeSE/q+Y6YrD0IVK9UjbuuteBPD5AdeP67yGNbmUU=;
        b=xIaMhCzGNjXfRoWJW9R9PI7/4ywroFWDSOwWqD5gIwmM7HZcL1m3KX/ji5uck8nX4u
         8G0I7L49ntXTUMCjUfsbOZozL7mYHS6gcoqkLSW/ZZyJO9Lw9T1KoMvLYlxvVaQwph61
         nH5Iaah711vcFbtBcv/8SGYt4mFFsWSE3fbGd4q2SUSujvSdK3rxY4CUU4mMev9dkkla
         joOXV9Ugh0760tt3+O69syRkbd415dLmw+fdExwqv36mZP21xTBtxtbu2SrLUzk0MJGm
         RY4SDb/SSNAvX+VwfyThGLFPoXuwTkdrZg5jd73Mj8FjdyCTdpEujaLCIGlG8Jt72tEG
         NeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvszpzeYXyb91UFkS3hJSb4aP4lew629lGHrY+e+/UGc7XTUd58GP19rdOsI3sz2CXttdTA6o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSdknhIl7gFemglhW0ax5RBZMyLL3Op+JnMc/Wq/eEXeFLA/0C
	eCvu94bS70hVFZx05gwodlr7cvncwEk/BGZasBD8O4lJS+10aIHmpHl9QK8Ol1g23S9UczHfISe
	AuPZ22cWlEMyF8QXvTHTQMu3lAUrswFeSBqhYSN++RN+BmFtrSLOfq1giTPiEVd6yh8FG
X-Gm-Gg: ASbGncvPtfuXF3bswDS+ZaZOE3OwJmtIP8MF+kzGohm2miGawtpeKqQS91Nx+z27RU1
	4UtgXmxJiOgRRPFYskMJlHLnRxViZ2H5XhSzAt0gz7NnabNTbZsnxFVmB2t86hG++WybhIAMfYA
	dvBn3C1FmvfSb5NgFc+mnrH+hf9iqzjnlpQH/CKAlN7lHKhmf99g5hAeEPbtxp7j6OVex8AeWT0
	VAUxzIFzK013F8v60r+NNQS/cXa9PCIT44sPhNDLl51lW8YBgWlAoJbU+IkGsP+oJf0NSzRSsr9
	+Nw5Y7LoE8WxTqHvVYykuJn8clnwhz2J1m/Ofy7AqZt/lbTCbqmHiJd6XC0a
X-Received: by 2002:a05:6a21:338b:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-2093e7241a7mr118080637.28.1745857257123;
        Mon, 28 Apr 2025 09:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlIi9uzFadx2FXvf2TXjYbAFvq297GPuwWm5m/Xe5j9oz8gB/6YKGlt9K0f+FWvwAy+Fp8FA==
X-Received: by 2002:a05:6a21:338b:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-2093e7241a7mr118040637.28.1745857256658;
        Mon, 28 Apr 2025 09:20:56 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.192.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca292sm8142742b3a.168.2025.04.28.09.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:20:56 -0700 (PDT)
Message-ID: <c407bb06-19a6-2dd0-c42f-24725b7873b6@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 21:50:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V13 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680faaea cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=XJI/iaC0GbrNbCf3OOiYRw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PJRSDOuFSj8v0qVA-6MA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: NBt2z6owrSTsU288mIgtEv54tVHSunUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNCBTYWx0ZWRfXw8lA+4ju75Sf /gMnJFelqVnwqG+lcvDHLSNloW77JP8nY0QTA5j7RQ/eUBfeXTzB0gnMZHWC5LzM3M0q8a7RHty 95Zu+xTCxoA+lg2y9VjkASDI1x5znPGGJuU/x8qdA/wd8iqdBMz4iytQJp+dZtay/m8/kd1BvYr
 oPSv14YcTAnKpbiXJYsnL6YwD3IUQ2LiFll0XYAR1jerNHWsHBgUPDcJ0uQ3c+w9+4PwaR2ujZF APmnUcFt/wzt2/jYDDsRZKKkBDSrTJC3S8rCPP0u7C2NsF/Uhd4jDSTBtkK6Fn3/SPNBfW27p/u WXKWdVkARoqwx3g2V6x5BlyF/X2NcJ2h7Joiye9wum6BkD0uRXq0hipYqsRflPPrbgPFKaG7gNK
 8piGyNNStHuzwZd494FMUJTVRXwJFJ0A+5koHQUmm4UjCszZsgyGv4xt1o5FU03XLrwHtRPq
X-Proofpoint-ORIG-GUID: NBt2z6owrSTsU288mIgtEv54tVHSunUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092100_074519_2B8DE0B0 
X-CRM114-Status: GOOD (  17.94  )
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



On 4/18/2025 11:18 PM, Pradeep Kumar Chitrapu wrote:
> Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v13:
>   - rebase
> 
> changes in v12:
>   - rebase
> 
> changes in v11:
>   patch 1/9:
>    - fix return values in ath12k_mac_set_he_txbf_conf() and
>      ath12k_mac_vif_recalc_sta_he_txbf()
>   patch 6/9:
>    - fix missing he_mcs initialization in ath12k_mac_init_arvif()
> 
> changes in v10:
>   patch 6/9:
>    - use ath12k_ahsta_to_sta()
>    - fix rcu_dereference warning in ath12k_mac_set_bitrate_mask_iter()
>    - change return type for ath12k_mac_validate_fixed_rate_settings()
>    - improve readability by adhering to nl80211 definitions of GI
>      NL80211_TXRATE_DEFAULT_GI. Introduce ath12k_mac_nlgi_to_wmigi()
>      for conversion.
>   patch 7/9:
>    - do not change default MODE_11AC_VHT160 in
>      ath12k_mac_get_phymode_vht() as it breaks clients which do not
>      set VHT_CAP_SUPP_CHAN_WIDTH_160MHZ.
>   patch 8/9:
>    - Use IEEE80211_VHT_CAP_EXT_NSS_BW_MASK along with
>      IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ for determining VHT160
>      phymode.
> 
> changes in v9: rebase on top of master branch with mlo changes
>   patch 1/9 and 2/9:
>    - fetch link_conf using ath12k_mac_get_link_bss_conf()
>      instead of arvif->vif->bss_conf before mlo
>   patch 6/9
>    - fetch mcs/nss values from sta->link[] instead of sta->deflink
>    - fix spelling of 'incompatibility'
>   patch 8/9
>    - replace sta->deflink.addr with arsta->addr in
>      ath12k_peer_assoc_h_vht
>   patch 9/9
>    - replace sta->deflink.rx_nss with link_sta->rx_nss
> 
> changes in v8:
>   - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.
> 
> Pradeep Kumar Chitrapu (9):
>    wifi: ath12k: push HE MU-MIMO params to hardware
>    wifi: ath12k: push EHT MU-MIMO params to hardware
>    wifi: ath12k: move HE MCS mapper to a separate function
>    wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>    wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>    wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>    wifi: ath12k: clean up 80P80 support
>    wifi: ath12k: add support for 160 MHz bandwidth
>    wifi: ath12k: add extended NSS bandwidth support for 160 MHz
> 
>   drivers/net/wireless/ath/ath12k/core.h |    2 +
>   drivers/net/wireless/ath/ath12k/mac.c  | 1141 ++++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>   drivers/net/wireless/ath/ath12k/wmi.c  |   13 +-
>   drivers/net/wireless/ath/ath12k/wmi.h  |  107 ++-
>   5 files changed, 1058 insertions(+), 222 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

