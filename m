Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AA5D5AE49
	for <ath12k@archiver.kernel.org>; Thu,  7 Nov 2024 02:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PR2J7v/OxwipS01XjyfQuTVgZ/1b3olAMop2jUT0OA=; b=qKap1yZ2rr121lS8L8yTRhdFfK
	4eg9JqyubS4CM825sARflrXRBa1C+/eitrVYnVHe6Px7qL4KwA7kwN3g2vIfQkrxwW3pczpOli3em
	v/9a6c67IGwmRijCAaTvihEgAo2i5EQKtp0Cywi2l/DDonmVj2sV6aTX0n1Ruj1RHPtOKyPQS8otM
	+/kEt1zQ18Cnd4JPyUvLvDrvcYUZ38oorTWMYV2T+n67Wcwl2cVB1t9ohDBME2yOTvlC5PJ6MngRp
	f5o2P6u09jYlSqExw2T2uLKHK84U61usArxPiUF1HGg/teMnsFEiAGCyX/lkC/XMzqqbdumCITaTs
	PfGhIenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8sWK-00000005U1q-3hYB
	for ath12k@archiver.kernel.org;
	Thu, 07 Nov 2024 02:45:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8sWH-00000005U1L-41Vr
	for ath12k@lists.infradead.org;
	Thu, 07 Nov 2024 02:45:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A71ikge004555;
	Thu, 7 Nov 2024 02:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PR2J7v/OxwipS01XjyfQuTVgZ/1b3olAMop2jUT0OA=; b=jUShNrkqjxpROvBX
	+P3/0ZNhOos9e+y8fhqi8wmxPAwdy5mwv366V6snbSoVs7v0jxN8NJ6VtS09pj+4
	thkZAkrayL+h59Af+vnIJA+J5m89j4MamiJ1J33orxMWnUssmkboM91lKbABa/Bc
	Sn7Hj9nTCeMRpulJyb3khT278SCzvqbzaVcVLS2Cj/XIM83CJPnuiGXycHYxBYTD
	rH/k3fpYEz/vd/1btYpFHUWIDehIFjKPLpOHVTOgCgYqp0Slg/djVwyDBUK0+LBA
	fej+Xd6U9TgYks8vflQfK1H7jHsvs4QTBcNANZF2uyAJPDh5qOTGFwjmfiAplULa
	ySgmdg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvg3us4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 02:45:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A72jAav010295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 02:45:10 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 18:45:08 -0800
Message-ID: <2e706d58-5d83-4867-9963-c62441cdd4da@quicinc.com>
Date: Thu, 7 Nov 2024 10:45:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-2-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20241106142617.660901-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lf_sc1RU-SYbUnrWMsGXS1y5UkbwtCzg
X-Proofpoint-GUID: lf_sc1RU-SYbUnrWMsGXS1y5UkbwtCzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=896
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_184514_044172_6D84DD3E 
X-CRM114-Status: GOOD (  11.87  )
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



On 11/6/2024 10:26 PM, Kalle Valo wrote:
> +static void ath12k_mac_unassign_link_sta(struct ath12k_hw *ah,
> +					 struct ath12k_sta *ahsta,
> +					 u8 link_id)
> +{
> +	lockdep_assert_wiphy(ah->hw->wiphy);
> +
> +	ahsta->links_map &= ~BIT(link_id);
> +	rcu_assign_pointer(ahsta->link[link_id], NULL);
> +
> +	synchronize_rcu();
this looks strange: generally we call synchronize_rcu() to wait for any RCU readers to finish, such that we can then safely free something. but here we do nothing ...

> +}
> +
> +static void ath12k_mac_free_unassign_link_sta(struct ath12k_hw *ah,
> +					      struct ath12k_sta *ahsta,
> +					      u8 link_id)
> +{
> +	struct ath12k_link_sta *arsta;
> +
> +	lockdep_assert_wiphy(ah->hw->wiphy);
> +
> +	if (WARN_ON(link_id >= IEEE80211_MLD_MAX_NUM_LINKS))
> +		return;
> +
> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
> +
> +	if (WARN_ON(!arsta))
> +		return;
> +
> +	ath12k_mac_unassign_link_sta(ah, ahsta, link_id);
> +
> +	arsta->link_id = ATH12K_INVALID_LINK_ID;
> +	arsta->ahsta = NULL;
> +	arsta->arvif = NULL;
if arsta is not deflink and would be freed, can we avoid these cleanup?

> +
> +	if (arsta != &ahsta->deflink)
> +		kfree(arsta);
I know the actual free happens here, but why split them?

these two hunks give me the impression that we may (in the future?) have cases to call ath12k_mac_unassign_link_sta() alone somewhere else rather than directly calling ath12k_mac_free_unassign_link_sta(). am I feeling right? what are those cases?

> +}
> +


