Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2740C8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 02:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFHZR640whZ50apTRavefB7gtI4x66BfTikrkd3j2JA=; b=oTyrMRLlxtwheas6cac4FF1nzr
	Pm8QmbSh3PW2hUJ96t/9CFADMVSXlWgtT1kdEmPYCR+8uVzBljapCeifQdHhG4FQQMU8e5OjZp6hZ
	P0GhaK8zPq4LW7Bbw7gPdaj8HMvKPp/0q31D26bkXeJ6Qlc3P7R2JSwL29nIDiQMrF0Ht+c3RMLB9
	2C/YNpzO9s3Ye0ZI91S5IbJhI1KbJu1Q5aAEFUqZ8wh2emZCtuoboLb6RJ5hW4JLiy0h4lhUpPx34
	2yfa4d4uZiPf3PEcamHMPxyjeu3i6WtfsBRLXm/RaUam8EknCRPkrRfAR5uxSXjGUk+GIapcIu18T
	b2LV0JZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQXf-00000003rOM-2jkr;
	Tue, 01 Jul 2025 02:16:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQXd-00000003rNs-0wik
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 02:16:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFTH7R007345
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 02:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFHZR640whZ50apTRavefB7gtI4x66BfTikrkd3j2JA=; b=JVzipEJa5pritMl+
	4CW3825w9IHTnwFHVlCP+9+QqOVUYUa72B5VAXwvw9YEztLxK4f94a6e96Df9bWv
	NU54lBlbtXL5rzVhmmd8epHCMHdN3U8vReFpsqmBAIevJjpuXkh6nDI8kNhqbJEZ
	FKPmgUx2FfeqHJ5dl/GfsX3sWFso+99/fcr6OTEbcReVFwe1Yk6QVhueAiu8gw6q
	ZvlXMtQ78doSkr8421k3uU+rE4xMFT+j5GuPV7TM6Mw/AEzeNLgCYQ0wcTB3ANGd
	WXzwB+RPkeTGS8WVsco1OXKN/oDOVgSI7V7YIM4i7/Vpzj+1gFB2dGgp6CmBElAw
	woNZiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jb4t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 02:16:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso4801103a91.2
        for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 19:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336171; x=1751940971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFHZR640whZ50apTRavefB7gtI4x66BfTikrkd3j2JA=;
        b=WfajSJqg6FYM+pc+hDG7iHKu2w126AN5ita38N5exeAtXXJzRio1vd1rcT6XsyvDSL
         kBxWwnoP3sCEwX+O9Tuki0vWGCxqHnivovCPmSXBy2Ep95Ka8k4lmja0ppvD1UYdexEN
         ecQeogqhmOZ3KrdN3UdFYLW76t959kYjKC3uyilFi6w503TAHtNi0RqxqWRr6ZAmDpMs
         vfDXpcZ3xvg/lTMxuL9jLv5nvWLjx7lINE10hhJJFRVXdeE+eOybb+iHkVhs3SzCusCD
         8txpJiDicOanYBLZ8vcdoIKz6GSoX5/Gjh5eWqk8U85fWGng4tkTt2fHsontxmDUDg5H
         r8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUmfvIZn28C5MwKlMZ/+tLCkT48YXbh//aN1Oerv9CgEjfwBJgBSTzVPsvvI//uTNElGUgSXMw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUXzEV7fN2G/tjZhq1T8scYB/GDJD8k4kl2fdc3tSZogpjaMHa
	iFVt3rUC2Aknw91a5Zg+lkYHfdncZhmPn7e++c5FQShE3zQ1bNpvp0paAqx04PEJHcEhhSPkXzx
	VQa8hpUwdD126tqReZX6kCxziNtoiLt/M0WnDk2SeoZAbedaYUgMriqfWcW3McxI9
