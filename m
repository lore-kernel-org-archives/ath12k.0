Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1518C6FD1F
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPwAdeRwnp+jmLqXPDhPkR2HEa9R0lZiweO/MiFU1n4=; b=TPsj15H9h0IZcK9Qwr3YLgOPdP
	BTDaaTQmwyWnjL23DV2ZvscvgYTrykJao4bGOuo55o/hZLq5OQcbwzVYShFcT3eIx0agdZ0+fa+sv
	+0kT7Tk6YSrcSOuocQAWBZevOeNSAzCTXt/89DA/Qq6FOU0NRpfl7JQoFuKa6l6K+hlANUM1hzrDO
	7VpWDkkoNopKmUyH3jM0DM1O68rMNjxqnvCXQenlv/efuwH3L14sp1llNVuzB+PLLcGEAHhN3su2s
	8W0IDUkYWGyoty+VaG9WIgq9u3bw0BsOdsKNYfUUT2E8tigoGu+t/VNRY8OgsbNWrx/PHDaAbfcny
	xLGLnoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGR0-00000001Xds-2DHe
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 17:54:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGQx-00000001XdB-0PdB
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 17:54:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42THgVtV001041;
	Fri, 29 Mar 2024 17:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lPwAdeRwnp+jmLqXPDhPkR2HEa9R0lZiweO/MiFU1n4=; b=Zp
	SxBFdpaX2bT/880VOw/yF4hnNe1UAGYtcTafeah3xZPsXiNTSzbS+4Y0/W5LiBur
	bWcGA2shN8SwA78XppTCfxSpvLc5P40TwMoiIE+Hot1JY7SJ3ltpsFUlPz1H8PW0
	UQMrexqkItbbIyM0VDSRQBSw71JD0+EsAfknatKXFdK2fPHe2T5KJrqP42eGH9lX
	e5dAvbAbl5brZ7A/utU2poSrpkoJ7UR7gmzhLcxUNwJp/MXvhz/H7u9f88ECBCuk
	cZyvy05hGHGvHFFps45URZ89qCGXSZTx4LdqoaHWlCdF35rY2K+Pfd9YNntNuqVP
	Zrigprtr94UTjwnZxcTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5ybmrdbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:54:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42THsS7c031350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:54:28 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 10:54:27 -0700
Message-ID: <6ead299e-003b-4db5-adc7-e009c0d3ddb1@quicinc.com>
Date: Fri, 29 Mar 2024 10:54:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] wifi: ath12k: support SMPS configuration for 6 GHz
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240325212304.28241-1-quic_pradeepc@quicinc.com>
 <20240325212304.28241-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240325212304.28241-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V5qJ_w140Zg-ltTtqKU4Qf4F1QajWGE5
X-Proofpoint-GUID: V5qJ_w140Zg-ltTtqKU4Qf4F1QajWGE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_105431_377801_C72B198C 
X-CRM114-Status: GOOD (  11.54  )
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

On 3/25/2024 2:23 PM, Pradeep Kumar Chitrapu wrote:
> Parse SMPS configuration from IEs and configure. Without this,
> SMPS is not enabled for 6 GHz band.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index b4114dd22bf0..433b8be74997 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -1964,12 +1964,17 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
>  }
>  
>  static inline int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
> +					    const struct ieee80211_he_6ghz_capa *he_6ghz_capa,

ath12k-check complains:
drivers/net/wireless/ath/ath12k/mac.c:1967: line length of 94 exceeds 90 columns

git blame indicates:
bf5622d2fd27a (Pradeep Kumar Chitrapu 2024-03-25 14:23:04 -0700 1967)              const struct ieee80211_he_6ghz_capa *he_6ghz_capa,

Suggest removing 'inline' to align with:
https://www.kernel.org/doc/html/latest/process/coding-style.html#the-inline-disease


