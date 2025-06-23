Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4831C77B7C
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACu+Ugoc+fmjjc65HLikxPSEZ4wRcHUDOKbnH+1uLps=; b=h23GdwTZPPULXFAjwBTcvXT0Aj
	YZ0tcFpaVb5H6h7Lf1HDf7MRcTB3Lttv4lsHlIHxns2XTMEUy2Zw2qh3iClffzBTS3HSowduJ3CPM
	ZlLsd5SBuZOAhBXRHsxyEOHSQYX5M6ZmCVkqnaL0PtwPNijyt11U4KafiM04akFvHTGlq0EQnvWbG
	JnLMu+SYa5Ea1ke0Bk1U/CTzQESdwgl5ZA4qIh6w0doRzWpGLt2RR6b0nWP2fW9EOQGsvxRIrQmmc
	20xtZJH9hrXprT2oRXwPROY1nDtFwcLr0BbYQyaJAY2jFQaBvjP7dyOpUhbNb4E31jlI44iiAWa27
	ZOEpp4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTm4Q-00000003iP3-2sBD;
	Mon, 23 Jun 2025 18:39:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTihT-000000039Ux-0BEe
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 15:03:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NBlicr031297
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACu+Ugoc+fmjjc65HLikxPSEZ4wRcHUDOKbnH+1uLps=; b=A+ShHQbsJjOrz3s2
	9Z/Plg0bKxg1oEMZ5FNLwGstZORMWILp+gfXq/Zje/ePad3uWhLCoopqoz0jv6BM
	iUvoc5YBenfaJe0BHfaMMVkfiQ5mD+aLxL6ZLXYxg21ciOYZkelvT47v8T9zHM9w
	iXWh2lDDd04IynJsGsyabXcXFIsLRIJ8IyyzepoAk7cQSoe/V52aGi9cqgIFwudC
	fFFUF1EoJlygd10U63wGLctLzx60S+XDFctM7H0PoURmFvCcwcgNxjGhw1KwoGnI
	r+WlgdoAIeVlu4PRzaXEuCtEAR3QG1RUnYMPtAaHmWOwv/HU5+jdfnPwpIhG32/Q
	oZGpRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1u6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 15:03:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so5382365a12.3
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 08:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690988; x=1751295788;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACu+Ugoc+fmjjc65HLikxPSEZ4wRcHUDOKbnH+1uLps=;
        b=uAPicg+ZuVOcHsOI1Imv9hKJmgTHAlmqiVAFCRD4sRTqTC4u5BJPZQrtj0AU8Ftlgx
         1FebNqj+TnIRevj/Oxp/FSscZ9iV9uVaHkV9x3YLNSxqKSUginfXCSGbLRPKao8OeeH+
         KM2xGh4yo96DQnHxO8S+rURb7HZAUeIP/hhEPyjGjk5geeQll+LETHSpwVWd0OHaNHxJ
         DtcBDlNjA4ALlmEdYXqN/0L4A5+ZBJKFOWy1h6gr61X/dkxKMjkO0lCacfPyjWVbouIA
         8i3GEyYCR512TWxJqw4S2VZ+wAASOl9xFqNYd++TPizNZ6BnXFWRz3FKF+ODbj7uGpuo
         gSiw==
X-Forwarded-Encrypted: i=1; AJvYcCV6QZMxOKphBhKLAhQLNrk2HDOBr4rNeuh2V1nJXT8vZzsZbis8kfF5Hqgry0wBNzARffiWzJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxKXBhElEcrip01CkLNQF4+LJDjy9val/dEtcxZrxlA3Zk2fvZ
	MRNtqvQCQHGrmDdrBYVQMl8i7HFGIh8e6Bgx6MhpeIpM1PXEc9stHdVXc/tDiTPWFj94vWDh7UJ
	GG1zomKQfnj3pLrScNskt1AYChN3A3s+XTgCFYa4N31PVsl8NkRFXKM7IQbICFozB
X-Gm-Gg: ASbGncvTTyFwcPjDGgAATLIqzh1hDaOuIeG74biE4MDd02+8D/aqnrBpqeJen0sOCX5
	dkLIGk39N7xNoIlGwOmWT9WtdJBAha5vONFADNnFM3e9Iyp5iV3s34UefS1rSrUcG2tM2oGGw4P
	kqV5kkx/P4Na41w4XvcJ0jWWSS7JZIVdodX/VKR6O3E4OkxeaYRn5klh6MvGb8rcEI5i16kTi65
	10a9IHqoE1njeCXYjd3P1nh1uS+WLySu96pFJj2SZe8yHKShWBqb6EdlLnrpjQ7cHX8pHgRMXAc
	I7g4Je17nmrq9RwVgMSXYDMYftH1871As6uBvjOgdDbg0DFQgwitin2NYXCGlzvgHR29WJDIx6J
	gqw==
X-Received: by 2002:a05:6a20:72a7:b0:215:ead1:b867 with SMTP id adf61e73a8af0-22026d8c81bmr22088501637.14.1750690988256;
        Mon, 23 Jun 2025 08:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74WojNJSxdTzppMSfsKAjS02fehU849MkaHH5rLr8CDvVCCJUz/6i6k/1xBO9Cr/2SAoM7g==
X-Received: by 2002:a05:6a20:72a7:b0:215:ead1:b867 with SMTP id adf61e73a8af0-22026d8c81bmr22088433637.14.1750690987654;
        Mon, 23 Jun 2025 08:03:07 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f125d668sm7015916a12.54.2025.06.23.08.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:03:07 -0700 (PDT)
