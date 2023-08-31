Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F1EC83F2B
	for <ath12k@archiver.kernel.org>; Thu, 31 Aug 2023 03:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRQlEkZsXJ7ZBySBbYdr7NCrhU6awRfa7gaanj7A1Sc=; b=dyfhO4c9j9s5pi
	9RQl69F0EA3gM1tfsKD4NbeTZP5pAbmEuwbywxfD1ZqRGPQdz31KxWjCJgK35S/ZvTFRyHnYczh19
	rreQoG7+nku/bR6NMMh9VbfZ+iWgzzGenjKgtvLc/wjLteN7P+giEfDBxOYJlxnY5VeCDLCCd1KN7
	PwcYzLkX3JWM+7BLzCQ5wCuex/vrno650BGfmRYqTcLEcogr/EdX05HOZV6t+lQgK/cAJagqHPfn3
	QUKr/JUmL9Ze28MvzbZhqFTNX7//BgLdyS3OZ3CBX0WhWEgPO/zAZLtKOG+4KgCZ0Ea41EKChKLTZ
	vlGqplyG/Lz9e12sWrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbYgf-00EaGj-1M
	for ath12k@archiver.kernel.org;
	Thu, 31 Aug 2023 03:49:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbYgc-00EaFr-1C
	for ath12k@lists.infradead.org;
	Thu, 31 Aug 2023 03:49:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37V3T6hk010219;
	Thu, 31 Aug 2023 03:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S5a+p5gZ9WGY6cPpibnn508ey6Pe9M/v0/ucEDU3wzw=;
 b=hLK5Z4R+4gr3UnxZWI/3J1gRBQ/Pma9Mm+tiw4ldSlfwglnZtIUn9F7FoptOYH2ySpBC
 H+wPWUt9g2VgB9BXzgFpYyhk+TtVIerW6F9ay0Cwo3OjnUxqFb/vqIFWJMe+rpdWEWpQ
 yQ2O0nxiBdV6AGXyI5Ca4Oc4+WbD1iYfJyJGt5iDoYW+X1RYPxRiJx29wl5FsD7M/BtB
 qX0mN1mWsbVzcs+GUBipliAYNhYqTy+Yi+HwA8tDA2+++SMO3Znbr6DHZYmCl1ITDB8B
 WqTtx2pRIozYLA0M2hCsiBm4qVgz4rkneEZo/UHsa1cL4V3aGVcOHLUo7Ijol8zDPLZC Mw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssmcvba8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 03:49:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37V3nYJ9001476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 03:49:35 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 30 Aug
 2023 20:49:33 -0700
Message-ID: <d4ea2c1b-a142-1ce6-9566-7f501a30f533@quicinc.com>
Date: Thu, 31 Aug 2023 09:19:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] wifi: ath12k: Set default beacon mode to burst mode
Content-Language: en-US
To: Sidhanta Sahu <quic_sidhanta@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230830194617.26400-1-quic_sidhanta@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20230830194617.26400-1-quic_sidhanta@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 86A2kBCTxcumMdbK4HzuZV-gMxTYF29H
X-Proofpoint-GUID: 86A2kBCTxcumMdbK4HzuZV-gMxTYF29H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_01,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_204938_542727_77815372 
X-CRM114-Status: GOOD (  17.60  )
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

On 8/31/23 01:16, Sidhanta Sahu wrote:
> Currently, firmware does not like when beacon mode is set as staggered
> mode for more than one beaconing vifs. Beacon mode for multiple
> beaconing (transmitted) vifs are expected to be in burst mode. So set
> beacon mode to burst mode by default.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 1bb9802ef569..b16cbc3c906d 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2314,7 +2314,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>   
>   	if (changed & BSS_CHANGED_BEACON) {
>   		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
> -		param_value = WMI_BEACON_STAGGERED_MODE;
> +		param_value = WMI_BEACON_BURST_MODE;
>   		ret = ath12k_wmi_pdev_set_param(ar, param_id,
>   						param_value, ar->pdev->pdev_id);
>   		if (ret)
In else part, we have a debug print. IMHO that should be changed too. 
Please check once.

		else
			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
				   "Set staggered beacon mode for VDEV: %d\n",
				   arvif->vdev_id);

Could you check once?

Aditya

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
