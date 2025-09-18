Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3197BCAC59A
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSjGDOxJVlv8lyqbxoa5TJlW0jL+p+ujSkvMtFycbHs=; b=zqCUfm/IiE9FJh0A9zg20nZQF9
	SFdEi3EbjH00n9VW5+HSbfk59vnpGhn93x+43k/TSfXgUQ8nRIpMr5jKJRSl3YxV/aYv88N7scPfv
	4CCfGsmfzG/fzlL+9EQ6tpGltnyk8vkyFlWLHzcw1ijXnnvUyR/Et8RLrws3enptLiQtdKfs9wZ9b
	lIErM/fV4lVJIgUydHcCdTUxaR472APznR0Y7siGy7ArgJitr3Dg7c6fHVnlg+rN0uaV75NlATyvA
	7Pz9dLfEmwaSdZWMf54BeWCBO21e6+BmP6F/IoIZfDh4EqE2uuqIr3s7N/R6PVsXGsJqk1aOa0waD
	BclyV/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz96h-0000000GXwa-3xBN;
	Thu, 18 Sep 2025 07:31:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz96e-0000000GXub-43XB
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 07:31:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HMaTZC011208
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 07:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSjGDOxJVlv8lyqbxoa5TJlW0jL+p+ujSkvMtFycbHs=; b=cjhgWZC2Mzm9Pvtq
	0te6kbpZcfX90brLFp2wNJvYTosCAAs3xIJsWwH3u9C1ZA5DVv2SVw3Ejt4khKhA
	CLx7RHttEJhjW2+W92hsSWW5DLNOKBzaJ9D/ZSfT6qP83E981KkmZpAJ3u6hABFv
	11MoAr1MYzrCAxzievOQJEmNom3ilZ+kT4xmJ7G1sZBLvqbIy0bvAaCZXcMvZ+lu
	hcrbZwPKx9+nqareNvBT3wLRFOZvvUhiwY7J5DRR3X2kVYuMTtmWXIf8AIvy8yWu
	PX2oJfyiCyf/2ChDxDVYkZDRBoIFLNSi1NBDUHVQkCv4tCtbrsE3EjTTsR3rv1hd
	YREObA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx1ane-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 07:31:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269880a7bd9so6085435ad.3
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 00:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758180662; x=1758785462;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSjGDOxJVlv8lyqbxoa5TJlW0jL+p+ujSkvMtFycbHs=;
        b=Ws6G640cHWb3fUz0jZy52Ecq+llxD04gBYEW145VkY36afKS8lYtPk/3ZT/Fqq4Dny
         f4V+E5B9kjxk2u8p0ncmYdBQj/L10nxsqvNb8x/V4gqHdT1Xhwm1qOlVCaPLULlN51Ng
         0emlxxyim7OtRzOdCv7Zj8l0OotJZNSOPjxw+v+Xg53/FHDe2S9sHU6njzKRxVm7R7QF
         ukPWmaXk70etijA7F5b+/Y9xUWCqPwin1VhMJQVftYfN+1dDgA9Nfmz90iNwKG/8gvIZ
         XhQ6WExUEprdHyr0BuYHsknBEtq5+ObYm/JfltVPnRvcp/ESS0Jb04OO5XcUY8qhW+Y0
         wIBw==
X-Forwarded-Encrypted: i=1; AJvYcCULLOM2T9wqlMXI2nRlUdgOLRt7L4s4stdvSeKzihr2PkaB9zHWMJVgzdhaO5BXQvT/2qTcwgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRZq9qqvYMfqKXw3mZbGFjPh2PhY9aGQyh9VZ5mbRFxfHAAnGO
	ZMKoBEaZzbm7JKctVQz81rN3jtRDeXVcEnv1G7GJAqwEvXoYbR2fmpteHhGnWO8LEFUPkpRPR6R
	G85w7TpDLUcvy0PpXJ7LZPOlXYxhfkQvuzNBkqEQNbmmrKDV7B3fEmBMVx2Z66cfePdcaqz5GEe
	Q=
X-Gm-Gg: ASbGncth8kRV52/44t1PjniWsExJTn0E8aIZuVRGk+rpvyTwgS44bJh4elXfiweRa42
	EmdP/NRptvshPYopKmI2yrmKlsJO5+PzGw9gmQ7ZgxunhGPov0C/lVAwvMBpyLHcL2IcCmNZNsf
	2SFaDbx7+HQimnkCVcluMifojJcjyHjQf+yPi+Wv5QgjP9ztlWexOQaSVJfQEN10Ku65fFqyYSZ
	XfMEVPylhPyhLeO1TQ2BS+wPnsgp53pZzIJ/y71bhRFLm2xHJClCqEMhycMs2ByVVr/QErkF++s
	2cQvjw4QJqLarFhu9BOJh33qJcDGTau6BE9Eld84wx+EbuCTTHpsNBtjmo/4xpC7517pKfeSw5A
	dVXqA9wvnsOxAYO0gEJ66dAuFCNDgENLTbPgc
