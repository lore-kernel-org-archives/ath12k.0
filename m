Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C043C77B61
	for <ath12k@archiver.kernel.org>; Mon, 10 Apr 2023 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z69Z1oSouqwgGeFcX9IpTusc7wSgFTfC9txi8tYrIGI=; b=IhVQDkloHeSiI5
	dGXaZX4Xr9LVR6rPU1uVv6xHKN/Jf+Ojh9k1dyRI8/1iDYgETo7gr5eC11kO5mEcbKxpL8cSnShZp
	q3yDgsOneOmV7m27xQKE+beXB/FmPOVXLn90sNRPWP0/qWZN0qc0IHHpsLT+aeXaTnJQOsYKyfEJK
	aCZSIf2KQrTFEQWK5yU69DHk0tT5SoM63kaikAD08b+p/KWf0nvKx8cosP2aeCdD1sR8220lk513D
	EnE08nAVPj+21wdlSW2gbe0qfES2WGhZm0oQKrGdN4vKoBZ2FVRiW8L20YyeGvbWWj5Z1f77LQcSz
	1Glv8Xr7mv4aL4+BLPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pluIG-00FX1W-24
	for ath12k@archiver.kernel.org;
	Mon, 10 Apr 2023 16:23:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pluID-00FWza-2d
	for ath12k@lists.infradead.org;
	Mon, 10 Apr 2023 16:22:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33AFcFTx026807;
	Mon, 10 Apr 2023 16:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3lJMiVRfvN6h7n2bdTM/qCHW5/XoOFcofVx3jowYF/M=;
 b=jJSK2P2y+8fQ0f1IwRGlaAzppmAM7gGEZ4P9SuouZjIyLF/qHvgWahWOsRw/opJKhjzn
 Vb7R747V7f/o/pz36iMu8IScE59F7qPYKofXLHViTxJBY64ZSMVGSpgoFg1jZ7jroMJ6
 lwofEhaSu8aF9HKcs0bKy0QVkpT5zr2a9oFutDSJomKdDWf/3IxFzGkBAKfiOU1onwrW
 5u+unlSNzcKTIzvHgG+JuicQlm36kHNYEQAEy7tED27N0+esq7mHYJsKm5qHRg/oWTAn
 M8X6gyD0v6yne8HFawnK+ORhFQjDt5D8eeNsJnj8njM8RvNpsBXkdAcH4zUdeNtvGS+9 XQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pu0c33cyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Apr 2023 16:22:56 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33AGMsfb005885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Apr 2023 16:22:54 GMT
Received: from [10.110.38.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 10 Apr
 2023 09:22:54 -0700
Message-ID: <b3282c7d-07c5-8657-fca2-c286f82cb235@quicinc.com>
Date: Mon, 10 Apr 2023 09:22:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 06/11] wifi: ath12k: prepare EHT peer assoc parameters
Content-Language: en-US
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20230403225146.14139-1-quic_alokad@quicinc.com>
 <20230403225146.14139-7-quic_alokad@quicinc.com>
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <20230403225146.14139-7-quic_alokad@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E8N7KmBj_Wjte4GR3RM9ZnvK1SVtU2TI
X-Proofpoint-ORIG-GUID: E8N7KmBj_Wjte4GR3RM9ZnvK1SVtU2TI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_12,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=569 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_092257_995303_1E770240 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 4/3/2023 3:51 PM, Aloka Dixit wrote:
> Add new parameters and prepare the association data for an EHT peer.
> MCS data uses the format described in IEEE P802.11be/D2.0, May 2022,
> 9.4.2.313.4, convert it into the format expected by the firmware.
> 
> +	case IEEE80211_STA_RX_BW_320:
> +		bw = &eht_cap->eht_mcs_nss_supp.bw._320;
> +		ath12k_mac_set_eht_mcs(bw->rx_tx_mcs9_max_nss,
> +				       bw->rx_tx_mcs9_max_nss,
> +				       bw->rx_tx_mcs11_max_nss,
> +				       bw->rx_tx_mcs13_max_nss,
> +				       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320],
> +				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_320]);
> +		arg->peer_eht_mcs_count++;
> +		fallthrough;
> +
> +	case IEEE80211_STA_RX_BW_160:
> +		bw = &eht_cap->eht_mcs_nss_supp.bw._160;
> +		ath12k_mac_set_eht_mcs(bw->rx_tx_mcs9_max_nss,
> +				       bw->rx_tx_mcs9_max_nss,
> +				       bw->rx_tx_mcs11_max_nss,
> +				       bw->rx_tx_mcs13_max_nss,
> +				       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160],
> +				       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_160]);
> +		fallthrough;
> +

'arg->peer_eht_mcs_count++' is missing for 160 MHz case.
Should I send a follow-up now for the series or wait for comments on the 
remaining part for some time.
Thanks.


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