Message-ID: <4521d120-422d-4dbc-9461-6bd0dc32d628@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 08:03:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V14 0/9] wifi: ath12k: add MU-MIMO and 160 MHz
 bandwidth support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68596cad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ewB7IA-g4tuOwMp8HOQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: HccxOHCYlk5Qb6FgdV19P-P6GZP9PEcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5MCBTYWx0ZWRfX0L0nzkc7ZRXD
 DuG39HBIbnL7jhxrKlxYllA6q2C+2/Tme30x58CTa0OOYkJiDFnAIe7Ht2XIJc9T740Gn7Ci0g7
 vLJ9P+LusUrIRKZQMe7wtwkNdsw4C6i8AMiMKgaVvb+uekxWdeZvjnOV7smasV1ba2ookZrRl4X
 UZrLqkQLgBtNWWOsjk81WBTPX4vXfy5R0nMV/2Tkrk7VPrDlfpJLqUmTlJ6f6bfRl1fVXtp0qNg
 fpQmB7Nn9r8lEDQ9xEmVUo7tZ/d6L/Z2n1Gfz2BNwbRWZ3AxvqqnLICjBPlDXaFIGkQMgQhPmXS
 +QmKO1NinIyl6SGx10Ljeqd/G3tuPLB9tI29u4m4m0FFnCDzp9M6h4Xb4viY6h3JdVfb+P1t4vS
 fo6hwtqeARo8eReme3u20EZJ3taVA0FuIiQw244Abqleq8Hq5omknIQuHZnhHyX4GH1Fj7Fh
X-Proofpoint-GUID: HccxOHCYlk5Qb6FgdV19P-P6GZP9PEcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080311_217472_8B5B73C4 
X-CRM114-Status: GOOD (  22.57  )
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

On 5/21/2025 3:45 PM, Pradeep Kumar Chitrapu wrote:
>  Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v14:
>  patch 6/9:
>  - cap max_nss using ar->num_tx_chains to fix interop issue caused due
>    to sending nss value 4 when firmware only supports nss value 2.
>  patch 8/9:
>  - Set the default return value to MODE_11AC_VHT160 for 160 MHz
>    to allow STA to connect to the AP even if it does not
>    explicitly indicate 160 MHz bandwidth support.
> 
> changes in v13:
>  - rebase
> 
> changes in v12:
>  - rebase
> 
> changes in v11:
>  patch 1/9:
>   - fix return values in ath12k_mac_set_he_txbf_conf() and
>     ath12k_mac_vif_recalc_sta_he_txbf()
>  patch 6/9:
>   - fix missing he_mcs initialization in ath12k_mac_init_arvif()
> 
> changes in v10:
>  patch 6/9:
>   - use ath12k_ahsta_to_sta()
>   - fix rcu_dereference warning in ath12k_mac_set_bitrate_mask_iter()
>   - change return type for ath12k_mac_validate_fixed_rate_settings()
>   - improve readability by adhering to nl80211 definitions of GI
>     NL80211_TXRATE_DEFAULT_GI. Introduce ath12k_mac_nlgi_to_wmigi()
>     for conversion.
>  patch 7/9:
>   - do not change default MODE_11AC_VHT160 in
>     ath12k_mac_get_phymode_vht() as it breaks clients which do not
>     set VHT_CAP_SUPP_CHAN_WIDTH_160MHZ.
>  patch 8/9:
>   - Use IEEE80211_VHT_CAP_EXT_NSS_BW_MASK along with
>     IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ for determining VHT160
>     phymode.
> 
> changes in v9: rebase on top of master branch with mlo changes
>  patch 1/9 and 2/9:
>   - fetch link_conf using ath12k_mac_get_link_bss_conf()
>     instead of arvif->vif->bss_conf before mlo
>  patch 6/9
>   - fetch mcs/nss values from sta->link[] instead of sta->deflink
>   - fix spelling of 'incompatibility'
>  patch 8/9
>   - replace sta->deflink.addr with arsta->addr in
>     ath12k_peer_assoc_h_vht
>  patch 9/9
>   - replace sta->deflink.rx_nss with link_sta->rx_nss
> 
> changes in v8:
>  - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.
> 
> Pradeep Kumar Chitrapu (9):
>   wifi: ath12k: push HE MU-MIMO params to hardware
>   wifi: ath12k: push EHT MU-MIMO params to hardware
>   wifi: ath12k: move HE MCS mapper to a separate function
>   wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>   wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>   wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>   wifi: ath12k: clean up 80P80 support
>   wifi: ath12k: add support for 160 MHz bandwidth
>   wifi: ath12k: add extended NSS bandwidth support for 160 MHz
> 
>  drivers/net/wireless/ath/ath12k/core.h |    2 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 1144 ++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>  drivers/net/wireless/ath/ath12k/wmi.c  |   13 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  107 ++-
>  5 files changed, 1061 insertions(+), 222 deletions(-)
> 
> 
> base-commit: 0d777aa2ca77584b339ce195db86fe0ee7dda5d5

This series no longer applies cleanly on ath/main, please rebase

Applying: wifi: ath12k: push HE MU-MIMO params to hardware
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/mac.h
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Applying: wifi: ath12k: push EHT MU-MIMO params to hardware
Applying: wifi: ath12k: move HE MCS mapper to a separate function
Applying: wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
Applying: wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
Applying: wifi: ath12k: add support for setting fixed HE rate/GI/LTF
Applying: wifi: ath12k: clean up 80P80 support
Applying: wifi: ath12k: add support for 160 MHz bandwidth
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/mac.h
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.h
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.h'
error: Failed to merge in the changes.
Patch failed at 0008 wifi: ath12k: add support for 160 MHz bandwidth