X-Received: by 2002:a17:902:e94d:b0:24c:965a:f94d with SMTP id d9443c01a7336-26813cfd846mr59503775ad.46.1758180662358;
        Thu, 18 Sep 2025 00:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF6R0aGszZMJZu5EezdW7KvbKGGAQgOyOQqusY7oJkHBb0cO2tRgbEcai63GOpeXe32VmfCQ==
X-Received: by 2002:a17:902:e94d:b0:24c:965a:f94d with SMTP id d9443c01a7336-26813cfd846mr59503435ad.46.1758180661869;
        Thu, 18 Sep 2025 00:31:01 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368dc1sm16041485ad.152.2025.09.18.00.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:31:01 -0700 (PDT)
Message-ID: <9c3db505-760d-41a3-9d6b-f55504db6872@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 15:30:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: enhance the
 WMI_PEER_STA_KICKOUT event with reasons and RSSI reporting
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <20250812111708.3686-2-maharaja.kennadyrajan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250812111708.3686-2-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WBmM4jAmVj_ozZlwg9rSA0lKN087Jx1d
X-Proofpoint-GUID: WBmM4jAmVj_ozZlwg9rSA0lKN087Jx1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX6FDmTNCu7X7f
 v7FiH8d5Bl4Ws+SmhFVRG3IqmTCnqVmwJAi497yueZgtzwP2p3fwovjGShMBaogjjNTtL9fuy0g
 u08D7beuPzImwMna2oBdCxRXGaw6wcIOvmQ2TRP/rjYHh0qKbIRGM/529H/YG3j9GD8I+nOga27
 jPW2jaMM7K3h7u1ab37ybozpT29b6GmmraeK447sAiSLhvHfq841PJPLTolzKYxPq4nnpJP7SKd
 nx1U9X38tEUGEOrCPRF7OpsXYCjSEElK2ThoL5TXkVFCO7j5TmDPC3WOevgyoGESaDoaVpzUCbk
 4RZp/6G7vjnoJeecdBhv7FOKIevVl+2uCI0amVlaYMg+4vPlblrKCTEk143wp0cmiZnKZktOQf3
 4XynA5et
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cbb537 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eoNwnVE8TkJRRwwNz3IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_003105_127752_B1CA9AAB 
X-CRM114-Status: GOOD (  19.67  )
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



On 8/12/2025 7:17 PM, Maharaja Kennadyrajan wrote:
> Enhance the WMI_PEER_STA_KICKOUT event by adding support for reporting the
> kickout reason and RSSI value. The reason code will be used in the
> following patches when the beacon miss handling is added.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c |  7 +++++--
>  drivers/net/wireless/ath/ath12k/wmi.h | 15 +++++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index da85c28ec355..cb686c68987a 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -6461,6 +6461,8 @@ static int ath12k_pull_peer_sta_kickout_ev(struct ath12k_base *ab, struct sk_buf
>  	}
>  
>  	arg->mac_addr = ev->peer_macaddr.addr;
> +	arg->reason = le32_to_cpu(ev->reason);
> +	arg->rssi = le32_to_cpu(ev->rssi);
>  
>  	kfree(tb);
>  	return 0;
> @@ -7333,8 +7335,9 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
>  		goto exit;
>  	}
>  
> -	ath12k_dbg(ab, ATH12K_DBG_WMI, "peer sta kickout event %pM",
> -		   arg.mac_addr);
> +	ath12k_dbg(ab, ATH12K_DBG_WMI,
> +		   "peer sta kickout event %pM reason: %d rssi: %d\n",

nit:
no ':' needed for a debug print?

> +		   arg.mac_addr, arg.reason, arg.rssi);
>  
>  	ieee80211_report_low_ack(sta, 10);
>  
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index f3b0a6f57ec2..211812c62f91 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -4548,12 +4548,27 @@ struct wmi_scan_event {
>  	__le32 tsf_timestamp;
>  } __packed;
>  
> +enum wmi_peer_sta_kickout_reason {
> +	WMI_PEER_STA_KICKOUT_REASON_UNSPECIFIED = 0,
> +	WMI_PEER_STA_KICKOUT_REASON_XRETRY = 1,
> +	WMI_PEER_STA_KICKOUT_REASON_INACTIVITY = 2,
> +	WMI_PEER_STA_KICKOUT_REASON_IBSS_DISCONNECT = 3,
> +	WMI_PEER_STA_KICKOUT_REASON_TDLS_DISCONNECT = 4,
> +	WMI_PEER_STA_KICKOUT_REASON_SA_QUERY_TIMEOUT = 5,
> +	WMI_PEER_STA_KICKOUT_REASON_ROAMING_EVENT = 6,
> +	WMI_PEER_STA_KICKOUT_REASON_PMF_ERROR = 7,
> +};
> +
>  struct wmi_peer_sta_kickout_arg {
>  	const u8 *mac_addr;
> +	enum wmi_peer_sta_kickout_reason reason;
> +	u32 rssi;
>  };
>  
>  struct wmi_peer_sta_kickout_event {
>  	struct ath12k_wmi_mac_addr_params peer_macaddr;
> +	__le32 reason;
> +	__le32 rssi;
>  } __packed;
>  
>  #define WMI_ROAM_REASON_MASK		GENMASK(3, 0)


