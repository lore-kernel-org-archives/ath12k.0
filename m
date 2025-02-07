Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B4FC02192
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deOoZprUQ4cEZkRCsB7rGwrPfYEpijDIgS2TVxENs8E=; b=pBw8XtNOV9Ww72dmoM4VUOWpnT
	spMHTdZ7ViJTlu1bljQGYK/GdfmulmDHZZgQPBHbaQE5LUcTQ5SWV/IWbtZILT13czOM79r2RZcwX
	hY/SpkpRguncMDFb5tNYhmrxPoFFjujQu4BFl67GD8wIslU3ZNpX2ZYsOE5/Qf2IWlQC8vPq7G+dU
	9xpXCU7jNCQ7NnMgHL9ttxxN8AWuHcH1IFDmdpnjGok1K0G7TC5qnfXsUE08Py0K5p7mdWGpgdzBv
	Q98XpHS3Yka1vHn1rB/zGlB5/sgI5M7nxrHuzOFXljEsokqNSpK126xM58k27dA+qrvETmAXQ4wPM
	JYOG9q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKTA-00000008ylF-3HhC
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 09:16:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKIh-00000008wHj-0KVR
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 09:05:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5172JVk2004869;
	Fri, 7 Feb 2025 09:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	deOoZprUQ4cEZkRCsB7rGwrPfYEpijDIgS2TVxENs8E=; b=EbxzQbVwjEUxrMOb
	LrLATijo1VY4etUpMPnrDFtarHEw5PEQBz6ePUbbhdtyJ/vrDiM17O+Pd6b2ZuVo
	PsIVa1gkvXGexZ2wZ9QW931bVgAvNt3rIhEkXz5Q+s9QBBZFxy6KftW3lXBBJlQ2
	cfTW4tDkESu77FODRI6wjtJDs1sNFks6J+lEY44kODuczYqSxFNmdkNTMXMKc6DE
	adOZntllIls7gw5bf1KmUfZ6qhJZwgVNqixcUzgaXlKwbLMVOCUwop53xrSSc6Q0
	MEjVxrY5Ce+/ZZtxOe7EsvIlpjk0cQtqLAcyo6iKV74UX6tmAWY9PbjtpxblBp7b
	GzNooA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n99e8vut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 09:05:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517952Iq018215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 09:05:02 GMT
Received: from [10.110.58.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 01:05:00 -0800
Message-ID: <44dc86f0-7775-4d47-9058-17cb048cd976@quicinc.com>
Date: Fri, 7 Feb 2025 17:04:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Abort scan before removing link interface
 to prevent duplicate deletion
To: <ath12k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20250124093352.481-1-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <20250124093352.481-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D9Teo-Vgfka2ithrk9RvS9TpSC5N6LAp
X-Proofpoint-GUID: D9Teo-Vgfka2ithrk9RvS9TpSC5N6LAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_010527_238448_0CDCBE33 
X-CRM114-Status: GOOD (  17.91  )
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



On 2025/1/24 17:33, Lingbo Kong wrote:
> Currently, when ath12k performs the remove link interface operation, if
> there is an ongoing scan operation on the arvif, ath12k may execute the
> remove link interface operation multiple times on the same arvif. This
> occurs because, during the remove link operation, if a scan operation is
> present on the arvif, ath12k may receive a WMI_SCAN_EVENT_COMPLETED event
> from the firmware. Upon receiving this event, ath12k will continue to
> execute the ath12k_scan_vdev_clean_work() function, performing the remove
> link interface operation on the same arvif again.
> 
> To address this issue, before executing the remove link interface
> operation, ath12k needs to check if there is an ongoing scan operation on
> the current arvif. If such an operation exists, it should be aborted.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 329c05003721..cdce88787182 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9333,6 +9333,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
>   	    ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
>   		ath12k_mac_monitor_stop(ar);
>   
> +	if (ar->scan.arvif == arvif && ar->scan.state == ATH12K_SCAN_RUNNING) {
> +		ath12k_scan_abort(ar);
> +		ar->scan.arvif = NULL;
> +	}
> +
>   	ath12k_mac_remove_link_interface(hw, arvif);
>   	ath12k_mac_unassign_link_vif(arvif);
>   }
> 
> base-commit: 376673aa393c1c232299be3e910d7f2e6d974b2f

hi jeff,
do you have any updates on this patch?🙂

/lingbo

