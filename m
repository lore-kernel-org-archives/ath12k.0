Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D0ED637BE
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lr8r7RYSll6wbkuXNkdfUly12aqqfyacJTDVeodYpWg=; b=TpgxY8Qb1DwKZlCxG8fENiekpC
	3Ukiaw/8kUFbCy29tia9zKyErZwQ6Su1LHaKlAmPM9VzXEj/kUIZy91ElRgDzKp41Fj28bJgoox6l
	QLjuavsJ+W2B8fQeJapJSLJRu7xlTLCBu0pUBWkfA1BuKQXiDSG6+NgR8hkE28UZ6dhYHuV/UzFfn
	03c/UrSlRp2C+ds4qypcPzn1NVNlAF3aP27dIm2VK/N3Hz69PFZnxBbGOnNnwIA2DHKomNgy7Su2t
	m/rTiiqHz/bfUCGyIWRiHeAmKoGZO8gY2HaXRIykd79iWNZaaIpWAgIIY6qQGmiGKM59O+EdORv8v
	47vzrOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKFQ-00000007zjZ-1f9G
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 20:45:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKFN-00000007zjB-35gv
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 20:45:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADHxgiU027022;
	Wed, 13 Nov 2024 20:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lr8r7RYSll6wbkuXNkdfUly12aqqfyacJTDVeodYpWg=; b=mBGwe5GwRTu/NU0q
	zemVysqPZh1Hd7NAvj98qJS8XJ/hb85iJIroWs/jlw1Rv9ANmK3rlu2WuCRl4pII
	NcN3KAtB8A634F0HX3QTNNy81UWCq/z8DTNQa62KI2eqeyFfULGNHv9fpJGR4+Py
	EoaRsE3y0dVsk3Jtvl5q74KQnE3CoRmZTJE4snMuG+oT73IjuMgQ7304KYtUtVJu
	sr2fCDfTNneJlJvRKvjyWdo5Rwzg3NeWpA2QeYxfInwIRbUzF7ExTXOT2CqC3iM9
	7swvn1ZXrDygBuT/i254z467PY9A44ffq5TD5VDmuPQcmJ6zo1g4yvxrNJgq5FUn
	NoIsOQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jrec4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 20:45:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADKjoH8027919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 20:45:50 GMT
Received: from [10.48.243.207] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 12:45:49 -0800
Message-ID: <b40b21cc-2c82-426e-9194-404b21b7e3bf@quicinc.com>
Date: Wed, 13 Nov 2024 12:45:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] wifi: ath12k: Support Downlink Pager Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
 <20241113072707.3377341-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241113072707.3377341-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TBaIBlohfPu6mHryVJA3e2jZiFAQ_nPX
X-Proofpoint-GUID: TBaIBlohfPu6mHryVJA3e2jZiFAQ_nPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=965
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_124553_961390_72F1B2D3 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
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

On 11/12/2024 11:27 PM, Roopni Devanathan wrote:
...
> +	dword_lock = u32_get_bits(stat_buf->info2,
> +				  ATH12K_HTT_DLPAGER_TOTAL_LOCK_PAGES_INFO2);
> +	dword_unlock = u32_get_bits(stat_buf->info2,
> +				    ATH12K_HTT_DLPAGER_TOTAL_FREE_PAGES_INFO2);

drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2615:43: warning: incorrect type in argument 1 (different base types)
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2615:43:    expected unsigned int [usertype] v
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2615:43:    got restricted __le32 const [usertype] info2
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2617:45: warning: incorrect type in argument 1 (different base types)
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2617:45:    expected unsigned int [usertype] v
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2617:45:    got restricted __le32 const [usertype] info2

Note that previously Kalle suggested:
There's le32_get_bits() so you can simplify this function quite a lot.

So s/u32_get_bits/le32_get_bits/ in your new code