X-Gm-Gg: ASbGncvhdYHkMX600gKzeJ49+FSuSKa5Uf4K3ta7iou3S7bev3+gTt1SXmx3mYSUsWe
	HUKhI5TDdgdc+5oA7eEPH8sRIMjwhop/GT62O/kSAnBz9FY8e/DDwEfjeXWjT6ZHo0UbOxJShmg
	KGX2zzKUili98j4vuzh6nZpTm7gm1v7ZffCwy6lDyps2qMhNXZygGjLhXnLUDQQ3jemA1JC4HOH
	uzwJNsI/VSchs9V6jBv0ey51CwdIS9Ytz28tPIEJsGFkPQkSOVjpX1k3BJoGZYR2BUgAjeoXFff
	YCP0cNgax3qVtnHqnQh5/7j8I/vmTjV10kkCxkbsHE96icsz1ax0a3eSDcn6mDeFlJvc8pIfEls
	4yHXUgYeF
X-Received: by 2002:a17:902:da8b:b0:22f:c19c:810c with SMTP id d9443c01a7336-23ac48e36demr215881705ad.51.1751336171331;
        Mon, 30 Jun 2025 19:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl01jur39CibMv88CkAiIoOzI3KNSrRmyG7VLRH6HJ62L2QCjUqXTwQIAIA8IMkZVVV7dQsg==
X-Received: by 2002:a17:902:da8b:b0:22f:c19c:810c with SMTP id d9443c01a7336-23ac48e36demr215881415ad.51.1751336170846;
        Mon, 30 Jun 2025 19:16:10 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c8649sm95503675ad.236.2025.06.30.19.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 19:16:10 -0700 (PDT)
Message-ID: <bd46f78c-6448-4b89-a788-45801acb2b16@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:16:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V15 0/9] wifi: ath12k: add MU-MIMO and 160 MHz
 bandwidth support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686344ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=g9aHqRueWkUMR_c1qpIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: tXUBc24GqydR01sUoJZjIWbnmg2liTQj
X-Proofpoint-GUID: tXUBc24GqydR01sUoJZjIWbnmg2liTQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwNyBTYWx0ZWRfX/aWypScuAb+8
 WUb5sWxz2yhZS2kq+ln03XOwSemeamDA2YJOyLBDPBV9SyEWAUeKLVQM16jiO++1C52H6xApw+X
 Z4Su2T0fOEmyFytzkaNRdzBubusX1UPJX2P/GvrmbYrSugccPxvKJIv9aPR+KQ537EyH0OsIiW+
 MmvB06fpQF91X9UbfcZ6QfjmaTH7HjKOKUZu4iwJsTr1FTM1rAJH36itJwIul3ySWB4RWsaCS0G
 NsF4+RrcZhdy7yRDMdLT+vmeymsRdpRdXrrQr+v6IYguDQV4OVJGU8f80lalPEsozewDvZGCVMy
 0ToM3EQGcv6x1JapB3qTRuCsySBrOPZUo38NGdZmu8eNmFO58iZqnW+NdGCGoLhi1TGBY21jgNH
 L2QciRLUreyZ5Gmofna4Gf3HypTXvjfxwuQ93EvoAYmRBHHx0TkKxzKq5AhjlYPTO/LJtOty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_191613_278775_97D0E1C2 
X-CRM114-Status: GOOD (  23.35  )
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



On 7/1/2025 9:03 AM, Pradeep Kumar Chitrapu wrote:
>   Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v15:
>  - rebased the series after merge conflicts reported
>  patch 4/9:

patch 5/9 ?

>  - change the fix to apply for all modes except STA mode as
>    WCN7850 expect it same as before.

It is not chip specific behavior, for now we believe it is mode behavior.

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
>  drivers/net/wireless/ath/ath12k/wmi.c  |   28 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  100 ++-
>  5 files changed, 1069 insertions(+), 222 deletions(-)
> 
> 
> base-commit: c256a94d1b1b15109740306f7f2a7c2173e12072


