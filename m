Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7527C001B0
	for <ath12k@archiver.kernel.org>; Mon, 24 Jul 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LdOgt08zeQDuMp3FnUUmTvOIF3cQJiK/bQBslgrLeo=; b=WB6dNHsqSCH2/T
	zqqmR0qyNpjPYPwVEVqpAVDL9QC+LtpoAndwJyLExP0pEZPrKmuevSPWH4JjOaqA70LlvoYZK2ncx
	lipHjyJCMeTOlQxgWWyDwZUseJHlQ07reNQhN2kciElRmhMCAfBl2nMqFWFdifkh5/udGQUPsxB4x
	OOcFilZKoBcy5YLb2VoYgS53kS9+4qsTocjkG1JeYafxmSYspiPC99mkp7UYil/RRexFxbFfmXCqY
	6AHiHmLn1MbVVLmJNtSVGO33sTWOh/T3fjnYBq7EHypAahJC2pvG2MUAxCimX483eKHAxoZLBtfyp
	4X/uJ0FzG0cVnnVtb4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNscZ-003e0t-1G
	for ath12k@archiver.kernel.org;
	Mon, 24 Jul 2023 10:16:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNscW-003dlC-2N
	for ath12k@lists.infradead.org;
	Mon, 24 Jul 2023 10:16:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36O6FmuM000883;
	Mon, 24 Jul 2023 10:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cfewn56TVGilkmEgIByWqsa6Ek2mqMzLIsbNYs2uegI=;
 b=BMi/hewY69T7bB2FJgqpb1r5DleYLGVqj2+zGdAddmTGlHbZahU538M2SS2OQluxmLqL
 ObWANCPAwLfayEE9/+K0TXqHPefaSmHjuV/2DUfKRM7PHpi64cxvNAGaRfe9jR7B3NX0
 JYEz6Ggq4sXi39iky/zFrs9mwUpf0PbClYCMl+v28CRmz/ZaTGcW3qV+ys0qj9maXHRw
 /yROdztBapPu0xDF07Vr+nWw/cBtY3OOnXxii5i4p2mT6BBW/Gw8d/Fscbw6JtdIprpR
 /KcdvUVN2/Gy3ZJoRw0rR2Ahb25o8ru0AB8Jk2Ao8nOJAnvSYdTH4soVVFXROkxd4Tco +g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s089ttvvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 10:16:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36OAGTiP019896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 10:16:29 GMT
Received: from [10.253.76.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 24 Jul
 2023 03:16:28 -0700
Message-ID: <f4515520-1d3b-1b07-6ddd-ae269c12a91f@quicinc.com>
Date: Mon, 24 Jul 2023 18:16:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 06/11] wifi: ath12k: prepare EHT peer assoc parameters
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
 <20230602235820.23912-7-quic_alokad@quicinc.com>
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20230602235820.23912-7-quic_alokad@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3riSjrm0_YjQubqt7MbLv5nz8B56jQiO
X-Proofpoint-ORIG-GUID: 3riSjrm0_YjQubqt7MbLv5nz8B56jQiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_08,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=794
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_031652_787854_01055BA8 
X-CRM114-Status: GOOD (  11.55  )
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

On 6/3/2023 7:58 AM, Aloka Dixit wrote:
> ...
> +	default:
> +		if (arg->peer_phymode == MODE_11BE_EHT20) {
> +			const struct ieee80211_eht_mcs_nss_supp_20mhz_only *bw_20 =
> +					&eht_cap->eht_mcs_nss_supp.only_20mhz;

When ath12k used as station mode, it entered here as well as AP mode.

But remote is AP device for station mode, then remote AP device do not 
have the only_20mhz data(EHT-MCS Map (20 MHz-Only Non-AP STA)).

Also 20 MHz should be same for 5 GHz/6 GHz(MODE_11BE_EHT20) and 2.4 
GHz(MODE_11BE_EHT20_2G), right?

> +
> +			ath12k_mac_set_eht_mcs(bw_20->rx_tx_mcs7_max_nss,
> +					       bw_20->rx_tx_mcs9_max_nss,
> +					       bw_20->rx_tx_mcs11_max_nss,
> +					       bw_20->rx_tx_mcs13_max_nss,
> +					       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80],
> +					       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80]);
> +		} else {
> +			bw = &eht_cap->eht_mcs_nss_supp.bw._80;
> +			ath12k_mac_set_eht_mcs(bw->rx_tx_mcs9_max_nss,
> +					       bw->rx_tx_mcs9_max_nss,
> +					       bw->rx_tx_mcs11_max_nss,
> +					       bw->rx_tx_mcs13_max_nss,
> +					       &rx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80],
> +					       &tx_mcs[WMI_EHTCAP_TXRX_MCS_NSS_IDX_80]);
> +		}
> +
> +		arg->peer_eht_mcs_count++;
> +		break;
> +	}
> +}
> +

...

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
